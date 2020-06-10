import RxSwift
import RxCocoa
import FBSDKLoginKit

class SettingViewModel: BaseViewModel {
    
    var input = Input()
    var output = Output()
    var userService: UserServiceProtocol
    var userDefaults: UserDefaultsUtils
    var firebaseUtils: FirebaseProtocol
    
    struct Input {
        let signout = PublishSubject<Void>()
    }
    
    struct Output {
        let showLoading = PublishRelay<Bool>()
        let showAlert = PublishRelay<(String, String)>()
        let goToSignIn = PublishRelay<Void>()
    }
    
    let userPublisher = PublishSubject<User>()
    
    init(userService: UserServiceProtocol,
         userDefaults: UserDefaultsUtils,
         firebaseUtils: FirebaseProtocol) {
        self.userService = userService
        self.userDefaults = userDefaults
        self.firebaseUtils = firebaseUtils
        super.init()
        
        
        input.signout.withLatestFrom(userPublisher).bind { [weak self] (user) in
            guard let self = self else { return }
            self.userDefaults.clear()
            self.firebaseUtils.signOut()
            
            // 페이스북이면 페이스북도 로그아웃
            if user.social == "facebook" {
                LoginManager().logOut()
            }
            self.output.goToSignIn.accept(())
        }.disposed(by: disposeBag)
    }
    
    func fetchUser() {
        userService.findUserById(id: userDefaults.getToken()!) { [weak self] (userObservable) in
            guard let self = self else { return }
            userObservable.subscribe(onNext: self.userPublisher.onNext, onError: { (error) in
                if let error = error as? CommonError {
                    self.output.showAlert.accept(("유저 조회 오류", error.description))
                } else {
                    self.output.showAlert.accept(("유저 조회 오류", error.localizedDescription))
                }
            }).disposed(by: self.disposeBag)
        }
    }
}

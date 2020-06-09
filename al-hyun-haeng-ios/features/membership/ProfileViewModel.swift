import RxSwift

class ProfileViewModel: BaseViewModel {
    
    var input: Input
    var output: Output
    var userService: UserServiceProtocol
    var userDefaults: UserDefaultsUtils
    
    struct Input {
        var nameText: AnyObserver<String>
        var nameChanged: AnyObserver<Void>
        var tapContinueBtn: AnyObserver<Void>
    }
    
    struct Output {
        var goToMain: Observable<Void>
        var enableContinueBtn: Observable<Bool>
        var showLoading: Observable<Bool>
        var showAlert: Observable<(String, String)>
        var showError: Observable<String>
    }
    
    let idPublisher = PublishSubject<String>()
    let socialPublisher = PublishSubject<String>()
    
    let nameTextPublisher = PublishSubject<String>()
    let nameChangedPublisher = PublishSubject<Void>()
    let tapContinueBtnPublisher = PublishSubject<Void>()
    
    let goToMainPublisher = PublishSubject<Void>()
    let enableContinueBtnPublisher = PublishSubject<Bool>()
    let showLoadingPublisher = PublishSubject<Bool>()
    let showAlertPublisher = PublishSubject<(String, String)>()
    let showErrorPublisher = PublishSubject<String>()
    
    init(userService: UserServiceProtocol,
         userDefaults: UserDefaultsUtils) {
        self.userService = userService
        self.userDefaults = userDefaults
        input = Input(nameText: nameTextPublisher.asObserver(),
                      nameChanged: nameChangedPublisher.asObserver(),
                      tapContinueBtn: tapContinueBtnPublisher.asObserver())
        output = Output(goToMain: goToMainPublisher,
                        enableContinueBtn: enableContinueBtnPublisher,
                        showLoading: showLoadingPublisher,
                        showAlert: showAlertPublisher,
                        showError: showErrorPublisher)
        super.init()
        
        nameChangedPublisher.withLatestFrom(nameTextPublisher).map { $0.isEmpty }.bind { [weak self] (isEmpty) in
            guard let self = self else { return }
            self.enableContinueBtnPublisher.onNext(isEmpty)
        }.disposed(by: disposeBag)
        
        tapContinueBtnPublisher.withLatestFrom(Observable.combineLatest(idPublisher, socialPublisher, nameTextPublisher)).bind { [weak self] (id, social, name) in
            guard let self = self else { return }
            // 동일한 닉네임 있는지 검사
            self.showLoadingPublisher.onNext(true)
            self.userService.findUserByName(name: name) { (userObservable) in
                userObservable.subscribe(onNext: { (userList) in
                    if userList.isEmpty {
                        let user = User(id: id, social: social, name: name)
                        
                        self.userService.signup(user: user) { (observable) in
                            observable.subscribe(onNext: { (_) in
                                self.userDefaults.setToken(token: id)
                                self.goToMainPublisher.onNext(())
                                self.showLoadingPublisher.onNext(false)
                            }, onError: { (error) in
                                self.showAlertPublisher.onNext(("회원가입 오류", error.localizedDescription))
                                self.showLoadingPublisher.onNext(false)
                            }).disposed(by: self.disposeBag)
                        }
                    } else {
                        self.showErrorPublisher.onNext("동일한 닉네임이 존재합니다.")
                        self.showLoadingPublisher.onNext(false)
                    }
                }, onError: { (error) in
                    self.showAlertPublisher.onNext(("닉네임 조회 오류", error.localizedDescription))
                    self.showLoadingPublisher.onNext(false)
                }).disposed(by: self.disposeBag)
            }
            
        }.disposed(by: disposeBag)
        
    }
    
}

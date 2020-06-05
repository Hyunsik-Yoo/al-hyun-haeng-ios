import UIKit

class ProfileVC: BaseVC {
    private lazy var profileView = ProfileView(frame: self.view.frame)
    
    private var viewModel = ProfileViewModel(userService: UserService(),
                                             userDefaults: UserDefaultsUtils())
    
    static func instance(id: String, social: String) -> ProfileVC {
        return ProfileVC(nibName: nil, bundle: nil).then {
            $0.viewModel.idPublisher.onNext(id)
            $0.viewModel.socialPublisher.onNext(social)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        
        setKeyboardVisible(visible: true)
    }
    
    override func bindEvent() {
        profileView.backBtn.rx.tap.bind { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }
    
    override func bindViewModel() {
        // Bind input
        profileView.nicknameField.rx.text.orEmpty.bind(to: viewModel.input.nameText)
            .disposed(by: disposeBag)
        profileView.continueBtn.rx.tap.bind(to: viewModel.input.tapContinueBtn)
            .disposed(by: disposeBag)
        profileView.nicknameField.rx.controlEvent(.editingChanged).bind(to: viewModel.input.nameChanged)
            .disposed(by: disposeBag)
        
        // Bind output
        viewModel.output.goToMain.bind(onNext: goToMain)
            .disposed(by: disposeBag)
        viewModel.output.enableContinueBtn.bind(onNext: profileView.setEmptyBtn(isEmpty:))
            .disposed(by: disposeBag)
        viewModel.output.showLoading.bind(onNext: profileView.showLoading(isShow:))
            .disposed(by: disposeBag)
        viewModel.output.showAlert.bind { [weak self] (title, message) in
            guard let self = self else { return }
            AlertUtils.show(controller: self, title: title, message: message)
        }.disposed(by: disposeBag)
        viewModel.output.showError.bind(onNext: profileView.showError(error:))
            .disposed(by: disposeBag)
    }
    
    private func setKeyboardVisible(visible: Bool) {
        if visible {
            profileView.nicknameField.becomeFirstResponder()
        } else {
            profileView.nicknameField.resignFirstResponder()
        }
    }
    
    private func goToMain() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToMain()
        }
    }
}

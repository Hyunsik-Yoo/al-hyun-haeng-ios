import UIKit

class ProfileVC: BaseVC {
    private lazy var profileView = ProfileView(frame: self.view.frame)
    
    static func instance(id: String, social: String) -> ProfileVC {
        return ProfileVC(nibName: nil, bundle: nil)
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
    
    private func setKeyboardVisible(visible: Bool) {
        if visible {
            profileView.nicknameField.becomeFirstResponder()
        } else {
            profileView.nicknameField.resignFirstResponder()
        }
        
    }
}

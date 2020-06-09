import UIKit

class SplashVC: BaseVC {
    
    static func instance() -> SplashVC {
        return SplashVC(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        validateToken()
    }
    
    private func validateToken() {
        if let _ = UserDefaultsUtils().getToken() {
            goToMain()
        } else {
            goToSignIn()
        }
    }
    
    private func goToMain() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToMain()
        }
    }
    
    private func goToSignIn() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToMain()
        }
    }
}

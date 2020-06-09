import UIKit

class MainTabBarVC: UITabBarController {
    
    let homeVC = HomeVC.instance()
    let myPageVC = MyPageVC.instance()
    
    static func instance() -> MainTabBarVC {
        return MainTabBarVC(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setViewControllers([homeVC, myPageVC], animated: true)
        view.backgroundColor = .white
    }
}

extension MainTabBarVC: UITabBarControllerDelegate {
    
}

import UIKit

class HomeVC: BaseVC {
    
    static func instance() -> UINavigationController {
        let controller = HomeVC(nibName: nil, bundle: nil).then {
            $0.title = "title_home".localized
            $0.navigationItem.largeTitleDisplayMode = .automatic
            $0.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        }
        
        return UINavigationController(rootViewController: controller)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

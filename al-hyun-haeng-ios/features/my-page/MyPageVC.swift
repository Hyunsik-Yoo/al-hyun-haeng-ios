import UIKit

class MyPageVC: BaseVC {
    
    private lazy var myPageView = MyPageView(frame: self.view.frame)
    
    static func instance() -> UINavigationController {
        let controller = MyPageVC(nibName: nil, bundle: nil).then {
            $0.title = "title_my_page".localized
            $0.navigationItem.largeTitleDisplayMode = .automatic
            $0.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        }
        
        return UINavigationController(rootViewController: controller)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myPageView
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_setting"), style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

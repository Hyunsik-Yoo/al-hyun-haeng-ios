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
        view = myPageView
        setupNavigationBar()
        
        super.viewDidLoad()
    }
    
    override func bindEvent() {
        navigationItem.rightBarButtonItem?.rx.tap.bind(onNext: { [weak self] (_) in
            guard let self = self else { return }
            self.navigationController?.pushViewController(SettingVC.instance(), animated: true)
        }).disposed(by: disposeBag)
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_setting"), style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

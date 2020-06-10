import UIKit
import RxSwift

class SettingVC: BaseVC {
    
    private lazy var settingView = SettingView(frame: self.view.frame)
    private let viewModel = SettingViewModel(userService: UserService(),
                                             userDefaults: UserDefaultsUtils(),
                                             firebaseUtils: FirebaseUtils())
    
    static func instance() -> SettingVC {
        return SettingVC(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = settingView
        setupTableView()
        viewModel.fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        restoreNavigation()
    }
    
    override func bindViewModel() {
        viewModel.output.showLoading.bind(onNext: settingView.showLoading(isShow:))
            .disposed(by: disposeBag)
        viewModel.output.showAlert.bind { [weak self] (title, message) in
            guard let self = self else { return }
            AlertUtils.show(controller: self, title: title, message: message)
        }.disposed(by: disposeBag)
        viewModel.output.goToSignIn.bind(onNext: goToSignIn)
            .disposed(by: disposeBag)
    }
    
    private func setNavigation() {
        title = "title_setting".localized
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func restoreNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        settingView.tableView.delegate = self
        settingView.tableView.dataSource = self
        settingView.tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.registerId)
    }
    
    private func goToSignIn() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.goToSignIn()
        }
    }
}

extension SettingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.registerId, for: indexPath) as? TextCell else {
            return UITableViewCell()
        }

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "sign_out".localized
        case 1:
            cell.textLabel?.text = "membership_withdraw".localized
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: // 로그아웃
            AlertUtils.showWithCancel(controller: self, "로그아웃", message: "로그아웃 하시겠습니까?") {
                self.viewModel.input.signout.onNext(())
            }
        case 1: // 회원 탈퇴
            break
        default:
            break
        }
    }
}

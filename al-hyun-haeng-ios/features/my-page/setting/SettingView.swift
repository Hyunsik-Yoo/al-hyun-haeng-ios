import UIKit

class SettingView: BaseView {
    let tableView = UITableView().then {
        $0.tableFooterView = UIView()
        $0.separatorStyle = .none
    }
    
    override func setup() {
        backgroundColor = .white
        addSubViews(tableView)
    }
    
    override func bindConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
        }
    }
}

import UIKit

class TextCell: BaseTableViewCell {
    
    static let registerId = "\(TextCell.self)"
    
    let label = UILabel().then{
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20)
    }
    
    override func setup() {
        backgroundColor = .white
        addSubViews(label)
        selectionStyle = .none
    }
    
    override func bindConstraints() {
        
        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().offset(-25)
        }
    }
}

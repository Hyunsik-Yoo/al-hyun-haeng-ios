import UIKit

class MyPageView: BaseView {
    
    let scrollView = UIScrollView()
    
    let containerView = UIView()
    
    let profileImage = UIImageView().then {
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 5
    }
    
    let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont(name: "SpoqaHanSans-Regular", size: 25)
        $0.textColor = .black
    }
    
    let nameUnderLine = UIView().then {
        $0.backgroundColor = .underlineGreen
        $0.layer.cornerRadius = 3
    }
    
    let historyEmoji = UILabel().then {
        $0.text = "🎯"
        $0.font = .systemFont(ofSize: 25)
    }
    
    let historyLabel = UILabel().then {
        $0.text = "my_recent_record".localized
        $0.font = UIFont(name: "SpoqaHanSans-Regular", size: 25)
        $0.textColor = .systemGray
    }
    
    let historyUnderLine = UIView().then {
        $0.backgroundColor = .underlineGreen
        $0.layer.cornerRadius = 3
        $0.isHidden = true
    }
    
    let moreBtn = UIButton().then {
        $0.setTitle("btn_more".localized, for: .normal)
        $0.setTitleColor(.systemGray, for: .normal)
    }
    
    let arrowBtn = UIButton().then {
        $0.setImage(UIImage(named: "ic_arrow_forward"), for: .normal)
    }
    
    override func setup() {
        backgroundColor = .white
        containerView.addSubViews(profileImage, nameUnderLine, nameLabel,
                                  historyEmoji, historyUnderLine, historyLabel,
                                  moreBtn, arrowBtn)
        scrollView.addSubViews(containerView)
        addSubViews(scrollView)
    }
    
    override func bindConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        profileImage.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(15)
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(profileImage.snp.right).offset(20)
            make.top.equalTo(profileImage).offset(10)
        }
        
        nameUnderLine.snp.makeConstraints { (make) in
            make.left.right.equalTo(nameLabel)
            make.bottom.equalTo(nameLabel).offset(-5)
            make.height.equalTo(5)
        }
        
        historyEmoji.snp.makeConstraints { (make) in
            make.left.equalTo(profileImage)
            make.top.equalTo(profileImage.snp.bottom).offset(40)
        }
        
        historyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(historyEmoji.snp.right)
            make.top.bottom.equalTo(historyEmoji)
        }
        
        historyUnderLine.snp.makeConstraints { (make) in
            make.left.right.equalTo(historyLabel)
            make.bottom.equalTo(historyLabel).offset(-5)
            make.height.equalTo(5)
        }
        
        arrowBtn.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(historyLabel)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(15)
        }
        
        moreBtn.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(historyLabel)
            make.right.equalTo(arrowBtn.snp.left).offset(-5)
        }
    }
}

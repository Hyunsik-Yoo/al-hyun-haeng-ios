import UIKit


class ProfileView: BaseView {
    
    let backBtn = UIButton().then {
        $0.setImage(UIImage(named: "ic_back"), for: .normal)
    }
    
    let titleLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = .black
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 30)
    }
    
    let titleLabel2 = UILabel().then {
        $0.text = " 입력✏️"
        $0.textColor = .black
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 30)
    }
    
    let underLine = UIView().then {
        $0.backgroundColor = UIColor(r: 82, g: 255, b: 32)
        $0.layer.cornerRadius = 3
    }
    
    let descLabel = UILabel().then {
        $0.text = "원하는 닉네임을 입력해주세요.\n설정 후에도 닉네임을 변경할 수 있습니다."
        $0.textColor = .systemGray
        $0.font = UIFont(name: "SpoqaHanSans-Regular", size: 15)
    }
    
    let nicknameField = UITextField().then {
        $0.font = UIFont(name: "SpoqaHanSans-Regular", size: 20)
        $0.textAlignment = .left
        $0.placeholder = "둔산동 꿀주먹"
    }
    
    let continueBtn = UIButton().then {
        $0.setTitle("계속하기 ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 2
        $0.isEnabled = false
        $0.backgroundColor = UIColor(r: 162, g: 162, b: 162)
        $0.titleLabel?.font = UIFont(name: "SpoqaHanSans-Regular", size: 15)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 5
    }
    
    let errorLabel = UILabel().then {
        $0.text = "에러라벨"
        $0.textColor = .black
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 15)
        $0.isHidden = true
    }
    
    let errorUnderline = UIView().then {
        $0.backgroundColor = UIColor(r: 245, g: 83, b: 37)
        $0.layer.cornerRadius = 3
        $0.isHidden = true
    }
    
    override func setup() {
        backgroundColor = .white
        addSubViews(backBtn, underLine, titleLabel, titleLabel2, descLabel,
                    nicknameField, continueBtn, errorUnderline, errorLabel)
    }
    
    override func bindConstraints() {
        
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(backBtn.snp.bottom).offset(30)
        }
        
        titleLabel2.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(titleLabel)
            make.left.equalTo(titleLabel.snp.right)
        }
        
        underLine.snp.makeConstraints { (make) in
            make.left.right.equalTo(titleLabel)
            make.bottom.equalTo(titleLabel).offset(-5)
            make.height.equalTo(6)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        nicknameField.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(descLabel.snp.bottom).offset(20)
        }
        
        continueBtn.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(nicknameField.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        errorLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(continueBtn.snp.bottom).offset(5)
        }
        
        errorUnderline.snp.makeConstraints { (make) in
            make.left.right.equalTo(errorLabel)
            make.bottom.equalTo(errorLabel).offset(-5)
            make.height.equalTo(3)
        }
    }
    
    func showError(error: String) {
        errorLabel.isHidden = false
        errorUnderline.isHidden = false
        errorLabel.text = error
    }
    
    func setEmptyBtn(isEmpty: Bool) {
        continueBtn.isEnabled = !isEmpty
        if isEmpty {
            continueBtn.backgroundColor = UIColor(r: 162, g: 162, b: 162)
        } else {
            continueBtn.backgroundColor = UIColor(r: 29, g: 171, b: 224)
        }
    }
}

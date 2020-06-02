import UIKit
import AuthenticationServices
import FBSDKCoreKit
import FBSDKLoginKit
import SnapKit

class SignInView: BaseView {
    
    let alLabel = UILabel().then {
        $0.text = "알"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .black
    }
    
    let underLine1 = UIView().then {
        $0.backgroundColor = UIColor(r: 82, g: 255, b: 32)
        $0.layer.cornerRadius = 3
    }
    
    let subLabel1 = UILabel().then {
        $0.text = "쏭달쏭"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
    let subLabel2 = UILabel().then {
        $0.text = "바쁘다 바빠"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
    let hyunLabel = UILabel().then {
        $0.text = "현"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .black
    }
    
    let underLine2 = UIView().then {
        $0.backgroundColor = UIColor(r: 82, g: 255, b: 32)
        $0.layer.cornerRadius = 3
    }
    
    let subLabel3 = UILabel().then {
        $0.text = "대사회 속"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
    let subLabel4 = UILabel().then {
        $0.text = "소소한 "
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
    let haengLabel = UILabel().then {
        $0.text = "행"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .black
    }
    
    let underLine3 = UIView().then {
        $0.backgroundColor = UIColor(r: 82, g: 255, b: 32)
        $0.layer.cornerRadius = 3
    }
    
    let subLabel5 = UILabel().then {
        $0.text = "복이"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
    let subLabel6 = UILabel().then {
        $0.text = "되어줄 녀석"
        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
        $0.textColor = .systemGray
    }
    
//    let titleLabel = UILabel().then {
//        $0.text = "알쏭달쏭\n바쁘다바빠\n현대사회 속\n소소한 행복이\n되어줄 녀석"
//        $0.numberOfLines = 0
//        $0.font = UIFont(name: "SpoqaHanSans-Bold", size: 40)
//    }
    
    let appleBtn = ASAuthorizationAppleIDButton(type: .continue, style: .black).then {
        $0.cornerRadius = 0
    }
    
    let facebookBtn = UIButton().then {
        $0.backgroundColor = UIColor(r: 50, g: 92, b: 175)
        $0.setTitle("페이스북 계정으로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "SpoqaHanSans-Bold", size: 14)
        $0.setTitleColor(.white, for: .normal)
    }
    
    let fbBtn: FBLoginButton = {
        let button = FBLoginButton(frame: .zero)
        
        button.permissions = ["public_profile", "email"]
        return button
    }()
    
    
    override func setup() {
        backgroundColor = .white
        addSubViews(underLine1, alLabel, subLabel1, subLabel2, underLine2, hyunLabel,
                    subLabel3, subLabel4, underLine3, subLabel5, subLabel6, haengLabel, fbBtn, appleBtn, facebookBtn)
    }
    
    override func bindConstraints() {
        alLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
        }
        
        underLine1.snp.makeConstraints { (make) in
            make.left.right.equalTo(alLabel)
            make.bottom.equalTo(alLabel).offset(-5)
            make.height.equalTo(6)
        }
        
        subLabel1.snp.makeConstraints { (make) in
            make.left.equalTo(alLabel.snp.right)
            make.top.bottom.equalTo(alLabel)
        }
        
        subLabel2.snp.makeConstraints { (make) in
            make.left.equalTo(alLabel)
            make.top.equalTo(alLabel.snp.bottom)
        }
        
        hyunLabel.snp.makeConstraints { (make) in
            make.left.equalTo(alLabel)
            make.top.equalTo(subLabel2.snp.bottom)
        }
        
        underLine2.snp.makeConstraints { (make) in
            make.left.right.equalTo(hyunLabel)
            make.bottom.equalTo(hyunLabel).offset(-5)
            make.height.equalTo(6)
        }
        
        subLabel3.snp.makeConstraints { (make) in
            make.left.equalTo(hyunLabel.snp.right)
            make.top.bottom.equalTo(hyunLabel)
        }
        
        subLabel4.snp.makeConstraints { (make) in
            make.left.equalTo(alLabel)
            make.top.equalTo(hyunLabel.snp.bottom)
        }
        
        haengLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subLabel4.snp.right)
            make.top.bottom.equalTo(subLabel4)
        }
        
        underLine3.snp.makeConstraints { (make) in
            make.left.right.equalTo(haengLabel)
            make.bottom.equalTo(haengLabel).offset(-5)
            make.height.equalTo(6)
        }
        
        subLabel5.snp.makeConstraints { (make) in
            make.left.equalTo(haengLabel.snp.right)
            make.top.bottom.equalTo(haengLabel)
        }
        
        subLabel6.snp.makeConstraints { (make) in
            make.left.equalTo(alLabel)
            make.top.equalTo(subLabel5.snp.bottom)
        }
                
        facebookBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(40)
        }
        
        fbBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(0)
        }
        
        appleBtn.snp.makeConstraints { (make) in
            make.left.right.equalTo(facebookBtn)
            make.height.equalTo(40)
            make.bottom.equalTo(facebookBtn.snp.top).offset(-10)
        }
    }
}

import UIKit

class SignInVC: BaseVC {
    
    private lazy var signInView = SignInView(frame: self.view.frame)
    
    static func instance() -> SignInVC {
        return SignInVC(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
    }


}


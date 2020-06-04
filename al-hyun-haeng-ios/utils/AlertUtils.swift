import UIKit

struct AlertUtils {
    static func show(controller: UIViewController, title: String? = nil, message: String? = nil) {
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        show(controller: controller, title: title, message: message, [okAction])
    }
    
    static func showWithCancel(controller: UIViewController, _ title: String? = nil, message: String? = nil, onTapOk: @escaping () -> Void) {
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            onTapOk()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        show(controller: controller, title: title, message: message, [okAction, cancelAction])
    }
    
    static func show(controller: UIViewController, title: String?, message: String?, _ actions: [UIAlertAction]) {
        let alrtController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alrtController.addAction(action)
        }
        controller.present(alrtController, animated: true)
    }
}

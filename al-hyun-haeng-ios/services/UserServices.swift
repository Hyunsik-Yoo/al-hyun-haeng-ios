import RxSwift
import Firebase


protocol UserServiceProtocol {
    func validateUser(token: String, completion: @escaping ((Bool) -> Void))
}

class UserService: UserServiceProtocol {
    func validateUser(token: String, completion: @escaping (Bool) -> Void) {
        Firestore.firestore()
            .collection("user")
            .document(token)
            .getDocument { (snapshot, error) in
            if snapshot?.data() == nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

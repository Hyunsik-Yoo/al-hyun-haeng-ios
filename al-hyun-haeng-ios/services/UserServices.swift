import RxSwift
import Firebase


protocol UserServiceProtocol {
    func validateUser(token: String, completion: @escaping ((Bool) -> Void))
    func findUserByName(name: String, completion: @escaping ((Observable<[User]>) -> Void))
    func signup(user: User, completion: @escaping ((Observable<Void>) -> Void))
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
    
    func findUserByName(name: String, completion: @escaping ((Observable<[User]>) -> Void)) {
        Firestore.firestore().collection("user").whereField("name", isEqualTo: "id").getDocuments { (snapshot, error) in
            if let error = error {
                completion(Observable.error(error))
            } else {
                if let documents = snapshot?.documents {
                    var results: [User] = []
                    for document in documents {
                        let user = User(map: document.data())
                        
                        results.append(user)
                    }
                    completion(Observable.just(results))
                }
            }
        }
    }
    
    func signup(user: User, completion: @escaping ((Observable<Void>) -> Void)) {
        Firestore.firestore().collection("user").addDocument(data: user.toDict()) { (error) in
            if let error = error {
                completion(Observable.error(error))
            } else {
                completion(Observable.just(()))
            }
        }
    }
    
}

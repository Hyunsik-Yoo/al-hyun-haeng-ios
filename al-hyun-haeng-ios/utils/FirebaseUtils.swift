import FirebaseAuth

protocol FirebaseProtocol {
    func auth(credential: AuthCredential, onSuccess completion: @escaping () -> Void)
    func signOut()
}

struct FirebaseUtils: FirebaseProtocol {
    func auth(credential: AuthCredential, onSuccess completion: @escaping () -> Void) {
        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                completion()
            }
        }
    }
    
    func signOut() {
        try! Auth.auth().signOut()
    }
}

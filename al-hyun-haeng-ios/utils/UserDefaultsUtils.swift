import Foundation

struct UserDefaultsUtils {
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_IS_NORMAL_LAUNCH = "KEY_IS_NORMAL_LAUNCH"
    
    let instance: UserDefaults
    
    init(name: String? = nil) {
        if let name = name {
            UserDefaults().removePersistentDomain(forName: name)
            instance = UserDefaults(suiteName: name)!
        } else {
            instance = UserDefaults.standard
        }
    }
    
    func setToken(token: String) {
        instance.set(token, forKey: UserDefaultsUtils.KEY_TOKEN)
    }
    
    func getToken() -> String? {
        return instance.string(forKey: UserDefaultsUtils.KEY_TOKEN)
    }
    
    func setNormalLaunch(isNormal: Bool) {
        instance.set(isNormal, forKey: UserDefaultsUtils.KEY_IS_NORMAL_LAUNCH)
    }
    
    func isNormalLaunch() -> Bool {
        return instance.bool(forKey: UserDefaultsUtils.KEY_IS_NORMAL_LAUNCH)
    }
    
    func clear() {
        instance.removeObject(forKey: UserDefaultsUtils.KEY_IS_NORMAL_LAUNCH)
        instance.removeObject(forKey: UserDefaultsUtils.KEY_TOKEN)
    }
}

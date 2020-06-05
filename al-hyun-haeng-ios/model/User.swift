import Foundation

struct User: Codable {
    var id: String
    var social: String
    var name: String
    var profile: String
    
    init(map: [String: Any]) {
        self.id = map["id"] as! String
        self.social = map["social"] as! String
        self.name = map["name"] as! String
        self.profile = map["profile"] as! String
    }
    
    init(id: String, social: String, name: String) {
        self.id = id
        self.social = social
        self.name = name
        self.profile = ""
    }
    
    func toDict() -> [String: Any] {
        return ["id": id,
                "social": social,
                "name": name,
                "profile": profile]
    }
}

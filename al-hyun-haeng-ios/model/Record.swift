import Foundation

struct Record: Codable {
    var date: String
    var type: GameType
    var rank: String
    var value: String
}

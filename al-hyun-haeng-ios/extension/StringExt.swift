import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Strings", value: "에베베", comment: "")
    }
}

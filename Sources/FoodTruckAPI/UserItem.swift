
import Foundation

typealias JSONDictionary = [String: Any]

protocol DictionaryConvertible {
    func toDict() -> JSONDictionary
}

public struct UserItem {
    
    /// ID
    public let docId: String
    public let id: String
    public let permission: String
    public let phonenumber: String
    public let Password: String
    public let name: String
    public let partneruid: String
    public let mail: String
    
    public init(docId: String,id: String, permission: String, phonenumber: String, Password: String, name: String, partneruid: String, mail: String) {
        self.docId = docId
        self.id = id
        self.permission = permission
        self.phonenumber = phonenumber
        self.Password = Password
        self.name = name
        self.partneruid = partneruid
        self.mail = mail
    }
}

extension UserItem: Equatable {
    public static func == (lhs: UserItem, rhs: UserItem) -> Bool {
        return lhs.docId == rhs.docId &&
            lhs.id == rhs.id &&
            lhs.permission == rhs.permission &&
            lhs.phonenumber == rhs.phonenumber &&
            lhs.Password == rhs.Password &&
            lhs.name == rhs.name &&
            lhs.partneruid == rhs.partneruid &&
            lhs.mail == rhs.mail
    }
}

extension UserItem: DictionaryConvertible {
    func toDict() -> JSONDictionary {
        var result = JSONDictionary()
        result["id"] = self.docId
        result["_id"] = self.id
        result["permission"] = self.permission
        result["phonenumber"] = self.phonenumber
        result["Password"] = self.Password
        result["name"] = self.name
        result["partneruid"] = self.partneruid
        result["mail"] = self.mail
        
        return result
    }
}

extension Array where Element: DictionaryConvertible {
    func toDict() -> [JSONDictionary] {
        return self.map { $0.toDict() }
    }
}

import Foundation
import RealmSwift

class Persistance {
    static let shared = Persistance()
    private let kUserName = "Persistance.kUserName"
    private let kUserSecondName = "Persistance.kUserSecondName"
    var userName : String {
        set {
            UserDefaults.standard.set(newValue, forKey: kUserName)
        } get {
            return UserDefaults.standard.string(forKey: kUserName) ?? ""
        }
    }
    var userSecondName : String {
        set {
            UserDefaults.standard.set(newValue, forKey: kUserSecondName)
        } get {
            return UserDefaults.standard.string(forKey: kUserSecondName) ?? ""
        }
    }
    
    let realm = try! Realm()
    
}


import Foundation

struct DataUser {
    let email: String
    let phone: String
    let password: String

    static func setupUser()-> DataUser {
        DataUser(
                 email: "cat@mail.ru",
                 phone: "89997654321",
                 password: "0000")
    }
}

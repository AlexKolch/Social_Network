
import Foundation

struct DataUser {
    let name: String
    let surname: String
    let email: String
    let phone: String
    let password: String
    let status: String
    let image: String

    var fullName: String {
        name + " " + surname
    }

    static func setupUser()-> DataUser {
        DataUser(
            name: "Foo",
            surname: "Bar",
            email: "cat@mail.ru",
            phone: "89997654321",
            password: "0000",
            status: "Baz",
            image: "cat")
    }
}

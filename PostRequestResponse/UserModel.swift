public struct UserRequest : Codable {
    var username : String
    var email : String
    var password : String
}

struct UserResponse : Codable {
    var id : String
    var token : String
    var error : String?
    
}


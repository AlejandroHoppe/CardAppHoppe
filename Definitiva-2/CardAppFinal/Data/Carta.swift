import Foundation

struct Carta: Codable {
    var id: Int = -1
    var price: Double = 0
    var name: String = ""
    var description: String? = ""
    var imageURL: String = ""
    var edicion: String = ""
    var lang: String = ""
    var state: String = ""
    var vendedor: String = ""
    
}

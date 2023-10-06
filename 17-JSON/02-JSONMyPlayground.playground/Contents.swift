import UIKit

let myJSON = """

{
    "fruit": "Apple",
    "size": "Large",
    "color": "Red"
}

"""

struct Fruit : Codable {
    //1. No es necesario que respetemos el nombre de las claves del JSON, por ejemplo, en vez de que se llame fuit le podemos poner name 
    var name: String
    var size: String
    var color: String
    
    //2. Si compilamos nos dara un error y esto es por que tienen nombres distintos, para solucionarlo podemos recurrir a los enumerados de tipo string y CodingKey. de modo que en este enumerado definiremos las variables y su clave coprrespodiente en el JSON
    enum CodingKeys: String, CodingKey {
        case name = "fruit"
        case size
        case color
    }
}


let decoder = JSONDecoder()


if let jsonData = myJSON.data(using: .utf8){
    do{
        let fruit = try decoder.decode(Fruit.self, from: jsonData)
        print(fruit)
    }catch {
        print(error)
    }
}

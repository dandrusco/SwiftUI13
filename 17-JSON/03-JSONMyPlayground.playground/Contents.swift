import UIKit

//1. Le agregaremos mas datos a nuestro JSON
let myJSON = """

{
    "fruit": "Apple",
    "size": "Large",
    "color": "Red",
    "price": 2,
    "location": {
        "country": "Brasil"
    }
}

"""

struct Fruit : Codable {
    var name: String
    var size: String
    var color: String
    //2. Agregaremos las nuevas variables
    var price: Int
    var country: String
    
    enum CodingKeys: String, CodingKey {
        case name = "fruit"
        case size
        case color
        //3. Agregaremos los casos nuevos
        case price
        case country = "location"
    }
    //4. Claramente aqui tenemos un problema, si bien hemos renombrado la location por country, la location en su interior tiene otro JSON, por lo tanto deberemos crear otro enumerado
    enum LocationKeys: String, CodingKey {
        case country
        //5. Si compilamos nos dara un error ya que country lo declaramos como String pero nos devuelve un diccionario
    }
    //6. Deberemos crear una descodificacion anidada, para ello crearemos un constructor Decoder y marcado con throws por si nos da errores
    init(from decoder: Decoder) throws {
        //7. intentaremos recuperar todos los valores
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //8. Navegaremos por cada valor
        self.name = try values.decode(String.self, forKey: .name)
        self.size = try values.decode(String.self, forKey: .size)
        self.color = try values.decode(String.self, forKey: .color)
        self.price = try values.decode(Int.self, forKey: .price)
        //9. Para la location deberemos crear una variable temporal
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try location.decode(String.self, forKey: .country)
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

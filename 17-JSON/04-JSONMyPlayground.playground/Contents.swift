import UIKit

//1. Un JSON puede tener diferentes arrays, modificaremos este JSON para que tenga otras frutas
let myJSON = """
{
"fruits": [
    {
        "fruit": "Apple",
        "size": "Large",
        "color": "Red",
        "price": 2,
        "location": {
            "country": "Brasil"
        }
    },
    {
        "fruit": "Banana",
        "size": "Medium",
        "color": "Yollow",
        "price": 1,
        "location": {
            "country": "Canarias"
        }
    }
    ]
}

"""
//2. Ahora deberemos sacar un arrays de frutas, para ello deberemos crear una estructura padre
struct FruitStore: Codable {
    //3. Crearemos una variable que contenga el arrays de frutas
    var fruits: [Fruit]
}

struct Fruit : Codable {
    var name: String
    var size: String
    var color: String
    var price: Int
    var country: String
    
    enum CodingKeys: String, CodingKey {
        case name = "fruit"
        case size
        case color
        case price
        case country = "location"
    }

    enum LocationKeys: String, CodingKey {
        case country
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.size = try values.decode(String.self, forKey: .size)
        self.color = try values.decode(String.self, forKey: .color)
        self.price = try values.decode(Int.self, forKey: .price)
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try location.decode(String.self, forKey: .country)
    }
    
}


let decoder = JSONDecoder()


if let jsonData = myJSON.data(using: .utf8){
    do{
        //3. Aqui con fruit sacabamos una fruta, por lo tanto lo modificaremos por fruitStore
        let fruitStore = try decoder.decode(FruitStore.self, from: jsonData)
        //4. En vez de imprimir la fruta, deberemos pasarle cada una a travez de un For
        for fruit in fruitStore.fruits {
            print(fruit)
        }
    }catch {
        print(error)
    }
}

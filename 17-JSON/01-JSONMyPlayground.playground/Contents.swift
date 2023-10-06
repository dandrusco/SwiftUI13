import UIKit

//1. Crearemos una variable que en su interior tendra un codigo JSON
let myJSON = """

{
    "fruit": "Apple",
    "size": "Large",
    "color": "Red"
}

"""

//2. Crearemos una estructura de tipo Codable, para poder procesar el JSON
struct Fruit : Codable {
    //3. Declararemos las 3 variables
    var fruit: String
    var size: String
    var color: String
}

//4. Vanms a decodificar el JSON
let decoder = JSONDecoder()

//5. utilizaremops un casting seguro. SI podemos extrar los datos del JSON?
if let jsonData = myJSON.data(using: .utf8){
    //6. forzamos con un DO
    do{
        //7. Si no hay ningun error ejecutaremos y se lo pasaremos a la variable fruit
        let fruit = try decoder.decode(Fruit.self, from: jsonData)
        //8. Imprimimos
        print(fruit)
    }//9. Si no capturamos el error
    catch {
        //10. Imprimimos el error
        print(error)
    }
}

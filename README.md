# Introducción al Proyecto 🚀

## Proyect from bootcamp iOS Developer


### Creamos una aplicación meteorológica habilitada para el modo oscuro. Tambien verificamos el clima para la ubicación actual en función de los datos GPS del iPhone, así como también buscando una ciudad manualmente.  :fa-cogs:

------------



#### Model View Controller (MVC).

#####Model 📘
Propiedades calculadas de Swift.
` var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"`

Analizar JSON con los protocolos nativos Encodable y Decodable.

    struct WeatherData: Codable {
        let name: String
        let main: Main
        let weather: [Weather]
    }
    
    struct Main: Codable{
        let temp: Double
    }
    
    struct Weather: Codable {
        let description: String
        let id: Int
    }
Aprender a usar Grand Central Dispatch para obtener el hilo principal.
`DispatchQueue`

Cómo usar URLSession para conectarse en red y realizar solicitudes HTTP.
`4 pasos importantes`

Aprender a usar Core Location para obtener la ubicación actual del GPS del teléfono.
` var locationManager = CLLocationManager()`

------------

##### View 💻

Cómo usar imágenes vectoriales como activos de imagen.

Cómo crear una aplicación habilitada para el modo oscuro. :fa-adjust:

------------

##### Controller ⌨️

Cómo usar UITextField para obtener información del usuario.
`extension WeatherViewController: UITextFieldDelegate`

Protocolos y extensiones Swift.
###### `locationManager.delegate = self` reponde como delegado

utilizamos framworks = UIKit y CoreLocation
`import UIKit /
import CoreLocation`

Información sobre el patrón de delegado.

------------


###### Utilizamos 
##### //MARK: -  :fa-align-justify:
Para una mejor lectura el codigo esta marcado por secciones.









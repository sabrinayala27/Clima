# Introducci贸n al Proyecto 馃殌

## Proyect from bootcamp iOS Developer


### Creamos una aplicaci贸n meteorol贸gica habilitada para el modo oscuro. Tambien verificamos el clima para la ubicaci贸n actual en funci贸n de los datos GPS del iPhone, as铆 como tambi茅n buscando una ciudad manualmente.  

------------



#### Model View Controller (MVC).

#####Model 馃摌
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

C贸mo usar URLSession para conectarse en red y realizar solicitudes HTTP.
`4 pasos importantes`

Aprender a usar Core Location para obtener la ubicaci贸n actual del GPS del tel茅fono.
` var locationManager = CLLocationManager()`

------------

##### View 馃捇

C贸mo usar im谩genes vectoriales como activos de imagen.

C贸mo crear una aplicaci贸n habilitada para el modo oscuro. 

------------

##### Controller 鈱笍

C贸mo usar UITextField para obtener informaci贸n del usuario.
`extension WeatherViewController: UITextFieldDelegate`

Protocolos y extensiones Swift.
###### `locationManager.delegate = self` reponde como delegado

utilizamos framworks = UIKit y CoreLocation
`import UIKit /
import CoreLocation`

Informaci贸n sobre el patr贸n de delegado.

------------


###### Utilizamos 
麓 //MARK: -  麓
Para una mejor lectura, el c贸digo esta marcado por secci贸nes.









//
//  ViewController.swift
//  MAPA
//
//  Created by imac on 22/10/24.
//

import UIKit
import MapKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var lblPais: UILabel!
    @IBOutlet weak var imvCiudad: UIImageView!
    @IBOutlet weak var mapCiudad: MKMapView!
    @IBOutlet weak var srcCiudades: UIScrollView!
    
    let ciudades = ["Berlín", "Cd. México", "París", "Tokio", "Washington"]
    let paises = ["Alemania", "México", "Francia", "Japón", "USA"]
    let imagenes = ["Ciudad Berlin.jpg", "Ciudad Mexico.jpg", "Ciudad Paris.jpg", "Ciudad Tokio.jpg", "Ciudad Washington.jpg"]
    let latitud = [52.51917, 19.43260, 48.85661, 35.68949, 38.89511]
    let longitudes = [13.40609, -99.13320, 2.35222, 139.69170, -77.03637]
    var indice = 0
    let pin = Marcador()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        srcCiudades.contentSize = CGSize(width: 0, height: mapCiudad.frame.origin.y + mapCiudad.frame.height + 10)
        setearMapa()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return ciudades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return ciudades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indice = row
        lblPais.text = "Pais: \(paises[indice])"
        imvCiudad.image = UIImage(named: imagenes[indice])
        setearMapa()
    }
    
    func setearMapa()
    {
        var region = MKCoordinateRegion()
        mapCiudad.removeAnnotation(pin)
        
        region.span.latitudeDelta = 0.1
        region.span.longitudeDelta = 0.1
        region.center.latitude = latitud[indice]
        region.center.longitude = longitudes[indice]
        pin.coordinate = region.center
        pin.title = "Latitude \(latitud[indice])"
        pin.subtitle = "Longitud \(longitudes[indice])"

        mapCiudad.setRegion(region, animated: true)
        mapCiudad.addAnnotation(pin)
        
    }


}


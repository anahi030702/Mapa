//
//  Marcador.swift
//  MAPA
//
//  Created by imac on 24/10/24.
//

import UIKit
import MapKit

class Marcador: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    override init() {
        coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    

}

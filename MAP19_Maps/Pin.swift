//
//  Pin.swift
//  MAP19_Maps
//
//  Created by David Svensson on 2020-02-13.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import Foundation
import MapKit


// vår klass håller sig till MKAnnottation protokollet då måste den ha en
// coordinate och den kan ha en titel
class Pin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = "Been here"
    }
}

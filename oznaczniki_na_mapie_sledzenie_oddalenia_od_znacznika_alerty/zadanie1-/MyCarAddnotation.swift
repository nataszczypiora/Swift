//
//  MyCarAddnotation.swift
//  zadanie1-
//
//  Created by Iga Łukiewska on 19/06/2020.
//  Copyright © 2020 Iga Łukiewska. All rights reserved.
//

import UIKit
import MapKit

class MyCarAddnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D)
    {
        self.title = "o tutaj jest auto"
        self.coordinate = coordinate
    }

}

//
//  Location.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 6/9/23.
//

import Foundation
import MapKit

struct Location {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}

//
//  LocationViewModel.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 19/9/23.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

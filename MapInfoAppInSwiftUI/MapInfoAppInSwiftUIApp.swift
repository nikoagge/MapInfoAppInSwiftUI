//
//  MapInfoAppInSwiftUIApp.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 6/9/23.
//

import SwiftUI

@main
struct MapInfoAppInSwiftUIApp: App {
    @StateObject private var locationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationsViewModel)
        }
    }
}

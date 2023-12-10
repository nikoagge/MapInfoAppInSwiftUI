//
//  LocationsView.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 19/9/23.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(locationsViewModel.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

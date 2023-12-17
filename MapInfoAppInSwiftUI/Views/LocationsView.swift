//
//  LocationsView.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 19/9/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationsViewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
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

extension LocationsView {
    private var header: some View {
            VStack {
                Button(action: locationsViewModel.toggleLocationsList) {
                    Text(locationsViewModel.mapLocation.name + ", " + locationsViewModel.mapLocation.cityName)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 58)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: locationsViewModel.mapLocation)
                        .overlay(alignment: .leading) {
                            Image(systemName: "arrow.down")
                                .font(.headline)
                                .foregroundColor(.primary)
                                .padding()
                                .rotationEffect(Angle(degrees: locationsViewModel.showLocationsList ? 180 : 0))
                }
            }
            if locationsViewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(13)
        .shadow(
            color: .black.opacity(0.4),
            radius: 22,
            x: 0,
            y: 15
        )
    }
}

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
    
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(
                        maxWidth: maxWidthForIpad)
                
                Spacer()
                
                locationsPreviewStack
            }
        }
        .sheet(
            item: $locationsViewModel.sheetLocation,
            onDismiss: nil
        ) { location in
                LocationDetailsView(location: location)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

private extension LocationsView {
    var header: some View {
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
    
    var mapLayer: some View {
        Map(
            coordinateRegion: $locationsViewModel.mapRegion,
            annotationItems: locationsViewModel.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect( locationsViewModel.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 13)
                        .onTapGesture {
                            locationsViewModel.showNextLocation(location: location)
                        }
                }
            })
    }
    
    var locationsPreviewStack: some View {
        ZStack {
            ForEach(locationsViewModel.locations) { location in
                if locationsViewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(
                            color: Color.black
                            .opacity(0.4),
                            radius: 20
                        )
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
            }
        }

    }
}

//
//  LocationDetailsView.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 23/12/23.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imagesSection
                    .shadow(
                        color: Color.black.opacity(0.4),
                        radius: 20,
                        x: 0,
                        y: 10
                    )
                
                VStack(
                    alignment: .leading,
                    spacing: 16
                ) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(
                    width: .infinity,
                    alignment: .leading
                )
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(
            backButton,
            alignment: .topLeading
        )
    }
}

struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

private extension LocationDetailsView {
    var imagesSection: some View {
        TabView {
            ForEach(
                location.imageNames,
                id: \.self
            ) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 580)
        .tabViewStyle(PageTabViewStyle())
    }
    
    var titleSection: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    var descriptionSection: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link(
                    "Read more on wikipedia",
                    destination: url
                )
                .font(.headline)
                .tint(.blue)
            }
        }
    }
    
    var mapLayer: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(
                    center: location.coordinates,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.01,
                        longitudeDelta: 0
                    )
            )),
            annotationItems: [location]
        ) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(
            1,
            contentMode: .fit
        )
        .cornerRadius(30)
    }
    
    var backButton: some View {
        Button {
            locationsViewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}

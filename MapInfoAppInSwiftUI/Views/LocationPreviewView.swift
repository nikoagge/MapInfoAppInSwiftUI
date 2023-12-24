//
//  LocationPreviewView.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 17/12/23.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(
            alignment: .bottom,
            spacing: 0
        ) {
            VStack(
                alignment: .leading,
                spacing: 16
            ) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 13)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipped()
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(location:  LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

private extension LocationPreviewView {
    var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 130,
                        height: 130
                    )
                    .cornerRadius(13)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(13)
    }
    
    var titleSection: some View {
        VStack(
            alignment: .leading,
            spacing: 4
        ) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    var learnMoreButton: some View {
        Button {
            locationsViewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(
                    width: 130,
                    height: 40
                )
        }
        .buttonStyle(.borderedProminent)
    }
    
    var nextButton: some View {
        Button {
            locationsViewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(
                    width: 130,
                    height: 40
                )
        }
        .buttonStyle(.bordered)
    }
}

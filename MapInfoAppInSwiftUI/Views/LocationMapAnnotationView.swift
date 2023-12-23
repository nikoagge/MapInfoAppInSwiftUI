//
//  LocationMapAnnotationView.swift
//  MapInfoAppInSwiftUI
//
//  Created by Nikos Aggelidis on 23/12/23.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color.accentColor
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(
                    width: 40,
                    height: 40
                )
                .font(.headline)
                .foregroundColor(.white)
                .background(accentColor)
                .cornerRadius(46)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(
                    width: 13,
                    height: 13
                )
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(
                    .bottom,
                    40
                )
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}

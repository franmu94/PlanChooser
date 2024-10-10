//
//  placeCellView.swift
//  PlanMaker
//
//  Created by Fran Malo on 9/10/24.
//

import SwiftUI
import MapKit

struct placeCellView: View {
    let place: Place
    let userLocation: CLLocationCoordinate2D
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                VStack (alignment: .leading) {
                    HStack {
                        Text(place.displayname)
                    }
                    HStack {
                        Text(String(place.rating))
//                        StarsRateComponent(rate: place.rating)
                        Text("\(place.distanceFromUser(userLocation: userLocation))")
                    }
                }
            }
            .font(.system(size: 16, weight: .regular, design: .rounded))
            
        }
    }
}

#Preview {
    placeCellView(place: .previewPlace, userLocation: .init())
}

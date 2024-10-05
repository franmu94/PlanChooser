//
//  UserLocationView.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import SwiftUI

import SwiftUI

struct UserLocationView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.lastKnownLocation {
                Text("Latitude: \(coordinate.latitude)")
                
                
                Text("Longitude: \(coordinate.longitude)")
            } else {
                Text("Unknown Location")
            }
            
            
            Button("Get location") {
                locationManager.checkLocationAuthorization()
                print("Latitude: \(locationManager.lastKnownLocation?.latitude)")
                print("Longitude: \(locationManager.lastKnownLocation?.longitude)")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    UserLocationView()
}

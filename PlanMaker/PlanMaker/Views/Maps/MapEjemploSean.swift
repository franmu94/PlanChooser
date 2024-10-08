//
//  MapEjemploSean.swift
//  PlanMaker
//
//  Created by Fran Malo on 8/10/24.
//

import MapKit
import SwiftUI

struct MapEjemploSean: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var cameraPosition = MapCameraPosition.region
    
    
    var body: some View {
        Map {
          UserAnnotation()
        }
    }
}

#Preview {
    MapEjemploSean()
}

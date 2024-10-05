//
//  platilla.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

class NearbySearch {
    func performSearch() {
        let userLocation = CLLocation(latitude: 40.4273, longitude: -3.6692) // Ubicación del usuario
        let searchRadiusInKilometers: Double = 0.4 // Radio en kilómetros

        // Define un área de búsqueda más grande que el radio para hacer una búsqueda inicial
        let regionRadiusInMeters = searchRadiusInKilometers * 1000 * 1.5 // Multiplica por 1.5 para cubrir más área en la búsqueda rectangular
        let regionSpan = MKCoordinateRegion(center: userLocation.coordinate,
                                            latitudinalMeters: regionRadiusInMeters,
                                            longitudinalMeters: regionRadiusInMeters)

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "openNow" // Tipo de lugar a buscar
        request.region = regionSpan

        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            print(response.mapItems)
            for item in response.mapItems {
                let placeLocation = item.placemark.location!
                let distanceInMeters = userLocation.distance(from: placeLocation)
                let distanceInKilometers = distanceInMeters / 1000

                // Filtrar solo lugares dentro del radio circular
                if distanceInKilometers <= searchRadiusInKilometers {
//                    print("Nombre: \(item.name ?? "No disponible")")
//                    print("Dirección: \(item.placemark.title ?? "No disponible")")
//                    print("Distancia: \(String(format: "%.2f", distanceInKilometers)) km")
                }
            }
        }
    }
    
    

    
}

struct plantilla: View {
    var body: some View {
        
        Button(action: {
            let search = NearbySearch()
            search.performSearch() // Llama a la búsqueda al cargar la vista
        }, label: {
            Text("Buscar lugares cercanos")        })
            .padding()
    }
}

#Preview {
    plantilla()
}

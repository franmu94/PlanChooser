//
//  MapModels.swift
//  PlanMaker
//
//  Created by Fran Malo on 2/10/24.
//

import Foundation
import MapKit

struct LocationMap: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D

    static let example = LocationMap(coordinate: CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103))
}



enum RangosMapa: String, CaseIterable {
    case nivel1 = "200 metros"
    case nivel2 = "300 metros"
    case nivel3 = "400 metros"
    case nivel4 = "500 metros"
    case nivel5 = "600 metros"
    case nivel6 = "700 metros"
    case nivel7 = "800 metros"
    case nivel8 = "900 metros"
    case nivel9 = "1 KM"
    case nivel10 = "1.5 KM"
    case nivel11 = "2 KM"
    case nivel12 = "2.5 KM"
    
    // Devolver el valor en metros como Double
    var metros: Double {
        switch self {
        case .nivel1:
            return 200.0
        case .nivel2:
            return 300.0
        case .nivel3:
            return 400.0
        case .nivel4:
            return 500.0
        case .nivel5:
            return 600.0
        case .nivel6:
            return 700.0
        case .nivel7:
            return 800.0
        case .nivel8:
            return 900.0
        case .nivel9:
            return 1000.0
        case .nivel10:
            return 1500.0
        case .nivel11:
            return 2000.0
        case .nivel12:
            return 2500.0
        }
    }
    
    // Calcular el zoom según los metros
    var zoom: Double {
        if metros >= 1000 {
            return metros / 50000.0
        } else if metros >= 400 {
            return metros / 45000.0
        } else {
            return 0.006
        }
    }
}







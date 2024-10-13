//
//  Place.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import SwiftUI
import MapKit
import Foundation

//struct Place {
//    let businessStatus: String?
//    let geometry: Geometry
//    let icon: String?
//    let name: String
//    let openingHours: OpeningHours?
//    let photos: [Photo]?
//    let placeID: String
//    let plusCode: PlusCode?
//    let priceLevel: Int?
//    let rating: Double?
//    let reference: String
//    let scope: String?
//    let types: [String]
//    let userRatingsTotal: Int?
//    let vicinity: String?
//}

struct Place: Codable, Identifiable, Hashable {
    
    let name: String?
    let id: String?
    let displayname: String
    let location: LatLng?
    let formattedAddress: String?
    let rating: Double
    let priceLevel: PriceLevel
    let primaryType: String
    
    
    
    
    func distanceFromUser(userLocation: CLLocationCoordinate2D) -> CLLocationDistance {
        guard let placeLocation = location else {
            return .greatestFiniteMagnitude
        }
        let placeCLLocation = CLLocation(latitude: placeLocation.latitude, longitude: placeLocation.longitude)
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let d = userCLLocation.distance(from: placeCLLocation)

        return d
    }
}



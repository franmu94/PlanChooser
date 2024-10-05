//
//  Place.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

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

struct Place {
    
    let id: String?
    let types: [String]?
    let formattedAddress : String?
    let rating: Double?
    let priceLevel: String?
    let userRatingCount: Int?
    let displayName: DisplayName?
    let photos: [Photo]?
}

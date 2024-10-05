//
//  APIPostModel.swift
//  PlanMaker
//
//  Created by Fran Malo on 4/10/24.
//

import Foundation


struct LocationRestriction: Codable {
    struct Circle: Codable {
        struct Center: Codable {
            let latitude: Double
            let longitude: Double
        }
        let center: Center
        let radius: Int
    }
    let circle: Circle
}

struct SearchRequest: Codable {
    let includedTypes: [String]
    let maxResultCount: Int
    let locationRestriction: LocationRestriction
}

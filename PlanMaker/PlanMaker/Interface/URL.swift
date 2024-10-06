//
//  URL.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation

let mainURLMaps = URL(string:"https://maps.googleapis.com/maps/api/place")!
let mainURLPlaces = URL(string: "https://places.googleapis.com/v1/places:")!
// searchNearby




extension URL {
    static let nearbySearchOldAPI = mainURLMaps.appending(path: "nearbysearch").appending(path: "json")
    static let nearbySearch = mainURLPlaces.appending(path: "searchNearby")

    
    
    static func finalNearbySearch(Location: (latitude: Double, longitude: Double), radius: Int) {
        
    }
}












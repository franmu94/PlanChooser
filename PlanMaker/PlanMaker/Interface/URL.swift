//
//  URL.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation

let mainURLMaps = URL(string:"https://maps.googleapis.com/maps/api/place")!
let mainURLPlaces = URL(string: "https://places.googleapis.com/v1/places:")!
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.4273,-3.6692&radius=400&type=restaurant&key=AIzaSyBEk4IyUYkG-BDVRInk6k5bRYcHevIyRIA
// searchNearby




extension URL {
    static let nearbySearchOldAPI = mainURLMaps.appending(path: "nearbysearch").appending(path: "json")
    static let nearbySearch = mainURLPlaces.appending(path: "searchNearby")

    
    
    static func finalNearbySearch(Location: (latitude: Double, longitude: Double), radius: Int) {
        
    }
}












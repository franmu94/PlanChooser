//
//  NearbyPlacesInteractor.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation

protocol PlacesInteractor {
    func getPlaces(includedTypes: [PlaceTypes], latitudeCenter: Double, longitudeCenter: Double, radius: Double) async throws -> [Place]  }

struct Network: PlacesInteractor, NetworkInteractor {
    var session: URLSession
    
    
    func getPlaces(includedTypes: [PlaceTypes],
                   latitudeCenter: Double,
                   longitudeCenter: Double,
                   radius: Double) async throws -> [Place] {
        
        let center = LocationRestriction.Circle.Center(latitude: latitudeCenter, longitude: longitudeCenter)
        let circle = LocationRestriction.Circle(center: center, radius: radius)
        let locationRestriction = LocationRestriction(circle: circle)
        
        var bodyRequest = SearchRequest(includedTypes: includedTypes.map(\.rawValue), maxResultCount: 5, locationRestriction: locationRestriction)
        return try await getJSON(request: .post(url: .nearbySearch, post: bodyRequest), type: PlacesResponse.self).places.map(\.toPlace)
    }
}

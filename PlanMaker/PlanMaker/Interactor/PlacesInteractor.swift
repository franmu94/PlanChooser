//
//  NearbyPlacesInteractor.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation

protocol PlacesInteractorProtocol {
    func getNearbyPlaces(includedTypes: [PlaceType], latitudeCenter: Double, longitudeCenter: Double, radius: Int) async throws -> [Place]  }

struct PlacesInteractor: NetworkInteractor, PlacesInteractorProtocol {
    var session: URLSession
    
    static let shared = PlacesInteractor()

    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getNearbyPlaces(includedTypes: [PlaceType],
                         latitudeCenter: Double,
                         longitudeCenter: Double,
                         radius: Int) async throws -> [Place] {
        
        let center = LocationRestriction.Circle.Center(latitude: latitudeCenter, longitude: longitudeCenter)
        let circle = LocationRestriction.Circle(center: center, radius: radius)
        let locationRestriction = LocationRestriction(circle: circle)
        
        let bodyRequest = SearchRequest(includedTypes: includedTypes.map(\.rawValue), maxResultCount: 5, locationRestriction: locationRestriction)
        return try await getJSON(request: .post(url: .nearbySearch, post: bodyRequest), type: PlacesResponse.self).places.map(\.toPlace)
    }
}

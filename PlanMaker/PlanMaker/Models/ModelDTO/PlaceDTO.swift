//
//  PlaceDTO.swift
//  PlanMaker
//
//  Created by Fran Malo on 1/10/24.
//

import Foundation

import Foundation

struct PlacesResponse: Codable {
    let places: [PlaceDTO]
}

struct PlaceDTO: Codable {
    let id: String?
    let types: [String]?
    let formattedAddress : String?
    let rating: Double?
    let priceLevel: String?
    let userRatingCount: Int?
    let displayName: DisplayName?
    let photos: [Photo]?
}

extension PlaceDTO {
    var toPlace: Place {
        Place(id: id,
              types: types,
              formattedAddress: formattedAddress,
              rating: rating,
              priceLevel: priceLevel,
              userRatingCount: userRatingCount,
              displayName: displayName,
              photos: photos)
    }
}





struct DisplayName: Codable {
    let text: String
    let languageCode: String
}

struct Photo: Codable {
    let name: String
    let widthPx: Int
    let heightPx: Int
    let authorAttributions: [AuthorAttribution]
}

struct AuthorAttribution: Codable {
    let displayName: String
    let uri: String
    let photoUri: String
}



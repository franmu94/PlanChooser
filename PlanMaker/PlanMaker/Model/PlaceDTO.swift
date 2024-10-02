//
//  PlaceDTO.swift
//  PlanMaker
//
//  Created by Fran Malo on 1/10/24.
//

import Foundation

// Struct para cada lugar dentro de los resultados
struct PlaceDTO: Codable {
    let businessStatus: String?
    let geometry: Geometry
    let icon: String?
    let name: String
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID: String
    let plusCode: PlusCode?
    let priceLevel: Int?
    let rating: Double?
    let reference: String
    let scope: String?
    let types: [String]
    let userRatingsTotal: Int?
    let vicinity: String?

    enum CodingKeys: String, CodingKey {
        case businessStatus = "business_status"
        case geometry
        case icon
        case name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case plusCode = "plus_code"
        case priceLevel = "price_level"
        case rating
        case reference
        case scope
        case types
        case userRatingsTotal = "user_ratings_total"
        case vicinity
    }
}

// Struct para la geometría (latitud y longitud)
struct Geometry: Codable {
    let location: Location
    let viewport: Viewport
}

// Struct para la ubicación
struct Location: Codable {
    let lat: Double
    let lng: Double
}

// Struct para el viewport (noreste y suroeste de la vista)
struct Viewport: Codable {
    let northeast: Location
    let southwest: Location
}

// Struct para las horas de apertura
struct OpeningHours: Codable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}

// Struct para las fotos
struct Photo: Codable {
    let height: Int?
    let htmlAttributions: [String]?
    let photoReference: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case htmlAttributions = "html_attributions"
        case photoReference = "photo_reference"
        case width
    }
}

// Struct para los códigos Plus (códigos geográficos)
struct PlusCode: Codable {
    let compoundCode: String?
    let globalCode: String?

    enum CodingKeys: String, CodingKey {
        case compoundCode = "compound_code"
        case globalCode = "global_code"
    }
}

// Struct para la respuesta principal
struct PlacesResponse: Codable {
    let htmlAttributions: [String]
    let nextPageToken: String?
    let results: [PlaceDTO]
    let status: String?

    enum CodingKeys: String, CodingKey {
        case htmlAttributions = "html_attributions"
        case nextPageToken = "next_page_token"
        case results
        case status
    }
}

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
    let name: String?
    let id: String?
    let types: [String]
    let nationalPhoneNumber: String?
    let internationalPhoneNumber: String?
    let formattedAddress: String?
    let addressComponents: [AddressComponent]?
    let plusCode: PlusCode?
    let location: LatLng?
    let viewport: Viewport?
    let rating: Double?
    let googleMapsUri: String?
    let websiteUri: String?
    let utcOffsetMinutes: Int?
    let adrFormatAddress: String?
    let businessStatus: String?
    let priceLevel: PriceLevel?
    let userRatingCount: Int?
    let iconMaskBaseUri: String?
    let iconBackgroundColor: String?
    let displayName: LocalizedText?
    let primaryTypeDisplayName: LocalizedText?
    let primaryType: String?
    let shortFormattedAddress: String?
    let reviews: [Review]?
    let photos: [Photo]?
    let paymentOptions: PaymentOptions?
    let accessibilityOptions: AccessibilityOptions?
    let regularOpeningHours: OpeningHours?
    let currentOpeningHours: OpeningHours?
    let currentSecondaryOpeningHours: [OpeningHours]?
    let regularSecondaryOpeningHours: [OpeningHours]?
    let delivery: Bool?
    let dineIn: Bool?
    let curbsidePickup: Bool?
    let reservable: Bool?
    let servesBreakfast: Bool?
    let servesLunch: Bool?
    let servesDinner: Bool?
    let servesBeer: Bool?
    let servesWine: Bool?
    let servesBrunch: Bool?
    let servesVegetarianFood: Bool?
}


struct LocalizedText: Codable {
    let text: String
    let languageCode: String?
}

struct AddressComponent: Codable {
    let longText: String
    let shortText: String
    let types: [String]
    let languageCode: String?
}

struct PlusCode: Codable {
    let globalCode: String
    let compoundCode: String?
}

struct LatLng: Codable {
    let latitude: Double
    let longitude: Double
}

struct Viewport: Codable {
    struct Bound: Codable {
        let latitude: Double
        let longitude: Double
    }
    let low: Bound
    let high: Bound
}

struct Review: Codable {
    struct AuthorAttribution: Codable {
        let displayName: String
        let uri: String?
        let photoUri: String?
    }
    let name: String?
    let relativePublishTimeDescription: String?
    let rating: Int
    let text: LocalizedText
    let originalText: LocalizedText
    let authorAttribution: AuthorAttribution
    let publishTime: String
}

struct Photo: Codable {
    struct AuthorAttribution: Codable {
        let displayName: String
        let uri: String?
        let photoUri: String?
    }
    let name: String
    let widthPx: Int
    let heightPx: Int
    let authorAttributions: [AuthorAttribution]
}

struct PaymentOptions: Codable {
    let acceptsDebitCards: Bool?
    let acceptsNfc: Bool?
}

struct AccessibilityOptions: Codable {
    let wheelchairAccessibleParking: Bool?
    let wheelchairAccessibleEntrance: Bool?
}

struct OpeningHours: Codable {
    struct Period: Codable {
        struct Time: Codable {
            let day: Int
            let hour: Int
            let minute: Int
            let date: DateInfo?
        }
        struct DateInfo: Codable {
            let year: Int
            let month: Int
            let day: Int
        }
        let open: Time
        let close: Time
    }
    let openNow: Bool?
    let periods: [Period]
    let weekdayDescriptions: [String]?
    let secondaryHoursType: String?
}

enum PriceLevel: String, CaseIterable, Codable {
       case PRICE_LEVEL_UNSPECIFIED = ""
       case PRICE_LEVEL_FREE = "Free"
       case PRICE_LEVEL_INEXPENSIVE = "Inexpensive"
       case PRICE_LEVEL_MODERATE = "Moderate"
       case PRICE_LEVEL_EXPENSIVE = "Expensive"
       case PRICE_LEVEL_VERY_EXPENSIVE = "Very Expensive"
    
    var number: Int {
        switch self {
        case .PRICE_LEVEL_UNSPECIFIED:
            -1
        case .PRICE_LEVEL_FREE:
            0
        case .PRICE_LEVEL_INEXPENSIVE:
            1
        case .PRICE_LEVEL_MODERATE:
            2
        case .PRICE_LEVEL_EXPENSIVE:
            3
        case .PRICE_LEVEL_VERY_EXPENSIVE:
            4
        }
    }
}



extension PlaceDTO {
    var toPlace: Place {
        Place(name: name,
              id: id,
              location: location,
              formattedAddress: formattedAddress,
              rating: rating,
              priceLevel: priceLevel ?? .PRICE_LEVEL_UNSPECIFIED
        )
    }
}

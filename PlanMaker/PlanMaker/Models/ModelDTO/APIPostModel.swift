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



//mask fields:


//Basic
//places.accessibilityOptions, places.addressComponents, places.adrFormatAddress, places.attributions, places.businessStatus, places.displayName, places.formattedAddress, places.googleMapsUri, places.iconBackgroundColor, places.iconMaskBaseUri, places.id, places.location, places.name*, places.photos, places.plusCode, places.primaryType, places.primaryTypeDisplayName, places.shortFormattedAddress, places.subDestinations, places.types, places.utcOffsetMinutes, places.viewport

//Advanced
//places.currentOpeningHours, places.currentSecondaryOpeningHours, places.internationalPhoneNumber, places.nationalPhoneNumber, places.priceLevel, places.rating, places.regularOpeningHours, places.regularSecondaryOpeningHours, places.userRatingCount, places.websiteUri

//Prefered
//places.allowsDogs, places.curbsidePickup, places.delivery, places.dineIn, places.editorialSummary, places.evChargeOptions, places.fuelOptions, places.goodForChildren, places.goodForGroups, places.goodForWatchingSports, places.liveMusic, places.menuForChildren, places.parkingOptions, places.paymentOptions, places.outdoorSeating, places.reservable, places.restroom, places.reviews, places.routingSummaries,* places.servesBeer, places.servesBreakfast, places.servesBrunch, places.servesCocktails, places.servesCoffee, places.servesDessert, places.servesDinner, places.servesLunch, places.servesVegetarianFood, places.servesWine, places.takeout


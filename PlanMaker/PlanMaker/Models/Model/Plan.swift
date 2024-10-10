//
//  Plan.swift
//  PlanMaker
//
//  Created by Fran Malo on 10/10/24.
//

import Foundation

struct Plan {
    var avaiblePlaces: [Place]
    
    let placeItinerarie: [placeInPlan]
    
    var requiresBreakfast: Bool
    var requiresBrunch: Bool
    var requiresLunch: Bool
    var requiresDinner: Bool

    
    
    struct placeInPlan{
        let startTime: Date
        let endTime: Date

        let TravelAfter: Travel?
        let TravelBefore: Travel?
    }
    
    
    struct Travel {
        
    }
}

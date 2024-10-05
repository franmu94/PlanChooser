//
//  PlanMakerApp.swift
//  PlanMaker
//
//  Created by Fran Malo on 1/10/24.
//

import SwiftUI

@main
struct PlanMakerApp: App {
    @StateObject var planMakerVM = PlanMakerVM()

    var body: some Scene {
        WindowGroup {
            TypesSelection()
                .environmentObject(planMakerVM)
        }
    }
}

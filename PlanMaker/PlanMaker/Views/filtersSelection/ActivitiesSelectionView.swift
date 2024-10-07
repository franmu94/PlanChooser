//
//  ActivitiesSelection.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI

struct ActivitiesView: View {
    @EnvironmentObject var vm: PlanMakerVM

    var body: some View {
        ScrollView {
            CategoryTypesView(title: "Entertainment and Recreation",category: PlaceType.entertainmentAndRecreation())
            CategoryTypesView(title: "Food and Drink",category: PlaceType.foodAndDrink())
            CategoryTypesView(title: "Shopping",category: PlaceType.shopping())
        }
    }
}

#Preview {
    ActivitiesView()
        .environmentObject(PlanMakerVM())
}
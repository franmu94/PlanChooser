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
            VStack {
                CategoryTypesView(title: "Entertainment and Recreation",category: PlaceType.entertainmentAndRecreation())
                CategoryTypesView(title: "Food and Drink",category: PlaceType.foodAndDrink())
                CategoryTypesView(title: "Shopping",category: PlaceType.shopping())
            }
            .onAppear {
                    if #available(iOS 16, *) {
                        UIScrollView.appearance().showsVerticalScrollIndicator = false
                    } else {
                        UIScrollView.appearance().showsVerticalScrollIndicator = false
                        UIScrollView.appearance().showsHorizontalScrollIndicator = false
                    }
                }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ActivitiesView()
        .environmentObject(PlanMakerVM())
}

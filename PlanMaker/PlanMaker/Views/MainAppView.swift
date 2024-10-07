//
//  MainAppView.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var vm: PlanMakerVM

    var body: some View {
        Group {
            switch vm.viewState {
            case .filtersView:
                FiltersView()
            case .selectionTypes:
                FiltersView()
            case .mapRangeView:
                FiltersView()
            }
        }
        .animation(.linear, value: vm.viewState)
    }
}

#Preview {
    MainAppView()
        .environmentObject(PlanMakerVM())
}


enum ViewState {
    case filtersView
    case selectionTypes
    case mapRangeView
}

enum FilterView {
    case activities
    case time
    case map
    case money
}

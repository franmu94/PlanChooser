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
            case .startView:
                TypesSelection()
            case .selectionTypes:
                TypesSelection()
            case .mapRangeView:
                TypesSelection()
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
    case startView
    case selectionTypes
    case mapRangeView
}

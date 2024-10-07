//
//  TypesSelection.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var vm: PlanMakerVM
    
    
    var body: some View {
            VStack {
                Text("Choose what you want to do")
                    .font(.system(size: 22, weight: .regular, design: .rounded))
                    .frame(maxWidth: 400)
                    .multilineTextAlignment(.center)
                
                ScrollView(.horizontal) {
                    HStack {
                        FilterTitleComponent(title: "Activities", isEmpty: vm.selectedTypes.isEmpty, Xaction: {vm.selectedTypes = []} ) {
                            vm.FilterViewState = .activities
                        }
                        .padding(.leading)
                        FilterTitleComponent(title: "Time", isEmpty: vm.timeIntervale == (0,0),Xaction: {
                            vm.timeIntervale = (0,0)
                            vm.startTime = Date()
                            vm.endTime = Date()
                        }) {
                            vm.FilterViewState = .time
                        }
                        FilterTitleComponent(title: "Range", isEmpty: vm.radius == .nivel0, Xaction: {vm.radius = .nivel0}) {
                            vm.FilterViewState = .map
                        }
        //                FilterTitleComponent(title: "Money") {}
                    }
                }
                .onAppear {
                    UIScrollView.appearance().showsVerticalScrollIndicator = false
                    UIScrollView.appearance().showsHorizontalScrollIndicator = false
                }
            }
        
            .padding(.top, UIDevice.height*0.05)
        VStack {
            switch vm.FilterViewState {
            case .activities:
                ActivitiesView()
            case .time:
                TimeSelection()
            case .map:
                RangeMapView()
            case .money:
                ActivitiesView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .frame(maxWidth: .infinity)

    }
    
}

#Preview {
    FiltersView()
        .environmentObject(PlanMakerVM())
}




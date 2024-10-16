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
        VStack{
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
                        FilterTitleComponent(title: "Money", isEmpty: vm.priceLevel == .PRICE_LEVEL_UNSPECIFIED, Xaction: {vm.priceLevel = .PRICE_LEVEL_UNSPECIFIED}) {
                            vm.FilterViewState = .money
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
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
                    MoneySelectionView()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .frame(maxWidth: .infinity)
        }
        .overlay(alignment: .bottom) {
            if vm.conditionsToCall() {
                Button {
                    
                } label: {
                    VStack{
                        Text("Generate Plans")
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .tint(.green)
                .padding(.bottom, 40)
            }
        }
        
    }
    
}

#Preview {
    FiltersView()
        .environmentObject(PlanMakerVM())
}




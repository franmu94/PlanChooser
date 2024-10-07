//
//  TimeSelection.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI
struct TimeSelection: View {
    @EnvironmentObject var vm: PlanMakerVM
    
    
    var body: some View {
        
        VStack {
            VStack (alignment: .trailing){
                HStack {
                    Text("From")
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                    DatePicker(
                        "Start Time",
                        selection: $vm.startTime,
                        //in: Date()..., // Limitar la selección a partir de la fecha/hora actual
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                    .onChange(of: vm.startTime) {
                        vm.calculateTimeDifference()
                    }
                }
                
                HStack {
                    Text("To")
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                    DatePicker(
                        "End Time",
                        selection: $vm.endTime,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                    .onChange(of: vm.endTime) {
                        vm.calculateTimeDifference()
                    }
                    
                }
            }
            Text("\(vm.timeIntervale.0) h \(vm.timeIntervale.1) m")
                .font(.system(size: 40, weight: .regular, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
            
            if vm.isBreakfastTimeIncluded() && vm.timeIntervale != (0,0) {
                Toggle(isOn: $vm.wantsBreakfast) {
                    Text("Want breakfast?")
                }
                .padding()
            }
            
            if vm.isBrunchTimeIncluded() && vm.timeIntervale != (0,0) {
                Toggle(isOn: $vm.wantsBrunch) {
                    Text("Want brunc?")
                }
                .padding()
            }
            
            if vm.isLunchTimeIncluded() && vm.timeIntervale != (0,0) {
                Toggle(isOn: $vm.wantsLunch) {
                    Text("Want lunch?")
                }
                .padding()
                .opacity(vm.isLunchTimeIncluded() ? 1 : 0)
            }
            
            if vm.isDinnerTimeIncluded() && vm.timeIntervale != (0,0) {
                Toggle(isOn: $vm.wantsDinner) {
                    Text("Want dinner?")
                }
                .padding()
            }
            
        }
        .padding()
    }
}

#Preview {
    TimeSelection()
        .environmentObject(PlanMakerVM())
}

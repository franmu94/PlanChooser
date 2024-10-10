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
            Text("\(vm.timeIntervale.0) h \(vm.timeIntervale.1) m")
                .font(.system(size: 40, weight: .regular, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
            VStack (alignment: .trailing){
                HStack {
                    Text("From")
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                    DatePicker(
                        "Start Time",
                        selection: $vm.startTime,
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
        }
            Group {
                if vm.isBrunchTimeIncluded() && vm.timeIntervale != (0,0) {
                    Toggle(isOn: $vm.wantsBreakfast) {
                        Text("Want breakfast?")
                    }
                }
                
                if vm.isLunchTimeIncluded() && vm.timeIntervale != (0,0) {
                    Toggle(isOn: $vm.wantsBrunch) {
                        Text("Want brunc?")
                    }
                }
                
                if vm.isLunchTimeIncluded() && vm.timeIntervale != (0,0) {
                    Toggle(isOn: $vm.wantsLunch) {
                        Text("Want lunch?")
                    }
                }
                
                if vm.isDinnerTimeIncluded() && vm.timeIntervale != (0,0) {
                    Toggle(isOn: $vm.wantsDinner) {
                        Text("Want dinner?")
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, UIDevice.width * 0.15)
    }
}

#Preview {
    TimeSelection()
        .environmentObject(PlanMakerVM())
}

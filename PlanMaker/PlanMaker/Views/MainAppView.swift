//
//  MainAppView.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var vm: PlanMakerVM
    @State var isCaminoBlue = false
    
    
    var body: some View {
        TabView {
            
            Tab("Old PLans", systemImage: "square.stack.fill") {
                Text("Old PLans")
                    .onAppear{
                        isCaminoBlue = false
                    }
            }
            
            Tab("My Places", systemImage: "mappin.and.ellipse") {
                Text("My Places")
                    .onAppear{
                        isCaminoBlue = false
                    }
            }
            
            Tab("New Plan", systemImage:  "plus") {
                FiltersView()
                    .onAppear{
                        isCaminoBlue = false
                    }
            }
            
            
            Tab("Running Plan", image: isCaminoBlue ? "camino.blue" : "camino.gray") {
                Text("Running Plan")
                    .onAppear{
                        isCaminoBlue = true
                    }
            }
            
            Tab("Settings", systemImage: "gear") {
                Test()
                    .onAppear{
                        isCaminoBlue = false
                    }
            }
            
            

        }
    }
}

#Preview {
    MainAppView()
        .environmentObject(PlanMakerVM())
}

enum FilterView {
    case activities
    case time
    case map
    case money
}



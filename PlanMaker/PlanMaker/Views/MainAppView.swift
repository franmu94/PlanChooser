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
        
        
        TabView {
            FiltersView()
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text("Old Plans")
                    
                }
            FiltersView()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Favorite Places")
                    
                }
            FiltersView()
                .tabItem {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .foregroundColor(.red)
                    Text("New Plan")
                    
                }
            FiltersView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                    
                }
            FiltersView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                    
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

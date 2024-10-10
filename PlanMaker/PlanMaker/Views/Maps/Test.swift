//
//  Test.swift
//  PlanMaker
//
//  Created by Fran Malo on 9/10/24.
//

import SwiftUI



struct Test: View {
    @EnvironmentObject var vm: PlanMakerVM
    

    var body: some View {
        
        HStack {
            Button {
                Task {
                   await vm.fetchNearbyPlaces()
                    print(vm.sortedPlaces)
                }
            } label: {
                Text("Get Places")
            }
            
            
        }

        
        if vm.sortedPlaces.isEmpty {
            Text("No hay lugares disponibles.")
        } else {
            List {
                ForEach(vm.sortedPlaces) { place in
                    placeCellView(place: place, userLocation: vm.locationManager.lastKnownLocation ?? LocationManager.defaultLocation)
//                    Text( place.displayname)
                }
            }
        }
    }
}

#Preview {
    Test()
        .environmentObject(PlanMakerVM())
}

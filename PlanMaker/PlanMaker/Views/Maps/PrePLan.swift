//
//  PrePLan.swift
//  PlanMaker
//
//  Created by Fran Malo on 13/10/24.
//

import SwiftUI

struct PrePLan: View {
    @EnvironmentObject var vm: PlanMakerVM
    
    @State var typesArray: [PlaceType] = [.restaurant, .museum, .bar]

    var body: some View {
        Text("View")
        
        List {
            ForEach(typesArray, id: \.self) { type in
                TypePlanCell(type: type)
            }
            .onMove { from, to in
                typesArray.move(fromOffsets: from, toOffset: to)
                print(typesArray)
            }

        }
    }
}

#Preview {
    PrePLan()
        .environmentObject(PlanMakerVM())
}

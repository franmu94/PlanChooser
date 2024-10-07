//
//  CategoryTypesView.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI

struct CategoryTypesView: View {
    let title: String
    //let size: Double
    let category: [PlaceType]
    
    @EnvironmentObject var vm: PlanMakerVM

    var gridColums = [GridItem(), GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        Text(title)
            .font(.system(size: 22, weight: .regular, design: .rounded))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,32)
            .padding(.bottom,4)
            .padding(.top,16)

        
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(), GridItem()], spacing: 22) {
                ForEach(category, id: \.self) { type in
                        Button {
                            if vm.containsType(type: type) {
                                vm.quitType(type: type)
                            } else {
                                vm.addType(type: type)
                            }
                        } label: {
                            TypeGridCell(type: type)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
            }
            .frame(height: 200)
            .padding(.leading, 36)
        }
    }
}

#Preview {
    CategoryTypesView(title: "Entertainment and Recreation", category: PlaceType.entertainmentAndRecreation())
        .environmentObject(PlanMakerVM())
}

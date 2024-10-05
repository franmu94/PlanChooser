//
//  TypesSelection.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import SwiftUI

struct TypesSelection: View {
    @EnvironmentObject var vm: PlanMakerVM

    var gridColums = [GridItem(), GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        Text("Choose what you want to do")
            .font(.system(size: 22, weight: .regular, design: .rounded))// Fuente redondeada minimalista
            .frame(maxWidth: 200) // Limita el ancho del texto al de la imagen
            .multilineTextAlignment(.center)
        
        ScrollView {
            Spacer(minLength: 64)
            Text("Entertainment and Recreation")
                .font(.system(size: 22, weight: .regular, design: .rounded))// Fuente redondeada minimalista
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,32)
                .padding(.vertical,16)

            LazyVGrid(columns: gridColums, spacing: 20) {
                ForEach(PlaceType.entertainmentAndRecreation(), id: \.self) { type in
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
            .padding(.horizontal,20)
            Text("Food and Drink")
                .font(.system(size: 22, weight: .regular, design: .rounded))// Fuente redondeada minimalista
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,32)
                .padding(.vertical,16)

            LazyVGrid(columns: gridColums, spacing: 20) {
                ForEach(PlaceType.foodAndDrink(), id: \.self) { type in
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
            .padding(.horizontal,20)
            
            Text("Shopping")
                .font(.system(size: 22, weight: .regular, design: .rounded))// Fuente redondeada minimalista
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,32)
                .padding(.vertical,16)

            LazyVGrid(columns: gridColums, spacing: 20) {
                ForEach(PlaceType.shopping(), id: \.self) { type in
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
            .padding(.horizontal,20)
        }
    }
}

#Preview {
    TypesSelection()
        .environmentObject(PlanMakerVM())
}




//
//  TypeGridCell.swift
//  PlanMaker
//
//  Created by Fran Malo on 5/10/24.
//

import SwiftUI

struct TypeGridCell: View {
    @EnvironmentObject var vm: PlanMakerVM

    let type: PlaceType
    
    var body: some View {
        VStack{
            Image("\(type.rawValue)\(vm.containsType(type: type) ? ".color" : "")")
                .resizable()
                .scaledToFit()
                .frame(width: 56)
            Text(type.displayText())
                .font(.caption) // Ajusta el tamaño del texto
                .frame(maxWidth: 72) // Limita el ancho del texto al de la imagen
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    TypeGridCell(type: .restaurant)
        .environmentObject(PlanMakerVM())
}

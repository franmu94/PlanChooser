//
//  TypeGridCell.swift
//  PlanMaker
//
//  Created by Fran Malo on 5/10/24.
//

import SwiftUI

struct TypeGridCell: View {
    let type: PlaceType
    let isSelected: Bool
    
    var body: some View {
        VStack{
            Image("\(type.rawValue)\(isSelected ? ".colored" : "")")
                .resizable()
                .scaledToFit()
                .frame(width: 56)
            Text(type.displayText())
                .font(.caption)
                .frame(maxWidth: 72)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    TypeGridCell(type: .restaurant, isSelected: false)
        .environmentObject(PlanMakerVM())
}

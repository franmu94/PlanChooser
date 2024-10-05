//
//  prueba.swift
//  PlanMaker
//
//  Created by Fran Malo on 5/10/24.
//

import SwiftUI

struct prueba: View {
    var body: some View {
        Button {
            print("dd")
        } label: {
            Image("aquarium-4_result_2")
                .resizable()
                .scaledToFit()
                .frame(width: 52)
        }
        
        Button {
            print("dd")
        } label: {
            Image("aquarium-4_result_1")
                .resizable()
                .scaledToFit()
                .frame(width: 48)
        }
        
        HStack {
            ForEach(1 ..< 7) { _ in
                Button {
                    print("dd")
                } label: {
                    Image("aquarium-4_result_1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52)
                }
            }
        }
    }
}

#Preview {
    prueba()
}

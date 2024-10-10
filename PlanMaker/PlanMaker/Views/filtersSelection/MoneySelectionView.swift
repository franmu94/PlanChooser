//
//  MoneySelectionView.swift
//  PlanMaker
//
//  Created by Fran Malo on 7/10/24.
//

import SwiftUI

struct MoneySelectionView: View {
    @EnvironmentObject var vm: PlanMakerVM

    let priceLevels = Array(PriceLevel.allCases.dropFirst(2))
    var body: some View {
        VStack {
            Text(vm.priceLevel.rawValue)
            HStack{
                
                ForEach(priceLevels, id: \.self) { priceLevel in
                    Button {
                        vm.priceLevel = priceLevel
                    } label: {
                        Image(systemName: "eurosign.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIDevice.width * 0.15)
                            .background {
                                Circle()
                                    .foregroundColor(priceLevel.number <= vm.priceLevel.number ? .yellow : .clear)
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
            }
            Button {
                vm.priceLevel = .PRICE_LEVEL_FREE
            } label: {
                Text("FREE")
                    .font(.system(size: 18 , weight: .bold, design: .rounded))
                    .background {
                        Circle()
                            .scaledToFill()
                            .foregroundColor(vm.priceLevel == .PRICE_LEVEL_FREE ? .yellow : .clear)
                            .frame(width: UIDevice.width * 0.15)
                            .overlay(
                                    Circle() // Círculo superpuesto para crear el borde
                                        .stroke(Color.black, lineWidth: 5) // Ajusta el color y el grosor del borde
                                )
                    }
                    .padding(.top,32)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.bottom,48)
        .padding(.top,24)


    

        
    }
}

#Preview {
    MoneySelectionView()
        .environmentObject(PlanMakerVM())
}

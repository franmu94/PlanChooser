//
//  TypePlanCell.swift
//  PlanMaker
//
//  Created by Fran Malo on 13/10/24.
//

import SwiftUI

struct TypePlanCell: View {
    
    var type: PlaceType
    
    var choosedPlace: Place?
    
    
    
    @State var showPlaces = false
    
    var body: some View {
        VStack {
            HStack {
                Image("\(type.rawValue).light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56)
                VStack {
                    Text(type.displayText())
                        .font(.caption)
                        .frame(maxWidth: 72)
                        .multilineTextAlignment(.center)
                }
                
            }
            Text("Show Places")
                .onTapGesture {
                    showPlaces.toggle()
                }
            if showPlaces {
                ScrollView(.horizontal) {
                    HStack {
                        Text(Place.previewPlace.displayname)
                        Text(Place.previewPlace.displayname)
                        Text(Place.previewPlace.displayname)
                        Text(Place.previewPlace.displayname)
                    }

                }
            }
        }
                
    }
}

#Preview {
    TypePlanCell(type: .restaurant)
}

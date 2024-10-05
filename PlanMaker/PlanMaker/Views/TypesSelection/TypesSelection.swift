//
//  TypesSelection.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import SwiftUI

struct TypesSelection: View {
    
    func getPreferredLocale() -> Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current
        }
        return Locale(identifier: preferredIdentifier)
    }
    
    
    
    var body: some View {
        Text(getPreferredLocale().language.languageCode?.identifier ?? "no prefer")
        
        Text(Locale.current.language.languageCode!.identifier)
        
        Text(Locale.preferredLanguages.first!)

        Button {
            print(Locale(identifier: "es-ES"))
        } label: {
            Text("boton")
        }

        Text(Locale(identifier: Locale.preferredLanguages.first ?? "ddd").language.languageCode?.identifier ?? "")
        Text(Locale.current.language.languageCode?.identifier ?? "Unknown")
        
        Text(Locale(identifier: Locale.preferredLanguages.first ?? "esdddd").language.languageCode?.identifier ?? "esddd")
    }
}

#Preview {
    TypesSelection()
}




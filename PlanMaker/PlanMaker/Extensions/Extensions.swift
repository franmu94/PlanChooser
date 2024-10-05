//
//  Extensions.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation


extension Locale {
    static func getPreferredLocaleLangeage() -> String {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current.language.languageCode?.identifier ?? "en"
        }
        return Locale(identifier: preferredIdentifier).language.languageCode?.identifier ?? "en"
    }
}

//
//  Extensions.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation
import SwiftUI

extension Locale {
    static func getPreferredLocaleLangeage() -> String {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return Locale.current.language.languageCode?.identifier ?? "en"
        }
        return Locale(identifier: preferredIdentifier).language.languageCode?.identifier ?? "en"
    }
}


extension UIDevice {
    static var width: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .screen
            .bounds
            .width ?? 0
    }
    
    static var height: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .screen
            .bounds
            .width ?? 0
    }
    
    static var bottomInsetSize: CGFloat {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first { $0.isKeyWindow }?
            .safeAreaInsets
            .bottom ?? 0
    }
}

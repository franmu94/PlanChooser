//
//  APPConfig.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import Foundation

final class AppConfig {
    static let shared = AppConfig()
    
    var APIKey: String?
    
    init() {
        try? getApiKey()
    }
    
    private func getApiKey() throws {
        guard let url = Bundle.main.url(forResource: "configAPI", withExtension: "plist") else { return }
        let data = try Data(contentsOf: url)
        
        let plist = try PropertyListDecoder().decode([String: String].self, from: data)
        APIKey = plist["Api_Key"]
    }
}

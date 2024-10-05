//
//  URLRequest.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        //request.setValue("Bearer lasjdlñajhsdlkajshdlkjh", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    static func post<JSON>(url: URL,
                           post: JSON,
                           method: HTTPMethod = .post) -> URLRequest where JSON: Codable {
        var request = URLRequest(url: url)
        request.timeoutInterval = 60
        request.httpMethod = method.rawValue
        request.httpBody = try? JSONEncoder().encode(post)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}

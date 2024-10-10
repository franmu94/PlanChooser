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
        
        return request
    }
    
    static func post<JSON>(url: URL,
                           post: JSON,
                           method: HTTPMethod = .post,
                           token: String? = nil) -> URLRequest where JSON: Codable {
       
        var request = URLRequest(url: url)
        
        let headers = [
            "accept": "application/json",
            "X-Goog-Api-Key": token ?? "No token",
            "X-Goog-FieldMask": "places.displayName,places.id,places.rating,places.location",
            "Content-Type": "application/json; charset=utf-8"
        ]
        request.allHTTPHeaderFields = headers

        request.timeoutInterval = 60
        request.httpMethod = method.rawValue
        request.httpBody = try? JSONEncoder().encode(post)
        
        
//        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print(request.httpMethod)
        return request
    }
}

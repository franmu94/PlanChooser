//
//  NetworkInteractor.swift
//  PlanMaker
//
//  Created by Fran Malo on 3/10/24.
//

import Foundation


protocol NetworkInteractor {
    var session: URLSession { get }
}

extension NetworkInteractor {
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await session.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest) async throws {
        let (_, response) = try await session.getData(for: request)
        if response.statusCode != 200 {
            throw NetworkError.status(response.statusCode)
        }
    }
}

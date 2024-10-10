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
        
        // Imprimir información de depuración
        print("Request URL: \(request.url?.absoluteString ?? "URL inválida")")
        print("HTTP Method: \(request.httpMethod ?? "No especificado")")
        print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
        if let httpBody = request.httpBody {
            print("Request Body: \(String(data: httpBody, encoding: .utf8) ?? "No se pudo convertir el cuerpo de la solicitud a UTF-8")")
        }
        
        // Castear response a HTTPURLResponse
        guard let httpResponse = response as? HTTPURLResponse else {

        }
        
        print("Response Status Code: \(httpResponse.statusCode)")
        print("Response Headers: \(httpResponse.allHeaderFields)")
        print("Response Data: \(String(data: data, encoding: .utf8) ?? "No se pudo convertir la respuesta a UTF-8")")
        
        if httpResponse.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                print("Error al decodificar JSON: \(error)")
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(httpResponse.statusCode)
        }
    }
    
    func postJSON(request: URLRequest) async throws {
        let (_, response) = try await session.getData(for: request)
        if response.statusCode != 200 {
            throw NetworkError.status(response.statusCode)
        }
    }
}

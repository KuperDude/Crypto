//
//  NetworkingManager.swift
//  Crypto
//
//  Created by MyBook on 10.06.2022.
//

import Foundation
import Combine

actor NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url): return "[🔥] Bad response from URL. \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) async throws -> Data {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        try handleURLResponse(response: response, url: url)
        
        return data
    }
    
    static private func handleURLResponse(response: URLResponse, url: URL) throws {
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error)
        }
    }
}

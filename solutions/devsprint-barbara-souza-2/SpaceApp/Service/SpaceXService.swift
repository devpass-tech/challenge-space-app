//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation
import UIKit

enum Response {
    case result(Data)
    case error(Error?)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

struct SpaceXService {
    let httpHeaders: [String: String] = ["Content-Type": "application/json"]

    func performRequest(
        url: URL,
        httpMethod: HTTPMethod,
        completion: @escaping (Response) -> ()
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        httpHeaders.forEach { headerField, value in
            request.setValue(value, forHTTPHeaderField: headerField)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.error(error))
                return
            }
            
            if let data = data {
                completion(.result(data))
            }
        }
        task.resume()
    }
}

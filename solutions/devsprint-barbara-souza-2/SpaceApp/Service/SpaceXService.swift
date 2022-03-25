//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

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

    func performRequest(url: URL,
                        httpMethod: HTTPMethod,
                        httpBody: Data? = nil,
                        completion: @escaping (Response) -> ()) {

        var request = URLRequest(url: url)

        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody

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

    func fetchNextLaunches(completion: @escaping ([NextLaunch]) -> ()) {
        
        let url = URL(string: "https://api.spacexdata.com/v5/launches/query")!
        let body = "{\"options\": {\"limit\": 20}}".data(using: .utf8)

        performRequest(url: url, httpMethod: .post, httpBody: body) { response in
            switch response {
            case let .result(data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(LaunchesDocs.self, from: data)
                    completion(response.docs)
                } catch {
                    print(error)
                }

            case .error(_):
                print("houve um erro")
            }
        }
    }
}

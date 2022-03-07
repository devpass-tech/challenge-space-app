//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct SpaceXService {

    func fetchNextLaunches(_ completion: ([String]) -> Void) {

        completion(["CRS-20", "Starlink 4-2", "FalconSat", "Transporter-3"])
    }
}

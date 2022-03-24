//
//  NextLaunch.swift
//  SpaceApp
//
//  Created by Hyago Henrique on 14/03/22.
//

import Foundation
import UIKit

struct NextLaunch: Codable {
    let name: String
    let links: Links
    let launchNumber: Int
    let details: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case links
        case details
        case launchNumber = "flight_number"
    }
    
    struct Links: Codable {
        let patch: Patch
        
        struct Patch: Codable {
            let small: String
            let large: String
        }
    }
}

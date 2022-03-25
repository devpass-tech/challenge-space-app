//
//  NextLaunch.swift
//  SpaceApp
//
//  Created by Hyago Henrique on 14/03/22.
//

import Foundation

struct LaunchesDocs: Decodable {
    let docs: [NextLaunch]
}

struct NextLaunch: Decodable {

    let name: String
    let launchNumber: Int
    //let launchDate: String
    let description: String?
    let success: Bool
    let badge: String

    enum CodingKeys: String, CodingKey {
        case name
        case description = "details"
        case launchNumber = "flight_number"
        case success
        case links
    }

    enum LinksCodingKeys: CodingKey {
        case patch
        case small
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        launchNumber = try container.decode(Int.self, forKey: .launchNumber)
        description = try container.decode(String?.self, forKey: .description)
        success = try container.decode(Bool.self, forKey: .success)

        let linksContainer = try container.nestedContainer(keyedBy: LinksCodingKeys.self, forKey: .links)
        let patchContainer = try linksContainer.nestedContainer(keyedBy: LinksCodingKeys.self, forKey: .patch)

        badge = try patchContainer.decode(String.self, forKey: .small)
    }
}

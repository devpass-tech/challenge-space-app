//
//  LaunchDetailModel.swift
//  SpaceApp
//
//  Created by William Henrique Gonçalves Ribeiro on 23/03/22.
//

import Foundation

struct LaunchDetailModel {

    let badgeImage: String
    let rocketName: String
    let status: Status
}

enum Status: String {
    case success = "Success"
    case failed = "Failed"
}

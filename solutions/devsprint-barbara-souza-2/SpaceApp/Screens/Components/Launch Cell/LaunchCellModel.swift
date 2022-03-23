import Foundation

struct LaunchCellModel {

    let badgeImage: String
    let rocketName: String
    let number: Int
    let date: String
    let status: Status
}

enum Status: String {
    case success = "Success"
    case failed = "Failed"
}

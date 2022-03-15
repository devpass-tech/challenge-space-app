//
//  NextLaunchesViewController.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

final class NextLaunchesViewController: UIViewController {

    private let nextLaunchesView: NextLaunchesView = {

        let nextLaunchesView = NextLaunchesView()
        return nextLaunchesView
    }()

    private let service = SpaceXService()

    override func viewDidLoad() {

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Space App 🚀"
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchNextLaunches { launches in

            DispatchQueue.main.async {

                self.nextLaunchesView.updateView(with: NextLaunch(
                    badge: "cart",
                    name: "Transporter-3",
                    launchNumber: 145,
                    launchDate: "January 13, 2022",
                    description: "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission is very importante for the humanity to discover the baldness cure! muito mais texto cansei de escrever em ingles ai ai"
                )
                )
            }
        }

    }

    override func loadView() {
        self.view = nextLaunchesView
    }
}

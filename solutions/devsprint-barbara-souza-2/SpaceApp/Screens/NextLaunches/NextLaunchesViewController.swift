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
        navigationItem.title = "Home"
        if #available(iOS 13.0, *) {
                    let navBarAppearance = UINavigationBarAppearance()
                    navBarAppearance.configureWithOpaqueBackground()
                    navBarAppearance.backgroundColor = .backgroundNextLaunchColor
                    navigationController?.navigationBar.standardAppearance = navBarAppearance
                    navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
                } else {
                    navigationController?.edgesForExtendedLayout = []
                }
    }
    
    override func viewDidAppear(_ animated: Bool) {

        service.fetchNextLaunches { launches in
            
            DispatchQueue.main.async {

                self.nextLaunchesView.updateView(with: launches.first!)
            }
        }
    }
    
    override func loadView() {
        self.view = nextLaunchesView
    }
}

extension NextLaunchesViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

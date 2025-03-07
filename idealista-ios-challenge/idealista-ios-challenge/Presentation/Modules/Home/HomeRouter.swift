//
//  HomeRouter.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation
import SwiftUI

final class HomeRouter {
    weak var viewController: HomeViewController!
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    func navigateAdDetail(ad: Ad) {
        let adDetailViewController = UIHostingController(rootView: Container.shared.AdDetailDefaultBuilder().build(ad: ad))
        self.viewController.present(adDetailViewController, animated: true)
    }
}

//
//  HomeRouter.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation
final class HomeRouter {
    weak var viewController: HomeViewController!
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    func navigateAdDetails(adId: Int) {
        //TODO: Add push to detail ad view
    }
}

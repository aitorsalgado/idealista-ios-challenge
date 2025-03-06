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
    func navigateAdDetail(adId: String) {
        let adDetailViewController = UIHostingController(rootView: AdDetailSwiftUIView())
        self.viewController.present(adDetailViewController, animated: true)
    }
}

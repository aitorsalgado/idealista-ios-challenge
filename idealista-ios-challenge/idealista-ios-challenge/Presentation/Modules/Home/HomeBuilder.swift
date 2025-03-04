//
//  HomeBuilder.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation
final class HomeBuilder: HomeBuilderProtocol {
    func build() -> HomeViewController {
        let homeViewController = HomeViewController()
        let router = HomeRouter(viewController: homeViewController)
        let adUseCase = AdUseCase(repository: Container.shared.adRepository)
        let homeViewModel = HomeViewModel(router: router, adUseCase: adUseCase)
        homeViewController.viewModel = homeViewModel
        return homeViewController
    }
}

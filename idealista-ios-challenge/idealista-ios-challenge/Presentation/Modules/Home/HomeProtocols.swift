//
//  HomeProtocols.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation

protocol HomeBuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
    func navigateAdDetails(adId: Int)
}

protocol HomeViewModelProtocol {
    func viewDidLoad()
}

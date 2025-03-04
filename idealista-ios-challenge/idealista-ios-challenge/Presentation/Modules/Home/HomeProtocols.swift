//
//  HomeProtocols.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation

protocol HomeBuilderProtocol {
    func build() -> ViewController
}

protocol HomeRouterProtocol {
    func navigateAdDetails(adId: Int)
}

protocol HomeViewModelProtocol {
    func viewDidLoad()
}

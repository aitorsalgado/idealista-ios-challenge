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
    func navigateAdDetail(adId: String)
}

protocol HomeViewModelProtocol {
    var ads: [Ad] { get set }
    var adsUpdated: (() -> Void)? { get set }
    
    func viewDidLoad()
    func pressAdDetail(adId: String)
}

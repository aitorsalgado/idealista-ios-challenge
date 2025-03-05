//
//  HomeViewModel.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    let router: HomeRouterProtocol
    let adUseCase: AdUseCaseProtocol
    var ads = [Ad]() {
        didSet {
            adsUpdated?()
        }
    }
    
    var adsUpdated: (() -> Void)?
    
    init(router: HomeRouterProtocol,
         adUseCase: AdUseCaseProtocol) {
        self.router = router
        self.adUseCase = adUseCase
    }
    
    func viewDidLoad() {
        fetchAds()
    }
    
    func fetchAds() {
        Task {
            do {
                self.ads = try await self.adUseCase.fetchAds()
            } catch {
                print("Error fetching ads: \(error)")
            }
        }
    }
    
}

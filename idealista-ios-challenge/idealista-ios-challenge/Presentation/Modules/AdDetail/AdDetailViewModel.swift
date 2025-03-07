//
//  AdDetailViewModel.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import Foundation
final class AdDetailViewModel: AdDetailViewModelProtocol, ObservableObject {
    let adUseCase: AdUseCaseProtocol
    let ad: Ad
    
    //MARK: SwiftUI Properties
    @Published var id: Int = 0
    @Published var price: String = ""
    @Published var roomNumber: Int = 0
    @Published var constructedArea: Int = 0
    @Published var propertyComment: String = ""
    @Published var images: [ImageAd] = []
    @Published var ubication: String = ""
    @Published var favoriteDate: Date?
    
    
    init(Ad: Ad, adUseCase: AdUseCaseProtocol) {
        self.ad = Ad
        self.adUseCase = adUseCase
        self.favoriteDate = ad.favoriteDate
        Task {
            await getAdDetails()
        }
    }
}

extension AdDetailViewModel {
    @MainActor
    func getAdDetails() async {
        do {
            let adDetails = try await adUseCase.fetchAdDetail()
            id = adDetails.adid
            price = "\(adDetails.priceInfo.amount)" + adDetails.priceInfo.currencySuffix
            roomNumber = adDetails.moreCharacteristics.roomNumber
            constructedArea = adDetails.moreCharacteristics.constructedArea
            propertyComment = adDetails.propertyComment
            images = adDetails.multimedia.images.map {
                ImageAd(url: $0.url, tag: $0.tag)
            }
            ubication = adDetails.ubication.latitude.description + "," + adDetails.ubication.longitude.description
        } catch {
            print(error)
        }
    }
    
    func toggleFavorite() {
        if favoriteDate == nil {
            favoriteDate = Date()
        } else {
            favoriteDate = nil
        }
    }
}

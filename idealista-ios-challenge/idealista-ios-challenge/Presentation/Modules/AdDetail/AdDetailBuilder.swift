//
//  AdDetailBuilder.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import Foundation
final class AdDetailBuilder: AdDetailBuilderProtocol {
    func build(ad: Ad) -> AdDetailSwiftUIView {
        let adUseCase = AdUseCase(repository: Container.shared.adRepository)
        let adDetailViewModel = AdDetailViewModel(Ad: ad, adUseCase: adUseCase)
        return AdDetailSwiftUIView(adDetailviewModel: adDetailViewModel)
    }
}

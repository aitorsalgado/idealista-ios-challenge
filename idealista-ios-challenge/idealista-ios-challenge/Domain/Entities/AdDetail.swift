//
//  AdDetail.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import Foundation
// MARK: - AdDetail
struct AdDetail: Codable {
    let adid: Int
    let price: Double
    let priceInfo: PriceInfoDetail
    let operation, propertyType, extendedPropertyType, homeType: String
    let state: String
    let multimedia: Multimedia
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification
}

// MARK: - EnergyCertification
struct EnergyCertification: Codable {
    let title: String
    let energyConsumption, emissions: Emissions
}

// MARK: - Emissions
struct Emissions: Codable {
    let type: String
}

// MARK: - MoreCharacteristics
struct MoreCharacteristics: Codable {
    let communityCosts, roomNumber, bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType, flatLocation: String
    let modificationDate, constructedArea: Int
    let lift, boxroom, isDuplex: Bool
    let floor, status: String
}

struct PriceInfoDetail: Codable {
    let amount: Int
    let currencySuffix: String
}

// MARK: - Ubication
struct Ubication: Codable {
    let latitude, longitude: Double
}

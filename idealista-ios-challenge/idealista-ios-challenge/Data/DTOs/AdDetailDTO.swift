//
//  AdDetailDTO.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import Foundation

// MARK: - AdDetailDTO
struct AdDetailDTO: Codable {
    let adid: Int
    let price: Double
    let priceInfo: PriceInfoDetailDTO
    let operation, propertyType, extendedPropertyType, homeType: String
    let state: String
    let multimedia: MultimediaDTO
    let propertyComment: String
    let ubication: UbicationDTO
    let country: String
    let moreCharacteristics: MoreCharacteristicsDTO
    let energyCertification: EnergyCertificationDTO
}

// MARK: - EnergyCertification
struct EnergyCertificationDTO: Codable {
    let title: String
    let energyConsumption, emissions: EmissionsDTO
}

// MARK: - Emissions
struct EmissionsDTO: Codable {
    let type: String
}

// MARK: - MoreCharacteristics
struct MoreCharacteristicsDTO: Codable {
    let communityCosts, roomNumber, bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType, flatLocation: String
    let modificationDate, constructedArea: Int
    let lift, boxroom, isDuplex: Bool
    let floor, status: String
}

// MARK: - PriceInfo
struct PriceInfoDetailDTO: Codable {
    let amount: Int
    let currencySuffix: String
}

// MARK: - Ubication
struct UbicationDTO: Codable {
    let latitude, longitude: Double
}

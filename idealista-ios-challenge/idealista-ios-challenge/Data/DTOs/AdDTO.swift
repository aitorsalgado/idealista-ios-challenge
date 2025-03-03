//
//  AdAPI.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

// MARK: AdDTO
struct AdDTO: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Int
    let priceInfo: PriceInfoDTO
    let propertyType, operation: String
    let size: Int
    let exterior: Bool
    let rooms, bathrooms: Int
    let address, province, municipality, district: String
    let country, neighborhood: String
    let latitude, longitude: Double
    let description: String
    let multimedia: MultimediaDTO
    let features: FeaturesDTO
    let parkingSpace: ParkingSpaceDTO?
}

// MARK: - Features
struct FeaturesDTO: Codable {
    let hasAirConditioning, hasBoxRoom: Bool
    let hasSwimmingPool, hasTerrace, hasGarden: Bool?
}

// MARK: - Multimedia
struct MultimediaDTO: Codable {
    let images: [ImageDTO]
}

// MARK: - Image
struct ImageDTO: Codable {
    let url: String
    let tag: String
}

// MARK: - ParkingSpace
struct ParkingSpaceDTO: Codable {
    let hasParkingSpace, isParkingSpaceIncludedInPrice: Bool
}

// MARK: - PriceInfo
struct PriceInfoDTO: Codable {
    let price: PriceDTO
}

// MARK: - Price
struct PriceDTO: Codable {
    let amount: Int
    let currencySuffix: String
}

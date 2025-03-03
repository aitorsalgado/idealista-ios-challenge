//
//  Ad.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

// MARK: - Ad
struct Ad: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Int
    let priceInfo: PriceInfo
    let propertyType, operation: String
    let size: Int
    let exterior: Bool
    let rooms, bathrooms: Int
    let address, province, municipality, district: String
    let country, neighborhood: String
    let latitude, longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: Features
    let parkingSpace: ParkingSpace?
}

// MARK: - Features
struct Features: Codable, Hashable {
    let hasAirConditioning, hasBoxRoom: Bool
    let hasSwimmingPool, hasTerrace, hasGarden: Bool?
}

// MARK: - Multimedia
struct Multimedia: Codable, Hashable {
    let images: [Image]
}

// MARK: - Image
struct Image: Codable, Hashable {
    let url: String
    let tag: String
}

// MARK: - ParkingSpace
struct ParkingSpace: Codable, Hashable {
    let hasParkingSpace, isParkingSpaceIncludedInPrice: Bool
}

// MARK: - PriceInfo
struct PriceInfo: Codable, Hashable {
    let price: Price
}

// MARK: - Price
struct Price: Codable, Hashable {
    let amount: Int
    let currencySuffix: String
}

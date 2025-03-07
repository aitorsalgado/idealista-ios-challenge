//
//  Ad.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

// MARK: - Ad
struct Ad: Hashable ,Codable {
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
    var favoriteDate: Date?
}

// MARK: - Features
struct Features: Codable, Hashable {
    let hasAirConditioning, hasBoxRoom: Bool
    let hasSwimmingPool, hasTerrace, hasGarden: Bool?
}

// MARK: - Multimedia
struct Multimedia: Codable, Hashable {
    let images: [ImageAd]
}

// MARK: - Image
struct ImageAd: Codable, Hashable {
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

extension Ad {
    static let AdPreviewMock = Ad(propertyCode: "Property Preview Code 1",
                                  thumbnail: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
                                  floor: "",
                                  price: 1,
                                  priceInfo: PriceInfo(price: Price(amount: 1,
                                                                    currencySuffix: "€")),
                                  propertyType: "",
                                  operation: "",
                                  size: 1,
                                  exterior: true,
                                  rooms: 1,
                                  bathrooms: 1,
                                  address: "",
                                  province: "",
                                  municipality: "",
                                  district: "",
                                  country: "",
                                  neighborhood: "",
                                  latitude: 1.0,
                                  longitude: 1.0,
                                  description: "",
                                  multimedia: Multimedia(images: []),
                                  features: Features(hasAirConditioning: true,
                                                     hasBoxRoom: true,
                                                     hasSwimmingPool: nil,
                                                     hasTerrace: nil,
                                                     hasGarden: nil),
                                  parkingSpace: nil)
}

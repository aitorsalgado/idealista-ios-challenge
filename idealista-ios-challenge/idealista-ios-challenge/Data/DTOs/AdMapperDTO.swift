//
//  AdMapperDTO.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation
enum AdMapperDTO {
    static func toBO(fromDTO dtos: [AdDTO]) -> [Ad] {
        var adsBO: [Ad] = []
        for dto in dtos {
            adsBO.append(Ad(propertyCode: dto.propertyCode,
                            thumbnail: dto.thumbnail,
                            floor: dto.floor,
                            price: dto.price,
                            priceInfo: PriceInfoMapperDTO.toBO(fromDTO: dto.priceInfo),
                            propertyType: dto.propertyType,
                            operation: dto.operation,
                            size: dto.size,
                            exterior: dto.exterior,
                            rooms: dto.rooms,
                            bathrooms: dto.bathrooms,
                            address: dto.address,
                            province: dto.province,
                            municipality: dto.municipality,
                            district: dto.district,
                            country: dto.country,
                            neighborhood: dto.neighborhood,
                            latitude: dto.latitude,
                            longitude: dto.longitude,
                            description: dto.description,
                            multimedia: MultimediaMapperDTO.toBO(fromDTO: dto.multimedia),
                            features: FeaturesMapperDTO.toBO(fromDTO: dto.features),
                            parkingSpace: ParkingSpaceMapperDTO.toBO(fromDTO: dto.parkingSpace)
                            ))
        }
        return adsBO
    }
}

enum PriceMapperDTO {
    static func toBO(fromDTO dto: PriceDTO) -> Price {
        Price(amount: dto.amount,
              currencySuffix: dto.currencySuffix)
    }
}

enum PriceInfoMapperDTO {
    static func toBO(fromDTO dto: PriceInfoDTO) -> PriceInfo {
        PriceInfo(price: PriceMapperDTO.toBO(fromDTO: dto.price))
    }
}

enum ImageMapperDTO {
    static func toBO(fromDTO dto: ImageDTO) -> Image {
        Image(url: dto.url,
              tag: dto.tag)
    }
}

enum MultimediaMapperDTO {
    static func toBO(fromDTO dto: MultimediaDTO) -> Multimedia {
        var imagesDTO = dto.images
        var imagesBO: [Image] = []
        for imageDTO in imagesDTO {
            imagesBO.append(ImageMapperDTO.toBO(fromDTO: imageDTO))
        }
        return Multimedia(images: imagesBO)
    }
}

enum FeaturesMapperDTO {
    static func toBO(fromDTO dto: FeaturesDTO) -> Features {
        Features(hasAirConditioning: dto.hasAirConditioning,
                 hasBoxRoom: dto.hasBoxRoom,
                 hasSwimmingPool: dto.hasSwimmingPool,
                 hasTerrace: dto.hasTerrace,
                 hasGarden: dto.hasGarden)
    }
}

enum ParkingSpaceMapperDTO {
    static func toBO(fromDTO dto: ParkingSpaceDTO?) -> ParkingSpace? {
        guard let dto = dto else { return nil }
        return ParkingSpace(
            hasParkingSpace: dto.hasParkingSpace,
            isParkingSpaceIncludedInPrice: dto.isParkingSpaceIncludedInPrice
        )
    }
}

//
//  AdDetailMapperDTO.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import Foundation
enum AdDetailMapperDTO {
    static func toBO(fromDTO dto: AdDetailDTO) -> AdDetail {
        AdDetail(adid: dto.adid,
                 price: dto.price,
                 priceInfo: PriceInfoDetailMapperDTO.toBO(fromDTO: dto.priceInfo),
                 operation: dto.operation,
                 propertyType: dto.propertyType,
                 extendedPropertyType: dto.extendedPropertyType,
                 homeType: dto.homeType,
                 state: dto.state,
                 multimedia: MultimediaMapperDTO.toBO(fromDTO: dto.multimedia),
                 propertyComment: dto.propertyComment,
                 ubication: UbicationMapperDTO.toBO(fromDTO: dto.ubication),
                 country: dto.country,
                 moreCharacteristics: MoreCharacteristicsMapperDTO.toBO(fromDTO: dto.moreCharacteristics),
                 energyCertification: EnergyCertificationMapperDTO.toBO(fromDTO: dto.energyCertification))
    }
    
}

enum UbicationMapperDTO {
    static func toBO(fromDTO dto: UbicationDTO) -> Ubication {
        Ubication(latitude: dto.latitude,
                  longitude: dto.latitude)
    }
}

enum MoreCharacteristicsMapperDTO {
    static func toBO(fromDTO dto: MoreCharacteristicsDTO) -> MoreCharacteristics {
        MoreCharacteristics(communityCosts: dto.communityCosts,
                            roomNumber: dto.roomNumber,
                            bathNumber: dto.bathNumber,
                            exterior: dto.exterior,
                            housingFurnitures: dto.housingFurnitures,
                            agencyIsABank: dto.agencyIsABank,
                            energyCertificationType: dto.energyCertificationType,
                            flatLocation: dto.flatLocation,
                            modificationDate: dto.modificationDate,
                            constructedArea: dto.constructedArea,
                            lift: dto.lift,
                            boxroom: dto.boxroom,
                            isDuplex: dto.isDuplex,
                            floor: dto.floor,
                            status: dto.status)
    }
}

enum EnergyCertificationMapperDTO {
    static func toBO(fromDTO dto: EnergyCertificationDTO) -> EnergyCertification {
        EnergyCertification(title: dto.title,
                            energyConsumption: EmissionsMapperDTO.toBO(fromDTO: dto.energyConsumption),
                            emissions: EmissionsMapperDTO.toBO(fromDTO: dto.emissions)
                            )
    }
}

enum EmissionsMapperDTO {
    static func toBO(fromDTO dto: EmissionsDTO) -> Emissions {
        Emissions(type: dto.type)
    }
}

enum PriceInfoDetailMapperDTO {
 static func toBO(fromDTO dto: PriceInfoDetailDTO) -> PriceInfoDetail {
     PriceInfoDetail(amount: dto.amount,
                     currencySuffix: dto.currencySuffix)
    }
}

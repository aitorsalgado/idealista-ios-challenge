//
//  RemoteDataSource.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func fetchAds() async throws -> [Ad]
    func fetchAdDetail() async throws -> AdDetail
}

final class RemoteDataSource: RemoteDataSourceProtocol {
    func fetchAds() async throws -> [Ad] {
        guard let idealistaListAdsURL = URL(string: "https://idealista.github.io/ios-challenge/list.json") else { throw URLError(.badURL) }
        do {
            let (data, response) = try await URLSession.shared.data(from: idealistaListAdsURL)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw URLError(.badServerResponse) }
            do {
                let adDTOData = try JSONDecoder().decode([AdDTO].self, from: data)
                return AdMapperDTO.toBO(fromDTO: adDTOData)
            } catch  {
                throw error
            }
        } catch {
            throw error
        }
    }
    
    func fetchAdDetail() async throws -> AdDetail {
            guard let idealistaAdDetailURL = URL(string: "https://idealista.github.io/ios-challenge/detail.json") else { throw URLError(.badURL) }
            do {
                let (data, response) = try await URLSession.shared.data(from: idealistaAdDetailURL)
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw URLError(.badServerResponse) }
                do {
                    let adDetailDTOData = try JSONDecoder().decode(AdDetailDTO.self, from: data)
                    return AdDetailMapperDTO.toBO(fromDTO: adDetailDTOData)
                } catch  {
                    throw error
                }
            } catch {
                throw error
            }
    }
}

//
//  RemoteDataSource.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func fetchAds() async throws -> [Ad]
}

final class RemoteDataSource: RemoteDataSourceProtocol {
    func fetchAds() async throws -> [Ad] {
        guard let idealistaURL = URL(string: "https://idealista.github.io/ios-challenge/list.json") else { throw NSError() }
        do {
            let (data, response) = try await URLSession.shared.data(from: idealistaURL)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NSError() }
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
}

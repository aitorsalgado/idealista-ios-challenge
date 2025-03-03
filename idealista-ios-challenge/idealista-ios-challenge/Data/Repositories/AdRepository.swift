//
//  AdRepository.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

protocol AdRepositoryProtocol {
    func fetchAds() async throws -> [Ad]
}

class AdRepository {
    var remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

extension AdRepository: AdRepositoryProtocol {
    func fetchAds() async throws -> [Ad] {
        do {
            return try await remoteDataSource.fetchAds()
        } catch {
            throw error
        }
    }
}

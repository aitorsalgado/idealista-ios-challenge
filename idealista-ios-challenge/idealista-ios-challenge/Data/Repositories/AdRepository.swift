//
//  AdRepository.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

protocol AdRepositoryProtocol {
    func fetchAds() async throws -> [Ad]
    func fetchAdDetail() async throws -> AdDetail
}

class AdRepository {
    var remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
}

extension AdRepository: AdRepositoryProtocol {
    func fetchAdDetail() async throws -> AdDetail {
        do {
            return try await remoteDataSource.fetchAdDetail()
        } catch {
            throw error
        }
    }
    
    func fetchAds() async throws -> [Ad] {
        do {
            return try await remoteDataSource.fetchAds()
        } catch {
            throw error
        }
    }
}

//MARK: Repository Mock for previews
extension AdRepository {
    static let adRepositoryPreviewMock = AdRepository(remoteDataSource: RemoteDataSource())
}


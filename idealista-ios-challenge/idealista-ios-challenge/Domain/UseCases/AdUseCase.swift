//
//  AdUseCase.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 3/3/25.
//

import Foundation

protocol AdUseCaseProtocol {
    func fetchAds() async throws -> [Ad]
    func fetchAdDetail() async throws -> AdDetail
}

final class AdUseCase {
    let repository: AdRepository
    
    init(repository: AdRepository) {
        self.repository = repository
    }
}

extension AdUseCase: AdUseCaseProtocol {
    func fetchAdDetail() async throws -> AdDetail {
        do {
            return try await repository.fetchAdDetail()
        } catch {
            throw error
        }
    }
    
    func fetchAds() async throws -> [Ad] {
        do {
            return try await repository.fetchAds()
        } catch {
            throw error
        }
    }
}

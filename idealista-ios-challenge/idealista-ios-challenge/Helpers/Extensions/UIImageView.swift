//
//  UIImageView.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 5/3/25.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String) async {
        guard let url = URL(string: urlString) else {
            await setPlaceholderImage()
            return
        }
        
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        
        if let cachedResponse = cache.cachedResponse(for: request),
           let image = UIImage(data: cachedResponse.data) {
            await MainActor.run {
                self.image = image
            }
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let image = UIImage(data: data) else {
                await setPlaceholderImage()
                return
            }
            
            let cachedData = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedData, for: request)
            
            await MainActor.run {
                self.image = image
            }
        } catch {
            await setPlaceholderImage()
        }
    }
    
    @MainActor
    private func setPlaceholderImage() async {
        let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular)
        self.image = UIImage(systemName: "house.fill", withConfiguration: config)
        self.tintColor = .gray
    }
}



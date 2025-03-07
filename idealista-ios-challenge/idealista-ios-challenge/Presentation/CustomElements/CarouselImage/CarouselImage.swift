//
//  CarouselImage.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 7/3/25.
//

import SwiftUI

struct CarouselImage: View {
    let images: [ImageAd]
    var body: some View {
        TabView {
            ForEach(images, id: \.url) { image in
                AsyncImage(url: URL(string: image.url)) { response in
                    switch response {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 250)
    }
}

#Preview {
    let images: [ImageAd] = [
        ImageAd(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "Primera"),
        ImageAd(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a1/0f/ee/1273036728.web", tag: "Segunda")
        ]
    CarouselImage(images: images)
}

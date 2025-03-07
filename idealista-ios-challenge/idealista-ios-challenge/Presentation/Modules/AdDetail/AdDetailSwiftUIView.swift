//
//  AdDetailSwiftUIView.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 6/3/25.
//

import SwiftUI

struct AdDetailSwiftUIView: View {
    @ObservedObject var adDetailviewModel: AdDetailViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                CarouselImage(images: adDetailviewModel.images)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Propiedad: \(adDetailviewModel.id)")
                        .font(.title2)
                        .bold()
                    Text("Ubicación: " + adDetailviewModel.ubication)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack {
                        Text(adDetailviewModel.price)
                            .font(.title)
                            .bold()
                    }
                    Text("\(adDetailviewModel.roomNumber) hab. · \(adDetailviewModel.constructedArea) m²")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                HStack(spacing: 20) {
                    VStack {
                        Button {
                            adDetailviewModel.toggleFavorite()
                        } label: {
                            Image(systemName: adDetailviewModel.favoriteDate == nil ? "heart" : "heart.fill")
                                .font(.title2)
                                .foregroundColor(.purple)
                        }
                        Spacer()
                        Text("Guardar")
                            .font(.caption)
                            .foregroundColor(.purple)
                    }
                    if let favoriteDate = adDetailviewModel.favoriteDate {
                        Text("Guardado el \(favoriteDate, style: .date)")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                Spacer()
                Text("Comentario del anunciante")
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
                Text(adDetailviewModel.propertyComment)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let adUseCasePreview = AdUseCase(repository: AdRepository.adRepositoryPreviewMock)
    AdDetailSwiftUIView(adDetailviewModel: AdDetailViewModel(Ad: Ad.AdPreviewMock,
                                                             adUseCase: adUseCasePreview))
}

//
//  AdCollectionViewCell.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 5/3/25.
//

import UIKit

class AdCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        String(describing: AdCollectionViewCell.self)
    }

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    
    @IBOutlet weak var propertyCodeLabel: UILabel!
    @IBOutlet weak var thumbnailImageAd: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateData(ad: Ad) {
        self.propertyCodeLabel.text = "Propiedad: \(ad.propertyCode)"
        self.priceLabel.text = "\(ad.priceInfo.price.amount) " + ad.priceInfo.price.currencySuffix
        self.neighborhoodLabel.text = ad.neighborhood
        Task {
            await thumbnailImageAd.loadImage(from: ad.thumbnail)
        }
//        thumbnailImageAd.contentMode = .scaleAspectFit
//        thumbnailImageAd.clipsToBounds = true

    }

}


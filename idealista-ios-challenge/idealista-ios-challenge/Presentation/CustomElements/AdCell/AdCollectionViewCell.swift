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
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var dateFavLabel: UILabel!
    
    var ad: Ad?
    var toggleFavorite: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func favButtonTapped(_ sender: Any) {
        toggleFavorite?()
    }
    
    func updateData(ad: Ad) {
        self.ad = ad
        self.propertyCodeLabel.text = "Propiedad: \(ad.propertyCode)"
        self.priceLabel.text = "\(ad.priceInfo.price.amount) " + ad.priceInfo.price.currencySuffix
        self.neighborhoodLabel.text = ad.neighborhood
        Task {
            await thumbnailImageAd.loadImage(from: ad.thumbnail)
        }
        if let favoriteDate = ad.favoriteDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            dateFavLabel.text = "Guardado el \(formatter.string(from: favoriteDate))"
            dateFavLabel.isHidden = false
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            dateFavLabel.isHidden = true
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }

}


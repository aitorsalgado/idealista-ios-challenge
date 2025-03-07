//
//  HomeViewController.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel: HomeViewModelProtocol!
    
    @IBOutlet weak var adCollectionView: UICollectionView!
    
    private lazy var dataSoruce = makeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupBindings()
        adCollectionView.backgroundColor = .systemPurple
        setUpViews()
    }
    
    func setupBindings() {
        viewModel.adsUpdated = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.applySnapshot()
                self.adCollectionView.setContentOffset(.zero, animated: false)
            }
        }
    }
    
    func setUpViews() {
        setupCollections()
        applySnapshot()
        
    }
    
    //MARK: Collection Functions
    func setupCollections() {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.separatorConfiguration.bottomSeparatorInsets = .zero
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        adCollectionView.frame = view.bounds
        adCollectionView.collectionViewLayout = layout
        adCollectionView.delegate = self
        adCollectionView.register(UINib(nibName: AdCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: AdCollectionViewCell.reuseIdentifier)
        
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<Int, Ad> {
        let dataSource = UICollectionViewDiffableDataSource<Int, Ad>(collectionView: adCollectionView) { collectionView, indexPath, ad in
            let cell = self.adCollectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.reuseIdentifier,
                                                                 for: indexPath) as? AdCollectionViewCell
            cell?.updateData(ad: ad)
            
            cell?.toggleFavorite = { [weak self] in
                guard let self = self else { return }
                if let index = self.viewModel.ads.firstIndex(where: { $0.propertyCode == ad.propertyCode }) {
                    if self.viewModel.ads[index].favoriteDate == nil {
                        self.viewModel.ads[index].favoriteDate = Date()
                    } else {
                        self.viewModel.ads[index].favoriteDate = nil
                    }
                    self.applySnapshot()
                }
            }
            return cell
        }
        return dataSource
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Ad>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.ads)
        dataSoruce.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.pressAdDetail(ad: viewModel.ads[indexPath.row])
    }
}

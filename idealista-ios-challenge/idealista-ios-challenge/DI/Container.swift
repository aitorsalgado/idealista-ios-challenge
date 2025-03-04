//
//  Container.swift
//  idealista-ios-challenge
//
//  Created by Aitor Salgado on 4/3/25.
//

import Foundation
import UIKit

final class Container {
    weak var window: UIWindow?
    static let shared = Container()
    static let adRemoteDataSource = RemoteDataSource()
    lazy var adRepository = AdRepository(remoteDataSource: Container.adRemoteDataSource)
    
    func startHome() {
        DispatchQueue.main.async {
            self.window?.rootViewController = Container.shared.homeDefaultBuilder().build()
            self.window?.makeKeyAndVisible()
        }
    }
    
    func homeDefaultBuilder() -> HomeBuilder {
        HomeBuilder()
    }
}

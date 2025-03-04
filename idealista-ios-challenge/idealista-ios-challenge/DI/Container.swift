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
    static let adRepository = AdRepository(remoteDataSource: adRemoteDataSource)
    
    func startHome() {
        DispatchQueue.main.async {
            self.window?.rootViewController = ViewController()
            self.window?.makeKeyAndVisible()
        }
    }
    
    func homeDefaultBuilder() -> HomeBuilder {
        HomeBuilder()
    }
}

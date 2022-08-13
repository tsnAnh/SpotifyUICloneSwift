//
//  DIContainer.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

import Foundation
import Swinject

final class DIContainer: DIContainerProtocol {
    static let shared = DIContainer()
    
    private let container: Container
    
    init() {
        let container = Container()
        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }
        container.register(SpotifyPreferencesProtocol.self) { r in
            SpotifyPreferencesService(userDefaults: r.resolve(UserDefaults.self) ?? UserDefaults.standard)
        }
        
        self.container = container
    }
    
    func inject<T>() -> T {
        return container.resolve(T.self)!
    }
}

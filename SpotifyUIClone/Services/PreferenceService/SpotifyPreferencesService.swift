//
//  SpotifyPreferences.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

import Foundation
import RxSwift

final class SpotifyPreferencesService: SpotifyPreferencesProtocol {
    func getBool(forKey key: String) -> Bool? {
        userDefaults.bool(forKey: key)
    }
    
    func observeBool(forKey key: String) -> Observable<Bool?> {
        userDefaults.rx.observe(Bool.self, key)
    }
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func observeInt(forKey key: String) -> Observable<Int?> {
        userDefaults.rx.observe(Int.self, key)
    }
    
    func observeString(forKey key: String) -> Observable<String?> {
        userDefaults.rx.observe(String.self, key)
    }
    
    func getInt(forKey key: String) -> Int {
        userDefaults.integer(forKey: key)
    }
    
    func getString(forKey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
    
    func set(data: Any?, forKey key: String) {
        userDefaults.set(data, forKey: key)
    }
}

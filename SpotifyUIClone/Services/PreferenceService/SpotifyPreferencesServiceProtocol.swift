//
//  SpotifyPreferencesProtocol.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

import Foundation
import RxSwift

protocol SpotifyPreferencesProtocol: AnyObject {
    func getInt(forKey key: String) -> Int
    
    func observeInt(forKey key: String) -> Observable<Int?>
    
    func getString(forKey key: String) -> String?
    
    func observeString(forKey key: String) -> Observable<String?>
    
    func getBool(forKey key: String) -> Bool?
    
    func observeBool(forKey key: String) -> Observable<Bool?>
    
    func set(data: Any?, forKey: String)
}

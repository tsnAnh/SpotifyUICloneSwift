//
//  ContentTypeAndListTypeViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 10/08/2022.
//

import RxSwift
import Foundation

final class ContentTypeAndListTypeViewModel {
    private let preferences: SpotifyPreferencesProtocol = DIContainer.shared.inject()
    
    var contentType: Observable<ContentType> {
        preferences.observeInt(forKey: "contentType")
            .compactMap { $0 }
            .map {
                ContentType.allCases[$0]
            }
    }
    
    var isLibraryLayoutGrid: Observable<Bool?> {
        preferences.observeBool(forKey: "library_layout")
    }
    
    func toggleLibraryLayout() {
        print("Cccc")
        preferences.set(data: !(preferences.getBool(forKey: "library_layout") ?? false), forKey: "library_layout")
    }
}

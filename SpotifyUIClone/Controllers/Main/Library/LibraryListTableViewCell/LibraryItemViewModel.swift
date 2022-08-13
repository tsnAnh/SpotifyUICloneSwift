//
//  LibraryItemViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 10/08/2022.
//

import RxSwift

final class LibraryItemViewModel {
    
    private let prefs: SpotifyPreferencesProtocol = DIContainer.shared.inject()
    let libraryItem: LibraryItemProtocol
    
    var isLibraryLayoutGrid: Observable<Bool?> {
        prefs.observeBool(forKey: "library_layout")
    }
    
    
    init(libraryItem: LibraryItemProtocol) {
        self.libraryItem = libraryItem
    }
}

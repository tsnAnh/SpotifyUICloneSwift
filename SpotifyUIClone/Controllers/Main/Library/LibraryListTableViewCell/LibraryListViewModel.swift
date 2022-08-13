//
//  LibraryListViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 10/08/2022.
//

import RxSwift

final class LibraryListViewModel {
    private let prefs: SpotifyPreferencesProtocol = DIContainer.shared.inject()
    
    let libraryItems: [LibraryItemProtocol]
    
    var isLibraryListUseGridLayout: Observable<Bool?> {
        prefs.observeBool(forKey: LibraryListViewModel.libraryListLayout)
    }
    
    init(libraryItems: [LibraryItemProtocol]) {
        self.libraryItems = libraryItems
    }
    
    static let libraryListLayout = "library_layout"
}

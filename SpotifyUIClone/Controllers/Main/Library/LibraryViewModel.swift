//
//  LibraryViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 01/08/2022.
//

import RxRelay
import RxSwift

final class LibraryViewModel {
    
//    let dataSource = LibraryDataSource.dataSource()
    
    private let librarySections = BehaviorRelay<[LibrarySection]>(value: [
        .HeaderSection(items: [.Header]),
    ])
    
    var librarySectionObseravble: Observable<[LibrarySection]> {
        librarySections.asObservable()
    }
}

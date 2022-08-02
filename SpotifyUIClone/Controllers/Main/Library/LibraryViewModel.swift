//
//  LibraryViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 01/08/2022.
//

import RxRelay
import RxSwift
import RxCocoa

final class LibraryViewModel {
    
    let dataSource = LibraryDataSource.dataSource()
    
    private let librarySections = BehaviorRelay<[LibrarySection]>(value: [
        .HeaderSection(items: [
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
            .LibraryList,
        ]),
    ])
    var librarySectionObseravble: Observable<[LibrarySection]> {
        librarySections.asObservable()
    }
    
    private let userAvatar = BehaviorRelay(value: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg")
    var userAvatarObservable: Driver<String> {
        userAvatar.asDriver()
    }
}

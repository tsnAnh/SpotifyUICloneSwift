//
//  ContentTypeBottomSheetViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 04/08/2022.
//

import RxRelay
import RxSwift

final class ContentTypeBottomSheetViewModel: BaseViewModel {
    private let contentTypes = BehaviorRelay(value: ContentType.allCases)
    var contentTypesObservable: Observable<[ContentType]> {
        contentTypes.asObservable()
    }
}

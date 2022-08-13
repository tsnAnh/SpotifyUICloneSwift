//
//  ContentTypeBottomSheetViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 04/08/2022.
//

import RxRelay
import RxSwift
import Foundation

final class ContentTypeBottomSheetViewModel: BaseViewModel {
    private let userDefaults: SpotifyPreferencesProtocol = DIContainer.shared.inject()
    
    private let contentTypes = BehaviorRelay(value: ContentType.allCases.enumerated().map { (index, contentType) in
         ContentTypeUi(contentType: contentType, isSelected: index == 0)
    })
    var contentTypesObservable: Observable<[ContentTypeUi]> {
        contentTypes.asObservable()
    }
    
    var selectRowObservable: Observable<Int?> {
        userDefaults.observeInt(forKey: ContentTypeBottomSheetViewModel.contentType)
    }
    
    func updateSelectedContentTypeIndex(index: Int) {
        userDefaults.set(data: index, forKey: ContentTypeBottomSheetViewModel.contentType)
    }
    
    static let contentType = "contentType"
}

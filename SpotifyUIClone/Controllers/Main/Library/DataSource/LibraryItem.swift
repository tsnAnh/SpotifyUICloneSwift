//
//  LibraryItem.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 01/08/2022.
//

enum LibraryItem {
    case ContentTypeAndListType
    case LibraryList(libraryItems: [LibraryItemProtocol])
    case AddArtist
    case AddPodcastAndProgram
}

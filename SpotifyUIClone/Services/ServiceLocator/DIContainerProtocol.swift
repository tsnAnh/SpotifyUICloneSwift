//
//  DIContainerProtocol.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 09/08/2022.
//

protocol DIContainerProtocol: AnyObject {
    func inject<T: Any>() -> T
}

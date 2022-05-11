//
//  Uitilities.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 29/04/2022.
//

import UIKit

class Utility {
    
    /// Logs all available fonts from iOS SDK and installed custom font
    class func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
}

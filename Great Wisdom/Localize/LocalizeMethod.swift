//
//  File.swift
//  Great Wisdom
//
//  Created by ACS on 19.02.2021.
//

import Foundation
extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

//
//  String+Extensions.swift
//  Allez
//
//  Created by Makarov_Maxim on 01.04.2022.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharachters = CharacterSet(charactersIn: "±§!@£$%^&*()-+=[]\\,}{.?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharachters) else {
            fatalError()
        }
        return encodedString
    }
}

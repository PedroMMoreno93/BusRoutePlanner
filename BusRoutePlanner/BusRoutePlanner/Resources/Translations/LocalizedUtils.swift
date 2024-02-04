//
//  LocalizedUtils.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 04/02/2024.
//

import SwiftUI

extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }

        return components[1][0]
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current
    ) -> String {
        let language = locale.language.languageCode?.identifier
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path)
        else { return "" }

        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")

        return localizedString
    }

    func replaceLocalized(id: String, value: String) -> String {
        return self.replacingOccurrences(of: "·\(id)·", with: value)
    }

    func replaceMarkdown() -> String {
        return self.replacingOccurrences(of: "·", with: "**")
    }

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: self)
    }
}
extension LocalizedStringKey {
    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale)
    }

    func localizedUppercase(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale).uppercased()
    }

    func localizedCapitalize(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey, locale: locale).capitalized
    }
}

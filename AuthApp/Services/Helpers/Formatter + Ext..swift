//
//  Formatter + Ext..swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

extension Formatter {
    static let day: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd"
        return formatter
    }()

    static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy"
        return formatter
    }()

    static let monthFull: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "LLLL"
        return formatter
    }()
}

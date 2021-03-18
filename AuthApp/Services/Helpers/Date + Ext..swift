//
//  Date + Ext..swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

extension Date {
    var day: String { Formatter.day.string(from: self) }
    var year: String  { Formatter.year.string(from: self) }
    var monthFull: String { Formatter.monthFull.string(from: self) }
    
    func convertServerDateToString(date: String?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        guard let date = date else { return nil }
        if let date = dateFormatter.date(from: date) {
            return "\(date.day) \(date.monthFull) \(date.year)".uppercased()
        } else {
            return nil
        }
    }
}

//
//  ReportsModel.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

typealias ReportsModel = [ReportsModelElement]

class ReportsModelElement: Codable {
    var name: String?
    var number: Int?
    var date: String?
    var sum: Double?
    var status, type: String?
    var reason: String?

    init(name: String?, number: Int?, date: String?, sum: Double?, status: String?, type: String?, reason: String?) {
        self.name = name
        self.number = number
        self.date = date
        self.sum = sum
        self.status = status
        self.type = type
        self.reason = reason
    }
}

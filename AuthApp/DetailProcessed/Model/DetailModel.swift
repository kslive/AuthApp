//
//  DetailModel.swift
//  AuthApp
//
//  Created by Eugene Kiselev on 18.03.2021.
//

import Foundation

typealias DetailModel = [DetailModelElement]

class DetailModelElement: Codable {
    var name: String?
    var number: Int?
    var numberPD, status: String?

    enum CodingKeys: String, CodingKey {
        case name, number
        case numberPD = "number_pd"
        case status
    }

    init(name: String?, number: Int?, numberPD: String?, status: String?) {
        self.name = name
        self.number = number
        self.numberPD = numberPD
        self.status = status
    }
}

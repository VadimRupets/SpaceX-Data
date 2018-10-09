//
//  CompanyInfo.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/12/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CompanyInfo {
    let name: String
    let founder: String
    let yearOfFoundation: Int
    let employees: Int
    let vehicles: Int
    let launchSites: Int
    let testSites: Int
    let ceo: String
    let cto: String
    let coo: String
    let ctoPropulsion: String
    let valuation: Int
    let headquarters: Address
    let summary: String
}

extension CompanyInfo: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        name,
        founder,
        yearOfFoundation = "founded",
        employees,
        vehicles,
        launchSites = "launch_sites",
        testSites = "test_sites",
        ceo,
        cto,
        coo,
        ctoPropulsion = "cto_propulsion",
        valuation,
        headquarters,
        summary
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.founder = try values.decode(String.self, forKey: .founder)
        self.yearOfFoundation = try values.decode(Int.self, forKey: .yearOfFoundation)
        self.employees = try values.decode(Int.self, forKey: .employees)
        self.vehicles = try values.decode(Int.self, forKey: .vehicles)
        self.launchSites = try values.decode(Int.self, forKey: .launchSites)
        self.testSites = try values.decode(Int.self, forKey: .testSites)
        self.ceo = try values.decode(String.self, forKey: .ceo)
        self.cto = try values.decode(String.self, forKey: .cto)
        self.coo = try values.decode(String.self, forKey: .coo)
        self.ctoPropulsion = try values.decode(String.self, forKey: .ctoPropulsion)
        self.valuation = try values.decode(Int.self, forKey: .valuation)
        self.headquarters = try values.decode(Address.self, forKey: .headquarters)
        self.summary = try values.decode(String.self, forKey: .summary)
    }
    
}

extension CompanyInfo: TableViewDataRepresentable {
    var tableViewData: [[String : Any]] {
        var _tableViewData = [[String: Any]]()
        
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Founder", founder))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Founded", yearOfFoundation.description))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Employees", employees.description))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Vehicles", founder))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Launch sites", launchSites.description))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Test sites", testSites.description))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "CEO", ceo))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "CTO", cto))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "COO", coo))
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "CTO Propulsion", ctoPropulsion))
        
        let formattedValuation = NumberFormatter.dollarFormatter.string(from: NSNumber(value: valuation)) ?? "$\(valuation)"
        _tableViewData.append(tableViewData(with: .subtitle, arguments: "Valuation", formattedValuation))
        _tableViewData.append(tableViewData(with: .rightDisclosure, arguments: "Headquarters"))
        
        
        return _tableViewData
    }
}

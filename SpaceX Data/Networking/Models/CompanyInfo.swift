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
    let yearOfFoundation: String
    let employees: Int
    let vehicles: Int
    let launchSites: Int
    let testSites: Int
    let ceo: String
    let cto: String
    let coo: String
    let ctoPropulsion: String
    let valuation: Int
    let headquaters: Address
    let summary: String
 
    init(name: String, founder: String, yearOfFoundation: String, employees: Int, vehicles: Int, launchSites: Int, testSites: Int, ceo: String, cto: String, coo: String, ctoPropulsion: String, valuation: Int, headquaters: Address, summary: String) {
        self.name = name
        self.founder = founder
        self.yearOfFoundation = yearOfFoundation
        self.employees = employees
        self.vehicles = vehicles
        self.launchSites = launchSites
        self.testSites = testSites
        self.ceo = ceo
        self.cto = cto
        self.coo = coo
        self.ctoPropulsion = ctoPropulsion
        self.valuation = valuation
        self.headquaters = headquaters
        self.summary = summary
    }
    
}

extension CompanyInfo: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        name,
        founder,
        yearOfFoundation,
        employees,
        vehicles,
        launchSites = "launch_sites",
        testSites = "test_sites",
        ceo,
        cto,
        coo,
        ctoPropulsion = "cto_propulsion",
        valuation,
        headquaters,
        summary
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        self.founder = try values.decode(String.self, forKey: .founder)
        self.yearOfFoundation = try values.decode(String.self, forKey: .yearOfFoundation)
        self.employees = try values.decode(Int.self, forKey: .employees)
        self.vehicles = try values.decode(Int.self, forKey: .vehicles)
        self.launchSites = try values.decode(Int.self, forKey: .launchSites)
        self.testSites = try values.decode(Int.self, forKey: .testSites)
        self.ceo = try values.decode(String.self, forKey: .ceo)
        self.cto = try values.decode(String.self, forKey: .cto)
        self.coo = try values.decode(String.self, forKey: .coo)
        self.ctoPropulsion = try values.decode(String.self, forKey: .ctoPropulsion)
        self.valuation = try values.decode(Int.self, forKey: .valuation)
        self.headquaters = try values.decode(Address.self, forKey: .headquaters)
        self.summary = try values.decode(String.self, forKey: .summary)
    }
    
}

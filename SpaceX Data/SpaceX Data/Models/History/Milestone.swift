//
//  Milestone.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/19/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Milestone: CustomStringConvertible {
    let id: Int
    let title: String
    let date: Date
    let flightNumber: Int?
    let links: Links
    let description: String
}

extension Milestone: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id,
        title,
        date = "event_date_utc",
        flightNumber = "flight_number",
        links,
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(Int.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        
        let eventDateString = try values.decode(String.self, forKey: .date)
        
        guard let eventDate = DateFormatter.ISO8601.date(from: eventDateString) ?? DateFormatter.ISO8601Millisecondless.date(from: eventDateString) else {
            throw DecodingError.dataCorruptedError(forKey: .date, in: values, debugDescription: "Date string does not match format expected by formatter.")
        }
        
        self.date = eventDate
        
        self.flightNumber = try values.decodeIfPresent(Int.self, forKey: .flightNumber)
        self.links = try values.decode(Links.self, forKey: .links)
        self.description = try values.decode(String.self, forKey: .description)
    }
    
}

extension Milestone: TableViewCellDataEssentiallyRepresentable {
    var essentialData: TableViewCellData {
        return .subtitle((title: title, subtitle: DateFormatter.yyyyMMdd.string(from: date)))
    }
}

extension Milestone: TableViewCellDataFullyRepresentable {
    var tableViewData: [TableViewCellData] {
        var tableViewData = [TableViewCellData]()
        
        tableViewData.append(.subtitle((title: "Date", subtitle: DateFormatter.yyyyMMdd.string(from: date))))
        
        if let flightNumber = flightNumber {
            tableViewData.append(.subtitle((title: "Flight number", subtitle: flightNumber.description)))
        }
        
        tableViewData.append(contentsOf: links.tableViewData)
        
        return tableViewData
    }
}

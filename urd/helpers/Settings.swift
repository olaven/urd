//
//  Settings.swift
//  urd
//
//  Created by Olav on 29/08/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import Foundation

private struct Keys {
    
    let excludeAllDayEvents = "EXCLUDE_ALL_DAY_EVENTS"
    let eventPeriod = "INCLUDE_EVENTS_FROM"
}


private let keys = Keys()
private let settings = UserDefaults()


enum EventPeriod {
    case week
    case month
    case six_months
    case year
}


func getStartDate() -> Date {
    
    let eventPeriod = getEventPeriod()
    
    switch eventPeriod {
    case .week:
        return Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    case .month:
            return Calendar.current.date(byAdding: .month, value: -1, to: Date())!
    case .six_months:
        return Calendar.current.date(byAdding: .month, value: -6, to: Date())!
    case .year:
        return Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    }
}

private func getEventPeriod() -> EventPeriod {
    
    let fromSettings = settings.string(forKey: keys.eventPeriod)
    switch fromSettings {
        case "WEEK":
            return .week
        case "MONTH":
            return .month
        case "SIX_MONTHS":
            return .six_months
        case "YEAR":
            return .year
        default:
            return .year
    }
}

func excludeAllDayEvents() -> Bool {
    
    let included = settings.bool(forKey: keys.excludeAllDayEvents)
    return included
}


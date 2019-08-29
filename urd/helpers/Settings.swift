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
}

private let keys = Keys()

func excludeAllDayEvents() -> Bool {
    
    let defaults = UserDefaults()
    let included = defaults.bool(forKey: keys.excludeAllDayEvents)
    return included
}


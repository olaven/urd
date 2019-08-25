//
//  Calendars.swift
//  urd
//
//  Created by Olav on 25/08/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import Foundation
import EventKit
import SwiftUI

let eventStore = EKEventStore()

func getCalendars() -> [MyCalendar] {
    
    return getEKCalendars().map({ekCalendar in
        
        let events = getEKEvents(in: ekCalendar)
        let hours = getHours(of: events)
        
        return MyCalendar(
            id: ekCalendar.calendarIdentifier,
            name: ekCalendar.title,
            color: Color.red,
            hours: hours
        )
    })
}


private func getEKEvents(in ekCalendar: EKCalendar) -> [EKEvent] {
    
    let start = Calendar.current.date(byAdding: .year, value: -3, to: Date())
    let end = Date()
    
                    //NOTE: if interval > 4 years, takes first events.
    let predicate = eventStore.predicateForEvents(withStart: start!, end: end, calendars: [ekCalendar])
    let events = eventStore.events(matching: predicate)
    print("\(events.count) in \(ekCalendar.title) start \(String(describing: start)) end \(end)")
    
    return events;
}

private func getHours(of events: [EKEvent]) -> Int {
    
    var hours = 0
    for event in events {
        
        let start = event.startDate.timeIntervalSinceReferenceDate
        let end = event.endDate.timeIntervalSinceReferenceDate
        let duration = ((end - start) * 1000 / 60) / 60
        
        hours += Int(duration)
    }
    
    return hours
}

private func getEKCalendars() -> [EKCalendar] {
    
    let ekCalendars = eventStore.calendars(for: .event)
    return ekCalendars
}

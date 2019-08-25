//
//  CalendarList.swift
//  urd
//
//  Created by Olav on 25/08/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI
import EventKit

func getCalendars() -> [_Calendar] {
    

    let eventStore = EKEventStore()
    let ekCalendars = eventStore.calendars(for: .event)
    let calendars = ekCalendars.map { ekCalendar in
        
        _Calendar(
            name: ekCalendar.title,
            color: .orange,//FIXME: placeholder
            hours: 2 //FIXME: placeholder
        )
    }
    
    return calendars
}


struct CalendarRow: View {
    var calendar: _Calendar
    
    var body: some View {
        HStack {
            Text("\(calendar.name)")
            Text("\(calendar.hours)")
        }.background(calendar.color)
    }
}


struct CalendarList: View {
    var body: some View {
        List(getCalendars()) { calendar in
            CalendarRow(calendar: calendar)
        }
    }
}


#if DEBUG
struct CalendarList_Previews : PreviewProvider {
    static var previews: some View {
        CalendarList()
    }
}
#endif

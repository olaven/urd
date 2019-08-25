//
//  CalendarList.swift
//  urd
//
//  Created by Olav on 25/08/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI



struct CalendarRow: View {
    var calendar: MyCalendar
    
    var body: some View {
        HStack {
            Text("\(calendar.name)").font(.headline).underline(true, color: calendar.color)
            Text("\(calendar.hours)")
        }
    }
}


struct CalendarList: View {
    
    let calendars = getCalendars()
    var body: some View {
        List(calendars) { calendar in
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

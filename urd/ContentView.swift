//
//  ContentView.swift
//  urd
//
//  Created by Olav on 11/07/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI
import EventKit


struct ContentView : View {
    
    @State private var hasAccess = EKEventStore.authorizationStatus(for: .event) == EKAuthorizationStatus.authorized;
    let eventStore = EKEventStore()
    
    
    var body: some View {
        VStack {
            if (hasAccess) {
                
                CalendarList()
            } else {
                
                AccessButton()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

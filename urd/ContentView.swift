//
//  ContentView.swift
//  urd
//
//  Created by Olav on 11/07/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI
import EventKit


func askForCalendarPermission() {
    
    
    
}

struct ContentView : View {
    
    @State private var hasAccess = EKEventStore.authorizationStatus(for: .event) == EKAuthorizationStatus.authorized;
    let eventStore = EKEventStore()
    
    
    var body: some View {
        VStack {
            if (hasAccess) {
                
                Text("You have access to calendar")
            } else {
                
                Button(
                    action: {
                        
                        switch EKEventStore.authorizationStatus(for: .event) {
                            
                        case .authorized:
                            print("Authorized")
                            
                        case .notDetermined:
                            self.eventStore.requestAccess(to: .event, completion: {
                                (granted: Bool, error: Error?) -> Void in
                                
                                if granted {
                                    print("Granted")
                                } else {
                                    print("Denied")
                                }
                            })
                        case .denied:
                            
                            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                                return
                            }
                            
                            if UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                    print("Settings opened: \(success)") // Prints true
                                })
                            }
                        default:
                            print("Default case")
                        }
                    }) {
                        
                        Text("Give access")
                    }
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

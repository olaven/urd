//
//  AccessButton.swift
//  urd
//
//  Created by Olav on 25/08/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI
import EventKit


struct AccessButton : View {
    
    var body: some View {
        
        VStack {
            
            Button(
                action: {
                    
                    switch EKEventStore.authorizationStatus(for: .event) {
                    case .notDetermined:
                        EKEventStore().requestAccess(to: .event, completion: {
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

#if DEBUG
struct AccessButton_Previews : PreviewProvider {
    static var previews: some View {
        AccessButton()
    }
}
#endif

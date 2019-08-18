//
//  ContentView.swift
//  urd
//
//  Created by Olav on 11/07/2019.
//  Copyright © 2019 olaven. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
        VStack {
            Text("Hei igjen")
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

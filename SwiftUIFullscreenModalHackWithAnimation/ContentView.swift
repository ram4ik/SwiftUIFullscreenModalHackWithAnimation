//
//  ContentView.swift
//  SwiftUIFullscreenModalHackWithAnimation
//
//  Created by Ramill Ibragimov on 02.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Text("Show standard modal")
                })
            }.navigationBarTitle("Standard")
                .sheet(isPresented: $isPresented, content: {
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Text("HERE IS MY MODAL")
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
        ZStack {
            NavigationView {
                VStack {
                    Button(action: {
                        withAnimation {
                            self.isPresented.toggle()
                        }
                    }, label: {
                        Text("Show standard modal")
                    })
                }.navigationBarTitle("Standard")
            }
            ZStack {
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    self.isPresented.toggle()
                                }
                            }, label: {
                                Text("Dismiss")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            })
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.isPresented.toggle()
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                            }
                        }.padding(.top, UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top)
                        .padding(.horizontal)
                        Spacer()
                    }
                    Spacer()
                }
            }.background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
            .offset(x: 0, y: isPresented ? 0 : UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.frame.height ?? 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

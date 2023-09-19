//
//  ContentView.swift
//  SFSymbolTest
//
//  Created by 안병욱의 mac on 2023/09/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var bounceValue: Int = 0
    
    var IsInternetConnected: Bool = false
    
    @State private var isPaused: Bool = false
    
    var isMoonHidden: Bool = false
    
    
    var body: some View {
        VStack {
            //Simbel Effect 적용 방법
            Image(systemName: "wifi.router")
                .symbolEffect(.variableColor) //새로운 기능
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            
            //Discrete
            Image(systemName: "antenna.radiowaves.left.and.right")
                .symbolEffect(.bounce, value: bounceValue) //새로운 기능
            
            Button("Plus") {
                bounceValue += 1
            }
            
            
            //Indefinite
            Image(systemName: "wifi.router")
                .symbolEffect(.variableColor, isActive: IsInternetConnected) //새로운 기능
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            
            //content Transition
            Button {
                isPaused.toggle()
            } label : {
                Image(systemName: isPaused ? "pause.fill" : "play.fill")
                    .contentTransition(.symbolEffect(.replace.offUp))
            }
            
            
            //transition
            if !isMoonHidden {
                Image(systemName: "moon.stars")
                    .transition(.symbolEffect(.automatic))
            }
        }
        .padding()
    }
}


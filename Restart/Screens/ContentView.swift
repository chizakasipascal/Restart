//
//  ContentView.swift
//  Restart
//
//  Created by CHIZA KASI Pascal on 16/01/2023.
//

import SwiftUI
  
struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = true
   
    var body: some View {
        ZStack {
//            Image(systemName: "globe")
//                .padding()
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello! Kasi Pascal")
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
            }
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

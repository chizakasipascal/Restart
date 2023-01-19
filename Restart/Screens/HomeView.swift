//
//  HomeView.swift
//  Restart
//
//  Created by CHIZA KASI Pascal on 16/01/2023.
//

import SwiftUI

struct HomeView: View {
    //MARK -> PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = true
    var body: some View {
        VStack(){
            
            Text("Home")
                .font(.largeTitle)
            Button(action:{
                isOnboardingViewActive=true
            }){
                Text("Restart")
            }
        }//VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


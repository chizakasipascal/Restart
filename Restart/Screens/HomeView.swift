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
            //MARK: -> HEAD
            Spacer()
            ZStack{
                CirculerGrouperView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit() 
                    .padding()
            }
            //MARK -> BODY
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: -> FOOTER
          
                Spacer()
            Button(action:{
                isOnboardingViewActive=true
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
                    
            }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            
            
        }//VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


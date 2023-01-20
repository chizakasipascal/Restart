//
//  OnboardingView.swift
//  Restart
//
//  Created by CHIZA KASI Pascal on 16/01/2023.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: -> PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive:Bool = true
    
    @State private var buttonWith:Double=UIScreen.main.bounds.width-80
    @State private var buttonOffset:CGFloat=0
    @State private var isAnimating:Bool=false
    @State private var imageOffset:CGSize = .zero
    @State private var indicatorOpacity:Double = 1.0
    @State private var textTitle:String = "Share."
    //MARK: -> BODY
    var body: some View {
        ZStack{
            
//            Color("ColorBlue")
//                .ignoresSafeArea(.all, edges:.all)
           
            VStack( spacing: 20){
                //MARK >HEAD
                 Spacer()
                VStack(spacing:0){
                    Text(textTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .font(.system(size: 60))
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("""
                         It's not how much we give but
                         how much love we put into giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                }//: HEADER
                .opacity (isAnimating ? 1 : 0) .offset (y: isAnimating ? 0 : -40)
                .animation (.easeOut (duration: 1), value: isAnimating)
              
                //MARK: ->CENTER
                ZStack(){
                    CirculerGrouperView(ShapeColor: .red, ShapeOpacity: 0.2)
                        .offset(x:imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width /  5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ?1:0)
                        .offset(x:imageOffset.width*1.2,y:0)
                        .rotationEffect(.degrees(Double(imageOffset.width /  20)))
                        .animation(.easeIn(duration: 0.5), value: isAnimating)
                        .gesture(
                            DragGesture()
                                .onChanged{gesture in
                                    if abs(imageOffset.width)<=150
                                    {
                                        imageOffset=gesture.translation
                                        withAnimation(.linear(duration:0.25)){
                                            indicatorOpacity=0
                                            textTitle="Give."
                                        }
                                    }
                                }
                                .onEnded{ _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration:0.25)){
                                        indicatorOpacity=1
                                        textTitle="Share."
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }//:CENTER
                 
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight:.ultraLight ))
                        .foregroundColor(.black)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                        .offset(y:20)
                    ,
                    alignment:.bottom
                )
               Spacer()
                  //MARK: ->FOOTER
                ZStack{
                    // PARTS OF CUSTOMER BUTTOM
                    
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.red.opacity(0.2))
                    Capsule()
                        .fill(Color.red.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    Text ("Get Started")
                        .font (.system(.title3, design:.rounded) )
                        . fontWeight(.bold)
                        . foregroundColor (.white)
                        . offset(x: 20)
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()

                    }
                    // 4.  CIRCLE (DRAGGABLE)
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(Color.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                            
                        }.foregroundColor(.white)
                            .frame(width: 80,height: 80,alignment: .center)
                            .offset(x:buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        if gesture.translation.width > 0 && buttonOffset <= buttonWith-80{
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                    .onEnded{  _ in
                                        withAnimation(Animation.easeOut(duration: 0.4)){
                                            if buttonOffset > buttonWith / 2 {
                                                buttonOffset=buttonWith - 80
                                                isOnboardingViewActive = false
                                            }else{
                                                buttonOffset=0
                                            }
                                        }
                                    }//Gesture
                            )
 
                         Spacer()
                    }
                }
                .frame( width: buttonWith,height: 80,alignment: .center)
                    .padding()
                    .opacity(isAnimating ?1:0)
                    .offset(y:isAnimating ?0:40)
                    .animation(.easeIn(duration: 1), value: isAnimating)
            }//VStack
            
        }  //ZStack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

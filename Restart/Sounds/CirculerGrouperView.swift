//
//  CirculerGrouperView.swift
//  Restart
//
//  Created by CHIZA KASI Pascal on 19/01/2023.
//

import SwiftUI

struct CirculerGrouperView: View {
    //MARK :-> PROPERTY
    @State var ShapeColor:Color
    @State var ShapeOpacity:Double
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
                .frame(width: 260,height: 260,alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260,height: 260,alignment: .center)
        }
    }
}

struct CirculerGrouperView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            CirculerGrouperView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
       
    }
}

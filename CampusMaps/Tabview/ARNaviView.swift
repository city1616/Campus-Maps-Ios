//
//  ARNaviView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/09.
//

import SwiftUI

struct ARNaviView: View {
    
    @State var ObjectShow = false
    
    var body: some View {
        NavigationView {
          
            ZStack {
                VStack {
                    ARViewContainer()
                    
                    if(ObjectShow == true) {
                        ObjectView()
                    }
                    else {
                        NaviView()
                    }
                }
            }
            .navigationBarTitle("AR Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }), trailing: Button(action: {
                withAnimation {
                    self.ObjectShow.toggle()
                }
            }) {
                Text("3D Object")
            })
        }
    }
}

struct ARNaviView_Previews: PreviewProvider {
    static var previews: some View {
        ARNaviView()
    }
}

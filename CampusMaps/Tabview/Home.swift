//
//  Home.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/06.
//

import SwiftUI

struct Home: View {
    
    @State var SideMenu = false
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.SideMenu = false
                    }
                }
            }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                VStack(alignment: .center, spacing: 0.0) {
                    NaverMapView()
                }
                .offset(x: self.SideMenu ? UIScreen.main.bounds.width / 2 : 0)
                .disabled(self.SideMenu ? true : false)
                
                if self.SideMenu {
                    CampusMaps.SideMenu()
                        // .frame(width: geo.size.width / 2)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .transition(.move(edge: .leading))
                        .edgesIgnoringSafeArea(.top)
                }
            }
            .navigationTitle("Campus Maps")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.SideMenu.toggle()
                }
            }) {
                Text("Menu")
            }, trailing: Button(action: {
                withAnimation {
                    
                }
            }) {
                Image(systemName: "ellipsis")
                    .font(.title3)
            })
            .gesture(drag)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

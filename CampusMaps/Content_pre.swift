//
//  Content_pre.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/06.
//

import SwiftUI

struct Content_pre: View {
    @State var SideMenu = false
    @State var arToggle = false
    @State var naviToggle = false
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
                
                VStack() {
                    // Text("AR")
                    NaverMapView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    // ARViewContainer().edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing: 0.0) {
                        HStack() {
                            Spacer()
                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "map")
                                        .font(.title3)
                                    Text("MAP")
                                        .multilineTextAlignment(.center)
                                        .font(.footnote)
                                }
                            }
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.naviToggle.toggle()
                                }
                            }) {
                                VStack {
                                    // Image(systemName: "mappin.and.ellipse")
                                    Image(systemName: "location.circle")
                                        .font(.title3)
                                    Text("NAV")
                                        .font(.footnote)
                                }
                            }
                            .sheet(isPresented: $naviToggle) {
                                VStack {
                                    NaviView()
                                    
                                }
                            }
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.arToggle.toggle()
                                }
                            }) {
                                VStack {
                                    // Image(systemName: "camera.on.rectangle")
                                    Image(systemName: "arkit")
                                    Text("AR")
                                        .font(.footnote)
                                        .sheet(isPresented: $arToggle) {
                                            VStack {
                                                ARViewContainer().edgesIgnoringSafeArea(.all)
    //                                            NaverMapView().edgesIgnoringSafeArea(.all)
    //                                                .frame(width: .zero, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            }
                                        }
                                }
                            }
                            Spacer()
                            Button(action: {}) {
                                VStack {
                                    Image(systemName: "person.circle")
                                        .font(.title3)
                                    Text("MY")
                                        .font(.footnote)
                                }
                            }
                            Spacer()
                        }
                        .padding(.top, 10.0)
                    }
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
                    self.arToggle.toggle()
                }
            }) {
                Image(systemName: "ellipsis")
                    .font(.title3)
            })
            .gesture(drag)
        }
    }
}

struct Content_pre_Previews: PreviewProvider {
    static var previews: some View {
        Content_pre()
    }
}

//
//  ContentView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import RealityKit

//struct ContentView: View {
//    var body: some View {
//        Text("abc")
//    }
//}
struct ContentView : View {

    @State var ShowMenu = false
    @State var arToggle = false

    var body: some View {

        NavigationView {
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
                        Button(action: {}) {
                            VStack {
                                // Image(systemName: "mappin.and.ellipse")
                                Image(systemName: "location.circle")
                                    .font(.title3)
                                Text("NAV")
                                    .font(.footnote)
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
                                    .font(.title3)
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
            .navigationTitle("Campus Maps")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.ShowMenu.toggle()
                }
            }) {
                Text("menu")
            }, trailing: Button(action: {
                withAnimation {
                    self.arToggle.toggle()
                }
            }) {
                Image(systemName: "ellipsis")
                    .font(.title3)
            })
        }
//         .edgesIgnoringSafeArea(.all)
//
//         NaverMapView().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)
        
        arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.arView.frame = self.view.bounds
//        self.arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.load장면()

        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)

        return arView

    }

    func updateUIView(_ uiView: ARView, context: Context) {}

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

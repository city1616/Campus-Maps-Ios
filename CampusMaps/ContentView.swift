//
//  ContentView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    @State var ShowMenu = false
    @State var arToggle = false
    
    var body: some View {
        NavigationView {
            VStack() {
                // Text("AR")
                NaverMapView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                // ARViewContainer().edgesIgnoringSafeArea(.all)
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
                Text("AR")
            })
        }
        .edgesIgnoringSafeArea(.all)
        
        // NaverMapView().edgesIgnoringSafeArea(.all)
        // MapTest()
    }
}

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)

        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.load장면1()

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

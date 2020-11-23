//
//  ContentView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import RealityKit

struct AR_View : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
        // NaverMapView().edgesIgnoringSafeArea(.all)
        // MapTest()
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct AR_View_Previews : PreviewProvider {
    static var previews: some View {
        AR_View()
    }
}
#endif

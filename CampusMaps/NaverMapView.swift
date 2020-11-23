//
//  NaverMapView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import UIKit
import NMapsMap

struct NaverMapView : View {
    var body: some View {
        return navermap()
    }
}

struct navermap: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        var _: NMFAuthState!
        let nmapView = NMFMapView(frame: .zero)
        return nmapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

//class ViewController: UIViewController, NMFMapViewDelegate {
//    var authState: NMFAuthState!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let nmapView = NMFMapView(frame: view.frame)
//        view.addSubview(nmapView)
//    }
//}

struct NaverMapView_Previews : PreviewProvider {
    static var previews: some View {
        NaverMapView()
    }
}


//struct ContentView : View {
//    var body: some View {
//        return ARViewContainer().edgesIgnoringSafeArea(.all)
//        // NaverMapView().edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> ARView {
//
//        let arView = ARView(frame: .zero)
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//
//        return arView
//
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif

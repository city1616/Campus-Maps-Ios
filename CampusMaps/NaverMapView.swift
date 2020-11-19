//
//  NaverMapView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import UIKit
import NMapsMap

//struct NaverMapView : View {
//    var body: some View {
//        return ViewController()
//    }
//}

class ViewController: UIViewController, NMFMapViewDelegate {
    var authState: NMFAuthState!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nmapView = NMFMapView(frame: view.frame)
        view.addSubview(nmapView)
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

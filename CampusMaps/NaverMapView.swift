//
//  NaverMapView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import UIKit
import NMapsMap

public let DEFAULT_CAMERA_POSITION = NMFCameraPosition(NMGLatLng(lat: 35.968461, lng: 126.958047), zoom: 14, tilt: 0, heading: 0)


struct NaverMapView : View {
    var body: some View {
        return navermap()
    }
}

struct navermap: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    
    func makeUIView(context: Context) -> some UIView {
        
//        weak var naverMapView: NMFNaverMapView!
//        var mapView: NMFMapView {
//            return naverMapView.mapView
//        }
        
        let naverMapView = NMFNaverMapView()
        
        var _: NMFAuthState!
        
        // let nmapView = NMFMapView(frame: .zero)
        
       
        // nmapView.addOptionDelegate(delegate: self)
        
        naverMapView.mapView.mapType = .basic
        naverMapView.showLocationButton = true
        naverMapView.showCompass = true
        naverMapView.showZoomControls = true
        
        // nmapView.isNightModeEnabled = true // darkmode
      
        // nmapView.moveCamera(NMFCameraUpdate(position: DEFAULT_CAMERA_POSITION))
        // naverMapView.mapView.moveCamera(NMFCameraUpdate(position: NMFCameraPosition(NMGLatLng(lat: Double(userLatitude.floatValue), lng: Double(userLongitude.floatValue)), zoom: 14, tilt: 0, heading: 0)))
        naverMapView.mapView.moveCamera(NMFCameraUpdate(position: DEFAULT_CAMERA_POSITION))
        
        return naverMapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
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

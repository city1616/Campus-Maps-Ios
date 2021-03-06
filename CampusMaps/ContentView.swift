//
//  ContentView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import RealityKit
import ARKit

//struct ContentView: View {
//    var body: some View {
//        Text("abc")
//    }
//}

struct ContentView : View {

    @State var SideMenu = false

    @State var selectedView = 0 // TabView index
    
    var body: some View {

        TabView(selection: $selectedView) {

            // CustomNavigationView(view: Home())
//            CustomNavigationView(view: Home(), onSearch: { (txt) in
//                print("from SwiftUI")
//            }, onCancel: {
//                print("From Canceled")
//            })
            Home()
                .tag(0)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("HOME")
                }
            NaverMapView()
                .edgesIgnoringSafeArea(.all)
                .tag(1)
                .tabItem {
                    Image(systemName: "map")
                    Text("MAP")
                }
//            CustomNavigationView(view: AnyView(NaviView()), placeHolder: "Search", largeTitle: false, title: "Campus Maps", onSearch: { (txt) in
//                if txt != "" {
//
//                }
//            }, onCancel: {
//                print("NaviView Cancel")
//            })
            NaviView()
            .edgesIgnoringSafeArea(.all)
                .tag(2)
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("NAV")
                }
            ARNaviView()
                .tag(3)
                .tabItem {
                    Image(systemName: "arkit")
                    Text("AR")
                }
            // NaviMapView(annotations: $annotations).centerCoordinate(.init(latitude: 35.968461, longitude: 126.958047)).zoomLevel(16).edgesIgnoringSafeArea(.all)
            MY()
                .tag(4)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("MY")
                }
        }
//         .edgesIgnoringSafeArea(.all)
//
//         NaverMapView().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {

        let arView = ARView(frame: .zero)
        
//        let ARModel = try! ModelEntity.load(named: "ARModel")
//        let anchorEntity = AnchorEntity(plane: .horizontal)
//        anchorEntity.addChild(ARModel)
//        arView.scene.addAnchor(anchorEntity)
        
        arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        self.arView.frame = self.view.bounds
//        self.arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.load장면()

        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
  

        return arView
        // return arvieww.session.run(config)

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

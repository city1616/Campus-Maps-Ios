//
//  NaviView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/30.
//

import SwiftUI
import Mapbox

// lat: 35.968461, lng: 126.958047 -> 원광대
// 35.967861, 126.958153 -> 공학관
// 35.967909, 126.956043 -> 학생회관
// 37.328989, 126.842730 -> 집

struct NaviView: View {
    
    // mark
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "프라임관", coordinate: .init(latitude: 35.968461, longitude: 126.958047)),
        MGLPointAnnotation(title: "공학관", coordinate: .init(latitude: 35.967861, longitude: 126.958153)),
        MGLPointAnnotation(title: "학생회관", coordinate: .init(latitude: 35.967909, longitude: 126.956043))
        
    ]
    
    var body: some View {
        NaviMapView(annotations: $annotations).centerCoordinate(.init(latitude: 35.968461, longitude: 126.958047)).zoomLevel(16).edgesIgnoringSafeArea(.all)
    }
}

struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView()
    }
}

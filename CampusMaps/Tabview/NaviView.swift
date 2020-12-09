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
        MGLPointAnnotation(title: "학생회관", coordinate: .init(latitude: 35.967909, longitude: 126.956043)),
        MGLPointAnnotation(title: "문화체육관", coordinate: .init(latitude: 35.965207, longitude: 126.957270)),
        MGLPointAnnotation(title: "박물관", coordinate: .init(latitude: 35.966288, longitude: 126.956602)),
        MGLPointAnnotation(title: "60주년 기념관", coordinate: .init(latitude: 35.965907, longitude: 126.954425)),
        MGLPointAnnotation(title: "숭산기념관", coordinate: .init(latitude: 35.966791, longitude: 126.954774)),
        MGLPointAnnotation(title: "원광대학교 대학원", coordinate: .init(latitude: 35.968155, longitude: 126.955352)),
        MGLPointAnnotation(title: "제2체육관", coordinate: .init(latitude: 35.968290, longitude: 126.954995)),
        MGLPointAnnotation(title: "법과대학", coordinate: .init(latitude: 35.968736, longitude: 126.956322)),
        MGLPointAnnotation(title: "대학본부", coordinate: .init(latitude: 35.969036, longitude: 126.953741)),
        MGLPointAnnotation(title: "학생지원관", coordinate: .init(latitude: 35.969640, longitude: 126.954577)),
        MGLPointAnnotation(title: "중앙도서관", coordinate: .init(latitude: 35.970254, longitude: 126.955451)),
        MGLPointAnnotation(title: "생활과학대학", coordinate: .init(latitude: 35.970146, longitude: 126.953945)),
        MGLPointAnnotation(title: "자연과학대학", coordinate: .init(latitude: 35.967724, longitude: 126.959289)),
        MGLPointAnnotation(title: "농식품융합대학", coordinate: .init(latitude: 35.968969, longitude: 126.960810)),
        MGLPointAnnotation(title: "미술대학", coordinate: .init(latitude: 35.970351, longitude: 126.957441)),
        MGLPointAnnotation(title: "새천년관", coordinate: .init(latitude: 35.970584, longitude: 126.958678)),
        MGLPointAnnotation(title: "사회과학대학", coordinate: .init(latitude: 35.971379, longitude: 126.957064)),
        MGLPointAnnotation(title: "인문대학", coordinate: .init(latitude: 35.971253, longitude: 126.958711)),
        MGLPointAnnotation(title: "승리관", coordinate: .init(latitude: 35.971279, longitude: 126.960798)),
        MGLPointAnnotation(title: "조소관", coordinate: .init(latitude: 35.971522, longitude: 126.959854)),
        MGLPointAnnotation(title: "학군단", coordinate: .init(latitude: 35.971948, longitude: 126.958815)),
        MGLPointAnnotation(title: "용화관", coordinate: .init(latitude: 35.972177, longitude: 126.956964)),
        MGLPointAnnotation(title: "삼동관", coordinate: .init(latitude: 35.972392, longitude: 126.957057)),
        MGLPointAnnotation(title: "보은관", coordinate: .init(latitude: 35.972364, longitude: 126.957713)),
        MGLPointAnnotation(title: "청운관", coordinate: .init(latitude: 35.973090, longitude: 126.957873)),
        MGLPointAnnotation(title: "사은관", coordinate: .init(latitude: 35.973425, longitude: 126.957670)),
        MGLPointAnnotation(title: "학림관", coordinate: .init(latitude: 35.972716, longitude: 126.956232)),
        MGLPointAnnotation(title: "어학관", coordinate: .init(latitude: 35.973583, longitude: 126.956983)),
        MGLPointAnnotation(title: "사범대학", coordinate: .init(latitude: 35.967327, longitude: 126.960883)),
        MGLPointAnnotation(title: "평생교육관(간호대학)", coordinate: .init(latitude: 35.966755, longitude: 126.961166)),
        MGLPointAnnotation(title: "약학대학", coordinate: .init(latitude: 35.966926, longitude: 126.959586)),
        MGLPointAnnotation(title: "의과대학", coordinate: .init(latitude: 35.965754, longitude: 126.959370)),
        MGLPointAnnotation(title: "원광대학교 병원", coordinate: .init(latitude: 35.964438, longitude: 126.959659)),
        MGLPointAnnotation(title: "원광대학교 치과병원", coordinate: .init(latitude: 35.964756, longitude: 126.960678)),
        MGLPointAnnotation(title: "치과대학", coordinate: .init(latitude: 35.965044, longitude: 126.960660)),
        MGLPointAnnotation(title: "원광대한의과대학 익산한방병원", coordinate: .init(latitude: 35.964602, longitude: 126.958672)),
        MGLPointAnnotation(title: "원광대학교 한의학 전문대학원", coordinate: .init(latitude: 35.965272, longitude: 126.958637)),
        MGLPointAnnotation(title: "SW중심대학사업단", coordinate: .init(latitude: 35.968531, longitude: 126.953238))
    ]
    
    
    @State var filteredSchool = School
    
    let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
    // var mode: MGLUserTrackingMode
    
    // @State var showlocation = false
    
    var body: some View {
        ForEach(filteredSchool) { item in
            
        }
        ZStack {
            CustomNavigationView(view: AnyView(NaviMapView(annotations: $annotations).centerCoordinate(.init(latitude: 35.968461, longitude: 126.958047)).zoomLevel(16).edgesIgnoringSafeArea(.all)), placeHolder: "Search", largeTitle: false, title: "Campus Maps", onSearch: { (txt) in
                if txt != "" {
                    self.filteredSchool = School.filter{$0.name.lowercased().contains(txt.lowercased())}
                }
                else {
                    self.filteredSchool = School
                }
            }, onCancel: {
                print("NAviView Cancle")
            })
            VStack {
                Spacer()
                
                HStack {
//                    Button(action: {
//                        withAnimation {
//                            self.showlocation.toggle()
//                        }
//                    }, label: {
//                        ZStack {
//                            Circle()
//                                .foregroundColor(.red)
//                                .frame(width: 50, height: 50)
//                                .opacity(0.5)
//                            Image(systemName: "location.fill")
//                                .font(.largeTitle)
//                        }
//                    })
//                    .padding(10)
                    
                    Spacer()
                }
            }
        }
    }
}

struct NaviView_Previews: PreviewProvider {
    static var previews: some View {
        NaviView()
    }
}


//
//  SchoolInfo.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/10.
//

import SwiftUI

struct SchoolInfo: Identifiable {
    var id = UUID().uuidString
    
    var name = String()
    
    var lat = Double()
    var lon = Double()
}

var School = [
    SchoolInfo(name: "프라임관", lat: 35.968461, lon: 126.958047),
    SchoolInfo(name: "공학관", lat: 35.967861, lon: 126.958153),
    SchoolInfo(name: "학생회관", lat: 35.967909, lon: 126.956043),
    SchoolInfo(name: "문화체육관", lat: 35.965207, lon: 126.957270),
    SchoolInfo(name: "박물관", lat: 35.966288, lon: 126.956602),
    SchoolInfo(name: "60주년 기념관", lat: 35.965907, lon: 126.954425),
    SchoolInfo(name: "숭산기념관", lat: 35.966791, lon: 126.954774),
    SchoolInfo(name: "원광대학교 대학원", lat: 35.968155, lon: 126.955352),
    SchoolInfo(name: "제2체육관", lat: 35.968290, lon: 126.954995),
    SchoolInfo(name: "법과대학", lat: 35.968736, lon: 126.956322),
    SchoolInfo(name: "대학본부", lat: 35.969036, lon: 126.953741),
    SchoolInfo(name: "학생지원관", lat: 35.969640, lon: 126.954577),
    SchoolInfo(name: "중앙도서관", lat: 35.970254, lon: 126.955451),
    SchoolInfo(name: "생활과학대학", lat: 35.970146, lon: 126.953945),
    SchoolInfo(name: "자연과학대학", lat: 35.967724, lon: 126.959289),
    SchoolInfo(name: "농식품융합대학", lat: 35.968969, lon: 126.960810),
    SchoolInfo(name: "미술대학", lat: 35.970351, lon: 126.957441),
    SchoolInfo(name: "새천년관", lat: 35.970584, lon: 126.958678),
    SchoolInfo(name: "사회과학대학", lat: 35.971379, lon: 126.957064),
    SchoolInfo(name: "인문대학", lat: 35.971253, lon: 126.958711),
    SchoolInfo(name: "사회과학대학", lat: 35.971279, lon: 126.960798),
    SchoolInfo(name: "조소관", lat: 35.971522, lon: 126.959854),
    SchoolInfo(name: "학군단", lat: 35.971948, lon: 126.958815),
    SchoolInfo(name: "용화관", lat: 35.972177, lon: 126.956964),
    SchoolInfo(name: "삼동관", lat: 35.972392, lon: 126.957057),
    SchoolInfo(name: "보은관", lat: 35.972364, lon: 126.957713),
    SchoolInfo(name: "청운관", lat: 35.973090, lon: 126.957873),
    SchoolInfo(name: "사은관", lat: 35.973425, lon: 126.957670),
    SchoolInfo(name: "학림관", lat: 35.972716, lon: 126.956232),
    SchoolInfo(name: "어학관", lat: 35.973583, lon: 126.956983),
    SchoolInfo(name: "사범대학", lat: 35.967327, lon: 126.960883),
    SchoolInfo(name: "평생교육관(간호대학)", lat: 35.966755, lon: 126.961166),
    SchoolInfo(name: "약학대학", lat: 35.966926, lon: 126.959586),
    SchoolInfo(name: "의과대학", lat: 35.965754, lon: 126.959370),
    SchoolInfo(name: "원광대학교 병원", lat: 35.964438, lon: 126.959659),
    SchoolInfo(name: "원광대학교 치과병원", lat: 35.964756, lon: 126.960678),
    SchoolInfo(name: "치과대학", lat: 35.965044, lon: 126.960660),
    SchoolInfo(name: "원광대한의과대학 익산한방병원", lat: 35.964602, lon: 126.958672),
    SchoolInfo(name: "원광대학교 한의학 전문대학원", lat: 35.965272, lon: 126.958637),
    SchoolInfo(name: "SW중심대학사업단", lat: 35.968531, lon: 126.953238)
]

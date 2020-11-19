//
//  MapTest.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import SwiftUI
import NMapsMap

struct MapTest: UIViewRepresentable {
    typealias UIViewType = UIViewType
    
    var authState: NMFAuthState!
    let nmapView = NMFMApView(frame: View.frame)
    
    var body: some View {
        Text("Hello")
    }
}

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        MapTest()
    }
}


//var authState: NMFAuthState!
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    let nmapFView = NMFMapView(frame: view.frame)
//    view.addSubview(nmapFView)
//  }

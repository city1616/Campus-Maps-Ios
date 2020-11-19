//
//  NaverMapView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/19.
//

import UIKit
import NMapsMap

class ViewController: UIViewController, NMFMapViewDelegate {
    var authState: NMFAuthState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nmapView = NMFMapView(frame: view.frame)
        view.addSubview(nmapView)
    }
}

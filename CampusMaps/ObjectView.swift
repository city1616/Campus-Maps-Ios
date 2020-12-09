//
//  ObjectView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/12/09.
//

import SwiftUI
import SceneKit

struct ObjectView: View {
    var body: some View {
        
        VStack {
            SceneView(scene: SCNScene(named: "1_floor.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            Spacer(minLength: 0)
        }
    }
}

struct ObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectView()
    }
}

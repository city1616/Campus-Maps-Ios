//
//  NaviMapView.swift
//  CampusMaps
//
//  Created by SeungWoo Mun on 2020/11/30.
//

import SwiftUI
import Mapbox

extension MGLPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}

struct NaviMapView: UIViewRepresentable {
    @Binding var annotations: [MGLPointAnnotation]
    // @Binding var userLocationshow: Bool
    
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
    var userLocationButton: UserLocationButton?
    
    // MARK: - Configuring UIViewRepresentable protocol
    
    func makeUIView(context: UIViewRepresentableContext<NaviMapView>) -> MGLMapView {
        mapView.delegate = context.coordinator
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        mapView.tintColor = .red
//        mapView.attributionButton.tintColor = .lightGray
        
        mapView.showsUserLocation = true
        
        
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<NaviMapView>) {
        updateAnnotations()
    }
    
    func makeCoordinator() -> NaviMapView.Coordinator {
        Coordinator(self)
    }
    
    // MARK: - Configuring MGLMapView
    
    func styleURL(_ styleURL: URL) -> NaviMapView {
        mapView.styleURL = styleURL
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> NaviMapView {
        mapView.centerCoordinate = centerCoordinate
        return self
    }
    
    func zoomLevel(_ zoomLevel: Double) -> NaviMapView {
        mapView.zoomLevel = zoomLevel
        return self
    }
    
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(annotations)
    }
    
    func locationButtonTapped() {
        var mode: MGLUserTrackingMode
        
        switch (mapView.userTrackingMode) {
        case .none:
            mode = .follow
        case .follow:
            mode = .followWithHeading
        case .followWithHeading:
            mode = .followWithCourse
        case .followWithCourse:
            mode = .none
        @unknown default:
            fatalError("Unknown user tracking mode")
        }
    }
    
    // Button creation and autolayout setup
//    func setupLocationButton() {
//        let userLocationButton = UserLocationButton(buttonSize: 80)
//        userLocationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
//        userLocationButton.tintColor = mapView.tintColor
//
//        // Setup constraints such that the button is placed within
//        // the upper left corner of the view.
//        userLocationButton.translatesAutoresizingMaskIntoConstraints = false
//
//        var leadingConstraintSecondItem: AnyObject
//        if #available(iOS 11.0, *) {
//            leadingConstraintSecondItem = mapView.safeAreaLayoutGuide
//        }
//        else {
//            leadingConstraintSecondItem = mapView
//        }
//
//        let constraints: [NSLayoutConstraint] = [
//        NSLayoutConstraint(item: userLocationButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 10),
//        NSLayoutConstraint(item: userLocationButton, attribute: .leading, relatedBy: .equal, toItem: leadingConstraintSecondItem, attribute: .leading, multiplier: 1, constant: 10),
//        NSLayoutConstraint(item: userLocationButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: userLocationButton.frame.size.height),
//        NSLayoutConstraint(item: userLocationButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: userLocationButton.frame.size.width)
//        ]
//
//        mapView.addSubview(userLocationButton)
//        mapView.addConstraints(constraints)
//
//        self.userLocationButton = userLocationButton
//    }
    
    // MARK: - Implementing MGLMapViewDelegate
    
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: NaviMapView
        
        init(_ control: NaviMapView) {
            self.control = control
        }
        
        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
            
            let coordinates = [
                CLLocationCoordinate2D(latitude: 37.791329, longitude: -122.396906),
                CLLocationCoordinate2D(latitude: 37.791591, longitude: -122.396566),
                CLLocationCoordinate2D(latitude: 37.791147, longitude: -122.396009),
                CLLocationCoordinate2D(latitude: 37.790883, longitude: -122.396349),
                CLLocationCoordinate2D(latitude: 37.791329, longitude: -122.396906),
            ]
            
            let buildingFeature = MGLPolygonFeature(coordinates: coordinates, count: 5)
            let shapeSource = MGLShapeSource(identifier: "buildingSource", features: [buildingFeature], options: nil)
            mapView.style?.addSource(shapeSource)
            
            let fillLayer = MGLFillStyleLayer(identifier: "buildingFillLayer", source: shapeSource)
            fillLayer.fillColor = NSExpression(forConstantValue: UIColor.blue)
            fillLayer.fillOpacity = NSExpression(forConstantValue: 0.5)
            
            mapView.style?.addLayer(fillLayer)

        }
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
         
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
        
    }
}

class UserLocationButton: UIButton {
    private var arrow: CAShapeLayer?
    private let buttonSize: CGFloat
     
    // Initializer to create the user tracking mode button
    init(buttonSize: CGFloat) {
        self.buttonSize = buttonSize
        super.init(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))
        self.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        self.layer.cornerRadius = 4
     
        let arrow = CAShapeLayer()
        arrow.path = arrowPath()
        arrow.lineWidth = 2
        arrow.lineJoin = CAShapeLayerLineJoin.round
        arrow.bounds = CGRect(x: 0, y: 0, width: buttonSize / 2, height: buttonSize / 2)
        arrow.position = CGPoint(x: buttonSize / 2, y: buttonSize / 2)
        arrow.shouldRasterize = true
        arrow.rasterizationScale = UIScreen.main.scale
        arrow.drawsAsynchronously = true
         
        self.arrow = arrow
         
        // Update arrow for initial tracking mode
        updateArrowForTrackingMode(mode: .none)
        layer.addSublayer(self.arrow!)
    }
     
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    // Create a new bezier path to represent the tracking mode arrow,
    // making sure the arrow does not get drawn outside of the
    // frame size of the UIButton.
    private func arrowPath() -> CGPath {
        let bezierPath = UIBezierPath()
        let max: CGFloat = buttonSize / 2
        bezierPath.move(to: CGPoint(x: max * 0.5, y: 0))
        bezierPath.addLine(to: CGPoint(x: max * 0.1, y: max))
        bezierPath.addLine(to: CGPoint(x: max * 0.5, y: max * 0.65))
        bezierPath.addLine(to: CGPoint(x: max * 0.9, y: max))
        bezierPath.addLine(to: CGPoint(x: max * 0.5, y: 0))
        bezierPath.close()
         
        return bezierPath.cgPath
    }
     
    // Update the arrow's color and rotation when tracking mode is changed.
    func updateArrowForTrackingMode(mode: MGLUserTrackingMode) {
        let activePrimaryColor = UIColor.red
        let disabledPrimaryColor = UIColor.clear
        let disabledSecondaryColor = UIColor.black
        let rotatedArrow = CGFloat(0.66)
     
        switch mode {
        case .none:
        updateArrow(fillColor: disabledPrimaryColor, strokeColor: disabledSecondaryColor, rotation: 0)
        case .follow:
        updateArrow(fillColor: disabledPrimaryColor, strokeColor: activePrimaryColor, rotation: 0)
        case .followWithHeading:
        updateArrow(fillColor: activePrimaryColor, strokeColor: activePrimaryColor, rotation: rotatedArrow)
        case .followWithCourse:
        updateArrow(fillColor: activePrimaryColor, strokeColor: activePrimaryColor, rotation: 0)
        @unknown default:
        fatalError("Unknown user tracking mode")
        }
    }
     
    func updateArrow(fillColor: UIColor, strokeColor: UIColor, rotation: CGFloat) {
        guard let arrow = arrow else { return }
        arrow.fillColor = fillColor.cgColor
        arrow.strokeColor = strokeColor.cgColor
        arrow.setAffineTransform(CGAffineTransform.identity.rotated(by: rotation))
         
        // Re-center the arrow within the button if rotated
        if rotation > 0 {
            arrow.position = CGPoint(x: buttonSize / 2 + 2, y: buttonSize / 2 - 2)
        }
         
        layoutIfNeeded()
    }
}

//struct NaviMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        NaviMapView()
//    }
//}

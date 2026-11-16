//
//  ViewController.swift
//  22_07_2026_AppleMaps_Demo
//
//  Created by Vishal Jagtap on 16/11/26.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var puneCoordinate : CLLocationCoordinate2D?
    var mkCoordinateRegion : MKCoordinateRegion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSettings()
        
        puneCoordinate = CLLocationCoordinate2D(
            latitude: 18.5204,
            longitude: 73.8567)
        
        mkCoordinateRegion = MKCoordinateRegion(
            center: puneCoordinate!,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000)
        
        mapView.setRegion(mkCoordinateRegion!, animated: true)
        
        addPointAnnotation()
    }
    
    func initSettings(){
        mapView.isPitchEnabled = true
        mapView.isZoomEnabled = true
        mapView.isRotateEnabled = true
        mapView.isScrollEnabled = true
        
        mapView.delegate = self
    }
    
    func addPointAnnotation(){
        
        let punePointAnnotation = MKPointAnnotation(
            coordinate: puneCoordinate!,
            title: "Pune City",
            subtitle: "Lovely City!")
        
        mapView.addAnnotation(punePointAnnotation)
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let reuseId = "LocationId"
        let view = MKAnnotationView(
            annotation: annotation,
            reuseIdentifier: reuseId)
        
        view.canShowCallout = true
        view.tintColor = .red
        
        return view
    }

}

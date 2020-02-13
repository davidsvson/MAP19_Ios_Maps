//
//  ViewController.swift
//  MAP19_Maps
//
//  Created by David Svensson on 2020-02-13.
//  Copyright © 2020 David Svensson. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // mapview följer efter användarens plats
        mapView.setUserTrackingMode(.follow, animated: true)
        
        // sätt oss som delegat antingen här eller i storyboard
        mapView.delegate = self
        
        updateRegion()
    }
    
    
    // denna funktion körs (mapview kommer att kalla på den) varje gång
    // användarens position ändras
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
       // print("long: \(userLocation.coordinate.longitude) , Lat: \(userLocation.coordinate.latitude)")
        
       updateRegion()
    }
    
    
    // sätter vad som skall visas i mapview
    func updateRegion() {
        let userLocation = mapView.userLocation
        
        // skapa en fyrkant av vad som ska visas
        // centrum av fyrkanten är användarens position
        // bredden och höjden anger vi i meter
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let width = 50.0
        let height = 50.0
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: width, longitudinalMeters: height)
        
        // sät regionen för mapview till våran region vi just skapat
        mapView.setRegion(region, animated: true)
    }
    
    
    
    @IBAction func addPin(_ sender: UIBarButtonItem) {
        // skapa en pin utifrån vår klass Pin med användarens position just nu
        let pin = Pin(coordinate: mapView.userLocation.coordinate)
        
        // lägg till vår pin på kartan
        mapView.addAnnotation(pin)
    }
    
    
    
    
    // öppnar en app med hjälp av en URL i det här fallet kommer Apple maps att öppnas automatiskt eftersom url leder till apple maps
    //    @IBAction func openMaps(_ sender: UIButton) {
//        if let url = URL(string: "http://maps.apple.com/?q=37.456732,-122.035676") {
//
//            let app = UIApplication.shared
//
//            app.open(url)
//        }
//    }
    
}


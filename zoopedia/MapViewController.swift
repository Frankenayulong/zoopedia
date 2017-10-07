//
//  MapViewController.swift
//  zoopedia
//
//  Created by Nadya on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    var id:Int32?
    var animal:AnimalDB?
    @IBOutlet weak var map:GMSMapView?
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.sharedInstance.getAnimals()
        self.animal = AppData.sharedInstance.getAnimal(IndexPath(row:Int(id!), section:0))
        let camera = GMSCameraPosition.camera(withLatitude: animal?.latitude ?? 4.739001, longitude: animal?.longitude ?? -74.059616, zoom: 6)
        map?.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(animal?.latitude ?? 4.739001, animal?.longitude ?? -74.059616)
        marker.snippet = (animal?.name ?? "") + " Location"
        marker.appearAnimation = .pop
        marker.map = self.map
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

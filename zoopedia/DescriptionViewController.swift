//
//  DescriptionViewController.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    
    var id:Int32?
    var animal:AnimalDB?
    @IBOutlet weak var image:UIImageView?
    @IBOutlet weak var desc: UILabel?
    @IBOutlet weak var locateBtn: UIButton?
    
    @IBAction func toMap(){
        performSegue(withIdentifier: "detailtomap", sender: self)
    }
    
    @IBAction func back(){
        self .dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "detailtomap" {
            let destinationVC = segue.destination as! MapViewController
            destinationVC.id = self.id
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.sharedInstance.getAnimals()
        self.animal = AppData.sharedInstance.getAnimal(IndexPath(row:Int(id!), section:0))
        image?.downloadedFrom(link: (animal?.image_url)!, contentMode: .scaleAspectFill)
        desc?.text = animal?.desc
        // Do any additional setup after loading the view.
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

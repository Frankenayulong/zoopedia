//
//  MenuViewController.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit
import SwiftSpinner

class MenuViewController: UIViewController {
    var loaded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        Requester.getAnimals(){animal in
            self.loaded = true
            self.checkLoaded()
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLoaded()
    }
    
    func checkLoaded(){
        if loaded{
            SwiftSpinner.hide()
        }else{
            SwiftSpinner.show("Fetching animals...")
        }
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

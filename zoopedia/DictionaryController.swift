//
//  DictionaryController.swift
//  zoopedia
//
//  Created by Nadya on 8/27/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit

class DictionaryController: UIViewController {

    @IBOutlet weak var tbl:UITableView?
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    var id:Int32?
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl?.dataSource = self
        tbl?.delegate = self
        AppData.sharedInstance.getAnimals()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "tabletodetail" {
            let destinationVC = segue.destination as! DescriptionViewController
            destinationVC.id = self.id
        }
    }

}

/* Click function */
extension DictionaryController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        self.id = AppData.sharedInstance.getAnimal(IndexPath(row:indexPath.row + 1, section:0)).id
        performSegue(withIdentifier: "tabletodetail", sender: self)
    }
}


extension DictionaryController: UITableViewDataSource{
    /* NUMBER OF ROWS */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.animaldb.count
    }
    /* DISPLAY ROW */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:DictionaryCell = tableView.dequeueReusableCell(withIdentifier: "DictionaryCell") as? DictionaryCell else {return DictionaryCell()}
        let animal = AppData.sharedInstance.getAnimal(IndexPath(row:indexPath.row + 1, section:0))
        cell.img?.downloadedFrom(link: animal.image_url!, contentMode: .scaleAspectFill)
        cell.title?.text = animal.name
        return cell
    }
}


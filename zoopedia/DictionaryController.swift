//
//  DictionaryController.swift
//  zoopedia
//
//  Created by Fajar on 8/27/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit

class DictionaryController: UIViewController {

    var animals:Animals = Animals()
    @IBOutlet weak var tbl:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl?.dataSource = self
        tbl?.delegate = self
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

/* Click function */
extension DictionaryController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
//        let selectedProperty = self.properties.getProperty(byIndex: indexPath.row)
//        self.delegate?.propertySelected(newProperty: selectedProperty)
//        splitViewController?.showDetailViewController(appDelegate.propertyDetailViewController, sender: nil)
    }
}


extension DictionaryController: UITableViewDataSource{
    /* NUMBER OF ROWS */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.getAll().count
    }
    /* DISPLAY ROW */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:DictionaryCell = tableView.dequeueReusableCell(withIdentifier: "DictionaryCell") as? DictionaryCell else {return DictionaryCell()}
        let animal = self.animals.getAll()[indexPath.row]
        cell.img?.image = UIImage(named:animal.getImage())
        cell.title?.text = animal.getName()
        return cell
    }
}


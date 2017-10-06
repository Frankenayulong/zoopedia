//
//  QuizViewController.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit
import Material
class QuizViewController: UIViewController {

    @IBOutlet weak var image:UIImageView?
    @IBOutlet weak var question:UILabel?
    @IBOutlet weak var choice1:RaisedButton?
    @IBOutlet weak var choice2:RaisedButton?
    @IBOutlet weak var choice3: RaisedButton?
    @IBOutlet weak var choice4: RaisedButton?
    @IBOutlet weak var statusLabel: UILabel?
    var id:Int?
    var animal:AnimalDB?
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func disableAllButtons(){
        choice1?.isEnabled = false
        choice2?.isEnabled = false
        choice3?.isEnabled = false
        choice4?.isEnabled = false
    }
    
    @IBAction func choice1Clicked(){
        disableAllButtons()
        if(animal?.choice1 == animal?.correct_answer){
            choice1?.backgroundColor = Color.green.darken2
            statusLabel?.text = "Correct!"
            statusLabel?.textColor = Color.green.darken2
        }else{
            choice1?.backgroundColor = Color.red.darken2
            statusLabel?.text = "Incorrect!"
            statusLabel?.textColor = Color.red.darken2
        }
        choice1?.titleColor = Color.white
        
        AppData.sharedInstance.saveAnswer(answer: (animal?.choice1)!, existing: animal!)
    }
    
    @IBAction func choice2Clicked(){
        disableAllButtons()
        if(animal?.choice2 == animal?.correct_answer){
            choice2?.backgroundColor = Color.green.darken2
            statusLabel?.text = "Correct!"
            statusLabel?.textColor = Color.green.darken2
        }else{
            choice2?.backgroundColor = Color.red.darken2
            statusLabel?.text = "Incorrect!"
            statusLabel?.textColor = Color.red.darken2
        }
        choice2?.titleColor = Color.white
        AppData.sharedInstance.saveAnswer(answer: (animal?.choice2)!, existing: animal!)
    }
    
    @IBAction func choice3Clicked(){
        disableAllButtons()
        if(animal?.choice3 == animal?.correct_answer){
            choice3?.backgroundColor = Color.green.darken2
            statusLabel?.text = "Correct!"
            statusLabel?.textColor = Color.green.darken2
        }else{
            choice3?.backgroundColor = Color.red.darken2
            statusLabel?.text = "Incorrect!"
            statusLabel?.textColor = Color.red.darken2
        }
        choice3?.titleColor = Color.white
        AppData.sharedInstance.saveAnswer(answer: (animal?.choice3)!, existing: animal!)
    }
    
    @IBAction func choice4Clicked(){
        disableAllButtons()
        if(animal?.choice4 == animal?.correct_answer){
            choice4?.backgroundColor = Color.green.darken2
            statusLabel?.text = "Correct!"
            statusLabel?.textColor = Color.green.darken2
        }else{
            choice4?.backgroundColor = Color.red.darken2
            statusLabel?.text = "Incorrect!"
            statusLabel?.textColor = Color.red.darken2
        }
        choice4?.titleColor = Color.white
        AppData.sharedInstance.saveAnswer(answer: (animal?.choice4)!, existing: animal!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.sharedInstance.getAnimals()
        self.animal = AppData.sharedInstance.getAnimal(IndexPath(row:id!, section:0))
        self.question?.text = animal?.question
        self.image?.downloadedFrom(link: (animal?.image_url)!, contentMode: .scaleAspectFill)
        self.choice1?.setTitle(animal?.choice1, for: .normal)
        self.choice2?.setTitle(animal?.choice2, for: .normal)
        self.choice1?.title = animal?.choice1
        self.choice2?.title = animal?.choice2
        self.choice3?.title = animal?.choice3
        self.choice4?.title = animal?.choice4
        if (animal?.answered)! {
            disableAllButtons()
            if animal?.answer == animal?.correct_answer {
                if animal?.choice1 == animal?.answer {
                    choice1?.backgroundColor = Color.green.darken2
                    choice1?.titleColor = Color.white
                }else if animal?.choice2 == animal?.answer {
                    choice2?.backgroundColor = Color.green.darken2
                    choice2?.titleColor = Color.white
                }else if animal?.choice3 == animal?.answer {
                    choice3?.backgroundColor = Color.green.darken2
                    choice3?.titleColor = Color.white
                }else if animal?.choice4 == animal?.answer {
                    choice4?.backgroundColor = Color.green.darken2
                    choice4?.titleColor = Color.white
                }
                statusLabel?.text = "Correct!"
                statusLabel?.textColor = Color.green.darken2
            }else{
                if animal?.choice1 == animal?.answer {
                    choice1?.backgroundColor = Color.red.darken2
                    choice1?.titleColor = Color.white
                }else if animal?.choice2 == animal?.answer {
                    choice2?.backgroundColor = Color.red.darken2
                    choice2?.titleColor = Color.white
                }else if animal?.choice3 == animal?.answer {
                    choice3?.backgroundColor = Color.red.darken2
                    choice3?.titleColor = Color.white
                }else if animal?.choice4 == animal?.answer {
                    choice4?.backgroundColor = Color.red.darken2
                    choice4?.titleColor = Color.white
                }
                statusLabel?.text = "Incorrect!"
                statusLabel?.textColor = Color.red.darken2
            }
        }
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

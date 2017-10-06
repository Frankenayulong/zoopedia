//
//  SelectLevelViewController.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import UIKit

class SelectLevelViewController: UIViewController {

    @IBOutlet weak var level1:UIButton?
    @IBOutlet weak var level2:UIButton?
    @IBOutlet weak var level3:UIButton?
    @IBOutlet weak var level4:UIButton?
    @IBOutlet weak var level5:UIButton?
    @IBOutlet weak var level6:UIButton?
    @IBOutlet weak var level7:UIButton?
    @IBOutlet weak var level8:UIButton?
    @IBOutlet weak var level9:UIButton?
    @IBOutlet weak var level10:UIButton?
    @IBOutlet weak var level11:UIButton?
    @IBOutlet weak var level12:UIButton?
    
    var id: Int?
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func level1Clicked(){
        goToQuiz(1)
    }
    @IBAction func level2Clicked(){
        goToQuiz(2)
    }
    @IBAction func level3Clicked(){
        goToQuiz(3)
    }
    @IBAction func level4Clicked(){
        goToQuiz(4)
    }
    @IBAction func level5Clicked(){
        goToQuiz(5)
    }
    @IBAction func level6Clicked(){
        goToQuiz(6)
    }
    @IBAction func level7Clicked(){
        goToQuiz(7)
    }
    @IBAction func level8Clicked(){
        goToQuiz(8)
    }
    @IBAction func level9Clicked(){
        goToQuiz(9)
    }
    @IBAction func level0Clicked(){
        goToQuiz(10)
    }
    @IBAction func level11Clicked(){
        goToQuiz(11)
    }
    @IBAction func level12Clicked(){
        goToQuiz(12)
    }
    
    private func goToQuiz(_ id: Int){
        self.id = id
        self.performSegue(withIdentifier: "quizsegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == "quizsegue" {
            let destinationVC = segue.destination as! QuizViewController
            destinationVC.id = self.id
        }
        // Create a new variable to store the instance of PlayerTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        AppData.sharedInstance.getAnimals()
                // Do any additional setup after loading the view.
    }
    
    func initView(){
        level1?.isHidden = true
        level2?.isHidden = true
        level3?.isHidden = true
        level4?.isHidden = true
        level5?.isHidden = true
        level6?.isHidden = true
        level7?.isHidden = true
        level8?.isHidden = true
        level9?.isHidden = true
        level10?.isHidden = true
        level11?.isHidden = true
        level12?.isHidden = true
        
        self.level1?.isEnabled = false
        self.level2?.isEnabled = false
        self.level3?.isEnabled = false
        self.level4?.isEnabled = false
        self.level5?.isEnabled = false
        self.level6?.isEnabled = false
        self.level7?.isEnabled = false
        self.level8?.isEnabled = false
        self.level9?.isEnabled = false
        self.level10?.isEnabled = false
        self.level11?.isEnabled = false
        self.level12?.isEnabled = false
        
        
        
        self.level1?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level2?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level3?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level4?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level5?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level6?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level7?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level8?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level9?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level10?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level11?.setImage(UIImage(named: "gembok"), for: .normal)
        self.level12?.setImage(UIImage(named: "gembok"), for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initView()
        var answered_1 = false
        var answered_2 = false
        var answered_3 = false
        var answered_4 = false
        var answered_5 = false
        var answered_6 = false
        var answered_7 = false
        var answered_8 = false
        var answered_9 = false
        var answered_10 = false
        var answered_11 = false
        var answered_12 = false
        for animal in AppData.sharedInstance.animaldb{
            switch animal.id {
            case 1:
                if animal.answered {
                    answered_1 = true
                    self.level1?.setImage(UIImage(named: "1"), for: .normal)
                    self.level1?.isEnabled = false
                }
                break
            case 2:
                if animal.answered {
                    answered_2 = true
                    self.level2?.setImage(UIImage(named: "2"), for: .normal)
                    self.level2?.isEnabled = false
                }
                break
            case 3:
                if animal.answered {
                    answered_3 = true
                    self.level3?.setImage(UIImage(named: "3"), for: .normal)
                    self.level3?.isEnabled = false
                }
                break
            case 4:
                if animal.answered {
                    answered_4 = true
                    self.level4?.setImage(UIImage(named: "4"), for: .normal)
                    self.level4?.isEnabled = false
                }
                break
            case 5:
                if animal.answered {
                    answered_5 = true
                    self.level5?.setImage(UIImage(named: "5"), for: .normal)
                    self.level5?.isEnabled = false
                }
                break
            case 6:
                if animal.answered {
                    answered_6 = true
                    self.level6?.setImage(UIImage(named: "6"), for: .normal)
                    self.level6?.isEnabled = false
                }
                break
            case 7:
                if animal.answered {
                    answered_7 = true
                    self.level7?.setImage(UIImage(named: "7"), for: .normal)
                    self.level7?.isEnabled = false
                }
                break
            case 8:
                if animal.answered {
                    answered_8 = true
                    self.level8?.setImage(UIImage(named: "8"), for: .normal)
                    self.level8?.isEnabled = false
                }
                break
            case 9:
                if animal.answered {
                    answered_9 = true
                }
                break
            case 10:
                if animal.answered {
                    answered_10 = true
                    self.level10?.setImage(UIImage(named: "10"), for: .normal)
                    self.level10?.isEnabled = false
                }
                break
            case 11:
                if animal.answered {
                    answered_11 = true
                    self.level11?.setImage(UIImage(named: "11"), for: .normal)
                    self.level11?.isEnabled = false
                }
                break
            case 12:
                if animal.answered {
                    answered_12 = true
                    self.level12?.setImage(UIImage(named: "12"), for: .normal)
                    self.level12?.isEnabled = false
                }
                break
            default:
                break
            }
        }
        for animal in AppData.sharedInstance.animaldb{
            switch animal.id {
            case 1:
                self.level1?.isHidden = false
                if !animal.answered {
                    self.level1?.setImage(UIImage(named: "1"), for: .normal)
                    self.level1?.isEnabled = true
                }
                break
            case 2:
                self.level2?.isHidden = false
                if answered_1 && !animal.answered {
                    self.level2?.setImage(UIImage(named: "2"), for: .normal)
                    self.level2?.isEnabled = true
                }
                break
            case 3:
                self.level3?.isHidden = false
                if answered_2 && !animal.answered {
                    self.level3?.setImage(UIImage(named: "3"), for: .normal)
                    self.level3?.isEnabled = true
                }
                break
            case 4:
                self.level4?.isHidden = false
                if answered_3 && !animal.answered {
                    self.level4?.setImage(UIImage(named: "4"), for: .normal)
                    self.level4?.isEnabled = true
                }
                break
            case 5:
                self.level5?.isHidden = false
                if answered_4 && !animal.answered {
                    self.level5?.setImage(UIImage(named: "5"), for: .normal)
                    self.level5?.isEnabled = true
                }
                break
            case 6:
                self.level6?.isHidden = false
                if answered_5 && !animal.answered {
                    self.level6?.setImage(UIImage(named: "6"), for: .normal)
                    self.level6?.isEnabled = true
                }
                break
            case 7:
                self.level7?.isHidden = false
                if answered_6 && !animal.answered {
                    self.level7?.setImage(UIImage(named: "7"), for: .normal)
                    self.level7?.isEnabled = true
                }
                break
            case 8:
                self.level8?.isHidden = false
                if answered_7 && !animal.answered {
                    self.level8?.setImage(UIImage(named: "8"), for: .normal)
                    self.level8?.isEnabled = true
                }
                break
            case 9:
                self.level9?.isHidden = false
                if answered_8 && !animal.answered {
                    self.level9?.setImage(UIImage(named: "9"), for: .normal)
                    self.level9?.isEnabled = true
                }
                break
            case 10:
                self.level10?.isHidden = false
                if answered_9 && !animal.answered {
                    self.level10?.setImage(UIImage(named: "10"), for: .normal)
                    self.level10?.isEnabled = true
                }
                break
            case 11:
                self.level11?.isHidden = false
                if answered_10 && !animal.answered {
                    self.level11?.setImage(UIImage(named: "11"), for: .normal)
                    self.level11?.isEnabled = true
                }
                break
            case 12:
                self.level12?.isHidden = false
                if answered_11 && !animal.answered {
                    self.level12?.setImage(UIImage(named: "12"), for: .normal)
                    self.level12?.isEnabled = true
                }
                break
            default:
                break
            }
        }
        if answered_12{
            
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

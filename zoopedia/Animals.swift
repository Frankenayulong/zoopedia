//
//  Animals.swift
//  zoopedia
//
//  Created by Nadya on 8/27/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import Foundation
import CoreData
class Animals {
    var animals:[SAnimal] = []
    
    /* LIST OF ANIMALS */
    init() {
        animals.append(SAnimal(name:"Buffalo", image:"buffalo", desc:"Eats grass"))
        
    }
    
    func getAll()->[SAnimal] {
        return animals
    }
}

class SAnimal {
    var name:String = ""
    var image:String = ""
    var desc:String = ""
    var answered: Bool = false
    
    init (name:String, image:String, desc:String) {
        self.name = name;
        self.image = image;
        self.desc = desc;
    }
    
    func getAnswered()->Bool{
        return self.answered
    }
    
    func getName()->String {
        return self.name;
    }
    func getImage()->String {
        return self.image;
    }
    func getDesc()->String {
        return self.desc;
    }
    
    func setAnswered(_ answered:Bool){
        self.answered = answered
    }
    
}

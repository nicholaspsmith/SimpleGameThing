//
//  ViewController.swift
//  SimpleGameThing
//
//  Created by Nick on 11/22/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var knightHPLabel: UILabel!
    @IBOutlet weak var ogreHPLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var knightImage: UIImageView!
    @IBOutlet weak var ogreImage: UIImageView!
    
    var knight: Character!
    var ogre: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        knight = Character(name: "Avatar", startingHp: 120, startingAttackPower: 20)
        ogreHPLabel.text = "\(knight.hp) HP"

        ogre = Character(name: "Avatar", startingHp: 120, startingAttackPower: 20)
        knightHPLabel.text = "\(ogre.hp) HP"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func pressOgreAttack(sender: AnyObject) {
        if knight.attemptAttack(ogre.attackPower) {
            mainLabel.text = "Attacked knight for \(ogre.attackPower) HP"
            knightHPLabel.text = "\(knight.hp) HP"
        } else {
            mainLabel.text = "Attack was unsuccessful"
        }
        
        if !knight.isAlive {
            knightHPLabel.text = ""
            mainLabel.text = "Killed knight"
            knightImage.hidden = true
        }
    }
    
    @IBAction func pressKnightAttack(sender: AnyObject) {
        if ogre.attemptAttack(knight.attackPower) {
            mainLabel.text = "Attacked ogre for \(knight.attackPower) HP"
            ogreHPLabel.text = "\(ogre.hp) HP"
        } else {
            mainLabel.text = "Attack was unsuccessful"
        }
        
        if !ogre.isAlive {
            ogreHPLabel.text = ""
            mainLabel.text = "Killed ogre"
            ogreImage.hidden = true
        }
    }
}


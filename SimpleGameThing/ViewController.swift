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
    @IBOutlet weak var knightAttackButton: UIButton!
    @IBOutlet weak var ogreAttackButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var knight: Character!
    var ogre: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCharacters()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeCharacters() {
        knight = Character(name: "Avatar", startingHp: 120, startingAttackPower: 20)
        ogreHPLabel.text = "\(knight.hp) HP"
        
        ogre = Character(name: "Avatar", startingHp: 120, startingAttackPower: 20)
        knightHPLabel.text = "\(ogre.hp) HP"
    }
    
    func showRestart() {
        restartButton.hidden = false
    }
    
    func ogreWins() {
        mainLabel.text = "Ogre wins!!!"
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "showRestart", userInfo: nil, repeats: false)
    }

    func knightWins() {
        mainLabel.text = "Knight is victorious!"
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "showRestart", userInfo: nil, repeats: false)
    }

    @IBAction func pressOgreAttack(sender: AnyObject) {
        if (!ogre.disabled) {
            
            
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
                knightAttackButton.enabled = false
                ogreAttackButton.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "ogreWins", userInfo: nil, repeats: false)
            }
        }
    }
    
    @IBAction func pressKnightAttack(sender: AnyObject) {
        if (!knight.disabled) {
            
            
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
                knightAttackButton.enabled = false
                ogreAttackButton.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "knightWins", userInfo: nil, repeats: false)
            }
        }
    }
    
    
    @IBAction func restartPressed(sender: AnyObject) {
        initializeCharacters()
        knightImage.hidden = false
        ogreImage.hidden = false
        restartButton.hidden = true
        knightAttackButton.enabled = true
        ogreAttackButton.enabled = true
    }
}


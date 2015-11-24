//
//  Character.swift
//  SimpleGameThing
//
//  Created by Nick on 11/23/15.
//  Copyright © 2015 Nick. All rights reserved.
//

import Foundation

class Character {
  
  private var _hp: Int = 100
  private var _attackPower: Int = 10
  
  var hp: Int {
    get {
      return _hp
    }
  }
  
  var attackPower: Int {
    get {
      return _attackPower
    }
  }
  
  var isAlive: Bool {
    get {
      if _hp > 0 {
        return true
      } else {
        return false
      }
    }
  }
  
  init(startingHp: Int, startingAttackPower: Int) {
    self._hp = startingHp
    self._attackPower = startingAttackPower
  }
  
  func attemptAttack(power: Int) -> Bool {
    self._hp -= attackPower
    // Return true if attack successful
    return true
  }
}

//
//  AdvancedFiltersVC.swift
//  Pokedex
//
//  Created by Maggie Yi on 2020-02-13.
//  Copyright © 2020 Maggie Yi. All rights reserved.
//

import UIKit

class AdvancedFiltersVC: UIViewController {
    
    var delegate: isAbleToReceiveData!
    

    var typeDict: [String: Bool] = ["Bug":false, "Grass":false, "Dark":false, "Ground":false, "Ice":false, "Electric":false, "Normal":false, "Fairy":false, "Poison":false, "Psychic":false, "Fire":false, "Rock":false, "Flying":false, "Steel":false, "Ghost":false, "Water":false, "Unknown":false, "Fighting":false, "Dragon":false]
    
    @IBAction func bug(_ sender: Any) {
        if bug.isOn {
            typeDict["Bug"] = true
        } else {
            typeDict["Bug"] = false
        }
    }
    @IBAction func grass(_ sender: Any) {
        if grass.isOn {
            typeDict["Grass"] = true
        } else {
            typeDict["Grass"] = false
        }
    }
    @IBAction func dark(_ sender: Any) {
        if dark.isOn {
            typeDict["Dark"] = true
        } else {
            typeDict["Dark"] = false
        }
    }
    @IBAction func ground(_ sender: Any) {
        if ground.isOn {
            typeDict["Ground"] = true
        } else {
            typeDict["Ground"] = false
        }
    }
    @IBAction func ice(_ sender: Any) {
        if ice.isOn {
            typeDict["Ice"] = true
        } else {
            typeDict["Ice"] = false
        }
    }
    @IBAction func electric(_ sender: Any) {
        if electric.isOn {
            typeDict["Electric"] = true
        } else {
            typeDict["Electric"] = false
        }
    }
    @IBAction func normal(_ sender: Any) {
        if normal.isOn {
            typeDict["Normal"] = true
        } else {
            typeDict["Normal"] = false
        }
    }
    @IBAction func fairy(_ sender: Any) {
        if fairy.isOn {
            typeDict["Fairy"] = true
        } else {
            typeDict["Fairy"] = false
        }
    }
    @IBAction func poison(_ sender: Any) {
        if poison.isOn {
            typeDict["Poison"] = true
        } else {
            typeDict["Poison"] = false
        }
    }
    @IBAction func psychic(_ sender: Any) {
        if psychic.isOn {
            typeDict["Psychic"] = true
        } else {
            typeDict["Psychic"] = false
        }
    }
    @IBAction func fire(_ sender: Any) {
        if fire.isOn {
            typeDict["Fire"] = true
        } else {
            typeDict["Fire"] = false
        }
    }
    @IBAction func rock(_ sender: Any) {
        if rock.isOn {
            typeDict["Rock"] = true
        } else {
            typeDict["Rock"] = false
        }
    }
    @IBAction func flying(_ sender: Any) {
        if flying.isOn {
            typeDict["Flying"] = true
        } else {
            typeDict["Flying"] = false
        }
    }
    @IBAction func steel(_ sender: Any) {
        if steel.isOn {
            typeDict["Steel"] = true
        } else {
            typeDict["Steel"] = false
        }
    }
    @IBAction func ghost(_ sender: Any) {
        if ghost.isOn {
            typeDict["Ghost"] = true
        } else {
            typeDict["Ghost"] = false
        }
    }
    @IBAction func water(_ sender: Any) {
        if water.isOn {
            typeDict["Water"] = true
        } else {
            typeDict["Water"] = false
        }
    }
    @IBAction func unknown(_ sender: Any) {
        if unknown.isOn {
            typeDict["Unknown"] = true
        } else {
            typeDict["Unknown"] = false
        }
    }
    @IBAction func fighting(_ sender: Any) {
        if fighting.isOn {
            typeDict["Fighting"] = true
        } else {
            typeDict["Fighting"] = false
        }
    }
    @IBAction func dragon(_ sender: Any) {
        if dragon.isOn {
            typeDict["Dragon"] = true
        } else {
            typeDict["Dragon"] = false
        }
    }
    
    @IBOutlet weak var bug: UISwitch!
    @IBOutlet weak var grass: UISwitch!
    @IBOutlet weak var dark: UISwitch!
    @IBOutlet weak var ground: UISwitch!
    @IBOutlet weak var ice: UISwitch!
    @IBOutlet weak var electric: UISwitch!
    @IBOutlet weak var normal: UISwitch!
    @IBOutlet weak var fairy: UISwitch!
    @IBOutlet weak var poison: UISwitch!
    @IBOutlet weak var fire: UISwitch!
    @IBOutlet weak var psychic: UISwitch!
    @IBOutlet weak var rock: UISwitch!
    @IBOutlet weak var flying: UISwitch!
    @IBOutlet weak var steel: UISwitch!
    @IBOutlet weak var ghost: UISwitch!
    @IBOutlet weak var water: UISwitch!
    @IBOutlet weak var unknown: UISwitch!
    @IBOutlet weak var fighting: UISwitch!
    @IBOutlet weak var dragon: UISwitch!
    
    var numDict: [String: Int] = [:]
    
    
    @IBOutlet weak var idLower: UITextField!
    @IBOutlet weak var idUpper: UITextField!
    @IBOutlet weak var attackLower: UITextField!
    @IBOutlet weak var attackUpper: UITextField!
    @IBOutlet weak var defenseLower: UITextField!
    @IBOutlet weak var defenseUpper: UITextField!
    @IBOutlet weak var healthLower: UITextField!
    @IBOutlet weak var healthUpper: UITextField!
    @IBOutlet weak var spatkLower: UITextField!
    @IBOutlet weak var spatkUpper: UITextField!
    @IBOutlet weak var spdefLower: UITextField!
    @IBOutlet weak var spdefUpper: UITextField!
    @IBOutlet weak var speedLower: UITextField!
    @IBOutlet weak var speedUpper: UITextField!
    @IBOutlet weak var totalLower: UITextField!
    @IBOutlet weak var totalUpper: UITextField!
    
    
    
    var idLower1 = 0
    var idUpper1 = 0
    var attackLower1 = 0
    var attackUpper1 = 0
    var defenseLower1 = 0
    var defenseUpper1 = 0
    var healthLower1 = 0
    var healthUpper1 = 0
    var spatkLower1 = 0
    var spatkUpper1 = 0
    var spdefLower1 = 0
    var spdefUpper1 = 0
    var speedLower1 = 0
    var speedUpper1 = 0
    var totalLower1 = 0
    var totalUpper1 = 0
    
    func integer(from textField: UITextField) -> Int {
        guard let text = textField.text, let number = Int(text) else {
            return 0
        }
        return number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         idLower1 = integer(from: idLower)
         idUpper1 = integer(from: idUpper)
         attackLower1 = integer(from: attackLower)
         attackUpper1 = integer(from: attackUpper)
         defenseLower1 = integer(from: defenseLower)
         defenseUpper1 = integer(from: defenseUpper)
         healthLower1 = integer(from: healthLower)
        healthUpper1 = integer(from: healthUpper)
         spatkLower1 = integer(from: spatkLower)
         spatkUpper1 = integer(from: spatkUpper)
         spdefLower1 = integer(from: spdefLower)
         spdefUpper1 = integer(from: spdefUpper)
         speedLower1 = integer(from: speedLower)
         speedUpper1 = integer(from: speedUpper)
        totalLower1 = integer(from: totalLower)
        totalUpper1 = integer(from: totalUpper)
        
        numDict = ["idLower": idLower1, "idUpper": idUpper1, "attackLower": attackLower1, "attackUpper": attackUpper1, "defenseLower": defenseLower1, "defenseUpper": defenseUpper1, "healthLower": healthLower1, "healthUpper": healthUpper1, "spatkLower": spatkLower1, "spatkUpper": spatkUpper1, "spdefLower": spdefLower1, "spdefUpper": spdefUpper1, "speedLower": speedLower1, "speedUpper": speedUpper1, "totalLower": totalLower1, "totalUpper": totalUpper1]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate.pass(data: typeDict)
        delegate.passInt(data: numDict)
    }
    
}

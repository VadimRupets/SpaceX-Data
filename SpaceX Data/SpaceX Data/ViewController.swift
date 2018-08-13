//
//  ViewController.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/12/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreBoostersDispatcher().executeRequest(.filtered(by: [.missions(["SpaceX CRS-11", "SpaceX CRS-13"])])) { response in
            print("Gotcha")
        }
    }

}


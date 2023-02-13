//
//  ViewController.swift
//  MyCarApp
//
//  Created by Bharat Silavat on 11/02/23.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

class Car {
       
       var make: String
       var model: String
       var year: Int
       var topSpeed: Int
       var engineSize: Double
       var horsepower: Int
       var fuelType: String
       var transmissionType: String
       var fuelEfficiency: Double
       var color: String
    
    init(make: String, model: String, year: Int, topSpeed: Int, engineSize: Double, horsepower: Int, fuelType: String, transmissionType: String, fuelEfficiency: Double, color: String) {
        self.make = make
        self.model = model
        self.year = year
        self.topSpeed = topSpeed
        self.engineSize = engineSize
        self.horsepower = horsepower
        self.fuelType = fuelType
        self.transmissionType = transmissionType
        self.fuelEfficiency = fuelEfficiency
        self.color = color
    }
    
    func description() -> String {
        return "\(year) \(make) \(model) with a top speed of \(topSpeed) mph"
    }
    
    func honk() {
        print("Beep Beep!")
    }
}



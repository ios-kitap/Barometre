//
//  ViewController.swift
//  barometer
//
//  Created by Emre Erol on 18.03.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let altimeter = CMAltimeter()

    @IBOutlet weak var altitu: UILabel!
    @IBOutlet weak var press: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startPRess(_ sender: Any) {
        startM()
    }
    
    func startM(){
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { (data, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.altitu.text =  String.init(format: "%.1fM", (data?.relativeAltitude.floatValue)!)
                        self.press.text = String.init(format: "%.2f hPA", (data?.pressure.floatValue)!*10)
                    }
                    
                }else{
                    print(error?.localizedDescription)
                }
            }
        }else{
            print("Basınç Sensörü yok yada erişilemiyor..")
        }
    }
    
    
}


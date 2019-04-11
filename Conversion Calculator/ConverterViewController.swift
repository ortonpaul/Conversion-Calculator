//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Paul Orton on 4/10/19.
//  Copyright © 2019 Paul Orton. All rights reserved.
//

import UIKit

struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
}

class ConverterViewController: UIViewController {
    
    let converters: [Converter] = [
        Converter(label: "fahrenheit to celsius", inputUnit: "°F", outputUnit: "°C"),
        Converter(label: "celsius to fahrenheit", inputUnit: "°C", outputUnit: "°C"),
        Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
        Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputDisplay.text = converters[0].outputUnit
        inputDisplay.text = converters[0].inputUnit
    }

    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func listConversions(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Choose Converter", message: "Choose", preferredStyle: UIAlertController.Style.actionSheet)
        
        for converter in converters {
            let choice = UIAlertAction(title: converter.label, style: .default) { (UIAlertAction) -> Void in
                self.inputDisplay.text = converter.inputUnit
                self.outputDisplay.text = converter.outputUnit
            }
            actionSheet.addAction(choice)
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

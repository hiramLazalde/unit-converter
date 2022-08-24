//
//  ViewController.swift
//  unit-converter
//
//  Created by Hiram Lazalde on 8/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchConverType: UISwitch!
    @IBOutlet weak var txtOriginal: UITextField!
    @IBOutlet weak var txtConverted: UITextField!
    
    @IBOutlet weak var lblOriginal: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var switchWeight: UISwitch!
    @IBOutlet weak var txtPoundOriginal: UITextField!
    @IBOutlet weak var txtKiloOriginal: UITextField!
    
    @IBOutlet weak var lblPoundsOriginal: UILabel!
    @IBOutlet weak var lblKiloOriginal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtOriginal.addTarget(self, action: #selector(ViewController.textFieldDidChange(txtOriginal:)), for: .editingChanged)
        
        txtPoundOriginal.addTarget(self, action: #selector(ViewController.textPoundsFieldDidChange(txtPoundOriginal:)), for: .editingChanged)
        
        switchConverType.addTarget(self, action: #selector(ViewController.switchPressed(txtOriginal:)), for: .touchUpInside)
        
        switchWeight.addTarget(self, action: #selector(ViewController.switchWeightPressed), for: .touchUpInside)
    }
    
    @objc func switchWeightPressed(){
        setWeightResultValue(txtToSet: "")
        setWeightOriginalValue(txtToSet: "")
        if switchWeight.isOn {
            lblKiloOriginal.text = "Kilograms"
            lblPoundsOriginal.text = "Pounds"
        } else {
            lblKiloOriginal.text = "Pounds"
            lblPoundsOriginal.text = "Kilogram"
        }
    }
    
    @objc func switchPressed(txtOriginal : UITextField){
        setResultValue(txtToSet: "")
        setOriginalValue(txtToSet: "")
        if switchConverType.isOn {
            lblOriginal.text = "Kilometers"
            lblResult.text = "Miles"
        } else {
            lblOriginal.text = "Miles"
            lblResult.text = "Kilometers"
        }
    }
    
    @objc func textFieldDidChange(txtOriginal : UITextField){
        if let txtOriginal = txtOriginal.text {
            if let original = Double(txtOriginal) {
                if switchConverType.isOn {
                    setResultValue(txtToSet: doConversion(doValue: original, stConversionType: 2 ))
                } else {
                    setResultValue(txtToSet: doConversion(doValue: original, stConversionType: 1))
                }
            } else {
                setResultValue(txtToSet: "")
            }
        }
    }
    
    @objc func textPoundsFieldDidChange(txtPoundOriginal : UITextField){
        if let txtOriginal = txtPoundOriginal.text {
            if let original = Double(txtOriginal) {
                if switchWeight.isOn {
                    setWeightResultValue(txtToSet: doConversion(doValue: original, stConversionType: 3))
                } else {
                    setWeightResultValue(txtToSet: doConversion(doValue: original, stConversionType: 4))
                }
            } else {
                setWeightResultValue(txtToSet: "")
            }
        }
    }
    
    func doConversion(doValue : Double, stConversionType : Int) -> String {
        switch stConversionType {
//            Miles to Kilometer
        case 1:
            return String(doValue * 1.609)

//            Kilometer to Miles
        case 2:
            return String(doValue / 1.609)

//            Pounds to Kilogram
        case 3:
            return String(doValue / 2.205)
            
//            Kilogram to Pounds
        case 4:
            return String(doValue * 2.205)
            
        default:
            return("NOT FOUND 404")
        }
    }
    
    func setResultValue(txtToSet : String) {
        txtConverted.text = txtToSet
    }
    
    func setOriginalValue(txtToSet : String) {
        txtOriginal.text = txtToSet
    }
 
    func setWeightResultValue(txtToSet : String) {
        txtKiloOriginal.text = txtToSet
    }
    
    func setWeightOriginalValue(txtToSet : String) {
        txtPoundOriginal.text = txtToSet
    }
}



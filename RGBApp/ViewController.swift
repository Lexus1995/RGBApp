//
//  ViewController.swift
//  RGBApp
//
//  Created by  Aliaksei on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        changeBackgroundColor()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel )
    }

    @IBAction func redSliderMoved() {
        redValueLabel.text = string(from: redSlider)
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderMoved() {
        greenValueLabel.text = string(from: greenSlider)
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderMoved() {
        blueValueLabel.text = string(from: blueSlider)
        changeBackgroundColor()
    }
    
    @IBAction func rgbSliderMoved(_ sender: UISlider) {
        changeBackgroundColor()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case redSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    private func changeBackgroundColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1.0))
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}


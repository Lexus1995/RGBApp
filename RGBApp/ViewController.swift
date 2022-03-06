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
        
        redValueLabel.text = String(String(redSlider.value).prefix(4))
        greenValueLabel.text = String(String(greenSlider.value).prefix(4))
        blueValueLabel.text = String(String(blueSlider.value).prefix(4))
    }

    @IBAction func redSliderMoved() {
        redValueLabel.text = String(String(redSlider.value).prefix(4))
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderMoved() {
        greenValueLabel.text = String(String(greenSlider.value).prefix(4))
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderMoved() {
        blueValueLabel.text = String(String(blueSlider.value).prefix(4))
        changeBackgroundColor()
    }
    
    private func changeBackgroundColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1.0))
    }
}


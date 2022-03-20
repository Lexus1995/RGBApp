//
//  SettingsViewController.swift
//  RGBApp
//
//  Created by  Aliaksei on 06.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = viewColor

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }

    @IBAction func rgbSliderMoved(_ sender: UISlider) {
        changeBackgroundColorBySlider()
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func pressedDoneButton(_ sender: UIButton) {
        changeBackgroundColorByTextField()
        delegate.setNewValues(for: viewColor)
        dismiss(animated: true)
    }
    
    @IBAction func endingFieldEditing() {
        changeBackgroundColorByTextField()
    }
        
    private func changeBackgroundColorByTextField() {
        guard let redTF = NumberFormatter().number(from: redTextField.text!) else { return }
        guard let greenTF = NumberFormatter().number(from: greenTextField.text!) else { return }
        guard let blueTF = NumberFormatter().number(from: blueTextField.text!) else { return }

        viewColor = UIColor(
            red: CGFloat(truncating: redTF),
            green: CGFloat(truncating: greenTF),
            blue: CGFloat(truncating: blueTF),
            alpha: CGFloat(1.0)
        )
        colorView.backgroundColor = viewColor
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    private func changeBackgroundColorBySlider() {
        viewColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(1.0)
        )
        colorView.backgroundColor = viewColor
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
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { field in
            switch field {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for sliders: UISlider...) {
        let colorComponents = getColorComponents(for: viewColor)
        sliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = colorComponents[0]
            case greenSlider:
                greenSlider.value = colorComponents[1]
            default:
                blueSlider.value = colorComponents[2]
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
        
    private func string(from textField: UITextField) -> String {
        String(format: "%.2f", textField.text!)
    }
    
    private func getColorComponents(for color: UIColor) -> [Float] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return [Float(red), Float(green), Float(blue)]
    }
}

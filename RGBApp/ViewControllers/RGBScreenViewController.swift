//
//  RGBScreenViewController.swift
//  RGBApp
//
//  Created by  Aliaksei on 19.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for color: UIColor)
}

class RGBScreenViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    private var viewColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = viewColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = viewColor
        settingsVC.delegate = self
    }
    
    @IBAction func pressedSettingsButton() {
        setNewValues(for: viewColor)
        performSegue(withIdentifier: "settingsVC", sender: nil)
    }
}

// MARK: - SettingsViewControllerDelegate
extension RGBScreenViewController: SettingsViewControllerDelegate {
    func setNewValues(for color: UIColor) {
        mainView.backgroundColor = color
        self.viewColor = color
    }
}

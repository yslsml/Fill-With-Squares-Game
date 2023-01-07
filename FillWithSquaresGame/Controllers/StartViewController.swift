//
//  StartViewController.swift
//  FillWithSquaresGame
//
//  Created by Milana Antonova on 7.01.23.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - IBActions
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

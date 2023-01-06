//
//  ViewController.swift
//  FillWithSquaresGame
//
//  Created by Milana Antonova on 6.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var sizeLabel: UILabel!
    
    //MARK: - let/var
    var size: CGFloat = 100
    let step: CGFloat = 10
    let maxSize: CGFloat = 300
    var squareArray: [UIView] = []
    var labelArray: [UILabel] = []

    //MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeLabel.text = "\(Int(self.size))"
    }

    //MARK: - IBActions
    @IBAction func showButtonPressed(_ sender: UIButton) {
        cleanView()
        showView()
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        increase()
        sizeLabel.text = "\(Int(self.size))"
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        decrease()
        sizeLabel.text = "\(Int(self.size))"
    }
    
    
    //MARK: - flow funcs
    private func createView(x: CGFloat, y: CGFloat) -> UIView {
        let square = UIView()
        square.frame.size.width = self.size
        square.frame.size.height = self.size
        square.backgroundColor = UIColor.randomColor
        square.frame.origin.x = x
        square.frame.origin.y = y
        square.layer.borderWidth = 1
        return square
    }
    
    private func showView() {
        let screenWidth: CGFloat = self.view.frame.width
        
        var totalWidth: CGFloat = 0
        var totalHeight: CGFloat = 50  // 50 is for dynamic island
        
        while (totalHeight + self.size) < self.showButton.frame.minY {
            while totalWidth < (screenWidth - self.size) {
                let square = createView(x: totalWidth, y: totalHeight)
                self.view.addSubview(square)
                self.squareArray.append(square)
                
                let label = createLabel(square: square)
                self.labelArray.append(label)
                self.view.addSubview(label)
                
                totalWidth += self.size
            }
            totalWidth = 0
            totalHeight += self.size
        }
    }
    
    private func decrease() {
        if self.size > self.step {
            self.size -= self.step
        }
    }
    
    private func increase() {
        if self.size < self.maxSize {
            self.size += self.step
        }
    }
    
    private func createLabel(square: UIView) -> UILabel {
        let x = square.frame.origin.x
        let y = square.frame.origin.y
        let label = UILabel(frame: CGRect(x: x, y: y, width: self.size, height: self.size/2))
        label.center = CGPoint(x: x + self.size/2, y: y + self.size/2)
        label.textAlignment = .center
        let currentColorName = square.backgroundColor?.accessibilityName
        label.text = currentColorName
        if label.text == "black" || label.text?.contains("dark") == true {
            label.textColor = .white
        } else { label.textColor = .black }
        return label
    }
    
    private func cleanView() {
        for view in self.squareArray {
            view.removeFromSuperview()
        }
        for label in self.labelArray {
            label.removeFromSuperview()
        }
    }
    
}


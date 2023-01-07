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
    var viewSize: CGFloat = 100
    let step: CGFloat = 10
    let maxViewSize: CGFloat = 300
    var squareArray: [UIView] = []
    var labelArray: [UILabel] = []

    //MARK: - lifecycle funcs
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sizeLabel.text = "\(Int(self.viewSize))"
    }

    //MARK: - IBActions
    @IBAction func showButtonPressed(_ sender: UIButton) {
        cleanView()
        showView()
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        increase()
        sizeLabel.text = "\(Int(self.viewSize))"
    }
    
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        decrease()
        sizeLabel.text = "\(Int(self.viewSize))"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - flow funcs
    private func createView(x: CGFloat, y: CGFloat) -> UIView {
        let square = UIView()
        square.frame.size.width = self.viewSize
        square.frame.size.height = self.viewSize
        square.backgroundColor = UIColor.randomColor
        square.frame.origin.x = x
        square.frame.origin.y = y
        square.layer.borderWidth = 1
        return square
    }
    
    private func showView() {
        var totalWidth: CGFloat = self.view.safeAreaInsets.left
        var totalHeight: CGFloat = self.view.safeAreaInsets.top
        
        while canInsertViewInRow(totalHeight: totalHeight) {
            while canInsertViewInColumn(totalWidth: totalWidth) {
                let square = createView(x: totalWidth, y: totalHeight)
                self.view.addSubview(square)
                self.squareArray.append(square)
                
                let label = createLabel(square: square)
                self.labelArray.append(label)
                self.view.addSubview(label)
                
                totalWidth += self.viewSize
            }
            totalWidth = 0
            totalHeight += self.viewSize
        }
    }
    
    private func canInsertViewInRow(totalHeight: CGFloat) -> Bool {
        return (totalHeight + self.viewSize) < self.showButton.frame.minY
    }
    
    private func canInsertViewInColumn(totalWidth: CGFloat) -> Bool {
        return totalWidth < (self.view.frame.width - self.viewSize)
    }
    
    private func decrease() {
        if self.viewSize > self.step {
            self.viewSize -= self.step
        }
    }
    
    private func increase() {
        if self.viewSize < self.maxViewSize {
            self.viewSize += self.step
        }
    }
    
    private func createLabel(square: UIView) -> UILabel {
        let x = square.frame.origin.x
        let y = square.frame.origin.y
        let label = UILabel(frame: CGRect(x: x, y: y, width: self.viewSize, height: self.viewSize/2))
        label.center = CGPoint(x: x + self.viewSize/2, y: y + self.viewSize/2)
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


//
//  ViewController.swift
//  FillWithSquaresGame
//
//  Created by Milana Antonova on 6.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showButton: UIButton!
    
    var size: CGFloat = 100
    let step: CGFloat = 10
    var squareArray: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showButtonPressed(_ sender: UIButton) {
        self.showView()
    }
    
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
                totalWidth += self.size
            }
            totalWidth = 0
            totalHeight += self.size
        }
    }
    
}


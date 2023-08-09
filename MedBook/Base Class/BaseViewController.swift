//
//  BaseViewController.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func hideBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func addnavigationLeftBarButton() {
        let sideBarImage = UIImage(systemName: "chevron.backward")
        let leftBarButton = UIBarButtonItem(image: sideBarImage, style:.plain, target: self, action: #selector(backButton))
        leftBarButton.tintColor = .blackColor
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func addCurveView() {
        let curveLayer = CAShapeLayer()
        self.view.layer.insertSublayer(curveLayer, at: 0)
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: screenWidth , y: 0))
        bezierPath.addLine(to: CGPoint(x: screenWidth , y: screenHeight * 0.2))
        
        bezierPath.addQuadCurve(to:  CGPoint(x: 0, y: screenHeight * 0.35),
                                controlPoint: CGPoint(x: screenWidth-70, y: screenHeight * 0.3))
        
        
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        
        
        bezierPath.close()
        
        curveLayer.path = bezierPath.cgPath
        curveLayer.fillColor = UIColor.darkGrayColor.cgColor
    }
    
    
}

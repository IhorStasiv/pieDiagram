//
//  ViewController.swift
//  PieDiagram
//
//  Created by Ihor Stasiv on 26.11.2021.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

    @IBOutlet private var mainBackgroundView: UIView!
    @IBOutlet private var diagramContainerView: UIView!
    
    @IBOutlet private var firstBlockImageView: UIImageView!
    @IBOutlet private var secondBlockImageView: UIImageView!
    @IBOutlet private var thirdBlockImageView: UIImageView!
    @IBOutlet private var fourBlockImageView: UIImageView!
    @IBOutlet private var fiveBlockImageView: UIImageView!
    @IBOutlet private var sixBlockImageView: UIImageView!
    @IBOutlet private var sevenBlockImageView: UIImageView!
    @IBOutlet private var eightBlockImageView: UIImageView!
    @IBOutlet private var nineBlockImageView: UIImageView!
    @IBOutlet private var tenBlockImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        setupDiagramContainerView()
        addTopBackGroundLayer()
        changeImageAction()
    }
    
    private func addTopBackGroundLayer() {
        self.view.layoutIfNeeded()
        let halfHeight = mainBackgroundView.frame.height / 2
        let halfWidth = mainBackgroundView.frame.width / 2
        let topLeftPoint = CGPoint(x: mainBackgroundView.frame.origin.x, y: mainBackgroundView.frame.origin.y)
        let topRightPoint = CGPoint(x: mainBackgroundView.frame.width + topLeftPoint.x, y: topLeftPoint.y)
        let midleRightPoint = CGPoint(x: topRightPoint.x, y: halfHeight)
        let midleLeftPoint = CGPoint(x: topLeftPoint.x, y: halfHeight)
        
        let path = UIBezierPath()
        let controlPoint: CGPoint = CGPoint(x: halfWidth, y: halfHeight + 150)
        
        path.move(to: topLeftPoint)
        path.addLine(to: topRightPoint)
        path.addLine(to: midleRightPoint)
        path.addQuadCurve(to: midleLeftPoint, controlPoint: controlPoint)
        path.addLine(to: topLeftPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = AppColors.lightGray.color.cgColor
        shapeLayer.lineWidth = 0
        
        mainBackgroundView.layer.addSublayer(shapeLayer)
    }
    
    private func setupDiagramContainerView() {
        self.diagramContainerView.layoutIfNeeded()
        self.diagramContainerView.layer.cornerRadius = diagramContainerView.frame.size.height / 2
    }
    
    private func changeImageAction() {
        choseDiagramImage(fill: 1, imageView: firstBlockImageView, name: "One")
        choseDiagramImage(fill: 2, imageView: secondBlockImageView, name: "Two")
        choseDiagramImage(fill: 3, imageView: thirdBlockImageView, name: "Three")
        choseDiagramImage(fill: 4, imageView: fourBlockImageView, name: "Four")
        choseDiagramImage(fill: 5, imageView: fiveBlockImageView, name: "Five")
        choseDiagramImage(fill: 6, imageView: sixBlockImageView, name: "Six")
        choseDiagramImage(fill: 7, imageView: sevenBlockImageView, name: "Seven")
        choseDiagramImage(fill: 8, imageView: eightBlockImageView, name: "Eight")
        choseDiagramImage(fill: 9, imageView: nineBlockImageView, name: "Nine")
        choseDiagramImage(fill: 10, imageView: tenBlockImageView, name: "Ten")
    }
    
    private func choseDiagramImage(fill: Float, imageView: UIImageView, name: String) {
        let fill = Int(fill)
        
        switch fill {
        case 1:
            guard let unwrapedImage = UIImage(named: name + "01") else { return }
            imageView.image = unwrapedImage
        case 2:
            guard let unwrapedImage = UIImage(named: name + "02") else { return }
            imageView.image = unwrapedImage
        case 3:
            guard let unwrapedImage = UIImage(named: name + "03") else { return }
            imageView.image = unwrapedImage
        case 4:
            guard let unwrapedImage = UIImage(named: name + "04") else { return }
            imageView.image = unwrapedImage
        case 5:
            guard let unwrapedImage = UIImage(named: name + "05") else { return }
            imageView.image = unwrapedImage
        case 6:
            guard let unwrapedImage = UIImage(named: name + "06") else { return }
            imageView.image = unwrapedImage
        case 7:
            guard let unwrapedImage = UIImage(named: name + "07") else { return }
            imageView.image = unwrapedImage
        case 8:
            guard let unwrapedImage = UIImage(named: name + "08") else { return }
            imageView.image = unwrapedImage
        case 9:
            guard let unwrapedImage = UIImage(named: name + "09") else { return }
            imageView.image = unwrapedImage
        case 10:
            guard let unwrapedImage = UIImage(named: name + "10") else { return }
            imageView.image = unwrapedImage
        default:
            break
        }
    }
}


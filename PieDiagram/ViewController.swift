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
    @IBOutlet private var firstSegmentLabel: UILabel!
    
    @IBOutlet private var secondBlockImageView: UIImageView!
    @IBOutlet private var secondSegmentLabel: UILabel!
    
    @IBOutlet private var thirdBlockImageView: UIImageView!
    @IBOutlet private var thirdSegmentLabel: UILabel!
    
    @IBOutlet private var fourBlockImageView: UIImageView!
    @IBOutlet private var fourSegmentLabel: UILabel!
    
    @IBOutlet private var fiveBlockImageView: UIImageView!
    @IBOutlet private var fiveSegmentLabel: UILabel!
    
    @IBOutlet private var sixBlockImageView: UIImageView!
    @IBOutlet private var sixSegmentLabel: UILabel!
    
    @IBOutlet private var sevenBlockImageView: UIImageView!
    @IBOutlet private var sevenSegmentLabel: UILabel!
    
    @IBOutlet private var eightBlockImageView: UIImageView!
    @IBOutlet private var eightSegmentLabel: UILabel!
    
    @IBOutlet private var nineBlockImageView: UIImageView!
    @IBOutlet private var nineSegmentLabel: UILabel!
    
    @IBOutlet private var tenBlockImageView: UIImageView!
    @IBOutlet private var tenSegmentLabel: UILabel!
    
    @IBOutlet private var indicatorLabel: UILabel!
    @IBOutlet private var rightIndicatorLabel: UILabel!
    @IBOutlet private var leftIndicatorLabel: UILabel!
    @IBOutlet private var topIndicatorLabel: UILabel!
    
    
    // MARK: - Private variables
    private let radiusMultipliers: [CGFloat] = [0.135, 0.225, 0.31, 0.395, 0.48, 0.57, 0.655, 0.74, 0.825, 0.91]
    private let angles: [CGFloat] = [4, 40, 76, 108, 139, 176, 214, 248, 292, 328]
    private var points: [CGPoint] = []
    private var halfWidth: [CGFloat] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    // MARK: - Private methods
    private func setupView() {
        drawDashes()
        setupDiagramContainerView()
        addTopBackGroundLayer()
        changeImageAction()
        setupLabelsPosition()
        setupIndicatorLabelsPosition()
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
        choseDiagramImage(fill: 1, imageView: secondBlockImageView, name: "Two")
        choseDiagramImage(fill: 1, imageView: thirdBlockImageView, name: "Three")
        choseDiagramImage(fill: 1, imageView: fourBlockImageView, name: "Four")
        choseDiagramImage(fill: 1, imageView: fiveBlockImageView, name: "Five")
        choseDiagramImage(fill: 1, imageView: sixBlockImageView, name: "Six")
        choseDiagramImage(fill: 1, imageView: sevenBlockImageView, name: "Seven")
        choseDiagramImage(fill: 1, imageView: eightBlockImageView, name: "Eight")
        choseDiagramImage(fill: 1, imageView: nineBlockImageView, name: "Nine")
        choseDiagramImage(fill: 1, imageView: tenBlockImageView, name: "Ten")
    }
    
    private func choseDiagramImage(fill: Int, imageView: UIImageView, name: String) {
        switch fill {
        case 1:
            guard let unwrappedImage = UIImage(named: name + "01") else { return }
            imageView.image = unwrappedImage
        case 2:
            guard let unwrappedImage = UIImage(named: name + "02") else { return }
            imageView.image = unwrappedImage
        case 3:
            guard let unwrappedImage = UIImage(named: name + "03") else { return }
            imageView.image = unwrappedImage
        case 4:
            guard let unwrappedImage = UIImage(named: name + "04") else { return }
            imageView.image = unwrappedImage
        case 5:
            guard let unwrappedImage = UIImage(named: name + "05") else { return }
            imageView.image = unwrappedImage
        case 6:
            guard let unwrappedImage = UIImage(named: name + "06") else { return }
            imageView.image = unwrappedImage
        case 7:
            guard let unwrappedImage = UIImage(named: name + "07") else { return }
            imageView.image = unwrappedImage
        case 8:
            guard let unwrappedImage = UIImage(named: name + "08") else { return }
            imageView.image = unwrappedImage
        case 9:
            guard let unwrappedImage = UIImage(named: name + "09") else { return }
            imageView.image = unwrappedImage
        case 10:
            guard let unwrappedImage = UIImage(named: name + "10") else { return }
            imageView.image = unwrappedImage
        default:
            break
        }
    }
    
    private func setPoints() {
        for index in 0 ..< angles.count {
            points.append(calculatePoints(radiusMultiplier: 5, angle: angles[index]))
        }
    }
    
    private var indicatorPoints: [CGPoint] = []
    
    private func setupIndicatorLabelsPosition() {
        var pointForCalculation: [CGPoint] = []
        
        pointForCalculation.append(calculatePoints(radiusMultiplier: 0, angle: 0, needToMultiple: true))
        pointForCalculation.append(calculatePoints(radiusMultiplier: 1, angle: 180, needToMultiple: true))
        pointForCalculation.append(calculatePoints(radiusMultiplier: 1, angle: 270, needToMultiple: true))
//        indicatorPoints.append(CGPoint(x: pointForCalculation[], y: pointForCalculation[])) // TODO point calculate
        
        
        indicatorLabel.center = CGPoint(x: (diagramContainerView.frame.width / 2), y: (diagramContainerView.frame.height / 2))
        diagramContainerView.addSubview(indicatorLabel)
        
        rightIndicatorLabel.center = CGPoint(x: indicatorPoints[0].x - 5, y: indicatorPoints[0].y)
        diagramContainerView.addSubview(rightIndicatorLabel)

        leftIndicatorLabel.center = CGPoint(x: indicatorPoints[1].x + 5, y: indicatorPoints[1].y)
        diagramContainerView.addSubview(leftIndicatorLabel)

        topIndicatorLabel.center = CGPoint(x: indicatorPoints[2].x, y: indicatorPoints[2].y - 5)
        diagramContainerView.addSubview(topIndicatorLabel)
    }
    
    private func setupLabelsPosition() {
        setPoints()
        getLabelsWidth()
        
        firstSegmentLabel.center = CGPoint(x: points[7].x - halfWidth[0], y: points[7].y)
        secondSegmentLabel.center = CGPoint(x: points[6].x - halfWidth[1], y: points[6].y)
        thirdSegmentLabel.center = CGPoint(x: points[5].x - halfWidth[2], y: points[5].y)
        fourSegmentLabel.center = CGPoint(x: points[4].x - halfWidth[3], y: points[4].y)
        fiveSegmentLabel.center = CGPoint(x: points[3].x - halfWidth[4], y: points[3].y)
        sixSegmentLabel.center = CGPoint(x: points[2].x + halfWidth[5], y: points[2].y)
        sevenSegmentLabel.center = CGPoint(x: points[1].x + halfWidth[6], y: points[1].y)
        eightSegmentLabel.center = CGPoint(x: points[0].x + halfWidth[7], y: points[0].y)
        nineSegmentLabel.center = CGPoint(x: points[9].x + halfWidth[8], y: points[9].y)
        tenSegmentLabel.center = CGPoint(x: points[8].x + halfWidth[9], y: points[8].y)
        
        diagramContainerView.addSubview(firstSegmentLabel)
        diagramContainerView.addSubview(secondSegmentLabel)
        diagramContainerView.addSubview(thirdSegmentLabel)
        diagramContainerView.addSubview(fourSegmentLabel)
        diagramContainerView.addSubview(fiveSegmentLabel)
        diagramContainerView.addSubview(sixSegmentLabel)
        diagramContainerView.addSubview(sevenSegmentLabel)
        diagramContainerView.addSubview(eightSegmentLabel)
        diagramContainerView.addSubview(nineSegmentLabel)
        diagramContainerView.addSubview(tenSegmentLabel)
    }
    
    private func getLabelsWidth() {
        halfWidth.append(firstSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(secondSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(thirdSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(fourSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(fiveSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(sixSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(sevenSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(eightSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(nineSegmentLabel.intrinsicContentSize.width / 2)
        halfWidth.append(tenSegmentLabel.intrinsicContentSize.width / 2)
    }
    
    private func calculatePoints(radiusMultiplier: CGFloat, angle: CGFloat, needToMultiple: Bool = false) -> CGPoint {
        var point: CGPoint
        let radiusWithMultiplication: CGFloat = (diagramContainerView.frame.width / 2) * radiusMultiplier
        let radiusWithoutMultiplication: CGFloat = (diagramContainerView.frame.width / 2) + radiusMultiplier
        let radius: CGFloat = needToMultiple ? radiusWithMultiplication : radiusWithoutMultiplication
        let center: CGPoint = CGPoint(x: diagramContainerView.frame.width / 2, y: diagramContainerView.frame.height / 2)
        
        let startX = radius * cos(angle * .pi / 180)
        let startY = radius * sin(angle * .pi / 180)
        point = CGPoint(x: center.x + startX, y: center.y + startY)
        
        return point
    }
    
    private func drawDashPath(radiusMultiplier: CGFloat, color: UIColor) {
        self.view.layoutIfNeeded()
        let x = diagramContainerView.frame.width / 2
        let y = diagramContainerView.frame.height / 2
        let width: CGFloat = diagramContainerView.frame.width * radiusMultiplier
        let height: CGFloat = diagramContainerView.frame.height * radiusMultiplier
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [4, 9] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: x - (width / 2), y: y - (height / 2), width: width, height: height))
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path
        diagramContainerView.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func drawDashes() {
        for index in 0 ..< radiusMultipliers.count {
            if index == 4 {
                drawDashPath(radiusMultiplier: radiusMultipliers[index], color: AppColors.dashViolet.color)
            } else if index >= 8 {
                drawDashPath(radiusMultiplier: radiusMultipliers[index], color: AppColors.dashGray.color)
            } else {
                drawDashPath(radiusMultiplier: radiusMultipliers[index], color: AppColors.dashLightViolet.color)
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func yesButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func noButtonAction(_ sender: UIButton) {
    }
}


//
//  ViewController.swift
//  PieDiagram
//
//  Created by Ihor Stasiv on 26.11.2021.
//

import UIKit
import CoreGraphics

struct CornerPoint {
    var centerPoint: CGPoint
    var startAngle:  CGFloat
    var endAngle: CGFloat
}

struct Polygon {
    let outerOne: CGPoint
    let outerTwo: CGPoint
    let innerOne: CGPoint
    let innerTwo: CGPoint
}

class ViewController: UIViewController {

    @IBOutlet weak var diagramContainerView: UIView!
    
    private var aPoints: [CGPoint] = []
    private var bPoint: CGPoint = CGPoint()
    private var cPoints: [CGPoint] = []
    
    
    private var aCalculatedPoints: [CGPoint] = []
    private var cCalculatedPoints: [CGPoint] = []
    
    private var someLines: [CGPoint] = []
    
    private var multypliers: [CGFloat] = [0.9, 0.8, 0.7, 0.6, 0.3, 0.5, 0.4, 0.3, 0.2, 0.1]
    private var polygons: [Polygon] = []
    private var outerPoints: [(CGPoint, CGPoint)] = []
    private var innerPoints: [(CGPoint, CGPoint)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        print("HEIGHT \(diagramContainerView.frame.height)")
        print("WIDTH \(diagramContainerView.frame.width)")
        setPointsForPolygons()
        draw()
        
    }
    
    private func draw() {
        drawPolygon(polygon: polygons[0], fillColor: .green, strokeColor: .red, controlX: 12, controlY: 0)
        drawPolygon(polygon: polygons[1], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (10))
        drawPolygon(polygon: polygons[2], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (10))
        drawPolygon(polygon: polygons[3], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (10))
        drawPolygon(polygon: polygons[4], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (10))
        drawPolygon(polygon: polygons[5], fillColor: .green, strokeColor: .red, controlX: (-12), controlY: (0))
        drawPolygon(polygon: polygons[6], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (-10))
        drawPolygon(polygon: polygons[7], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (-10))
        drawPolygon(polygon: polygons[8], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (-10))
        drawPolygon(polygon: polygons[9], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (-10))
    }
    
    private func setPointsForPolygons() {
        for index in 0 ..< multypliers.count {
            calculatePoints(radiusMultiplier: 1, isOuter: true, index: index)
            calculatePoints(radiusMultiplier: multypliers[index], isOuter: false, index: index)
        }
        setPolygons()
    }
    
    private func setPolygons() {
        for index in 0 ..< 10 {
            polygons.append(
                Polygon(
                    outerOne: outerPoints[index].0,
                    outerTwo: outerPoints[index].1,
                    innerOne: innerPoints[index].0,
                    innerTwo: innerPoints[index].1
                ))
        }
    }
    
    private func calculatePoints(radiusMultiplier: CGFloat, isOuter: Bool, index: Int) {
        var startPoint: CGPoint
        var endPoint: CGPoint
        let radius: CGFloat = (diagramContainerView.frame.width / 2) * radiusMultiplier
        let center: CGPoint = CGPoint(x: diagramContainerView.frame.width / 2, y: diagramContainerView.frame.height / 2)
        
        let startX = radius * cos(angles[index].0 * .pi / 180)
        let startY = radius * sin(angles[index].0 * .pi / 180)
        let endX = radius * cos(angles[index].1 * .pi / 180)
        let endY = radius * sin(angles[index].1 * .pi / 180)
        startPoint = CGPoint(x: center.x + startX, y: center.y + startY)
        endPoint = CGPoint(x: center.x + endX, y: center.y + endY)
        
        isOuter ? outerPoints.append((startPoint, endPoint)) : innerPoints.append((startPoint, endPoint))
    }
    private func drawPolygon(polygon: Polygon,
                              fillColor: UIColor,
                              strokeColor: UIColor,
                              controlX: CGFloat,
                              controlY: CGFloat
    ) {
        
        let path = UIBezierPath()
        let outerControlPoint: CGPoint = CGPoint(x: ((polygon.outerOne.x + polygon.outerTwo.x) / 2) + controlX, y: ((polygon.outerOne.y + polygon.outerTwo.y) / 2) + controlY)
        let innerControlPoint: CGPoint = CGPoint(x: ((polygon.innerOne.x + polygon.innerTwo.x) / 2) + controlX, y: ((polygon.innerOne.y + polygon.innerTwo.y) / 2) + controlY)
        
        path.move(to: polygon.outerOne)
        path.addLine(to: polygon.innerOne)
        path.addQuadCurve(to: polygon.innerTwo, controlPoint: innerControlPoint)
        path.addLine(to: polygon.outerTwo)
        path.addQuadCurve(to: polygon.outerOne, controlPoint: outerControlPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.lineWidth = 1
        
        diagramContainerView.layer.addSublayer(shapeLayer)
    }
    
    let angles: [(CGFloat, CGFloat)] = [(341, 16), (17, 52), (53, 88), (89, 124), (125, 160), (161, 196), (197, 232), (233, 268), (269, 304), (305, 340)]
    private func calculateAPoints(radiusMultiplier: CGFloat) {
        var startPoint: CGPoint
        var endPoint: CGPoint
        let radius: CGFloat = (diagramContainerView.frame.width / 2) * radiusMultiplier
        let center: CGPoint = CGPoint(x: diagramContainerView.frame.width / 2, y: diagramContainerView.frame.height / 2)
        
        for index in 0 ..< angles.count {
            let startX = radius * cos(angles[index].0 * .pi / 180)
            let startY = radius * sin(angles[index].0 * .pi / 180)
            let endX = radius * cos(angles[index].1 * .pi / 180)
            let endY = radius * sin(angles[index].1 * .pi / 180)
            startPoint = CGPoint(x: center.x + startX, y: center.y + startY)
            endPoint = CGPoint(x: center.x + endX, y: center.y + endY)
            print("INDEX=\(index)")
            print("POINT=\(startPoint)")
            let startPointView: UIView = UIView(frame: CGRect(x: startPoint.x, y: startPoint.y, width: 2, height: 2))
            startPointView.backgroundColor = .black
            let endPointView: UIView = UIView(frame: CGRect(x: endPoint.x, y: endPoint.y, width: 2, height: 2))
            endPointView.backgroundColor = .red
                                   
            diagramContainerView.addSubview(startPointView)
            diagramContainerView.addSubview(endPointView)
        }
    }
    
    private func setupView() {
        setupDiagramContainerView()
    }
    
    private func setupDiagramContainerView() {
        self.diagramContainerView.layoutIfNeeded()
        self.diagramContainerView.layer.cornerRadius = diagramContainerView.frame.size.height / 2
    }
}

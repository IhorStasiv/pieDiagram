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
} ;

class ViewController: UIViewController {

    @IBOutlet weak var diagramContainerView: UIView!
    
    private var aPoints: [CGPoint] = []
    private var bPoint: CGPoint = CGPoint()
    private var cPoints: [CGPoint] = []
    
    private var someLines: [CGPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        print("HEIGHT \(diagramContainerView.frame.height)")
        print("WIDTH \(diagramContainerView.frame.width)")
    }
    
    private func fillPoints() {
        bPoint = CGPoint(x: diagramContainerView.frame.width / 2, y: diagramContainerView.frame.height / 2)
        
        aPoints = [
            CGPoint(x: (diagramContainerView.frame.width / 2) + 1, y: 0),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 81, y: 27),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 131, y: 96),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 131, y: 181),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 81, y: 250),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 1, y: 276),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 81, y: 249),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 131, y: 180),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 131, y: 95),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 81, y: 26)
        ]
        
        cPoints = [
            CGPoint(x: (diagramContainerView.frame.width / 2) + 80, y: 26),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 130, y: 95),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 131, y: 180),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 81, y: 249),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 1, y: 276),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 80, y: 250),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 130, y: 181),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 131, y: 96),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 81, y: 27),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 1, y: 0),
        ]
        
        someLines = [
            CGPoint(x: (diagramContainerView.frame.width / 2) + 5, y: 5),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 5, y: 271),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 74, y: 27),
            CGPoint(x: (diagramContainerView.frame.width / 2) - 85, y: 243),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 1, y: 5),
            CGPoint(x: (diagramContainerView.frame.width / 2) + 89, y: 32),
        ]
    }
    var startAngle: CGFloat = .pi * 3 / 10
    var endAngle: CGFloat = .pi * 5 / 10
    var clockwise: Bool = true

    func updatePath() {
        /// Radius of center of this arc
        var radius: CGFloat = (diagramContainerView.frame.width / 2) - 50
        /// The linewidth of this thick arc
        var lineWidth: CGFloat = (diagramContainerView.frame.width / 2)
        /// The corner radius of this thick arc
        var cornerRadius: CGFloat = 5

        let center = bPoint
        let innerRadius = radius - (lineWidth / 2) + cornerRadius
        let innerAngularDelta = asin(cornerRadius / innerRadius)
        let outerRadius = radius + (lineWidth / 2)
        let outerAngularDelta = asin(cornerRadius / outerRadius)

        let path = UIBezierPath(arcCenter: center, radius: innerRadius, startAngle: startAngle + innerAngularDelta, endAngle: endAngle - innerAngularDelta, clockwise: clockwise)
        path.addArc(withCenter: center, radius: outerRadius, startAngle: endAngle - outerAngularDelta, endAngle: startAngle + outerAngularDelta, clockwise: !clockwise)
        path.close()

        // configure shapeLayer

        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = cornerRadius * 2
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineJoin = .round
        shapeLayer.path = path.cgPath
        diagramContainerView.layer.addSublayer(shapeLayer)
    }
    
    private func setupView() {
        setupDiagramContainerView()
        fillPoints()
        updatePath()
//        guard let adcIntersect = linesCross(start1: someLines[0], end1: someLines[1], start2: someLines[2], end2: someLines[3]) else { return }
//        let adcIntersectPoint = CGPoint(x: adcIntersect.x, y: adcIntersect.y)
//        guard let bcaIntersect = linesCross(start1: someLines[2], end1: someLines[3], start2: someLines[4], end2: someLines[5]) else { return }
//        let bcaIntersectPoint = CGPoint(x: bcaIntersect.x, y: bcaIntersect.y)
//        guard let cabIntersect = linesCross(start1: someLines[4], end1: someLines[5], start2: someLines[0], end2: someLines[1]) else { return }
//        let cabIntersectPoint = CGPoint(x: cabIntersect.x, y: cabIntersect.y)
//        guard let bottomCorner = createRoundedCornerTriangle(a: aPoints[0], b: bPoint, c: cPoints[0], intersect: adcIntersectPoint) else { return }
//        guard let rightCorner = createRoundedCornerTriangle(a: bPoint, b: cPoints[0], c: aPoints[0], intersect: bcaIntersectPoint) else { return }
//        guard let topCorner = createRoundedCornerTriangle(a: cPoints[0], b: aPoints[0], c: bPoint, intersect: cabIntersectPoint) else { return }
//
//        let roundedTrianglePath = CGMutablePath()
//        // manually calculated start point
//        roundedTrianglePath.move(
//            to: CGPoint(x: bottomCorner.centerPoint.x + CGFloat(5 * cosf(Float(bottomCorner.startAngle))),
//                        y: bottomCorner.centerPoint.y + CGFloat(5 * sinf(Float(bottomCorner.startAngle)))),
//            transform: .identity)
//        // add 3 arcs in the 3 corners
//        roundedTrianglePath.addArc(
//            center: CGPoint(x: bottomCorner.centerPoint.x,
//            y: bottomCorner.centerPoint.y),
//            radius: 5,
//            startAngle: bottomCorner.startAngle,
//            endAngle: bottomCorner.endAngle,
//            clockwise: false,
//            transform: .identity)
//        roundedTrianglePath.addArc(
//            center: CGPoint(x: topCorner.centerPoint.x,
//            y: topCorner.centerPoint.y),
//            radius: 5,
//            startAngle: topCorner.startAngle,
//            endAngle: topCorner.endAngle,
//            clockwise: false,
//            transform: .identity)
//        roundedTrianglePath.addArc(
//            center: CGPoint(x: rightCorner.centerPoint.x,
//            y: rightCorner.centerPoint.y),
//            radius: 5,
//            startAngle: rightCorner.startAngle,
//            endAngle: rightCorner.endAngle,
//            clockwise: false,
//            transform: .identity)
//        // close the path
//        roundedTrianglePath.closeSubpath()
//
//        var shapeLayer = CAShapeLayer()
//        shapeLayer.path = roundedTrianglePath
//        shapeLayer.lineWidth = 3.0
//        shapeLayer.strokeColor = UIColor.blue.cgColor
//        shapeLayer.fillColor = UIColor.blue.cgColor
//        diagramContainerView.layer.addSublayer(shapeLayer)
        
//        drawTriangle(aPoint: aPoints[0], bPoint: bPoint, cPoint: cPoints[0], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (-10))
//        drawTriangle(aPoint: aPoints[1], bPoint: bPoint, cPoint: cPoints[1], fillColor: .red, strokeColor: .green, controlX: (10), controlY: (-10))
//        drawTriangle(aPoint: aPoints[2], bPoint: bPoint, cPoint: cPoints[2], fillColor: .green, strokeColor: .red, controlX: (12), controlY: 0)
//        drawTriangle(aPoint: aPoints[3], bPoint: bPoint, cPoint: cPoints[3], fillColor: .red, strokeColor: .green, controlX: (10), controlY: (10))
//        drawTriangle(aPoint: aPoints[4], bPoint: bPoint, cPoint: cPoints[4], fillColor: .green, strokeColor: .red, controlX: (10), controlY: (10))
//        drawTriangle(aPoint: aPoints[5], bPoint: bPoint, cPoint: cPoints[5], fillColor: .red, strokeColor: .green, controlX: (-10), controlY: (10))
//        drawTriangle(aPoint: aPoints[6], bPoint: bPoint, cPoint: cPoints[6], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (10))
//        drawTriangle(aPoint: aPoints[7], bPoint: bPoint, cPoint: cPoints[7], fillColor: .red, strokeColor: .green, controlX: (-12), controlY: 0)
//        drawTriangle(aPoint: aPoints[8], bPoint: bPoint, cPoint: cPoints[8], fillColor: .green, strokeColor: .red, controlX: (-10), controlY: (-10))
//        drawTriangle(aPoint: aPoints[9], bPoint: bPoint, cPoint: cPoints[9], fillColor: .red, strokeColor: .green, controlX: (-10), controlY: (-10))
    }
    
    private func createRoundedCornerTriangle(a: CGPoint, b: CGPoint, c: CGPoint, intersect: CGPoint?) -> CornerPoint? {
        guard let abcIntersect = intersect else { return nil }
        let intersectPoint = CGPoint(x: abcIntersect.x, y: abcIntersect.y)
        let corner = roundedCornerWithLines(from: a, via: b, to: c, withRadius: 3, intersection: intersectPoint)
        return corner
    }
    
    private func drawTriangle(aPoint: CGPoint,
                              bPoint: CGPoint,
                              cPoint: CGPoint,
                              fillColor: UIColor,
                              strokeColor: UIColor,
                              controlX: CGFloat,
                              controlY: CGFloat
    ) {
        
        let path = UIBezierPath()
        let controlPoint: CGPoint = CGPoint(x: ((cPoint.x + aPoint.x) / 2) + controlX, y: ((cPoint.y + aPoint.y) / 2) + controlY)
        path.move(to: aPoint)
        path.addLine(to: bPoint)
        path.addLine(to: cPoint)
        path.addQuadCurve(to: aPoint, controlPoint: controlPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.lineWidth = 2
        
        diagramContainerView.layer.addSublayer(shapeLayer)
    }
    
    private func setupDiagramContainerView() {
        self.diagramContainerView.layoutIfNeeded()
        self.diagramContainerView.layer.cornerRadius = diagramContainerView.frame.size.height / 2
    }
    
    // MARK: - Calculate intersect
    private func linesCross(start1: CGPoint, end1: CGPoint, start2: CGPoint, end2: CGPoint) -> (x: CGFloat, y: CGFloat)? {
        // calculate the differences between the start and end X/Y positions for each of our points
        let delta1x = end1.x - start1.x
        let delta1y = end1.y - start1.y
        let delta2x = end2.x - start2.x
        let delta2y = end2.y - start2.y

        // create a 2D matrix from our vectors and calculate the determinant
        let determinant = delta1x * delta2y - delta2x * delta1y

        if abs(determinant) < 0.0001 {
            // if the determinant is effectively zero then the lines are parallel/colinear
            return nil
        }

        // if the coefficients both lie between 0 and 1 then we have an intersection
        let ab = ((start1.y - start2.y) * delta2x - (start1.x - start2.x) * delta2y) / determinant

        if ab > 0 && ab < 1 {
            let cd = ((start1.y - start2.y) * delta1x - (start1.x - start2.x) * delta1y) / determinant

            if cd > 0 && cd < 1 {
                // lines cross – figure out exactly where and return it
                let intersectX = start1.x + ab * delta1x
                let intersectY = start1.y + ab * delta1y
                return (intersectX, intersectY)
            }
        }

        // lines don't cross
        return nil
    }
    
    func roundedCornerWithLines(from: CGPoint, via: CGPoint, to: CGPoint, withRadius radius: CGFloat, intersection: CGPoint) -> CornerPoint {
        let fromAngle = atan2f(Float(from.y - via.y), Float(from.x - via.x))
        let toAngle = atan2f(Float(to.y - via.y), Float(to.x - via.x))

        let corner = CornerPoint(
            centerPoint: intersection,
            startAngle: CGFloat(fromAngle - .pi),
            endAngle: CGFloat(toAngle - .pi)
        )

        return corner
    }
}

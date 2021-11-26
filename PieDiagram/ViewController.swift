//
//  ViewController.swift
//  PieDiagram
//
//  Created by Ihor Stasiv on 26.11.2021.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

    @IBOutlet weak var diagramContainerView: UIView!
    
    @IBOutlet weak var firstBlockImageView: UIImageView!
    @IBOutlet weak var secondBlockImageView: UIImageView!
    @IBOutlet weak var thirdBlockImageView: UIImageView!
    @IBOutlet weak var fourBlockImageView: UIImageView!
    @IBOutlet weak var fiveBlockImageView: UIImageView!
    @IBOutlet weak var sixBlockImageView: UIImageView!
    @IBOutlet weak var sevenBlockImageView: UIImageView!
    @IBOutlet weak var eightBlockImageView: UIImageView!
    @IBOutlet weak var nineBlockImageView: UIImageView!
    @IBOutlet weak var tenBlockImageView: UIImageView!
    
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var firstTitleView: UILabel!
    @IBOutlet weak var firstSlider: UISlider!
    
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondSlider: UISlider!
    
    @IBOutlet weak var thirdContainerView: UIView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var thirdSlider: UISlider!
    
    @IBOutlet weak var fourContainerView: UIView!
    @IBOutlet weak var fourTitleLabel: UILabel!
    @IBOutlet weak var fourSlider: UISlider!
    
    @IBOutlet weak var fiveContainerView: UIView!
    @IBOutlet weak var fiveTitleLabel: UILabel!
    @IBOutlet weak var fiveSlider: UISlider!
    
    @IBOutlet weak var sixContainerView: UIView!
    @IBOutlet weak var sixTitleLabel: UILabel!
    @IBOutlet weak var sixSlider: UISlider!
    
    @IBOutlet weak var sevenContainerView: UIView!
    @IBOutlet weak var sevenTitleLabel: UILabel!
    @IBOutlet weak var sevenSlider: UISlider!
    
    @IBOutlet weak var eightContainerView: UIView!
    @IBOutlet weak var eightTitleLabel: UILabel!
    @IBOutlet weak var eightSlider: UISlider!
    
    @IBOutlet weak var nineContainerView: UIView!
    @IBOutlet weak var nineTitleLabel: UILabel!
    @IBOutlet weak var nineSlider: UISlider!
    
    @IBOutlet weak var tenContainerView: UIView!
    @IBOutlet weak var tenTitleLabel: UILabel!
    @IBOutlet weak var tenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        setupDiagramContainerView()
    }
    
    private func setupDiagramContainerView() {
        self.diagramContainerView.layoutIfNeeded()
        self.diagramContainerView.layer.cornerRadius = diagramContainerView.frame.size.height / 2
    }
    
    private func changeImageAction(slider: UISlider) {
        switch slider {
        case firstSlider:
            choseDiagramImagee(fill: slider.value, imageView: firstBlockImageView, name: "one")
        case secondSlider:
            choseDiagramImagee(fill: slider.value, imageView: secondBlockImageView, name: "two")
        case thirdSlider:
            choseDiagramImagee(fill: slider.value, imageView: thirdBlockImageView, name: "three")
        case fourSlider:
            choseDiagramImagee(fill: slider.value, imageView: fourBlockImageView, name: "four")
        case fiveSlider:
            choseDiagramImagee(fill: slider.value, imageView: fiveBlockImageView, name: "five")
        case sixSlider:
            choseDiagramImagee(fill: slider.value, imageView: sixBlockImageView, name: "six")
        case sevenSlider:
            choseDiagramImagee(fill: slider.value, imageView: sevenBlockImageView, name: "seven")
        case eightSlider:
            choseDiagramImagee(fill: slider.value, imageView: eightBlockImageView, name: "eight")
        case nineSlider:
            choseDiagramImagee(fill: slider.value, imageView: nineBlockImageView, name: "nine")
        case tenSlider:
            choseDiagramImagee(fill: slider.value, imageView: tenBlockImageView, name: "ten")
        default:
            break
        }
    }
    
    private func choseDiagramImagee(fill: Float, imageView: UIImageView, name: String) {
        let fill = Int(fill)
        
        switch fill {
        case 1:
            guard let unwrapedImage = UIImage(named: name + "100") else { return }
            imageView.image = unwrapedImage
        case 2:
            guard let unwrapedImage = UIImage(named: name + "90") else { return }
            imageView.image = unwrapedImage
        case 3:
            guard let unwrapedImage = UIImage(named: name + "80") else { return }
            imageView.image = unwrapedImage
        case 4:
            guard let unwrapedImage = UIImage(named: name + "70") else { return }
            imageView.image = unwrapedImage
        case 5:
            guard let unwrapedImage = UIImage(named: name + "60") else { return }
            imageView.image = unwrapedImage
        case 6:
            guard let unwrapedImage = UIImage(named: name + "50") else { return }
            imageView.image = unwrapedImage
        case 7:
            guard let unwrapedImage = UIImage(named: name + "40") else { return }
            imageView.image = unwrapedImage
        case 8:
            guard let unwrapedImage = UIImage(named: name + "30") else { return }
            imageView.image = unwrapedImage
        case 9:
            guard let unwrapedImage = UIImage(named: name + "20") else { return }
            imageView.image = unwrapedImage
        case 10:
            guard let unwrapedImage = UIImage(named: name + "05") else { return }
            imageView.image = unwrapedImage
        default:
            break
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeImageAction(slider: sender)
    }
}


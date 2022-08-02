//
//  ViewController.swift
//  WordGarden
//
//  Created by Daniel Heath on 8/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func drawLines() {
        // 1
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            // 2
            for _ in 1...5 {
                ctx.cgContext.move(to: CGPoint(x: Int.random(in: 20...260), y: Int.random(in: 20...230)))
                ctx.cgContext.addLine(to: CGPoint(x: Int.random(in: 20...260), y: Int.random(in: 20...230)))
            }

            ctx.cgContext.setLineWidth(2)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)

            // 3
            ctx.cgContext.strokePath()
        }

        imageView.image = img
    }
        
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 280, height: 250)

            // 4
            ctx.cgContext.setFillColor(UIColor.green.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
            ctx.cgContext.setLineWidth(10)

            // 5
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        imageView.image = img
    }
        
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 280, height: 250))

        let img = renderer.image { ctx in
            
            let petals=7
            for n in 0...petals {
                    
                let rect = CGRect(x: 100+40*sin(2.0*Double(n)*M_PI/8), y: 85+40*cos(2.0*Double(n)*M_PI/8), width: 80, height: 80)

                // 6
                ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
                ctx.cgContext.setStrokeColor(UIColor.purple.cgColor)
                ctx.cgContext.setLineWidth(2)

                ctx.cgContext.addEllipse(in: rect)
                ctx.cgContext.drawPath(using: .fillStroke)
            }
            let rect = CGRect(x: 120, y: 105, width: 40, height: 40)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(1)

            ctx.cgContext.addEllipse(in: rect)
            ctx.cgContext.drawPath(using: .fillStroke)
        }

        imageView.image = img
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
                case 0: drawLines()
                case 1: drawRectangle()
                case 2: drawCircle()
                default: print("default")
            }
    }
    
}


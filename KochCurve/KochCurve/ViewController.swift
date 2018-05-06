//
//  ViewController.swift
//  KochCurve
//
//  Created by L on 2018/5/1.
//  Copyright © 2018年 L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let kochSonwView = KochSnowView()
        kochSonwView.backgroundColor = .red
        kochSonwView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: sqrt(pow(view.frame.size.width, 2) - pow(view.frame.size.width/2, 2)))
        view.addSubview(kochSonwView)
//        hypot(<#T##Double#>, <#T##Double#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class KochSnowView: UIView {
    
    var bezierPath = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    
    /*
     给定线段AB，科赫曲线可以由以下步骤生成：
     (1)将线段分成三等份（AC,CD,DB）
     (2)以CD为底，向外（内外随意）画一个等边三角形DMC
     (3)将线段CD移去
     (4)分别对AC,CM,MD,DB重复1~3。
     反复进行这一作图过程，得到的曲线越来越精细。
     */
    
    func drawKochSnow(lineWidth: CGFloat, deep: Int) {
        
        let startPoint = CGPoint(x: frame.width/2, y: 0)
        let leftPoint = CGPoint(x: 0, y: frame.height)
        let rightPoint = CGPoint(x: frame.width, y: frame.height)
        
        bezierPath.move(to: startPoint)
        bezierPath.addLine(to: leftPoint)
        bezierPath.move(to: startPoint)
        bezierPath.addLine(to: rightPoint)
        
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        layer.addSublayer(shapeLayer)
        
    }
    
    func lineWidth(point1: CGPoint, point2: CGPoint) -> CGFloat {
        return sqrt(pow(point1.x - point2.x, 2) + pow(point1.y + point2.y, 2))
    }
    
}

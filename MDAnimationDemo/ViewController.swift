//
//  ViewController.swift
//  MDAnimationDemo
//
//  Created by Alan on 2018/4/27.
//  Copyright © 2018年 MD. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var b_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        b_btn.isHidden = true

//     positionAnimation()
        
//     transformScaleAnimation()
        
//        transformRotationAnimation()
        
//        transformTranslationAnimation()
        
//        transformCornerRadiusAnimation()
        
//        transformBorderWidthAnimation()
        
//        transformBackgroundColorAnimation()
        
//        transformAlphaAnimation()
        
//        positionAnimation()
        
//        groupAnimation()
        
//        emitterAnimate1()
        emitterAnimate3()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func  showGif(){
        let imageView = UIImageView.init(frame: UIScreen.main.bounds)
        imageView.animationImages = resolveGifImage()
        imageView.animationDuration = 10
        imageView.animationRepeatCount = Int.max
        imageView.startAnimating()
        self.view.addSubview(imageView)
    }
    
    
    //分解gif图
    func resolveGifImage()->[UIImage]{
        var images:[UIImage] = []
        let gifPath = Bundle.main.path(forResource: "demo", ofType: "gif")
        if gifPath != nil{
            if let gifData = try? Data(contentsOf: URL.init(fileURLWithPath: gifPath!)){
                let gifDataSource = CGImageSourceCreateWithData(gifData as CFData, nil)
                let gifcount = CGImageSourceGetCount(gifDataSource!)
                for i in 0...gifcount - 1{
                    let imageRef = CGImageSourceCreateImageAtIndex(gifDataSource!, i, nil)
                    let image = UIImage(cgImage: imageRef!)
                    images.append(image)
                }
            }
        }
        return images
    }
    
    /**
     
    //CABasicAnimation
    
    
    
    //位置
    func positionAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "position"
        animation.toValue = CGPoint(x: b_btn.x - 10, y: b_btn.y - 10)
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }

    //缩放
    func transformScaleAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale.x"
        animation.fromValue = 1.0
        animation.toValue = 0.8
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    //旋转
    func transformRotationAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.fromValue = Double.pi / 2
        animation.toValue = 2.0
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    //位移
    func transformTranslationAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "transform.translation.y"
        animation.toValue = 100
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    
    //圆角
    func transformCornerRadiusAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "cornerRadius"
        animation.toValue = 15
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    //边框
    func transformBorderWidthAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "borderWidth"
        animation.toValue = 15
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    //颜色渐变
    func transformBackgroundColorAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.fromValue = UIColor.green.cgColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    //淡入淡出
    func transformAlphaAnimation(){
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = 0
        animation.toValue = 1.0
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
 */
    
    
    
    //淡出动画效果
    func transformAlphaAnimation(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "opacity"
        animation.values = [0.9,0.8,0.3,0.0]
        animation.duration = 5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    
    //任意路径动画
    func positionAnimation(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        let pathLine = CGMutablePath()
        pathLine.move(to: CGPoint(x: 10, y: 10))
        //直线
//        pathLine.addLine(to: CGPoint(x: 100, y: 100))

        //圆弧
        pathLine.addArc(center: CGPoint(x: 100, y: 100), radius: 100, startAngle: 0, endAngle: CGFloat(Double.pi/2), clockwise: true)
        
        animation.path = pathLine
        animation.duration = 5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        b_btn.layer.add(animation, forKey: nil)
    }
    
    
    //组合动画
    func groupAnimation(){
        let move = CABasicAnimation()
        move.keyPath = "position"
        move.toValue = CGPoint(x: b_btn.x - 10, y: b_btn.y - 10)
        
        let scale = CABasicAnimation()
        scale.keyPath = "transform.scale.x"
        scale.fromValue = 1.0
        scale.toValue = 0.8
        
        let ransform = CABasicAnimation()
        ransform.keyPath = "transform.rotation"
        ransform.fromValue = Double.pi / 2
        ransform.toValue = 2.0
        
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [move,scale,ransform]
        
        animationGroup.duration = 5
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        b_btn.layer.add(animationGroup, forKey: nil)
        
    }
    
    
    
    //鬼火效果
    func emitterAnimate1(){
        self.view.backgroundColor = .black
        let emitterCell = CAEmitterCell()
        emitterCell.name = "fire"
        emitterCell.emissionLongitude = CGFloat(Double.pi)
        emitterCell.velocity = -1 //粒子熟读 负数表明向上燃烧
        emitterCell.velocityRange = 50 //粒子速度范围
        emitterCell.emissionRange = 1.1 //周围发射角度
        emitterCell.yAcceleration =  -200 //粒子y方向的加速度分量
        emitterCell.scaleSpeed = 0.7 //速度缩放比例  超大火苗
        
        emitterCell.birthRate = 500 //粒子生成速度
        emitterCell.lifetime = 1 //生命周期
        
        emitterCell.color = UIColor(red: 0 ,green: 0.4 ,blue:0.2 ,alpha:0.1).cgColor
        emitterCell.contents = UIImage(named: "fire")!.cgImage
        
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.position = self.view.center //粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 50, height: 10)//控制大小
        
        //渲染模式以及发射源模式
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterShape = kCAEmitterLayerLine
        emitterLayer.emitterCells = [emitterCell]
        self.view.layer.addSublayer(emitterLayer)
        
    }
    
    //霓虹效果
    func emitterAnimate2(){
        self.view.backgroundColor = UIColor.black
        
        let emitterCell = CAEmitterCell()
        
        emitterCell.name = "nenolight"
        emitterCell.emissionLongitude  = CGFloat(Double.pi*2)// emissionLongitude:x-y 平面的 发 射方向
        emitterCell.velocity = 50// 粒子速度
        emitterCell.velocityRange = 50// 粒子速度范围
        emitterCell.scaleSpeed = -0.2// 速度缩放比例 超大火苗
        emitterCell.scale = 0.1  //缩放比例
        
        //R G B alpha 颜色速度渐变
        emitterCell.greenSpeed = -0.1
        emitterCell.redSpeed = -0.2
        emitterCell.blueSpeed = 0.1
        emitterCell.alphaSpeed = -0.2
        emitterCell.birthRate = 100 // 一秒钟会产生粒子的个数
        emitterCell.lifetime = 4 //粒子生命周期
        emitterCell.color = UIColor.white.cgColor
        emitterCell.contents = UIImage(named: "neonlight")!.cgImage
        
        let emitterLayer = CAEmitterLayer()
        
        emitterLayer.position = self.view.center// 粒子发射位置
        emitterLayer.emitterSize = CGSize(width: 2, height: 2)// 控制粒子大小
        emitterLayer.renderMode = kCAEmitterLayerBackToFront
        emitterLayer.emitterMode = kCAEmitterLayerOutline// 控制发射源模式 即形状
        emitterLayer.emitterShape = kCAEmitterLayerCircle
        
        emitterLayer.emitterCells = [emitterCell]
        
        self.view.layer.addSublayer(emitterLayer)
    }
    
    
    //雪花效果
    func emitterAnimate3(){
        self.view.backgroundColor = UIColor.black
        
        let emitterCell = CAEmitterCell()
        
        emitterCell.name = "snow"
        emitterCell.birthRate = 150
        emitterCell.lifetime = 5
        
        //yAcceleration 和 xAcceleration 分别表示颗粒在y和x方向上面运动的加速度
        emitterCell.yAcceleration = 70.0
        emitterCell.xAcceleration = 10.0
        emitterCell.velocity = 20.0 //velocity表示颗粒运动的速度
        emitterCell.emissionLongitude = CGFloat(-Double.pi/2);//表示颗粒初始时刻发射的方向(-M_PI_2 表示竖直往上发射)
        emitterCell.velocityRange = 200//加上这句代码之后，随机产生的速度范围为 -180(20 - 200) 到 220(20 + 200)
        emitterCell.emissionRange = CGFloat(Double.pi/2) //我们可以将发射器的发射角度随机化
        
        //R G B alpha 颜色速度渐变
        emitterCell.color = UIColor(red: 0.9 ,green: 1.0 ,blue:1.0 ,alpha:1).cgColor
        emitterCell.greenSpeed = 0.3
        emitterCell.redSpeed = 0.3
        emitterCell.blueSpeed = 0.3
        
        emitterCell.scaleSpeed = -0.03// 速度缩放比例
        emitterCell.scale = 0.1  //缩放比例
        emitterCell.scaleRange = 0.1
        
        emitterCell.contents = UIImage(named: "snow")!.cgImage
        
        let emitterLayer = CAEmitterLayer()
        
        
        //确定发射器的位置及尺寸
        emitterLayer.position = CGPoint(x: self.view.center.x, y: -70)
        emitterLayer.emitterSize = CGSize(width: UIScreen.main.bounds.size.width, height: 50)
        emitterLayer.emitterShape = kCAEmitterLayerRectangle
        emitterLayer.emitterCells = [emitterCell]
        
        self.view.layer.addSublayer(emitterLayer)
    }
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  swiftTest.swift
//  ImgDownloadDemo
//
//  Created by LongMa on 2020/8/28.
//  Copyright © 2020 my. All rights reserved.
//

import UIKit

class TestVC: UIViewController{
    
    //如果写了形参，Xcode会提示在参数名前加_，麻烦，没必要
//    typealias MylBlock = (_ a: Int,_ b: Int) -> Int?
    
    //推荐写法，只声明，不写形参
    typealias MylBlock = (Int, Int) -> Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        //https://fuckingclosuresyntax.com/
        blockTest()
    }
    
    private func blockTest(){
        var c = "0"
        
       print("start", c, Unmanaged.passUnretained(c as AnyObject).toOpaque())
        //推荐！易读，标准，无推断（效率高）,易拓展（比如需要用到[weak self]时,直接加到闭包前就好了！）
        //swift中，只要闭包里用到了属性，会像OC里 “对block外属性加了__block类似的拷贝”，在 闭包外 后续 访问变量时，会用新拷贝的变量。
        let block0: MylBlock = {
//            [weak self]
            (a: Int, b: Int) -> Int in
//            if let `self` = self{
//
//            }
        print("in", c, Unmanaged.passUnretained(c as AnyObject).toOpaque())
            return a + b;
        };
        
        c = "16"
        print("end", c, Unmanaged.passUnretained(c as AnyObject).toOpaque())
        
        /*log:
        start 0 0xdeb19e20a331ca85
        end 16 0xdeb19e20a332aa96
        in 16 0xdeb19e20a332aa96
        */
        
//        let block0: MylBlock = {
//            (a, b) in
//            return a + b;
//        };
        
//        let block0: MylBlock = {
////            return $0 + $1;
//            $0 + $1;//都可以
//        };
        
        let rslt0 = block0(1, 2);
        if let rslt0 = rslt0{
            print("rslt = " + "\(rslt0)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {
            
        }
    }
}

//
//  Dog.swift
//  PrivateMethodTest
//
//  Created by LongMa on 2022/8/25.
//

import Foundation

class Dog:Animal {
    override init() {
        super.init()
        eat()
        shout()
    }
    
    private func eat(){
        print("Dog eat")
    }
   
    //swift 会自动检查，发现父类有同名方法，提示添加 override，真好！
    override func shout(){
        print("Dog wangwang")
    }
}

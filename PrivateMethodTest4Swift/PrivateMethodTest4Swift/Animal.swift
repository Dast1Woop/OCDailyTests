//
//  Animal.swift
//  PrivateMethodTest
//
//  Created by LongMa on 2022/8/25.
//

import Foundation

class Animal:NSObject {
    override init() {
        super.init()
        eat()
        shout()
    }
    
    private func eat(){
        print("Animal eat")
    }
    
    func shout(){
        print("animal shout")
    }
}

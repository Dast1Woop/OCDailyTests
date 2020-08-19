//
//  weakStrongDance.swift
//  TimerImpTest
//
//  Created by LongMa on 2020/8/19.
//  Copyright © 2020 hautu. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject {
    let age = 10
    
    func test4Timer()  {
        let lTimer = Timer.init(timeInterval: 0.5, repeats: true) {
            [weak self] (timer) in
            if let `self` = self{
                print(self.age)
            }
        }
        RunLoop.current.add(lTimer, forMode: .common)
    }
}



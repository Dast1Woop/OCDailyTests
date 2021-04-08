//
//  AOABle.swift
//  AOATestOC
//
//  Created by LongMa on 2021/4/8.
//

import Foundation
import RTLSSensor
import CoreBluetooth

@objcMembers
class AOABle:NSObject{
    var ble:Ble = Ble.init()
    
    /**
     * ID
     * MAC 地址的后两个字节
     * 值域：[0, 0xffff]
     * 不可以是 [56E6, 9730, 0BAA, 8E5C, C403,DB34, 67F7, 2745, ACCC, 2F61]
     ]
     */
    public var id: UInt {
        set{
            ble.id = newValue
        }
        get{
            return ble.id
        }
    }
    
    /**
     * 报警状态
     */
    public var alarm: Bool{
        set{
            ble.alarm = newValue
        }
        get{
            return ble.alarm
        }
    }
    
    /**
     * 电池电量
     * 值域：[0, 10]
     * 实际电量为 值 * 10 * 100%
     * 例：值为 5 表示电池电量为 50%
     */
    public var battery: UInt{
        set{
            ble.battery = newValue
        }
        get{
            return ble.battery
        }
    }
    
    /**
     * 蓝牙状态开启时，想要执行的操作，比如开始广播
     */
    var blePowerOn:(()->())?
    
    override init() {
        super.init()
        
        ble.stateChange.then { (state) in
            if state == .poweredOn{
                if let bleOn = self.blePowerOn {
                    bleOn()
                }
            }
        }
    }
    
    public func start(){
        do{
            try ble.start()
            print("start")
        }catch let err{
            print(err)
        }
    }
    public func stop(){
        print("stop")
        ble.stop()
    }
}

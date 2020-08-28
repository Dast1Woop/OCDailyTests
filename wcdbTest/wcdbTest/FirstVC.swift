//
//  FirstVC.swift
//  wcdbTest
//
//  Created by LongMa on 2019/5/30.
//  Copyright © 2019 hautu. All rights reserved.
//

import WCDBSwift
import Foundation
import UIKit

class FirstVC: UIViewController {
    var gDataBase = Database.init(withPath: "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/HTAR/arImages.db")
    
    let TABLE_NAME = "students"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatDB()
    }
    
    func creatDB() {
        gDataBase.tag = 1
        gDataBase = try! Database.init(withExistingTag: 1)
        do{
            try gDataBase.create(table: TABLE_NAME, of: Sample.self)
        }catch{
            print("error:\(error.localizedDescription)")
        }
        
        // 以下代码等效于 SQL：CREATE TABLE IF NOT EXISTS TABLE_NAME(xxx)
        try! gDataBase.create(table: "bles", of: Sample.self)
        try! gDataBase.create(table: "arInfo", of: Sample.self)
    }
    
    var gCount = 40.0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lM1 = Sample.init()
        lM1.newName = "name1"
        lM1.age = 18
        gCount += 1
        lM1.weight = gCount
        
        try? gDataBase.insert(objects: lM1, intoTable: TABLE_NAME)
        try? gDataBase.insert(objects: lM1, on: [Sample.Properties.weight], intoTable: TABLE_NAME)
        
        //查询
        let sts: [Sample] = try! gDataBase.getObjects(fromTable: TABLE_NAME, where: Sample.Properties.age == 18)
        print(sts.count)
        
        //删除
        try? gDataBase.delete(fromTable: TABLE_NAME, where: Sample.Properties.weight > 50)
        
        let sts2: [Sample] = try! gDataBase.getObjects(fromTable: TABLE_NAME)
        
        print(sts2.count)
        DispatchQueue.global().async {
            let sts3: Sample = try! self.gDataBase.getObject(fromTable: self.TABLE_NAME) ?? Sample.init()
            print(sts3.weight as Any)
        }
        
        DispatchQueue.main.async {
            print(sts2.last?.weight as Any)
        }
        
//        let _: [Sample] = try! gDataBase?.getObjects(fromTable: TABLE_NAME) ?? []
    }
    
    func getCustomArImgsDBPath() -> String {
        let imageFolderPath: String = "\(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])/Will/Be/Created/arImages.db"
        print(imageFolderPath)
        return imageFolderPath
    }
    
}

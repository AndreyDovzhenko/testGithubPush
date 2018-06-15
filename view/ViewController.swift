//
//  ViewController.swift
//  view
//
//  Created by Andrey on 06.05.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit
class Logger {
    var age = 5
    func printData() {
        let cars = [
            Car(name: "Batmobile", color: "Black"),
            Car(name: "SuperCar", color: "Gold"),
            Car(name: "FamilyCar", color: "Grey")
        ]
        
        let indexOfObject = cars.index(where:{$0.name == "FamilyCar"})
        print(indexOfObject!)
        
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        let result = numbers.reduce(0, {summ, number in summ + number})
        print(result)
        
        let result1 = numbers.reduce (0,{result, number in result + number})
       
        let map = numbers.map {$0 * 3}
        let filter2 = numbers.filter {$0 == 3}
        let reduce2 = numbers.reduce (0, +)
        
        let v = [Logger()]

        let map2 = numbers.map {value in value * 3}
        let filter = numbers.filter {value in value == 3}
        let reduce = numbers.reduce (0,{summ, number in summ + number})
        
        
        let results = [[5,2,7], [4,8], [9,1,3]]
        let allResults = results.flatMap {$0.filter {$0 > 5} }
        print(allResults)
        
        let flatMaps =  [[[1,2,3],[4,5,6],[7,8,9]],
                        [[10,11,12],[13,14,15],[16,17,18]],
                        [[19,20,21],[22,23,24],[25,26,27]]]
        
        let resultsMap = flatMaps.flatMap {$0}.flatMap{$0}
        
        print(resultsMap)
        
        //[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]

        
        let resuce3 = v.reduce (0,{summ, number in
            summ + number.age
            
        })
        
//        func randomLogin()->String{
//            let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
//            let randomString = letters.reduce("Anonymous",{string, _ in
//                string + String(letters[getRandomCount(letters.count)])
//            })
//            return randomString
//        }
        
        let keys: [String?] = ["Tom", nil, "Peter", nil, "Harry"]
        print(keys[1])
        let validNames = keys.compactMap { $0 }
        print(validNames[2])
        
        
        if cars.count == 0  {
            
        }
        
        if cars.isEmpty {print("Пусто")}
        
        for car in cars {
            print(car.name)
        }
        
        cars.forEach { (car) in
            print(car.name)
        }
        cars.forEach { car in
            print(car.printDetails())
        }
        
        let array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
        array.forEach { (number) in
            print(number)
        }
    }
}

class Car {
    var name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class ViewController: UIViewController {
  
    private var animator: UIDynamicAnimator!
    private var gravity: UIGravityBehavior!
    private var collision: UICollisionBehavior!
    var names: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let log = Logger()
        log.printData()
    
        createSquareAndBarrier()
        let dictionary = ["Hello": "World"]
        
        guard let name = dictionary["Hello"] else { fatalError("error") }
        print(name)
        
    }
}

extension ViewController {
    
    //MARK:Methods
    
    /// Create view for animate
    fileprivate func createSquareAndBarrier() {
        let square = getSquare()
        let barrier = getBarrier()
        
        view.addSubview(square)
        view.addSubview(barrier)
        
        dimnamicAnimatorView(square)
        colisionBehaviorView(square, barrier)
    }
    
    fileprivate func getSquare() -> UIView {
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        return square
    }
    
    fileprivate func getBarrier() -> UIView {
        let barrier: UIView = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.red
        return barrier
    }
    
    fileprivate func dimnamicAnimatorView(_ square: UIView) {
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
    }
    
    fileprivate func colisionBehaviorView(_ square: UIView, _ barrier: UIView) {
        collision = UICollisionBehavior(items: [square,barrier])
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
}


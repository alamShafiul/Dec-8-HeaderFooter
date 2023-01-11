//
//  ModelData.swift
//  Dec-8-HeaderFooter
//
//  Created by Admin on 8/12/22.
//

import Foundation

struct Bike {
    var name: String
}
extension Bike {
    static var bikeLists = [Bike(name: "CB Shine Honda"),
                            Bike(name: "SP Shine Honda"),
                            Bike(name: "GSX-R 150 Suzuki")
    ]
}

struct Car {
    var name: String
}
extension Car {
    static var carLists = [Car(name: "Corolla Toyota"),
                           Car(name: "Alien Toyota")
    ]
}

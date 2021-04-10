//
//  ViewModel.swift
//  CompareItem
//
//  Created by William Santoso on 10/04/21.
//

import Foundation

//MARK: - Model
struct Input {
    var price: Double
    var qty: Int
}

//MARK: - View Model
class ViewModel: ObservableObject {
    @Published var inputs = [Input.init(price: 0, qty: 0),
                             Input.init(price: 0, qty: 0)
    ]
    @Published var pricesText: [String] = ["",""] {
        didSet {
            calculate()
        }
    }
    @Published var qtysText: [String] = ["",""] {
        didSet {
            calculate()
        }
    }
    @Published var result: String = "Input not complete"
    
    
    func calculate() {
        if !pricesText[0].isEmpty && !pricesText[1].isEmpty {
            if !qtysText[0].isEmpty && !qtysText[1].isEmpty {
                guard let prices0 = Double(pricesText[0]) else { return }
                guard let prices1 = Double(pricesText[1]) else { return }
                guard let qty0 = Double(qtysText[0]) else { return }
                guard let qty1 = Double(qtysText[1]) else { return }
                
                let pricePerQty0 = prices0/qty0
                let pricePerQty1 = prices1/qty1
                let diff = pricePerQty0 - pricePerQty1
                let diffString = String(format: "%.2f", abs(diff))

                if diff == 0 {
                    result = "Price is the same"
                } else if diff < 0 {
                    result = "Price First is Cheaper by \(diffString) per unit"
                } else {
                    result = "Price Second is Cheaper by \(diffString) per unit"
                }
            } else {
                result = "Input not complete"
            }
        } else {
            result = "Input not complete"
        }
    }
}

extension Double {
    func toString2Digit() {
        
    }
}

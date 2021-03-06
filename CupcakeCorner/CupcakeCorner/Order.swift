//
//  Order.swift
//  CupcakeCorner
//
//  Created by Aleksandar Filipov on 4/5/22.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
                case order
    }
    
    @Published var order = OrderStruct()
    
    struct OrderStruct: Codable {
        
        static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
        
        var type = 0
        var quantity = 3
        
        var extraFrosting = false
        var addSprinkles = false
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
        
        var hasValidAddress: Bool {
            if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return false
            }
            
            return true
        }
        
        var cost: Double {
            var cost = Double(quantity) * 2
            
            cost += (Double(type) / 2)
            
            if extraFrosting {
                cost += Double(quantity)
            }
            
            if addSprinkles {
                cost += Double(quantity) / 2
            }
            
            return cost
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(order, forKey: .order)
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        order = try container.decode(OrderStruct.self, forKey: .order)
    }
}

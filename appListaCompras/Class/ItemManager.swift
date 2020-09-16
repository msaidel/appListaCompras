//
//  ItemManager.swift
//  appListaCompras
//
//  Created by Marcela Saidel on 16/09/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation

class ItemManager {
    
    var listItens:[Item] = []
   
    func addItem(item: Item) {
        listItens.append(item)
    }
    
    func editItem(item: Item) {
        
        for itemInList in listItens {
            
            if itemInList.name == item.name {
                itemInList.quantity  = item.quantity
            }
            
        }
        
    }
    
    func removeItem(item: Item) {
        
        let newList = listItens.filter { $0.name != item.name }
        listItens = newList
        
    }
    
    
    func isExists(name: String) -> Bool {
        
        var hasItem = false

        for item in listItens {
            if item.name == name {
                hasItem = true
            }
        }
        
        return hasItem
    }
    
    func getQuantity(name: String) -> Int {
       
        var quantity = 0
        
        for item in listItens {
            if item.name == name {
                quantity = item.quantity
            }
        }
        
        return quantity
        
    }
    
    func setQuantity(item: Item) {
        
        for itemList in listItens {
            if itemList.name == item.name {
                itemList.quantity = item.quantity
            }
        }
               
    }
    
    func getAllItens() -> String {
        
        var itens = ""
        
        for itemList in listItens {
            itens = "\(itens)\(itemList.name)\n"
        }
        
        return itens
    }
    
}

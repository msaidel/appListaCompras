//
//  ViewController.swift
//  appListaCompras
//
//  Created by Marcela Saidel on 16/09/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldQuantity: UITextField!
    @IBOutlet weak var lblProducts: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnRemove: UIButton!
    
    var myList = ItemManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        textFieldName.delegate = self
        textFieldQuantity.delegate = self
        
        btnSave.setTitle("Salvar", for: .normal)
        btnRemove.isHidden = true
        
    }

    func isExistsProduct(name: String) -> Bool {
       return myList.isExists(name: name)
    }
    
    
    func clearScreen() {
        
        closeKeyboard()
        
        textFieldQuantity.text = ""
        textFieldName.text = ""
        lblProducts.text = ""
    }
    
    func closeKeyboard() {
        
        textFieldQuantity.resignFirstResponder()
        textFieldName.resignFirstResponder()
    }
    
    @IBAction func tapAddProducts(_ sender: Any) {
        closeKeyboard()
        
        var qtd = 0
        if textFieldQuantity.text == nil || textFieldQuantity.text!.isEmpty {
            qtd = 0
        } else {
            qtd = Int(textFieldQuantity.text!)!
        }
        
        let name = textFieldName.text!
        
        
        let item = Item(name: name, quantity: qtd)
        if isExistsProduct(name: name.lowercased()) {
            myList.editItem(item: item)
        } else {
            myList.addItem(item: item)
        }
        
        lblProducts.text = myList.getAllItens()
        
        
    }
    
    
    @IBAction func btnRemove(_ sender: Any) {
        closeKeyboard()
    }
    

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == textFieldName {
            
            if textField.text != nil && !textField.text!.isEmpty {
               
                let nameProduct = textFieldName.text!
                     
                //verify exists products
                if isExistsProduct(name: textFieldName.text!.lowercased()) {
                  
                    //product exists
                    let quantity = self.myList.getQuantity(name: nameProduct.lowercased())
                    textFieldQuantity.text = String(quantity)
                    textFieldQuantity.becomeFirstResponder()
                    
                    btnSave.setTitle("Salvar edição", for: .normal)
                    btnRemove.isHidden = false
                    
                    lblProducts.text = ""
                    lblProducts.text = myList.getAllItens()
                    
                } else {
                    
                    btnSave.setTitle("Salvar", for: .normal)
                    btnRemove.isHidden = true
                    
                }
                
            }
            
        } else {
            
//            if textField.text != nil && !textField.text!.isEmpty {
//
//
//
//            }
            
        }
        
    }
    
}


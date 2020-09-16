//
//  StringExtension.swift
//  appListaCompras
//
//  Created by Marcela Saidel on 16/09/20.
//  Copyright © 2020 Marcela Saidel. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func removeCharSpecial() {
        
        self.folding(options: .diacriticInsensitive, locale: .current).lowercased()
       
    
    }
    
}

//
//  DetalleViewController.swift
//  CL2_NOEMI_VARGAS
//
//  Created by DAMII on 29/10/23.
//

import UIKit

class DetalleViewController: UIViewController {
    

    @IBOutlet weak var lblDni: UILabel!
    
    @IBOutlet weak var lblCliente: UILabel!
    
    
    @IBOutlet weak var lblTasa: UILabel!
    
    
    @IBOutlet weak var lblMonto: UILabel!
    
    var bean : InversionEntity!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("Estas en detalle LOAD")
        
        
        lblDni.text=bean.dni
        lblCliente.text=bean.cliente
        lblTasa.text=bean.tasa
        lblMonto.text=String(bean.monto)
    
    

        
    }
    

  
}

//
//  NuevoViewController.swift
//  CL2_NOEMI_VARGAS
//
//  Created by DAMII on 29/10/23.
//

import UIKit
import DropDown
import Toaster

class NuevoViewController: UIViewController {
    
    //crear objeto combo
    var dropdown = DropDown()
    

    @IBOutlet weak var txtDni: UITextField!
    
    @IBOutlet weak var txtCliente: UITextField!
    
    @IBOutlet weak var txtMonto: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func btnComboTasa(_ sender: UIButton) {
        //datos
        dropdown.dataSource=["4.2%","10%"]
        
        //vincular dropdown
        dropdown.anchorView = sender
        
        //mostrar lista
        dropdown.bottomOffset = CGPoint(x: 0, y: (dropdown.anchorView?.plainView.bounds.height)!)
        
        //mostrar elementos
        dropdown.show()
        
        //evento
        dropdown.selectionAction = {[unowned self] (index: Int, item: String) in print("Selected item:\(item) at index:\(index)")
            sender.setTitle(item, for: .normal)
            
        }
    }
    
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        
        //var listaInversiones
        
        var mensaje:String = ""
        
        //validar DNI, NOMBRE
        if(txtDni.text == "") {
            mensaje+="Debes ingresar tu dni \n"
        }
        
        if(txtCliente.text == "") {
            mensaje+="Debes ingresar tu Nombre y apellido \n"
        }
        
        if(txtMonto.text == "") {
            mensaje+="Debes ingresar monto \n"
        }
        
        var posicionCombo:Int = dropdown.indexForSelectedRow ?? -1
        print("Posicion combo : ", posicionCombo)
        
        if(posicionCombo == -1){
            mensaje+="Debes Seleccionar una tasa \n"
        }
        
        //Valida Verdad
        if(mensaje != ""){
            Toast(text: mensaje).show()
            return
            
        }
        
        
        let dni=txtDni.text ?? "0"
        let cli=txtCliente.text ?? ""
        let mont=Double(txtMonto.text ?? "0") ?? 0
        let ta=dropdown.selectedItem ?? " "
        
        
        //crear variable de tipo Cliente
        let objeto=Inversion(dni: dni, cliente: cli, tasa: ta, monto: mont)
        //invocar al metodo registrarCliente
        ControladorInversion().registrarInversion(bean: objeto)
        Toast(text: "Registro Correcto").show()
        
        print("Registro correcto")
        
    }
    
    
    

  

}

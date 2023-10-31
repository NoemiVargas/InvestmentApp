//
//  ControladorInversion.swift
//  CL2_NOEMI_VARGAS
//
//  Created by DAMII on 29/10/23.
//

import UIKit

class ControladorInversion: NSObject {
    
    //metodo registrar
    func registrarInversion(bean:Inversion){
        //1.objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //2.acceder a la bd
        let BD=delegate.persistentContainer.viewContext
        //3. indicar tabla para registrar
        let tabla = InversionEntity(context: BD)
        //4. controlar exception
        do{
            //5.asignar valor a los atributos de tabla
            tabla.dni=bean.dni
            tabla.cliente=bean.cliente
            tabla.monto=bean.monto
            tabla.tasa=bean.tasa
            //6. grabar
            try BD.save()
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    //metodo listar
    func listadoInversiones()->[InversionEntity]{
        //1. declarar objeto de tipo arreglo
        var datos:[InversionEntity]!
        //2.objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //3.acceder a la bd
        let BD=delegate.persistentContainer.viewContext
        //4. controlar exception
        do{
            //5.obtener registros de ClienteEntity
            let registros=InversionEntity.fetchRequest()
            //bucle
            datos = try BD.fetch(registros)
        }catch let ex as NSError{
            print("Error estado de supervisores",ex.localizedDescription)
        }
        return datos
    }

}

//
//  ViewController.swift
//  CL2_NOEMI_VARGAS
//
//  Created by DAMII on 29/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    //listar
    var listaInversiones: [InversionEntity]=[]
    var pos = -1
    
    
    @IBOutlet weak var tvInversion: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaInversiones=ControladorInversion().listadoInversiones()
        tvInversion.dataSource=self
        tvInversion.delegate=self
        tvInversion.rowHeight=70
        
    }
    
    
    @IBAction func btnRefrescar(_ sender: UIButton) {
        print("Refresca datos")
        listaInversiones=ControladorInversion().listadoInversiones()
        tvInversion.reloadData()
        
    }
    
    
    @IBAction func btnNuevaInversion(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaInversiones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase UITableViewCell
        let data=tvInversion.dequeueReusableCell(withIdentifier: "row")
        as! ItemTableViewCell
        //acceder a los lables's
        data.lblDni.text="DNI : "+listaInversiones[indexPath.row].dni!
        data.lblCliente.text="Cliente : "+listaInversiones[indexPath.row].cliente!
        
        return data
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        print("estas ene  TABLE VIEW",pos)
        performSegue(withIdentifier: "datos", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //detalle
        if segue.identifier=="datos" {
            print("Ya estas en el detalle")
            let row = segue.destination as! DetalleViewController
            print("Tienes la info de detalle")
            print("esto es pos : ", pos)
            
            row.bean = listaInversiones[pos]
            
            
        }
        
    }
}

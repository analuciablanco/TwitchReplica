//
//  TablaVideosController.swift
//  Twitch
//
//  Created by Tonny Gammer on 8/20/19.
//  Copyright © 2019 Blancovery. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class TablaVideosController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // Tamaño de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    

    
    // Número de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arregloTareas2.count
    }
    
    // Llenado de celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celdaVideo = tableView.dequeueReusableCell(withIdentifier: "idCeldaVideo") as! CeldaVideoController
        
        celdaVideo.lblTitulo.text = arregloTareas[indexPath.row].titulo
        celdaVideo.lblDescripcion.text = arregloTareas[indexPath.row].descripcion
        celdaVideo.lblFecha.text = arregloTareas[indexPath.row].fecha
        
        let estado = arregloTareas[indexPath.row].estado
        switch estado {
        case 1:
            celdaVideo.lblTipoVideo.text = "EN VIVO"
            celdaVideo.viewEstado.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)
        case 2:
            celdaVideo.lblTipoVideo.text = "RETRANSMICIÓN"
            celdaVideo.viewEstado.backgroundColor = UIColor.darkGray
        case 3:
            celdaVideo.lblTipoVideo.text = "EDITADO"
        default:
            print("No tiene estado.")
        }
        
        celdaVideo.imgMiniaturaVideo.kf.setImage(with: URL(string: arregloTareas[indexPath.row].urlMiniaturaVideo))
        celdaVideo.imgIconoStreamer.kf.setImage(with: URL(string: arregloTareas[indexPath.row].urlIconoStreamer!))
        
        return celdaVideo
    }
    
    @IBOutlet weak var tblListaVideos: UITableView!
    var arregloTareas : [Tarea] = []
    var arregloTareas2 : [Tarea] = []
    
    var conteo: Int = 0
    var imgMiniatura: String = ""
    var imgIcono: String = ""
    
    let arregloMiniaturas: [String] = ["https://securingtomorrow.mcafee.com/wp-content/uploads/2018/11/twitch2.jpg",
    "https://www.slashgear.com/wp-content/uploads/2019/03/twitch-squad-stream.jpg?w=640",
    "https://i.pinimg.com/originals/90/8c/9f/908c9f5043a58b6718e16f64f385cf8c.jpg"]
    
    let arregloIconos: [String] = ["https://upload.wikimedia.org/wikipedia/en/thumb/e/e0/WPVG_icon_2016.svg/498px-WPVG_icon_2016.svg.png",
    "https://www.waterlogic.com/media/shared/careers/Icons/icon-honesty.png",
    "https://www.burns-360.com/wp-content/uploads/2018/09/Sample-Icon.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblListaVideos.delegate = self
        tblListaVideos.dataSource = self
        
        Alamofire.request("https://getapp.mawetecnologias.com/api/tareas", method: .get, parameters: nil, headers: nil).responseJSON { respuesta in
            
            switch respuesta.result {
                
            case.success(let value): print (value)
            
            self.arregloTareas.removeAll()
            
                if let objetoJSON = value as? NSDictionary {
                    
                    if let tareasArray = objetoJSON.value(forKey: "tareas") as? NSArray {
                        
                        for tarea in tareasArray {
                            
                            if let objetoTarea = tarea as? NSDictionary {
                                
                                switch self.conteo {
                                case 0: self.imgMiniatura = self.arregloMiniaturas[0]
                                        self.imgIcono = self.arregloIconos[0]
                                    
                                case 1: self.imgMiniatura = self.arregloMiniaturas[1]
                                        self.imgIcono = self.arregloIconos[1]
                                    
                                case 2: self.imgMiniatura = self.arregloMiniaturas[2]
                                        self.imgIcono = self.arregloIconos[2]
                                   
                                default:
                                    print("no hay más imágenes por mostrar")
                                }
                                
                                self.conteo += 1
                                
                                let nuevaTarea = Tarea.init(diccionario: objetoTarea, urlMiniaturaVideo: self.imgMiniatura, urlIconoStreamer: self.imgIcono)
                                
                                self.arregloTareas.append(nuevaTarea)
                                
                                }
                            }
                            
                        }
                    
                        self.arregloTareas2 = self.arregloTareas
                        self.tblListaVideos.reloadData()
                    }
     
            case .failure(let value): print(value)
                
            }
        }

    }

}




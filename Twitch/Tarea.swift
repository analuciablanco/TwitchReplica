//
//  Tarea.swift
//  Twitch
//
//  Created by Tonny Gammer on 8/20/19.
//  Copyright © 2019 Blancovery. All rights reserved.
//

import Foundation

class Tarea {
    var urlMiniaturaVideo : String
    var urlIconoStreamer : String?
    var titulo : String
    var descripcion : String?
    var fecha : String?
    var hora : String?
    var estado : Int
    
    // Variables obligatorias
    init(urlMiniaturaVideo : String,
         titulo : String,
         estado : Int) {
        
        self.urlMiniaturaVideo = urlMiniaturaVideo
        self.titulo = titulo
        self.estado = estado
    }
    
    // Todas las variables
    init(urlMiniaturaVideo : String,
        urlIconoStreamer : String?,
        titulo : String,
        descripcion : String?,
        fecha : String?,
        hora : String?,
        estado : Int) {
        
        self.urlMiniaturaVideo = urlMiniaturaVideo
        self.urlIconoStreamer = urlIconoStreamer
        self.titulo = titulo
        self.descripcion = descripcion
        self.fecha = fecha
        self.hora = hora
        self.estado = estado
    }
    
    // Variables proporcionadas por enlaces externos (imágenes)
    init(urlMiniaturaVideo : String,
         urlIconoStreamer : String?) {
        
        self.urlMiniaturaVideo = urlMiniaturaVideo
        self.urlIconoStreamer = urlIconoStreamer
        self.titulo = ""
        self.estado = 0
    }
    
    // Variables proporcionadas por JSON
    init(titulo : String,
         descripcion : String?,
         fecha : String?,
         hora : String?,
         estado : Int) {
        
        self.urlMiniaturaVideo = ""
        self.titulo = titulo
        self.descripcion = descripcion
        self.fecha = fecha
        self.hora = hora
        self.estado = estado
    }
    
    // Variables para asignas de JSON a modelo
    init(diccionario : NSDictionary) {
        self.urlMiniaturaVideo = ""
        titulo = ""
        descripcion = ""
        fecha = ""
        hora = ""
        estado = 0
        
        if let titulo = diccionario.value(forKey: "titulo") as? String {
            self.titulo = titulo
        }
        
        if let descripcion = diccionario.value(forKey: "descripcion") as? String {
            self.descripcion = descripcion
        }
        
        if let fecha = diccionario.value(forKey: "fecha") as? String {
            self.fecha = fecha
        }
        
        if let hora = diccionario.value(forKey: "hora") as? String {
            self.hora = hora
        }
        
        if let estado = diccionario.value(forKey: "estado") as? Int {
            self.estado = estado
        }
    }
    
    // Borrar después, cuando le de formato para tomar imagenes de JSON
    init(diccionario : NSDictionary, urlMiniaturaVideo : String,
         urlIconoStreamer : String?) {
        self.urlMiniaturaVideo = urlMiniaturaVideo
        self.urlIconoStreamer = urlIconoStreamer
        titulo = ""
        descripcion = ""
        fecha = ""
        hora = ""
        estado = 0
        
        if let titulo = diccionario.value(forKey: "titulo") as? String {
            self.titulo = titulo
        }
        
        if let descripcion = diccionario.value(forKey: "descripcion") as? String {
            self.descripcion = descripcion
        }
        
        if let fecha = diccionario.value(forKey: "fecha") as? String {
            self.fecha = fecha
        }
        
        if let hora = diccionario.value(forKey: "hora") as? String {
            self.hora = hora
        }
        
        if let estado = diccionario.value(forKey: "estado") as? Int {
            self.estado = estado
        }
    }
}

//
//  Imagen.swift
//  Twitch
//
//  Created by Tonny Gammer on 8/21/19.
//  Copyright © 2019 Blancovery. All rights reserved.
//

import Foundation

// Modelo de las imágenes para la lista de videos.
class Imagen {
    var urlMiniaturaVideo : String
    var urlIconoStreamer : String?
    
    init (urlMiniaturaVideo : String,
          urlIconoStreamer : String) {
        
        self.urlMiniaturaVideo = urlMiniaturaVideo
        self.urlIconoStreamer = urlIconoStreamer
    }
}

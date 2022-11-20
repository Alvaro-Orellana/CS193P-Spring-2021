//
//  PampaModel.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 21-09-22.
//

import Foundation

let json = """
    {
        "nav_bar": {
            "title": "Nombre del flujo",
            "show_back_button": false,
            "is_transparent": true,
        },
        "header": {
            "title": "<b>Title</b>",
            "description": "Bajada con hasta 20 líneas de texto. Lorem ipsum dolor sit amet consectetur. <a href='www.google.com'>Link</a>."
        },
        "body": [],
        "footer": {
            "buttons": [
                 {
                   "id": "primary_id",
                   "size": "large",
                   "hierarchy": "loud",
                   "label": "Actualizar datos seleccionados",
                   "action": {
                        "type": "push",
                        "data": {
                             "link": "https://www.mercadolibre.com.ar",
                             "stack_config": "clear_stack"
                        }
                   }
                 },
                 {
                   "id": "primary_id",
                   "size": "large",
                   "hierarchy": "quiet",
                   "label": "Actualizar datos seleccionados",
                   "action": {
                        "type": "push",
                        "data": {
                             "link": "https://www.mercadolibre.com.ar",
                             "stack_config": "clear_stack"
                        }
                   }
                 },
                 {
                   "id": "primary_id",
                   "size": "large",
                   "hierarchy": "transparent",
                   "label": "Actualizar datos seleccionados",
                   "action": {
                        "type": "push",
                        "data": {
                             "link": "mercadopago://home",
                             "stack_config": "clear_stack"
                        }
                   }
                 }
              ]
        }
    }
    """.data(using: .utf8)!
    //return Result { try JSONDecoder().decode(PampaBaseModel.self, from: json) }

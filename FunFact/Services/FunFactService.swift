//
//  FunFactService.swift
//  FunFact
//
//  Created by Murilo Araujo on 26/05/20.
//  Copyright © 2020 LG Sistemas SA. All rights reserved.
//

import Foundation
import Alamofire

class FunFactService {
    static let shared = FunFactService()
    private init() {
        
    }
    var existeAtalho = true
    var tipo: String?
    
    
    public func getFunFact(for type: TipoFunFact, completion: @escaping (_ value: String?)->Void) {
        
        let urlString: String = {
            switch type {
            case .date:
                return "https://numbersapi.p.rapidapi.com/6/21/date"
            case .math:
                return "https://numbersapi.p.rapidapi.com/1729/math"
            case .random:
                return "https://numbersapi.p.rapidapi.com/random/trivia"
            }
        }()
        let dictHeaders: [String:String] = [
                    "x-rapidapi-host":"numbersapi.p.rapidapi.com",
                                              "x-rapidapi-key":"39ab72ef25msh0785493cef7be65p17ba89jsne095f49f661e",
                                              "useQueryString":"true"
                ]
        let headers: HTTPHeaders = HTTPHeaders(dictHeaders)
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        do {
            let request = try URLRequest(url: url, method: .get, headers: headers)
            
            URLSession.shared.dataTask(with: request) { (data, resposta, erro) in
                if erro != nil {
                    completion(nil)
                    print("Erro!: \(erro!.localizedDescription)")
                    return
                }
                
                if data != nil {
                    let dataString = String(data: data!, encoding: .utf8)
                    completion(dataString)
                }
            }.resume()
        } catch let e {
            completion(nil)
            print("Erro!: \(e.localizedDescription)")
        }

    }
}

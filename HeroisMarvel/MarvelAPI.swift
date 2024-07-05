//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Vitoria Ortega on 03/07/24.
//  Copyright © 2024 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "98ebdca504a566e1872f8f49a7368ace26383ecc"
    static private let publicKey = "870c7a5f642ead24f996d96b3feaf2f3"
    static private let limit = 50
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print("URL:", url)
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("Valor recebido:", value)
                guard let data = response.data else {
                    print("Erro: Não foi possível obter os dados da resposta.")
                    onComplete(nil)
                    return
                }
                
                do {
                    let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                    guard marvelInfo.code == 200 else {
                        print("Erro: Código de erro da Marvel API:", marvelInfo.code)
                        onComplete(nil)
                        return
                    }
                    onComplete(marvelInfo)
                } catch {
                    print("Erro ao decodificar resposta JSON:", error)
                    onComplete(nil)
                }
                
            case .failure(let error):
                print("Erro na requisição:", error)
                onComplete(nil)
            }
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts + privateKey + publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}

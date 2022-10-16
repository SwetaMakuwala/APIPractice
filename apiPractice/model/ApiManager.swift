//
//  ApiManager.swift
//  apiPractice
//
//  Created by sweta makuwala on 11/09/22.
//

import Foundation
//ravi : model (encodable) (decodable)https://youtu.be/rvgisFJedqk

struct APIManager{
    //MARK: - native post
    func imageUsingUrlSession(completion : ((_ data : Data) -> Void)? = nil) {
        var dataToReturn = Data()
        let task = URLSession.shared.dataTask(with: URL(string: "https://randomuser.me/api/portraits/med/women/12.jpg")!) { data, response , error in
            guard error == nil else { return}
            if data != nil && data?.count != 0 {
                dataToReturn = data!
                completion?(dataToReturn)
                
            }
        }.resume()
        
    }
    
    func nativePostDictionary() {

        let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        guard  let requestBody = try? JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted) else { return }
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return}
            guard let data = data else {return }
           // print(String(data: data, encoding: .utf8))
           let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(JsonApiData.self, from: data)
                print(decodedData)
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    func nativePostWithModel() {
        
        struct User : Codable {
            var name : String
            var email : String
            var password: String
            
        }
       
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
       // let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]
      //  guard  let requestBody = try? JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted) else { return }
        let userData = User(name: "ravi", email: "codexcat15@gmail.com", password: "1234")
        guard  let requestBody = try? JSONEncoder().encode(userData) else { return }
        
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else { return}
            guard let data = data else {return }
           // print(String(data: data, encoding: .utf8))
           let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(JsonApiData.self, from: data)
                print(decodedData)
            }catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}

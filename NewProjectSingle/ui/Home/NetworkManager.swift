//
//  NetworkManager.swift
//  NewProjectSingle
//
//  Created by Satendra Pal Singh on 25/02/1943 Saka.
//

import Foundation
class NetworkManager {
    
   
    func fetchAlbum(completionHandler: @escaping([UserAlbum]) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,response,error) in
        if let error = error {
               print("Error with fetching films: \(error)")
               return
             }
             
             guard let httpResponse = response as? HTTPURLResponse,
                   (200...299).contains(httpResponse.statusCode) else {
               print("Error with the response, unexpected status code: \(response)")
               return
             }

             if let data = data,
               let userAlbumSummary = try? JSONDecoder().decode([UserAlbum].self, from: data) {
//                print(userAlbumSummary)
                completionHandler(userAlbumSummary)
             }
           })
           task.resume()
    }
}

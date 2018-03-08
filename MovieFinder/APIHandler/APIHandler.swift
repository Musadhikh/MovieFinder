//
//  APIHandler.swift
//  MovieFinder
//
//  Created by Musadhikh Muhammed K on 08/03/18.
//  Copyright © 2018 musadhikh. All rights reserved.
//

import Foundation

// http://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=batman&page=1

struct API {
    fileprivate static let ApiKeyValue = "2696829a81b1b5827d515ff121700838"
    fileprivate static let BaseUrl = "http://api.themoviedb.org/3"
    fileprivate static let ApiKey = "api_key=%@"
    fileprivate static let Query = "&query=%@"
    fileprivate static let Page = "&page=%d"
    fileprivate static let MovieSearch = "/search/movie?"
    fileprivate static let ImageBaseUrl = "http://image.tmdb.org/t/p/w92"
}

class APIHandler {
    
    static let sharedHandler = APIHandler()
    
    func getMovies(for movie: String, page: Int, onCompletion: @escaping (_ result: Array<Any>) -> Void)  {
        var urlString = API.BaseUrl
        urlString.append(API.MovieSearch)
        let apiKey = String(format: API.ApiKey, API.ApiKeyValue)
        urlString.append(apiKey)
        let query = String(format: API.Query, movie)
        urlString.append(query)
        let page = String(format: API.Page, page)
        urlString.append(page)
        self.getData(fromUrl: urlString, onCompletion: onCompletion)
    }
    
    private func getData(fromUrl urlString:String, onCompletion: @escaping (_ result: Array<Any>) -> Void) {
        let url = URL(string: urlString)
        guard let _ = url else {
            onCompletion([])
            return
        }
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let _ = data else {
                onCompletion([])
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
                let results = json["results"] as? Array<Any>
                guard let _ = results else {
                    onCompletion([])
                    return
                }
                onCompletion(results!)
                
            } catch {
            
            }
            
        }
        task.resume()
        
    }
}

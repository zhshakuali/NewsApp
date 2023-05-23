//
//  AppCaller.swift
//  NewsApp
//
//  Created by Жансая Шакуали on 10.03.2023.
//

import Foundation
final class AppCaller{
    static let chared = AppCaller()
    
    struct Constants {
        static let topHeadLinesUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=667a6520830047daaf1aa64aafd4fc77")
    }
    private init(){}
        
       func getTopstories(completion: @escaping(Result<[Article], Error>) -> Void){
            guard let url = Constants.topHeadLinesUrl else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error{
                    completion(.failure(error))
                } else if let data = data{
                    do{
                        let result = try JSONDecoder().decode(APImodel.self, from: data)
                        
                        print(result.articles.count)
                        completion(.success(result.articles))
                    } catch{
                        completion(.failure(error))
                    }
                }
            }
           task.resume()
        }
        
   
}

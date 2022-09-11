//
//  NewsListViewModel.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 10/09/2022.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var state: State = .idle
    @Published var newsResponse: NewsResponse?
    
    func fetchNews() {
        // call api
        state = .loading
        
        //https://newsapi.org/v2/top-headlines?country=us&apiKey=b7d3753b32154e79a4c418efd2991763
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=b7d3753b32154e79a4c418efd2991763")! // note, https, not http
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard
                    error == nil,
                    let data = data,
                    let string = String(data: data, encoding: .utf8)
                else {
                    self.state = .failed
                    print(error ?? "Unknown error")
                    return
                }
                self.state = .loaded
                print(string)
                
                //NewsResponse \\ for more details: https://www.avanderlee.com/swift/json-parsing-decoding/
                let jsonData = string.data(using: .utf8)!
                let newsAPIDecoder = NewsAPIDecoder()
                self.newsResponse = try! newsAPIDecoder.decode(data: jsonData)
            }
        }
        task.resume()
    }
}

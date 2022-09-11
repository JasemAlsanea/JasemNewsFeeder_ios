//
//  NewsSourceDecoder.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 10/09/2022.
//

import Foundation

class NewsAPIDecoder {
    lazy private var iso8601: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return dateFormatter
    }()
    
    lazy private var iso8601mm: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        
        return dateFormatter
    }()
    
    func decode(data: Data) throws -> NewsResponse {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = makeDateDecodingStategy()
        
        let response = try? jsonDecoder.decode(NewsResponse.self, from: data)
        
        if let code = response?.code, let message = response?.message {
            throw NewsAPIError.serviceError(code: code, message: message)
        }
        
        if response != nil {
            return response!
        }

        throw NewsAPIError.unableToParse
    }
}

private extension NewsAPIDecoder {
    func makeDateDecodingStategy() -> JSONDecoder.DateDecodingStrategy {
        return .custom ({ [weak self] decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            if let date = self?.iso8601.date(from: dateStr) {
                return date
            }
            
            if let date = self?.iso8601mm.date(from: dateStr) {
                return date
            }
            
            throw NewsAPIError.unableToParse
        })
    }
}

struct NewsResponse: Decodable {
    let status: String
    let code: String?
    let message: String?
    let sources: [NewsSource]?
    let articles: [NewsArticle]?
}

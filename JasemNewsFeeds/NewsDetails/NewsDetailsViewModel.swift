//
//  NewsDetailsViewModel.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 11/09/2022.
//

import Foundation
class NewsDetailsViewModel: ObservableObject {
    @Published var imgSource: URL?
    @Published var author: String?
    @Published var title: String
    @Published var description: String?
    @Published var publishedAt: Date
    @Published var navigationTitle: String
    
    init(imgSource: URL?,
         author: String?,
         title: String,
         description: String?,
         publishedAt: Date,
         navigationTitle: String) {
        self.imgSource = imgSource
        self.author = author
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.navigationTitle = navigationTitle
    }
}

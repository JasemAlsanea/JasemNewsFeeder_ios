//
//  ContentView.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 10/09/2022.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsListViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            Text("")
                .padding()
                .onAppear {
                    viewModel.fetchNews()
                }
        case .loading:
            ProgressView()
        
        case .loaded:
            if let articles = viewModel.newsResponse?.articles {
                ScrollView {
                    ForEach(articles, id: \.title) { article in
                        NavigationLink {
                            NewsDetailsView(
                                viewModel: NewsDetailsViewModel(
                                    imgSource: article.urlToImage,
                                    author: article.author,
                                    title: article.title,
                                    description: article.articleDescription,
                                    publishedAt: article.publishedAt,
                                    navigationTitle: article.title))
                        } label: {
                            HStack {
                                AsyncImage(
                                    url: article.urlToImage,
                                    content: { result in
                                        result
                                            .image?.resizable()
                                            .frame(width: 50.0, height: 50.0)
                                    })
                                
                                Text(article.title)
                                    .foregroundColor(.black)
                            }
                        }

                    }
                }
            }
        case .failed:
            Text("Failed")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

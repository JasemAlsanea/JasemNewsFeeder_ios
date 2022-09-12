//
//  NewsDetailsView.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 10/09/2022.
//

import SwiftUI

struct NewsDetailsView: View {
    @StateObject var viewModel: NewsDetailsViewModel
    
    var body: some View {
        List {
            AsyncImage(url: viewModel.imgSource)
                .scaledToFit()
                .frame(height:170)
                .cornerRadius(4)

            Text("\(viewModel.title)")
                .lineLimit(2)
            
            Text("\(viewModel.publishedAt)")
            Spacer()
            Text("\(viewModel.author ?? "")")
            
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("\(viewModel.description ?? "")")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView(viewModel:
                            NewsDetailsViewModel(
                                imgSource: URL(string: "tesla_superchargers"),
                                author: "BBC news",
                                title: "Tesla to build the world's biggest CCS-compatible Supercharger locations with Magic Docks",
                                description: "Ein Bäcker weiß nicht, welche Brötchenpreise er noch verlangen kann. Ein Metallbauer erwägt, wegen der steigenden Energiepreise die Produktion ins Ausland zu verlagern. Wie lange geht das noch gut?",
                                publishedAt: Date(),
                                navigationTitle: "All News gg"))
    }
}

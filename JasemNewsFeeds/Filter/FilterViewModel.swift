//
//  FilterViewModel.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 11/09/2022.
//

import Foundation

class FilterViewModel: ObservableObject {
    @Published var countries = ["de", "us"]
    @Published var categories = ["business", "entertainment", "sports"]
}

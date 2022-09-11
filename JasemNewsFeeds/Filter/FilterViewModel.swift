//
//  FilterViewModel.swift
//  JasemNewsFeeds
//
//  Created by Jasem on 11/09/2022.
//

import Foundation

class FilterViewModel: ObservableObject {
    var countries = ["Algeria", "Kuwait", "Mexico"]
    var categories = ["Business", "Enterainements"]
    
    @Published var selectionCountries: String? = nil
    @Published var selectionCategory: String? = nil
    
}

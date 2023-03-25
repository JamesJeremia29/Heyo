//
//  ChipCategoryViewModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 24/03/23.
//

import Foundation

class CreateRoomViewModel: ObservableObject {
    @Published var pickedCategory: CategoryEnum = CategoryEnum.Sport
    @Published var pickedSignMove: SignMoveEnum = SignMoveEnum.Peace
    @Published var location: String = ""
    
    func setLocation(newLocation: String) {
        location = newLocation
    }
    
    func setPickedCategory(newPicked: String){
        switch newPicked {
        case CategoryEnum.Sport.name:
            pickedCategory = CategoryEnum.Sport
        case CategoryEnum.Movie.name:
            pickedCategory = CategoryEnum.Movie
        case CategoryEnum.Travel.name:
            pickedCategory = CategoryEnum.Travel
        case CategoryEnum.Food.name:
            pickedCategory = CategoryEnum.Food
        case CategoryEnum.News.name:
            pickedCategory = CategoryEnum.News
        default:
            pickedCategory = CategoryEnum.Sport
        }
    }
    
    func setPickedSignMove(newPicked: String){
        switch newPicked {
        case SignMoveEnum.Peace.value:
            pickedSignMove = SignMoveEnum.Peace
        case SignMoveEnum.Okay.value:
            pickedSignMove = SignMoveEnum.Okay
        case SignMoveEnum.ThumbsUp.value:
            pickedSignMove = SignMoveEnum.ThumbsUp
        default:
            pickedSignMove = SignMoveEnum.Peace
        }
    }
}

enum CategoryEnum {
    case Sport
    case Movie
    case Travel
    case Food
    case News
    
    var name: String {
        switch self {
        case .Sport: return "Sport"
        case .Movie: return "Movie"
        case .Travel: return "Travel"
        case .Food: return "Food"
        case .News: return "News"
        }
    }
}

enum SignMoveEnum {
    case Peace
    case Okay
    case ThumbsUp
    
    var value: String {
        switch self {
        case .Peace: return "✌️"
        case .Okay: return "👌"
        case .ThumbsUp: return "👍"
        }
    }
}

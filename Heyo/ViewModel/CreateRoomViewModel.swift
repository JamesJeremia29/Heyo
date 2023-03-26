//
//  ChipCategoryViewModel.swift
//  Heyo
//
//  Created by Ferrian Redhia Pratama on 24/03/23.
//

import Foundation
import SwiftUI

class CreateRoomViewModel: ObservableObject {
    @AppStorage(SPORT_CATEGORY_STORAGE) var sportCategory: Int = 0
    @AppStorage(MOVIE_CATEGORY_STORAGE) var movieCategory: Int = 0
    @AppStorage(FOOD_CATEGORY_STORAGE) var foodCategory: Int = 0
    @AppStorage(TRAVEL_CATEGORY_STORAGE) var travelCategory: Int = 0
    @AppStorage(NEWS_CATEGORY_STORAGE) var newsCategory: Int = 0
    
    @Published var pickedCategory: CategoryEnum = CategoryEnum.Sport
    @Published var pickedSignMove: SignMoveEnum = SignMoveEnum.Peace
    @Published var location: String = ""
    @Published var pickedRoom: RoomModel?
    @Published var isHost: Bool = false
    
    func setIsHost(isHost: Bool){
        self.isHost = isHost
    }
    
    func setPickedRoom(newRoom: RoomModel){
        self.pickedRoom = newRoom
    }
    
    func setLocation(newLocation: String) {
        location = newLocation
    }
    
    func saveCategory(category: CategoryEnum) {
        switch category{
        case .Food:
            foodCategory += 1
        case .Sport:
            sportCategory += 1
        case .Movie:
            movieCategory += 1
        case .Travel:
            travelCategory += 1
        case .News:
            newsCategory += 1
        }
    }
    
    func saveCategory(category: String) {
        switch category{
        case CategoryEnum.Food.name:
            foodCategory += 1
        case CategoryEnum.Sport.name:
            sportCategory += 1
        case CategoryEnum.Movie.name:
            movieCategory += 1
        case CategoryEnum.Travel.name:
            travelCategory += 1
        case CategoryEnum.News.name:
            newsCategory += 1
        default:
            print("notFound")
        }
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

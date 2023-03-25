//
//  Card_join.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI


struct CardJoin: View {
    @AppStorage("numberSport") var numberSport: Int = 0
    @AppStorage("numberMovie") var numberMovie: Int = 0
    @AppStorage("numberTravel") var numberTravel: Int = 0
    @AppStorage("numberFood") var numberFood: Int = 0
    @AppStorage("numberNews") var numberNews: Int = 0
    @AppStorage("numberBadge") var numberBatch: Int = 0
    
    var peace = "✌️"
//    @Binding var room : Bool
    var body: some View {
        ScrollView {
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        VStack{
                            HStack{
                                Text("Sport").font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.blue)
                                Spacer()
                                
                            }
                            Spacer().frame(height: 20)
                            HStack{
                                Image(systemName: "mappin.and.ellipse").resizable().frame(width: 25, height: 25).foregroundColor(.red)
                                Text("Cave").font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                        }
                        Text(peace).font(.system(size: 50))
                    }
                }
            }
            .padding(.all)
            .frame(width: 361, height: 100, alignment: .center)
            .background(Color(.white))
            .cornerRadius(10)
        .shadow(radius: 5)
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        VStack{
                            HStack{
                                Text("Sport").font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.blue)
                                Spacer()
                                
                            }
                            Spacer().frame(height: 20)
                            HStack{
                                Image(systemName: "mappin.and.ellipse").resizable().frame(width: 25, height: 25).foregroundColor(.red)
                                Text("Cave").font(.system(size: 17, weight: .medium))
                                Spacer()
                            }
                        }
                        Text(peace).font(.system(size: 50))
                    }
                }
            }
            .padding(.all)
            .frame(width: 361, height: 100, alignment: .center)
            .background(Color(.white))
            .cornerRadius(10)
            .shadow(radius: 5)
            Button("join sports"){
                numberSport += 1
            }
            Button("join Movies"){
                numberMovie += 1
            }
            Button("join travel"){
                numberTravel += 1
            }
            Button("join food"){
                numberFood += 1
            }
            Button("join news"){
                numberNews += 1
            }
        }
    }
}

struct CardJoin_Previews: PreviewProvider {
    static var previews: some View {
        CardJoin()
    }
}

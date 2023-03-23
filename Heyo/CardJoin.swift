//
//  Card_join.swift
//  Heyo
//
//  Created by James Jeremia on 20/03/23.
//

import SwiftUI


struct CardJoin: View {
    
    var peace = "✌️"
    var body: some View {
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
    }
}

struct CardJoin_Previews: PreviewProvider {
    static var previews: some View {
        CardJoin()
    }
}

//
//  TalkView.swift
//  Heyo
//
//  Created by James Jeremia on 21/03/23.
//

import SwiftUI


struct TalkView: View {
    var peace = "✌️"
    @State var navigate: Int?
//    @Binding var rootIsActive : Bool
//    @Binding var room : Bool
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        NavigationView(){
            VStack {
                NavigationLink(destination: ContentView(), tag: 2, selection: $navigate) {
                    EmptyView()
                }
                VStack(alignment: .leading) {
                    HStack{
                        VStack{
                            Text("Sports")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.white)
                            Text("\(Image(systemName: "mappin.and.ellipse")) Cave").foregroundColor(Color(.white)).font(.system(size: 21, weight: .bold))
                        }
                        Spacer()
                        Text(peace).font(.system(size: 50))
                    }.padding(.horizontal)
                    
                    Spacer()
                }.background(Color("blueTheme"))
                    .frame(height: 75)
                Spacer()
                ListPeople()
                ListPeople()
                ListPeople()
                Spacer()
//                Button(action: {
//                }, label: {
//                    Text("Delete").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
//                        .background(Color("redTheme"))
//                        .cornerRadius(10)
//                }
//
//            )
                
<<<<<<< HEAD
            }, label: {
                Text("Leave").foregroundColor(Color(.white)).font(.system(size: 24)).frame(width: 361,height: 50)
                    .background(Color("redTheme"))
                    .cornerRadius(10)
=======
>>>>>>> 33daea54d189d8bdd2db8a81874600bab2120979
            }
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                            self.mode.wrappedValue.dismiss()
                        }){
                            Text("\(Image(systemName: "rectangle.portrait.and.arrow.forward")) Leave").foregroundColor(Color("redTheme"))
                                .font(.system(size: 17, weight: .bold))
                        })
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}

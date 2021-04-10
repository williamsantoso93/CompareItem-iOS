//
//  ContentView.swift
//  Shared
//
//  Created by William Santoso on 10/04/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                inputSectionView(section: "First", priceText: $viewModel.pricesText[0], qtyText: $viewModel.qtysText[0])
                
                Divider()
                    .padding(.vertical, 10)
                
                inputSectionView(section: "Second", priceText: $viewModel.pricesText[1], qtyText: $viewModel.qtysText[1])
                
                VStack {
                    Text("\(viewModel.result)")
                }
                .padding()
                
                
//                .padding()
                
                Spacer()
            }
            .navigationTitle("Compare")
            .navigationBarItems(trailing:
                                    Button("Calculate") {
                                        viewModel.calculate()
                                    }
            )
        }
        .hideKeyboardWhenTappedAround()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}

struct inputSectionView: View {
    var section: String
    @Binding var priceText: String
    @Binding var qtyText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section)
                .font(.title)
            HStack(spacing: 10.0) {
                Text("Price")
                
                TextField("10000", text: $priceText)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                if !priceText.isEmpty {
                    Button(action: {
                        priceText = ""
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            HStack(spacing: 10.0) {
                Text("Qty")
                
                TextField("100", text: $qtyText)
                    .multilineTextAlignment(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                if !qtyText.isEmpty {
                    Button(action: {
                        qtyText = ""
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding()
    }
}

extension View {
    func hideKeyboardWhenTappedAround() -> some View  {
        return self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                  to: nil, from: nil, for: nil)
        }
    }
}

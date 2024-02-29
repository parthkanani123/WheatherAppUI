//
//  ContentView.swift
//  WheatherUI
//
//  Created by parth kanani on 20/02/24.
//

/*
 
 Imperative vs Declarative Programming :-
 
 Declarative (SwiftUI) :-
   -> show what you want
   -> you set all the rules upfront, you set all states upFront and you just changed the data and UI acts according to those rules.
   ==> Example :- if we want to find size of array
        -> return array.size()
 
 Imperative(UIkit) :-
   -> show how to do it
   -> you specifically telling UI when and how to update when time comes
   ==> Example :- if we want to find size of array
      -> traverse whole array, count no of elements in array
      -> return count
 
 Enviornment Modifier :- modifier that apply to overall VStack,ZStack or HStack
 example :
   VStack {
    }
    .font(.large)
 
 @ViewBuilder :- elements that return view that is ViewBuilder
 example :- ZStack { }   -> bracket is scope of that view
 
*/
 


import SwiftUI

struct ContentView: View
{
    @State private var isNight = false
    
    var body: some View
    {
        ZStack
        {
            BackgroundView(isNight: isNight)
            
            VStack
            {
                CitytextView(cityName: "Cupertino CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temprature: 76)
                
                HStack(spacing: 20)
                {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temprature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temprature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temprature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temprature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temprature: 25)
                }
                
                Spacer()
                
                Button
                {
                    isNight.toggle() //it toggle isNight from true to false and vice-versa
                } label: {
                    WeatherButton(title: "Change Day Time",
                                       textColor: .white,
                                       backgroundColor: .accentColor)
                }
                
                Spacer()
                
            }
        }
      
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View
{
    var dayOfWeek: String
    var imageName: String
    var temprature: Int
    
    
    var body: some View
    {
        VStack
        {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium,design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor) // palette has 3 color u can give it
                .resizable()
            
            // if symbolRenderingMode is palette than below foreground style is work
//                .foregroundStyle(.white, .yellow, .green)
            // SF symbols has layer some hase 1, some has 2 as well as 3. those who have 1 layer are of pink, those who have 2 layer they are of pink(1st layer) and orange(2layer).
            
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temprature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View
{
    var isNight: Bool
                    
    var body: some View
    {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : .lightBlue]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CitytextView: View
{
    var cityName: String
    
    var body: some View
    {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View
{
    var imageName: String
    var temprature: Int
    
    var body: some View
    {
        VStack(spacing: 10)
        {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
                
            
            Text("\(temprature)°")  // option + shift + 8  = degree symbol
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}


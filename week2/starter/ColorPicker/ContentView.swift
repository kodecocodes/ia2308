import SwiftUI

struct ContentView: View {
  @State public var backgroundColor = Color.white
  @State public var redValue = 0.0
  @State public var greenValue = 0.0
  @State public var blueValue = 0.0
  
  var body: some View {
    
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .foregroundColor(Color("TextColor"))
      RoundedRectangle(cornerRadius: 0)
          .foregroundColor(backgroundColor)
                  .overlay(RoundedRectangle(cornerRadius: 0)
                    .stroke(backgroundColor, lineWidth: 10)
                                    .opacity(0.5))
                  .padding()

        .padding()
    }
    VStack {
      SliderViewRed(sliderValue: $redValue)
    }
    .padding()
    VStack {
      SliderViewGreen(sliderValue: $greenValue)
    }
    .padding()
    VStack {
      SliderViewBlue(sliderValue: $blueValue)
    }
    .padding()
    ButtonView(backgroundColor: $backgroundColor, redValue: redValue, greenValue: greenValue, blueValue: blueValue)
  }
}




struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
   ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("Iphone 14 Pro Max")
  }
}

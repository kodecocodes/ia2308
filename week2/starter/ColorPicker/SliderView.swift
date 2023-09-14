
import SwiftUI  
  

  struct SliderViewRed: View {
    @Binding public var sliderValue: Double
    
    var body: some View {
      
      Text("Red")
        .foregroundColor(Color("TextColor"))
        .font(.headline)
      HStack {
        Slider(value: $sliderValue, in: 0...255)
          .tint(Color.red)
        Text("\(Int(sliderValue.rounded()))")
      }
    }
  }
  
  struct SliderViewGreen: View {
    @Binding var sliderValue: Double
    
    var body: some View {
      Text("Green")
        .foregroundColor(Color("TextColor"))
        .font(.headline)
      HStack {
        Slider(value: $sliderValue, in: 0...255)
          .tint(Color.green)
        Text("\(Int(sliderValue.rounded()))")
      }
    }
  }
  
  struct SliderViewBlue: View {
    @Binding var sliderValue: Double
    
    var body: some View {
      Text("Blue")
        .foregroundColor(Color("TextColor"))
        .font(.headline)
      HStack {
        Slider(value: $sliderValue, in: 0...255)
          .tint(Color.blue)
        Text("\(Int(sliderValue.rounded()))")
      }
    }
  }
  
  
//  struct SliderView_Previews: PreviewProvider {
//    static var previews: some View {
//      VStack {
//        SliderViewRed()
//        SliderViewGreen()
//        SliderViewBlue()
//      }
//    }
//  }

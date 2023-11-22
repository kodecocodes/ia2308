
import SwiftUI  
  

struct ColorSliderView: View {
    @Binding var value: Double
    let label: String

    private let labelTextSize: CGFloat = 18
    private let valueLabelOffset: CGFloat = 5
    private let colorScale: ClosedRange<Double> = 0...255

    var body: some View {
        VStack {
            Text(label)
                .font(.system(size: labelTextSize))

            HStack {
                Slider(value: $value, in: colorScale)

                Text("\(Int(value.rounded()))")
                    .offset(x: valueLabelOffset)
            }
        }
    }
}

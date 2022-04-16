/*
IGIS - Remote graphics for Swift on Linux
Copyright (C) 2018 Tango Golf Digital, LLC
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

public class StrokeStyle : CanvasObject {
    private enum Mode {
        case solidColor(color:Color)
        case gradient(gradientValue:Gradient)
    }
    private let mode : Mode

    public init(color:Color) {
        mode = .solidColor(color:color)
    }

    public init(gradient:Gradient) {
        mode = .gradient(gradientValue:gradient)
    }

    internal override func canvasCommand() -> String {
        var commands = String()
        switch mode {
        case .solidColor(let color):
            commands += "strokeStyleSolidColor|\(color.style)"
        case .gradient(let gradient):
            if !gradient.isReady {
                print("WARNING: canvasCommand requested on gradient not yet ready. ID: \(gradient.id.uuidString).")
            }
            commands += "strokeStyleGradient|\(gradient.id.uuidString)"
        }

        return commands
    }
}

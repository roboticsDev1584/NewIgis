/*
IGIS - Remote graphics for Swift on Linux
Copyright (C) 2018, 2019 Tango Golf Digital, LLC
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

import Foundation

public class Clip : CanvasObject {

    public enum WindingRule {
        case nonZero
        case evenOdd
    }
    
    public let windingRule : WindingRule

    public init(windingRule:WindingRule = .nonZero) {
        self.windingRule = windingRule
    }

    internal override func canvasCommand() -> String {
        var commands = "clip|"
        switch windingRule {
        case .nonZero:
            commands += "nonzero"
        case .evenOdd:
            commands += "evenodd"
        }
        return commands
    }
}

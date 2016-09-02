/*

Copyright (c) 2015 - Alex Leite (al7dev)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

import UIKit

public typealias GridViewConstructor = (_ column: UInt, _ row: UInt, _ contentView: UIView) -> Void

open class GridView: UIView {
    
    fileprivate var _padding: CGFloat = 0.0
    fileprivate var _margins: UIEdgeInsets = UIEdgeInsets.zero
    fileprivate var _columns: UInt = 0
    fileprivate var _rows: UInt = 0
    
    open var padding: CGFloat { return self._padding }
    open var margins: UIEdgeInsets { return self._margins }
    open var columns: UInt { return self._columns }
    open var rows: UInt { return self._rows }
    open var cellSize: CGSize?
    
    //MARK- Initializers
    
    public init(frame: CGRect, columns: UInt, rows: UInt, margins: UIEdgeInsets, padding: CGFloat, constructor: GridViewConstructor) {
        super.init(frame: frame)
        
        self._columns = (columns >= 1) ? columns : 1
        self._rows = (rows >= 1) ? rows : 1
        self._margins = margins
        self._padding = padding
        
        var contentFrame = self.bounds
        contentFrame.origin.x = self.margins.left
        contentFrame.origin.y = self.margins.top
        contentFrame.size.width -= (self.margins.left + self.margins.right)
        contentFrame.size.height -= (self.margins.top + self.margins.bottom)
        
        var cellSize = contentFrame.size
        cellSize.width = (cellSize.width - (padding * CGFloat(columns - 1))) / CGFloat(columns)
        cellSize.height = (cellSize.height - (padding * CGFloat(rows - 1))) / CGFloat(rows)
        self.cellSize = cellSize
        
        for r in 0..<self.rows {
            for c in 0..<self.columns {
                var contentFrame = CGRect.zero
                contentFrame.origin.x = self.margins.left + (CGFloat(c) * padding) + (CGFloat(c) * cellSize.width)
                contentFrame.origin.y = self.margins.top + (CGFloat(r) * padding) + (CGFloat(r) * cellSize.height)
                contentFrame.size = cellSize
                
                let contentView = UIView(frame: contentFrame)
                constructor(c, r, contentView)
                self.addSubview(contentView)
            }
        }
    }
    
    convenience init(frame: CGRect, columns: UInt, rows: UInt, constructor: GridViewConstructor!) {
        self.init(frame: frame, columns: columns, rows: rows, margins: UIEdgeInsets.zero, padding: 0.0, constructor: constructor)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK- Helper Methods
    
    open func viewAt(column: UInt, row: UInt) -> UIView? {
        if column < self.columns && row < self.rows {
            let subviewIndex = (row * self.columns) + column
            let subviews = self.subviews as NSArray
            if let subview = subviews.object(at: Int(subviewIndex)) as? UIView {
                return subview
            }
        }
        return nil
    }
}

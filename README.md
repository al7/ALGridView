ALGridView
=====================

### About

This custom control is a very simple, yet very useful implementation of a grid view in Swift. It will let you create a grid view in code, in line. In addition to letting you subdivide this custom view in rows and columns, it also allows you easily customize margins and padding of the cells.

See the code below to understand how it works:

### Sample Code

```swift

//-- Full initializer (passing margins, padding)

let frame = CGRect(x: 10.0, y: 10.0, width: 200.0, height: 200.0)
let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

let gridView = GridView(frame: frame, columns: 3, rows: 3, margins: margins, padding: 10) {
	column, row, contentView in
	
	let view = UIView(frame: contentView.bounds)
	view.backgroundColor = UIColor.blueColor()
	contentView.addView(view)}

someView.addSubview(gridView)

//-- Simplified initializer (frame, columns, rows and constructor closure)

let gridv

```

### Limitations

This class is intended for very simple grids when creating your UI in code. It is ideal for use cases like like grids of buttons of that will have same size and spacing, and that will keep a same size. With that in mind, understand that, as of now, this control has some limitations, including:

* it is not intended for dynamically resizing
* it has not been tested or developed with AutoLayout in mind
* it does not let you merge cells and rows
* all cells will have the same dimensions

Maybe some of these features will be implemented in the future. For now, I needed a quick way to lay out content in a grid, and this is doing the trick wonderfully! I encourage you to check out the sample code included in this project, and play out with the control a lit bit to understand what it's suited for and what would be potential shortcomings. 

### How to use

To use this control, you can either copy the *GridView.swift* class to your project, or add the following pod to your project, using CocoaPods 0.36 and up:

```
pod 'ALGridView'
```

### License

This component is available under MIT license.
# GraphicMotionApplication
simple application (with custom view) , that will draw graphics align to values from sensors

Each of graphics implement protocol Graphic: 

protocol Graphic{
    func pushValue(value: Int) throws
    func setupWithArray(values: [Int]) throws
    func getUIView() -> UIView
}

Example of usage:

1 setup init data - array of Int:

do{
   try graphic.setupWithArray(values: numbers)
}catch let error{       
   print("error while insert array: \(error)")
}

There are 2 things: 
- max array count should be less than 50

2 than we can push new value, which should be less than max value in data, or equel to max value

do{
   try graphic.pushValue(value: value)
}catch let error{
   print("error while push value: \(error)") 
}

![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/graph_one.jpg) 
![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/graph_two.jpg)

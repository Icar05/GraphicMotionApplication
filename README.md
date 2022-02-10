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

![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/setup.png) 

- max array count should be less than 50

2 than we can push new value, which should be less than max value in data, or equel to max value

![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/push.png) 

![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/Two.jpg) 
![alt text](https://github.com/Icar05/GraphicMotionApplication/blob/master/One.jpg)

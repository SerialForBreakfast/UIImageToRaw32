//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let image = UIImage(named: "ShowBlender.png")

let height = Int((image?.size.height)!)
print(height)
let width = Int((image?.size.width)!)

let bitsPerComponent = Int(8)
let bytesPerRow = 4 * width
let colorSpace = CGColorSpaceCreateDeviceRGB()
let rawData = UnsafeMutablePointer<UInt32>.allocate(capacity: (width * height))
let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
let CGPointZero = CGPoint(x: 0, y: 0)
let rect = CGRect(origin: CGPointZero, size: (image?.size)!)



let imageContext = CGContext(data: rawData, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)

imageContext?.draw(image!.cgImage!, in: rect)

let pixels = UnsafeMutableBufferPointer<UInt32>(start: rawData, count: width * height)

let outContext = CGContext(data: pixels.baseAddress, width: width, height: height, bitsPerComponent: bitsPerComponent,bytesPerRow: bytesPerRow,space: colorSpace,bitmapInfo: bitmapInfo,releaseCallback: nil,releaseInfo: nil)

let outImage = UIImage(cgImage: outContext!.makeImage()!)




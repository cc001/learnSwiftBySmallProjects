//: Playground - noun: a place where people can play

import UIKit

var array = [26, 17, 89, 56, 71, 90, 55, 14, 73, 45, 99, 101]

//// 默认升序
//let forwardArray = array.sorted()
//// 降序
//let reverseArray = array.sorted(){ $0 > $1}
//print("\(forwardArray) \n\(reverseArray) ")


enum SortType {
    // 冒泡排序， 插入排序， 希尔排序（升级版插入排序), 选择排序， 堆排序，归并排序，快速排序，基数排序
    case bubbleSort, insertSort, shellSort, simpleSelectionSort, heapSort, mergeSort, quickSort, radixSort
}


// 扩展中加入各种排序方法
extension Array {
    
    
    // 冒泡排序
    func BubbleSort() -> Array {
        print("冒泡排序")
        var list = self
        
        for i in 0 ..< list.count {
            
            print("第\(i + 1)轮排序开始")
            var j = list.count - 1
            
            while j > i {
                if (list[j-1] as! Int) > (list[j] as! Int) {
                    print("交换 \(list[j-1]) 和 \(list[j])")
                    (list[j-1], list[j]) = (list[j], list[j-1])
                } else {
                    print("\(list[j-1]) <= \(list[j]) 不交换")
                }
                j -= 1
            }
            print("第 \(i+1) 轮冒泡结束")
            print("当前数组为: \n\(list)\n")
        }
        return list
    }
    
    // 插入排序
    func insertSort() -> Array {
        print("插入排序")
        var list = self
        
        for i in 1 ..< list.count {
            print("第\(i)轮排序开始")
            print("要插入的值是\(list[i])")
            
            var j = i
            while j > 0 {
                if (list[j] as! Int) < (list[j - 1] as! Int) {
                    (list[j-1], list[j]) = (list[j], list[j-1])
                    j -=  1
                } else {
                    //退出内层循环中的本次循环
                    break
                }
            }
            print("插入的位置为: \(i) \n本轮插入完毕，插入结果为\n\(list) \n")
        }
        return list
    }
    
    
    // 希尔排序
    func shellSort() -> Array {
        print("希尔排序")
        var list = self
        var step: Int = list.count / 2
        while step > 0 {
            print("步长为\(step)的插入排序开始:")
            
            for i in 0 ..< list.count {
                var j = i + step
                while j >= step && j < list.count {
                    if (list[j] as! Int) < (list[j - step] as! Int) {
                        (list[j], list[j-step]) = (list[j-step], list[j])
                        j -= step
                    } else {
                        break
                    }
                }
            }
             print("步长为: \(step) 的插入顺序结束，本轮结果为\n\(list) \n")
            step /= 2
        }
        return list
    }
    
    // 简单选择排序
    func simpleSelectionSort() -> Array {
        print("简单排序")
        var list = self
        for i in 0 ..< list.count {
            print("第\(i + 1)轮选择， 选择下标范围是\(i)-----\(list.count)")
            var j = i + 1
            var minValue = list[i]
            var minIndex = i
            
            //寻找无序部分中的最小值
            while j < list.count {
                if  minValue as! Int > list[j] as! Int {
                    minValue = list[j]
                    minIndex = j
                }
                j += 1
            }
            print("第\(i + 1)小的值为 \(list[j]) 在第\(j)个")
            
            
            
        }
        return list
    }
    
}

var sortType = SortType.bubbleSort


switch sortType {
case .bubbleSort:
    array.BubbleSort()
case .insertSort:
    array.insertSort()
case .shellSort:
    array.shellSort()
default:
    print("这是个意外")
}













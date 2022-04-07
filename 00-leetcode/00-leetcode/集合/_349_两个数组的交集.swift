//
//  _349_两个数组的交集.swift
//  00-leetcode
//
//  Created by Sure_Dz on 2022/4/7.
//

import Foundation

class _349_两个数组的交集 {
//    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        if nums1.count == 0 || nums2.count == 0 {
//            return []
//        }
//
//        let nums1Set = Set(nums1)
//        let nums2Set = Set(nums2)
//
//        var set: [Int] = []
//
//        for num in nums1Set {
//            if nums2Set.contains(num) {
//                set.append(num)
//            }
//        }
//
//        return set
//    }
    
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        
        let arr1 = nums1.sorted()
        let arr2 = nums2.sorted()
        
        var result: [Int] = []
        var ptr1 = 0, ptr2 = 0
        
        while ptr1 < arr1.count && ptr2 < arr2.count {
            let num1 = arr1[ptr1], num2 = arr2[ptr2]
            if num1 == num2 {
                if result.count == 0 || result.last! != num1  {
                    result.append(num1)
                }
                ptr1 += 1
                ptr2 += 1
            } else {
                if num1 < num2 {
                    ptr1 += 1
                } else {
                    ptr2 += 1
                }
            }
        }
        
        return result
    }
}

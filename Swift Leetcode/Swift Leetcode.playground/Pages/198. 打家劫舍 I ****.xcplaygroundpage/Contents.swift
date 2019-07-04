//: [Previous](@previous)

import Foundation

/*:

 [打家劫舍](https://leetcode-cn.com/problems/house-robber)
 
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
 
 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: 4
 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
           偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2:
 
 输入: [2,7,9,3,1]
 输出: 12
 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
           偷窃到的最高金额 = 2 + 9 + 1 = 12 。
 
 
 */


/*
 方法一 使用递归来做
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        let nums1 = Array.init(nums[0..<nums.count-2])
        let nums2 = Array.init(nums[0..<nums.count-1])

        return max(nums.last! + rob(nums1),rob(nums2))
    }
}


/// 方法二 使用动态规划
class Solution1 {
    
    func dpRobTol(_ nums: [Int] , robTotal: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        robTotal[0] = 0
        robTotal[1] = nums[0]
        robTotal[2] = max(nums[0], nums[1])
        
        for i in 3...nums.count {
            robTotal[i] = max(nums[i-1] + robTotal[i-2],robTotal[i-1])
        }
        print(robTotal)
        return robTotal[nums.count]
    }
    
   
    func rob(_ nums: [Int]) -> Int {
        var robTotal = Array.init(repeating: -1, count: nums.count + 1)
        return dpRobTol(nums, robTotal: &robTotal)
    }
}



let s = Solution1()
let res = s.rob([1,2,3,1])
print(res)

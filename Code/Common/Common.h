//
//  Common.h
//  ALa4Map
//
//  Created by maoziyue on 2017/10/18.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#ifndef Common_h
#define Common_h


#define kScreenH       ([[UIScreen mainScreen]bounds].size.height)
#define kScreenW       ([[UIScreen mainScreen]bounds].size.width)
#define kBili          ([[UIScreen mainScreen]bounds].size.width / 375.0)

#define kNAVIGATION_HEIGHT (CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]) + CGRectGetHeight(self.navigationController.navigationBar.frame))




#endif /* Common_h */

//
//  RCTCustomScrollView+CARefreshControl.h
//  RNDemo
//
//  Created by 罗海雄 on 2019/11/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTScrollView.h>
#import <React/RCTScrollViewManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCTScrollViewManager (CANestedScroll)

@end

@interface RCTScrollView (CARefreshControl)

@property(nonatomic, assign) BOOL refreshEnable;

@property(nonatomic, readonly) BOOL refreshing;

@property(nonatomic, copy) RCTDirectEventBlock onRefreshCallback;

- (void)stopRefresh;

@end

NS_ASSUME_NONNULL_END

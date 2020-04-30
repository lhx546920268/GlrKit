//
//  RCTCustomScrollView+CARefreshControl.m
//  RNDemo
//
//  Created by 罗海雄 on 2019/11/11.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTCustomScrollView+CARefreshControl.h"
#import <MJRefreshNormalHeader.h>
#import <objc/runtime.h>
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>

static char refreshCallbacKey;
static char iosRefreshEnableKey;

@implementation RCTScrollViewManager (CANestedScroll)

RCT_EXPORT_METHOD(stopRefresh:(nonnull NSNumber*) reactTag)
{
  [self.bridge.uiManager addUIBlock:
  ^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry){
    RCTScrollView *view = (RCTScrollView*)viewRegistry[reactTag];
    
    if(!view || ![view isKindOfClass:[RCTScrollView class]]) {
      RCTLogError(@"Cannot find RCTScrollView with tag #%@", reactTag);
      return;
    }
    [view stopRefresh];
  }];
}

RCT_EXPORT_VIEW_PROPERTY(refreshEnable, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onRefreshCallback, RCTDirectEventBlock)

@end

@implementation RCTScrollView (CARefreshControl)

- (void)setRefreshEnable:(BOOL)refreshEnable
{
  if(refreshEnable != self.refreshEnable){
    objc_setAssociatedObject(self, &iosRefreshEnableKey, @(refreshEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(refreshEnable){
      self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        if(self.onRefreshCallback){
          self.onRefreshCallback(nil);
        }
      }];
    }else{
      self.scrollView.mj_header = nil;
    }
  }
}

- (BOOL)refreshEnable
{
  return [objc_getAssociatedObject(self, &iosRefreshEnableKey) boolValue];
}

- (BOOL)refreshing
{
  return self.scrollView.mj_header.refreshing;
}

- (void)setRefreshing:(BOOL)refreshing
{
  if(self.refreshEnable && refreshing != self.refreshing){
    if(refreshing){
      [self.scrollView.mj_header beginRefreshing];
    }else{
      [self.scrollView.mj_header endRefreshing];
    }
  }
}

- (void)stopRefresh
{
  if(self.refreshEnable && self.refreshing){
    [self.scrollView.mj_header endRefreshing];
  }
}

- (void)setOnRefreshCallback:(RCTDirectEventBlock)refreshCallback
{
  objc_setAssociatedObject(self, &refreshCallbacKey, refreshCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTDirectEventBlock)onRefreshCallback
{
  return objc_getAssociatedObject(self, &refreshCallbacKey);
}

@end

//
//  AppDelegate.h
//  TextFieldCategory
//
//  Created by apple on 17/7/13.
//  Copyright © 2017年 BigShow1949. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


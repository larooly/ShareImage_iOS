//
//  ShareViewController.m
//  ShareEx
//
//  Created by active on 2020/12/23.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController
- (void)viewDidLoad{
    //int i = (int)self.extensionContext.inputItems.count;
    //_uitext1.text = [NSString stringWithFormat: @"갯수인가? %d",i];
    NSLog(@"뭔데   %@",self.extensionContext.inputItems);
    int i = (int)self.extensionContext.inputItems.count;
    _uitext1.text = [NSString stringWithFormat: @"갯수인가? %d",i];
    NSLog(@"아니 갯수 좀 + %lu",(unsigned long)self.extensionContext.inputItems.count);
    NSExtensionItem *first = self.extensionContext.inputItems.firstObject;
    NSItemProvider *itemprovider = first.attachments.firstObject;
    NSLog(@"이건 뭐지 %@", itemprovider);
    
    
    NSExtensionItem *item = self.extensionContext.inputItems.firstObject;
        NSItemProvider *itemProvider = item.attachments.firstObject;
        if ([itemProvider hasItemConformingToTypeIdentifier:@"public.url"]) {
            [itemProvider loadItemForTypeIdentifier:@"public.url"
                                            options:nil
                                            completionHandler:^(NSURL *url, NSError *error) {
                                      // Do what you want to do with url
                                        K = [NSString stringWithFormat:@"%@",url];
                NSLog(@"뭐라는 거야 + %@",K);
                                        [self testAsnc];
                                     // [self.extensionContext completeRequestReturningItems:@[]
                                                                        // completionHandler:nil];
                                  }];
        }
    
    if ([itemProvider hasItemConformingToTypeIdentifier:@"public.png"]) {
        [itemProvider loadItemForTypeIdentifier:@"public.png"
                                        options:nil
                                        completionHandler:^(NSURL *url, NSError *error) {
                                  // Do what you want to do with url
                                    K = [NSString stringWithFormat:@"%@",url];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.uitext1.text = K;
                NSLog(@"뭐라는 거야 + %@",K);
                NSData *dta = [NSData dataWithContentsOfURL:url];
                self.uiimage1.image =[UIImage imageWithData:dta];
            });
                              }];
    }
    
    
    if ([itemProvider hasItemConformingToTypeIdentifier:@"public.jpeg"]) {
        [itemProvider loadItemForTypeIdentifier:@"public.jpeg"
                                        options:nil
                                        completionHandler:^(NSURL *url, NSError *error) {
                                  // Do what you want to do with url
                                    K = [NSString stringWithFormat:@"%@",url];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.uitext1.text = K;
                NSLog(@"뭐라는 거야 + %@",K);
                NSData *dta = [NSData dataWithContentsOfURL:url];
                self.uiimage1.image =[UIImage imageWithData:dta];
            });
                              }];
    }
    
    if ([itemProvider hasItemConformingToTypeIdentifier:@"public.bmp"]) {
        [itemProvider loadItemForTypeIdentifier:@"public.bmp"
                                        options:nil
                                        completionHandler:^(NSURL *url, NSError *error) {
                                  // Do what you want to do with url
                                    K = [NSString stringWithFormat:@"%@",url];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.uitext1.text = K;
                NSLog(@"뭐라는 거야 + %@",K);
                NSData *dta = [NSData dataWithContentsOfURL:url];
                self.uiimage1.image =[UIImage imageWithData:dta];
            });
                              }];
    }
    
    if ([itemProvider hasItemConformingToTypeIdentifier:@"public.image"]) {
        [itemProvider loadItemForTypeIdentifier:@"public.image" options:nil completionHandler:^(UIImage *image, NSError *error){
            if(image != nil){
                dispatch_async(dispatch_get_main_queue(), ^{
                                self.uiimage1.image = image;
                                //으허허허헝 코코야ㅠㅠㅠ
                            });
            }else{
                NSLog(@"망했어요");
            }
            
        }];
//        [itemProvider loadPreviewImageWithOptions:nil completionHandler:^(UIImage *image, NSError *error){
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.uiimage1.image = image;
//                NSLog(@"뭐라는 0거야 + %@",K);
//            });
//
//        }];
    }
    
    
    
}
NSString *K = @"";
- (void)viewWillAppear:(BOOL)animated{
   
    
    
   
   
}
-(void)testAsnc{//UI는 메인 스레드에서 바꿔야해서 여기에 있다.
    dispatch_async(dispatch_get_main_queue(), ^{
        self.uitext1.text = K;
    });
}


/*
- (BOOL)isContentValid {//사용자가 기본 입력창에 입력할때마다 작동
    //true면 Post라는 버튼 활성화
    
    if(self.textView.text.length<1){
        return false;
    }
    // Do validation of contentText and/or NSExtensionContext attachments here
    return true;//false
}

- (void)didSelectPost {//참고로 캔슬도 따로 있다 말그대로 포스트를 눌렀을때 뜨는 함수 
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}
*/
@end

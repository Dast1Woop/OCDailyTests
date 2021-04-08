//
//  ViewController.m
//  SocketTest
//
//  Created by LongMa on 2021/3/23.
//  Copyright © 2021 myl. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)socketDemo{
    // 1、 创建socket
      /**
       参数
       domain: 协议域，AF_INET --> IPV4
       type: Socket 类型， SOCK_STREAM(TCP)/SOCKET_DGRAM(报文 UDP)
       protocol: IPPROTO_TCP，如果传入0，会自动根据第二个参数，选择合适的协议
       
       返回值
       socket
       */
      int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
      
      // 2、 连接到服务器
      /**
       参数
       1> 客户端socket
       2> 指向数据结构sockaddr的指针，其中包括目的端口和IP地址
       3> 结构体数据长度
       
       返回值
       0 成功/其他 错误代号
       */
      struct sockaddr_in serverAddr;
      serverAddr.sin_family = AF_INET;
      //端口
      serverAddr.sin_port = htons(12345);
      //地址
      serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
      
      int connResult = connect(clientSocket, (const struct sockaddr *)&serverAddr, sizeof(serverAddr));
      if (connResult == 0) {
          NSLog(@"连接成功");
      }else{
          NSLog(@"连接失败 %zi",connResult);
          return;
      }
      
      // 3、发送数据到服务器
      /**
       参数
       1> 客户端socket
       2> 发送内容地址
       3> 发送内容长度
       4> 发送方式标志，一般为0
       返回值
       如果成功，则返回发送的字节数，失败则返回SOCKET_ERROR
       */
      NSString *sendMsg = @"Hello";
      ssize_t sendLen = send(clientSocket, sendMsg.UTF8String, strlen(sendMsg.UTF8String), 0);
      NSLog(@"发送了 %zi 个字节",sendLen);
      
      
      // 4、 从服务器接受数据
      /**
       参数
       1> 客户端socket
       2> 接受内容缓冲区地址
       3> 接受内容缓冲区长度
       4> 接收方式，0表示阻塞，必须等待服务器返回数据
       返回值
       如果成功，则返回读入的字节数，失败则返回SOCKET_ERROR
       */
      uint8_t buffer[1024];//将空间准备出来
      
      ssize_t recvLen = recv(clientSocket, buffer, sizeof(buffer), 0);
      NSLog(@"接收到了 %zi 个字节",recvLen);
      
      NSData *data = [NSData dataWithBytes:buffer length:recvLen];
      NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      NSLog(@"接收到数据为 %@",str);
      
      // 5、 关闭
      close(clientSocket);
}


@end

import { Injectable, OnApplicationShutdown } from '@nestjs/common';

@Injectable()
export class AppService implements OnApplicationShutdown {
  getHello(): string {
    return 'Hello World!';
  }

  onApplicationShutdown(signal?: string) {
    console.log('Shuting down');
  }
}

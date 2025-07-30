import * as cdk from 'aws-cdk-lib';
import { MyCdkAppStack } from '../lib/cdk-stack';

const app = new cdk.App();
new MyCdkAppStack(app, 'MyCdkAppStack');
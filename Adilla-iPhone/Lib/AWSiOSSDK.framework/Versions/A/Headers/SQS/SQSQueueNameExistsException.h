/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 * 
 *  http://aws.amazon.com/apache2.0
 * 
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "../AmazonServiceException.h"




/**
 * <p>
 * Queue already exists. SQS returns this error only if the request
 * includes a <code>DefaultVisibilityTimeout</code> value that differs
 * from the value for the existing queue.
 * </p>
 */        
@interface SQSQueueNameExistsException : AmazonServiceException 
{

}







-(id)initWithMessage:(NSString*)message;

        
/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString*)description;
    

@end
    
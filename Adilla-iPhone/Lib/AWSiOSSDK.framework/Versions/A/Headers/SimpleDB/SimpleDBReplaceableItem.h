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

#import "SimpleDBReplaceableAttribute.h"

               
/**
 * Replaceable Item
 */   

@interface SimpleDBReplaceableItem : NSObject 
    
{
    NSString* name;
    NSMutableArray* attributes;

}


/**
 * The name of the replaceable item.
 */
@property (nonatomic, retain) NSString* name;

/**
 * The list of attributes for a replaceable item.
 */
@property (nonatomic, retain) NSMutableArray* attributes;


/**
 * Default constructor for a new ReplaceableItem object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;
   
/**
 * Constructs a new ReplaceableItem object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theName The name of the replaceable item.
 */
-(id)initWithName:(NSString*)theName;
    
/**
 * Constructs a new ReplaceableItem object.
 * Callers should use properties to initialize any additional object members.
 * 
 * @param theName The name of the replaceable item.
 * @param theAttributes The list of attributes for a replaceable item.
 */
-(id)initWithName:(NSString*)theName andAttributes:(NSMutableArray*)theAttributes;
    
/**
 * Adds a single object to attributes. 
 * This function will alloc and init attributes if not already done.
 */        
-(void)addAttribute:(SimpleDBReplaceableAttribute*)attribute;
                
/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString*)description;
    

@end
    
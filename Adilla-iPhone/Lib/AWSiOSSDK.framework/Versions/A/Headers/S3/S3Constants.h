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

// HTTP Method Constants

#define kHttpMethodPut    @"PUT"
#define kHttpMethodGet    @"GET"
#define kHttpMethodHead   @"HEAD"
#define kHttpMethodPost   @"POST"
#define kHttpMethodDelete @"DELETE"

// HTTP Header Constants

#define kHttpHdrAuthorization      @"Authorization"
#define kHttpHdrContentLength      @"Content-Length"
#define kHttpHdrContentType        @"Content-Type"
#define kHttpHdrDate               @"Date"
#define kHttpHdrHost               @"Host"
#define kHttpHdrExpect             @"Expect"
#define kHttpHdrExpires            @"Expires"
#define kHttpHdrRange              @"Range"
#define kHttpHdrContentMD5         @"Content-MD5"
#define kHttpHdrContentEncoding    @"Content-Encoding"
#define kHttpHdrContentDisposition @"Content-Disposition"
#define kHttpHdrCacheControl       @"Cache-Control"
#define kHttpHdrUserAgent          @"User-Agent"
#define kHttpHdrIfModified         @"If-Modified-Since"
#define kHttpHdrIfUnmodified       @"If-Unmodified-Since"
#define kHttpHdrIfMatch            @"If-Match"
#define kHttpHdrIfNoneMatch        @"If-None-Match"

// Amazon-specific HTTP Header Constants

#define kHttpHdrAmzSecurityToken          @"x-amz-security-token"
#define kHttpHdrAmzAcl                    @"x-amz-acl"
#define kHttpHdrAmzMfa                    @"x-amz-mfa"
#define kHttpHdrAmzStorageClass           @"x-amz-storage-class"
#define kHttpHdrAmzCopySource             @"x-amz-copy-source"
#define kHttpHdrAmzMetaFormat             @"x-amz-meta-%@"
#define kHttpHdrAmzMetaDirective          @"x-amz-metadata-directive"
#define kHttpHdrAmzCopySourceIfMatch      @"x-amz-copy-source-if-match"
#define kHttpHdrAmzCopySourceIfNoneMatch  @"x-amz-copy-source-if-none-match"
#define kHttpHdrAmzCopySourceIfModified   @"x-amz-copy-source-if-modified-since"
#define kHttpHdrAmzCopySourceIfUnmodified @"x-amz-copy-source-if-unmodified-since"

#define kS3DateFormat @"EEE, dd MMM yyyy HH:mm:ss z"

#define kS3SubResourceAcl        @"acl"
#define kS3SubResourceVersioning @"versioning"
#define kS3SubResourceTorrent    @"torrent"
#define kS3SubResourceLogging    @"logging"
#define kS3SubResourcePolicy     @"policy"

// pre-signed URL query string parameters

#define kS3QueryParamAccessKey   @"AWSAccessKeyId"
#define kS3QueryParamExpires     @"Expires"
#define kS3QueryParamSignature   @"Signature"
#define kS3QueryParamMaxKeys	 @"max-keys"
#define kS3QueryParamPrefix		 @"prefix"
#define kS3QueryParamMarker		 @"marker"
#define kS3QueryParamDelimiter	 @"delimiter"

#define kS3ServiceEndpoint @"http://s3.amazonaws.com"




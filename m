Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7336FCDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:39:50 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3263.1782293982045694541
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=O2WI/fHf;
 spf=pass (domain: cherry.de, ip: 52.101.83.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIdC1eoW40pVqV2MP3aOrrayWkhIvvkH1qctk8z6nOFSZ77781fSQ4v3r9r37qCVyTc3kb3bfe6BzG+/szge62I3q6eleIdqw+9mcYbeZQltmFHTbQjtDJ5Vtt/X2xoMbq4YQnHgQrcjwW6XkBquYBtuOp0KySg7kT1b9vjvhf2YjmPJAYc3krXikSOETWY6eAx2PKuuZ+ssY7y5pMnACFOl1PzTYZ+YEpcx5nIaEThECVWOXZUfLiDUuY8dfa/kQMo4IoNXmrHAO9elyDtIUJyGtYIQ7DDep0t5JrOSagHxx/uLtaGYKazazmJdYw7M7r3LXVEz2M/0nK0HE6I3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7YIb+GCia4OcaaZT0dev4tPK8mwBWPNw9LY6BGfpVc=;
 b=YQb26zyWuiGKlwi5Z++3wAU2oUo5STipzQMVo9exiW0b1LZOnLmuJ6eoUFn5a0ZSPRo5JrdctThW83N4C7Dcj7/hPSLfNJEPRXjLB62n/G3QUuLMqBNtHkepTKpwX/l3fZCeCUGRWX0x3EnH7Qkf7C5jGMQsXYE2KnZos7k1a8LH2iIv3dyaqG9cNr3chJt7euY0FWvs4PpnNa4Nh0HG6k4pR2fkmkAC9615EonCCy8fVOq+gvqyOCm4nTZK98kSzybcqkS2b3qzTvwaiPvwgHyfrbolk+iMAx1Cj7W3hQ3JpNo7DsVEdbdFO7LjtCTsOx60FJC8xIZgRbVjUTQIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7YIb+GCia4OcaaZT0dev4tPK8mwBWPNw9LY6BGfpVc=;
 b=O2WI/fHfV8FbAMtnBE0qW+rfIln/AXGw2jhjTvxzl9pM/GikS/8rLOFn7jXQKSOJxj3LqzRejyYAv706/8Xa7uKqG8tWrFX5Da1Ms+fuJ+DAnUO/xiU3GHOW4uuI4RZ5konc0sa1bCdf0QkTvEeQFzkCfkZfmL0iwpdB5CftLRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:39:37 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 09:39:37 +0000
Message-ID: <75af20a8-4f59-4106-9cf1-cc750afe38b7@cherry.de>
Date: Wed, 24 Jun 2026 11:39:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why not rename "Maintaining Build Output Quality" to
 "buildhistory"?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <4871863c-1d5d-1ff9-2918-a2d9c6e19041@crashcourse.ca>
 <cfc70f67-3220-4766-ae57-035f66eb56eb@cherry.de>
 <5611a1fd-167e-a1a0-c644-7e92248a6afe@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5611a1fd-167e-a1a0-c644-7e92248a6afe@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 443bf188-d218-4e62-10b4-08ded1d481ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|3023799007|4133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sTCWfbrbVDcty2l20FXESu6+So3gS1TWG+NOyZvh+9iMcxrOR9/IRf8y/IeL2K8pnKVes43OTNl7xUN4JrF5jCS/hLhd6oOi/6NXfN7rCHBssJv/pviXbmFlM47aWhzZfrMOBRq/p/4LbwkhC04sqWw/ev4WTCGn+nv4yplA2IU4iUgNAFRyQDlgw66C6bDhI/dEYqr8OrI1Jfbyd+TTdLe9NFzrlWlerrRl8mVwA5qAV3kIZTSO7LKs8hV8K2Y2vF70N8IrexMuDMf0efItMdLdyt5BbPoCHz0L5VUWFgkICQXDmDG8nbX9g0J1y8/nvy416oUCGYNlY/SxcWnoajOWqiT0c0MKV3HTyKqJjMSbzbdwc+D4aE08fetibzon0Nmplw3Fo+5JleEq09S1AUouDZy5cc8N6FP0wtKAwqiuM3QAaTTI167lqqSkGxFrOF9l/zP3mXjB0FKzhvjJaZYRLDMMEOVuxhxp4YLz/ahoCX7EPJJ+oj8Z7GkTX+CxKRuQkHtl+mLIpKV3gLYIRrmtlWzS7gdlxG4nwypFZJBeSk82OPotvjmvJWl41UeG2LdXv9Tjn9mi2SMik6YbiJSfapOrtj8A72CssyS8aH+2ItPzCvuNHZCHL3dtvF+v2UOACO4CiylyjN8LY6aVamvWY49iI8MnPWYUqJLR8Jc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(3023799007)(4133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ak9raGsxeXdWL1ZtSmRyN3V1clN3a09hcXVoWi9EZUN6emxDK1Znb0liQmhP?=
 =?utf-8?B?cmNuRmNiLytrb1oyczRnSjdTQjRzbXNxUm1GSTJaSUp3Y3JWa0hYSXhXaXFP?=
 =?utf-8?B?UWlSeHpDZHliRW1Yb2V2Q1ZLRUxyakhjNE1GMXRPYlVGWFBON0JkY0FxL2My?=
 =?utf-8?B?MUl1QmRHQWNGUGJHM1Y4amp1QUhKMEtrc0U0SDVUZ081TFA0SVBORHNFU3Nh?=
 =?utf-8?B?NEM5M2pDOE0rODBKZ2ozOHJWZ1BNNGZpVEQvVkdHYnpXRTVwZ0xUclhsTVBO?=
 =?utf-8?B?bGFaMDM0VG1RV0Fub1o0TmkxMjBqUnZ4bFQ2WXVZZElQRXBoa01yZGx2OExt?=
 =?utf-8?B?TGJhazdUOVJPdHQyTTdnRHRMWEo1cnQ0UXdZRHNxOHh4V292ZStnN3dVVk1v?=
 =?utf-8?B?WEVnMlRWaVQwUWhyMU1ZbE9lUFd1M3Y3aTJ3QlNjWXYwdllyVkpEUXkxSkdZ?=
 =?utf-8?B?enJwYU5FS21HOWowWUprbWdPLzE1MnZYdElMOGltRDNuaXNiYzREaktHUnZN?=
 =?utf-8?B?RENaQzV3ck50K2Z0Z0Ixc1pnVFU3WVNudXlRdkloM0x1Sy9KWTZEUHRaNkds?=
 =?utf-8?B?ZnEyeVVsTjhBcE5mREdjNzJEOXpTZE41NkVlVUV1RXYyOUNwQ2NHYTkwZGdC?=
 =?utf-8?B?VWN6RHVYbkI5QUxrU3BsaEM5VHpXZXFCTG8wL2s0ZnFZK25XY0tWRXpHSzJr?=
 =?utf-8?B?RDdOU2RocUlpMkdrWm5MbnlJbjRLM1MrWHRCZEtTaTdaTDlxdGdsSkVXMEsy?=
 =?utf-8?B?T1NKbzBRZW1HVmw0OHJwTFMyN3BzNnVPL3FTam5WSGd5aUFXTHU3QnZZRWo5?=
 =?utf-8?B?Y1FDd1JZVEJjdXcvNE5tcSs5dXdRdXJaL3didUNwalQrM29ybnZyeXpkQTBL?=
 =?utf-8?B?ZEZKczFYb1g5cmVDU2cwMm1UMUU4d3dYZTJIeUgrMDlocmZaM0w5SFlFOWY4?=
 =?utf-8?B?OUtFL1VlN2h5SVIxa2JqNVo3eEpqSm1OcXhGY3VjdHlRUndlTkxsUTg3VE1l?=
 =?utf-8?B?NlpSSGtJaGluWU1DejVzaDZFOGthVXZvNTFuQUczZzhMV2htbUJHa1hBZEg2?=
 =?utf-8?B?V2dlWjArejlRQ2gwUytZdU54YWFGSkQ0WTVXTmYxdG1QZlZmdDlzc0N4UVJt?=
 =?utf-8?B?UWJYZDFwdWtPazI2YUh0R2w1WU1qUGJXNExCbDJZV214b0NnMHVaU2ZxODE4?=
 =?utf-8?B?YTZWeXNkbFJtNWZtY1NrSE81d3FnOW1XT2dmdGZHR2wzN1JXLzNQYmhBQnVD?=
 =?utf-8?B?Z0JYZ3pnZ2VIWVNNYjRaVmlleWhLakxCemlBWVpSMWI5WjZidEhiaGxwWm5w?=
 =?utf-8?B?QXRHdVlhSWZBWGlYMXdHRENCYXBqRGlXdFF3UFhIRFJBWkRWV0VOaS9YTjRu?=
 =?utf-8?B?MWtwVEExck1sUGxmS1M0Kys0R3VIMDhLSmdnaVNNcE11T3RDMVZ2cWVreFQ3?=
 =?utf-8?B?Z0dKL2pKbkl3TGQ5WDRFeUNyRDB5cnRyaGlxTm5VbUcycThCSnM3bjZLWXdy?=
 =?utf-8?B?Sk4vMUJYT0tQdGtoNW81VkpBdUhCRmxUVmwxL3JhYjhtbXNtVjVMZklKNWtW?=
 =?utf-8?B?TmkrdnVHWFN2RFBHdnVOczV6UzREcTArSXVJUkVWZjVjVTZyT24rb3dodjdZ?=
 =?utf-8?B?TEdGYjZBVTlRSGY3L2hSKzlHVUJmdUwvK2pSV2RsZkQ1QXFOZEIrelU4cDNz?=
 =?utf-8?B?ZGNvTTd1RVpKVFRzcjZTQ3Y3ak96SlBLZ0kwNG1DelJzSVJBZ00xWTJoMWtn?=
 =?utf-8?B?UEhMbmJVM1d4OVVYMmJRK25KVm55eGtmem94dEliVzlQWHo4c0lpMXBrR2Q2?=
 =?utf-8?B?RFVzVjhyOG9zeUFiKytoTTBNRTdUeXJrK0tFaFByaWp3a3E3VVdIVWJjalN2?=
 =?utf-8?B?UVFNMm1iOVh4dkdiOGdESEdGMTlQNHcrbnNqV0piMm5SSnhrU093aGlZZjJa?=
 =?utf-8?B?OC9XZStwYUpFOFZnbC9LZVQ5aGNMeHJyTC9zVVY3cHhaTFd2TXhsM1VjYkJR?=
 =?utf-8?B?VklSVFhNMDAyWTZzcjAwbi9nRmZnQW1xRHBiZlI1bEpRTU9QVldpODFyeEpn?=
 =?utf-8?B?ZExzRWk2bCtKSnhhWVMyNDY1RVZ3dndqajJtdFpBUlR3VWVRVFBCMUZtSkhE?=
 =?utf-8?B?VWJOWlNLZlIyckgrTDhPZEJxM1lnNHpxNllVOVhlRmxMTlFDaFVvd0xmUjFC?=
 =?utf-8?B?bmZLSEdiRE9oM3lsMVFtYWI3alIwRGwveUJUd20yeW5wcDNwbVJFRHlJZDRL?=
 =?utf-8?B?dGdqcGV3NndkN0pQR2NZODJMZng2U2ZraFB1V2tnYkhsVFJOSEF6OVp1cDlU?=
 =?utf-8?B?ZXdqMDdUZXdDY1FGUDNGL0lWZ3FWc3lJUi9SQ20zVkJHQTVtODF0QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 443bf188-d218-4e62-10b4-08ded1d481ad
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:39:37.3287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0SMAqmy50JHX/oG1QblHE5Q/1lxMOHwl6NdQtcZr2/u9zZdlayh4GSJDa88A0fKS7d04lJx0z6RKHSP56RA9jNeiGfIU1DpLHyzDeTeqIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:39:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9854



On 6/24/26 11:35 AM, Robert P. J. Day wrote:
> On Wed, 24 Jun 2026, Quentin Schulz wrote:
> 
>> On 6/24/26 10:21 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>> while this section is titled "Maintaining Build Output Quality":
>>>
>>>     https://docs.yoctoproject.org/dev-manual/build-quality.html
>>>
>>> it's really solely about how to use "buildhistory", so why not just
>>> call it something like "How to use YP buildhistory"? the title seems a
>>
>> OK but why would I want to use buildhistory? How do I hear about buildhistory
>> in the first place?
>>
>>> bit misleading and even a little inaccurate.
>>>
>>
>> What's misleading or inaccurate about it?
>>
>> """
>> The buildhistory class helps you maintain the quality of your build output.
>> """
>>
>> This matches the title of the section (which appears in the navigation panel
>> on the left.
> 
>    because the title suggests a more general approach to maintaining
> build quality when the section covers only buildhistory. so why not
> just title it that way?
> 

You're looking for ways to improve build quality, will you read a 
section called "How to use buildhistory" when looking for that?

> rday



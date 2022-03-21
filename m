Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458DEC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:19:07 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.87])
 by mx.groups.io with SMTP id smtpd.web09.25.1647883144609883276
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=sxonz00+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.87,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ya2CbvLUmFbyTsGVlChRSc1K16gN2jGRRRKr6SbNGhTIC2OZmDC9xRvmk6UOFapHMnK63xpz7+KLbla2M1ITjY1lc3RAomZSUYjpwrOSmMC7hrtrddMR1GJmZ5HQDK8Kj2Kstw180bJAl+Dvvr6+ETrmWBz32H6PTgDFl/nINfrYTNsy95VO8rbBJhjIFDheZz6ABjcPmDdQuD7ED1vaRJxcAMr21QG00GriWYdrJOmkzw0WapeC9TOtCWEsMEejAuRMiynJ4EGlOny9Zg6WuKKmsimfey3/M4eKwcmlHD1a8IlVIARJvs3bE5KZixiPT/bMkZrL5t9BG4duuW8Vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b+pWeu40An6i0iwsnuRg7TKTak493UyOAyCWhZT0+U=;
 b=UAx/ubm4LqRdGETlNJV181OSWdY9q9S1dxx8OmYxR9OuG9z0ZOTz1XR8ygpBLYaVL7Hl9mdj/XdMcle38aIYEhmR+Rt1b3nNW3GByZOk9yaklWNLcY45VUMjrmRlp9g3dVZxfp/skqIukrAZW/pV5MVNJutWhJ1uxs7+MOuIkT0lkmJwvM7O8pkmYmgPDIvW8YcUMCRcvGa8c7+ZyivTGJgmaWgfJnGhxBiUGBwIQgpEuV3NDtJ3QjXpb4bbvZDvKSri89+A3is9UIrjsbpP0NENp1SvkYh/NdiU2H/xvSlgq017yuP2oKCcB93XSzsqwGw5Son7SnGAc6Ql8Uz4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b+pWeu40An6i0iwsnuRg7TKTak493UyOAyCWhZT0+U=;
 b=sxonz00+y78QfrifFxGEvSsNN/2vRYjzQpPE5Mg1Ln8PiF0OlsHVbT7si1/KKgfez7nl3a6iEuu49v5CHzxZriTgQNBxTnRYifb/fB3RMrHnkG1oTIje9gcBN4dpiKvRKEC8nqPwyMY9LCYSJlvDH73a2QpXchz6NXz66Lm/nbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by HE1PR0401MB2602.eurprd04.prod.outlook.com (2603:10a6:3:84::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 17:19:00 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 17:19:00 +0000
Message-ID: <a0cf7c85-a61a-d15e-355e-193c537c4965@theobroma-systems.com>
Date: Mon, 21 Mar 2022 18:18:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 2/2] set_versions: Handle older non-active releases
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318162945.1072835-1-richard.purdie@linuxfoundation.org>
 <20220318162945.1072835-2-richard.purdie@linuxfoundation.org>
 <300671dc-db7a-1005-e84b-7987dd050294@theobroma-systems.com>
 <09de573178a10bc0e8d639a26531cdb2c00438fd.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <09de573178a10bc0e8d639a26531cdb2c00438fd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0018.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::31) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5a208b9-9403-411d-275e-08da0b5ee390
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2602:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0401MB2602BAF5077A9CB2F5E74B14C2169@HE1PR0401MB2602.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LXLTVzZsp2EO5JjnOtsgH0V8OYvM3Ii3o65i5OkPy7KjJt4olUj9YnvM1+fNpAHkDsoHbADYHYwmWC/z53QqpgaNceu2BNRZwrcKI7XbII0l1Q7dddsHF/wYzwfLJ1RrMZdcRroLBIL1sremzFsFu14UGVvB7AK4x0XaXzGF93/fF9qZNJe6OoAnUWkX4m+wTUAu5OEJ/XGcW9uDDGX8RgkkZ7KhAqft+8JP1AZpiroEbCZj1R5APJUvxNcabS7zmUSW3rA+pB0bIEA1His7v769wJltsURq45cYjTCmZMzjJhrhS6YV/XKeJYy5dX6wNSRW5lhZgfLaX132L/Zxw8da1R3fb3DF7Dpqtson15MUrQqbKnUdJWfvglXGWtHiv+o8lIeqHrtT0XpbYObbnWCRv4uaYqxkvY0EMd2ygnzHgPKMt+JUaXu1UD9UYGhEgdv+Kcje2CqcNNaepkUr+ootU6N2fQ494Dfj5c1cZ57J1WTtGT1vM8sgJutx6kXDvRbpUb1wwH1sWGAL/KVf8idHzdwABcl6PUor24TVHAe1om6Zudzaa3dss+eVb+3j29ER1xRLCILLExxlbE+wrZ9f11/VTJjLN3gR942RiDhD5sC8InnR5JR1fCQcx0/CS2AcSCaVbrCq1OILMiOF5zL40JHdkNQcsC6n9UU2YXYhrmgQWqqGYqbIFJpkHoIJgeMH8isQgXybKQLkGO+ssN1BqoouWCv4Sjdntje9Jc241AWDffOi6liMDXpUa+2itMSBdh0X4ZI2VM8hX8f8HP2B1b0QZPK1nn0AWWHwtl9AM5hAgbfPtLeZxjW0WNAW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(2906002)(6512007)(6506007)(966005)(508600001)(6486002)(8936002)(36756003)(44832011)(38100700002)(66476007)(66556008)(66946007)(316002)(86362001)(31686004)(2616005)(8676002)(26005)(186003)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czR2U2o1bnh2SkZXaGVEOWlBVXVnenBUZTd4Z2NXaE5oVEdZQUpENlJMNnlU?=
 =?utf-8?B?cHdrVXdNUnBzS1ZWa0o0MzVGcFNiZ0U2dXpvbDZtY0R5cTZveGZHc1dDWkNm?=
 =?utf-8?B?bytYN1V3ZjlHRCtYYzRneEZNcWF2T0RXQTc5eGtMWWwzb0xocHA2RjQzcEdy?=
 =?utf-8?B?WllpaWN3UWFxTnhhU0lpSWZtMmR0YzRwWXk2QTNiVE1UVGpRVHpkTG9oeXpS?=
 =?utf-8?B?ZmxmU0NncUhzZUt4M1R0cDUwajBoSU10M1daeTB5dm1KeXFlSmx2UE1wWms3?=
 =?utf-8?B?WE9ueFRVL2w5RE5oTUwxd2dLWVIwRWd6d3pVOW9BMFlNaDhYSngzbmFWNDF5?=
 =?utf-8?B?ZlVJZHNnY1VRT3RmN045OTczVkViaHZvQVVHNjRnTHpPbk1rS3lCcnF5RVVE?=
 =?utf-8?B?UEtRdHM0ZGwyUlBLR1ZETWY0d2tDNG5OeFptT0RpQTF5WnBKZHNVUDFCWHRZ?=
 =?utf-8?B?UXhMRjN1SVArczdCUkVENnhkaE1mdU1SWFU1MUdlTERPcy9Qa21LUTROd3Bp?=
 =?utf-8?B?ZFFBSG1GYUxwbkFuMnNzRXNqOXo2Uk9ydFYreENUWWhjZTdoUDR6ZDU0dHBs?=
 =?utf-8?B?aVZLVElhckViWnJBTnp3ZkszN1BRV3FOUlZmbjNZVjJTbkIvOUY2VnY4VWdy?=
 =?utf-8?B?blRUelhxcHdZbWQyczVtZXk5L2NHYmRtWGkzMHRmNFd2d29rTXlMVk1EK3V5?=
 =?utf-8?B?YXpzSGRVMlNrNnpXR1ZuMVNJYVhqYzJiZFltdmJHNmVaQnVoSGU3aWxlSFl3?=
 =?utf-8?B?UUdxdEtOcU9uSjVidVpKVy9td1BHcXQwNDJDWE5JQXhINDIwM2N2ZE83OENN?=
 =?utf-8?B?YWtPSCsyd05IU3RyUTQ3d0VtN3J4bnQwOE5mdHJndWVmMEppeUR0Vkxoa1Fz?=
 =?utf-8?B?VGxaVTV1eGV6L0FhQ0JhRm9DTTBXM2QxdFJwdm5leHpFNUd0YUxydS92L1Zv?=
 =?utf-8?B?QUhWSGhNSFlaa1VwV3FqaFBNL0YvSHBGTVBHTVQzaGpIekR6bFBKdVVvY3NP?=
 =?utf-8?B?NDdSeEU5NTEyeEllYTVBZkdNL0RZQlZPWk1ORHQ1YWE4VjJDRk5LUU1maGpr?=
 =?utf-8?B?WFUvTFdzUGZCYWFNQ3JaUEhpTFBIWTFEQUVLMU1Zck50N3VTdkVRVU9LbVdM?=
 =?utf-8?B?YkNYOEpmVzdFWHlPSHB4NHBwS081empCdnNkdFVVQ01UMjFMbHFUL1JFMHJl?=
 =?utf-8?B?ZTBrUEFDbzY3MzJKUnZvWEFYd1l5aUtJS1FZdTdVWkE4dllubmJQQjBEa014?=
 =?utf-8?B?UEdOZldmU3dZQnRnY29HaGlwbHRzR1ZBenROeWtKRWtxdXJFWGpmblRnUGZv?=
 =?utf-8?B?Zk5vTHZNb3VYcGNkV2R5VzJzc3ZIcUsrNFdPMm05STVRSllqc3pqbFZDRzZC?=
 =?utf-8?B?dENmMk1jTVNVZ0oxZVhMVE5NcDRndUVlU0diT0JMOTRGVnlWSHBacTRQOFJQ?=
 =?utf-8?B?dWVUbDhycHNpc2hQT2l5bkM2dERMUVRSZDRzVm1IcFY3YkxZdVprdzloaFpn?=
 =?utf-8?B?MjZwSE1kT1ZlWWQvSXEyckYvQk14Y3RiN0VSYlkzVnpNZEJhVUZMeGdhbTdv?=
 =?utf-8?B?Y2NUVVJZcXZJVWJuVFN4cVBvWFNuZXlNdUYyUHc4NUhjQVpYeWQxaUxMdmNi?=
 =?utf-8?B?dGpxaUE5VXNEZGd6dVFyZFNPeE5hY2JQTVc5NTZzUmJQK1BXRGZhYVNmR2hU?=
 =?utf-8?B?VXB5alpVbmcyVTU3ZVJrd25FcWJaaWVDZzVHZGtBWDlOWitHZmIyL1R0eG15?=
 =?utf-8?B?VlZianYwVHBuL3V0Y3VuQUNpNk5oTzlQdG5LTUhjcmFtYjBrWkIydW9mUjUv?=
 =?utf-8?B?Q3h6eGZvTUE2cXFlazZFLzdMRjU4K2JvaUNEQkswbFd2c1Z4NGl6aEp1aWxT?=
 =?utf-8?B?WjJOQ1ZrYmRCVUpjVVZuSEZjc3FzUnVodmpmU0ZYSGZxSm9Fc0NZU0lwdlVB?=
 =?utf-8?B?M1J0ZWZrbzMzQ0MvM1pkNVplMXYvQUNwSjZWSTNGSnN0c0tIVnpIVWlOUXdv?=
 =?utf-8?Q?qZQWGu778Lt5J6mK42TbR4N0VEHhVk=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5a208b9-9403-411d-275e-08da0b5ee390
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:18:59.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eGORDXxWxdrE+2oKanrGAPA1TaBp6gOhFtS6MddWYU7tU1HgZuK+8Xkh6SXqvDICUjgkXsIu13LNmFD+L26mk54kc7I9RYtmi1FcZkEvOhvIs82TqGI1OgAqiV3f6DPh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2602
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:19:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2659

Hi Richard,

On 3/21/22 18:14, Richard Purdie wrote:
> On Mon, 2022-03-21 at 18:11 +0100, Quentin Schulz wrote:
>> Hi Richard,
>>
>> On 3/18/22 17:29, Richard Purdie wrote:
>>> Ensure older non-active releases are shown in the switchers.js
>>> release list.
>>>
>>
>> We're currently showing EOL releases in the docs too. I think we need to
>> discuss this first before removing EOL releases in the previous patch
>> (pretty sure I commented on another patchseries questioning this
>> decision). I don't think it's a good idea to mask them but I'm happy to
>> be proven otherwise :)
> 
> I'm of the view that we should show the currently supported ones by default. You
> can navigate to the older ones or follow links to them but we want to give users
> a strong hint about which versions they should be looking at, and hint to them
> if they're on old versions...
> 

https://docs.yoctoproject.org/3.0.4/

Shows a red HTML header.

It's a policy decision. I know it's been hard to encourage people to 
move to actually supported versions of the Yocto Project, so maybe 
removing explicit links to the docs is sufficiently annoying for people 
to think about migrating? I don't know.

Not nice to users but can see the reason for the project to go this route.

Cheers,
Quentin


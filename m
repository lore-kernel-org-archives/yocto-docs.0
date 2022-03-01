Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B59DC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 14:03:58 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.61])
 by mx.groups.io with SMTP id smtpd.web10.8324.1646143435227700269
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 06:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=ejHClode;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.61,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqSsDmC7Cug0O0d9tdH86iIBhNjsvkZ3ndVg6rvo1Xe05cK3gV32jmlVaLmYeCYjQRcZdDIqEy0lcVf+kci3E5xzz8DEvdHwZyKA1GW9KtWzykLixiTDbKWdS9Z9CXcrV89x5xSMDxKgDNc25rPQ/1UXMzrR3x1gVPOyW9XkXNVJBcrDNnuhYTTcV/Feij7E4YT8+ybDmjEVq/H0wPHbJTRN4aZzp9YIoCdek/QBPzjFIPRirV/KFSCggRsexMfIEIQeOfwCwIDuOWnp5soIuqiUlAeCLSTrFVNaX9XJcW4gjoVuOiO/B6GaCx5VHfyrMwdaEmK7FHbBAmyNLaacoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRIXGsnL7QrWNG+M+j8FmZT6OdtrMPMgYs1Uv68HFeA=;
 b=VGZvWsCHx+kZc3GlkrSw6EUVaIzV+851/Q4DfdbFQzbzOmEcAQFzvBr4vRAR6sD56N9VfJJ5jRF9urY0sKfYHEk8nc1DgWA95/LSacW7tLgQQPyGFkukf0wnPu4bdzWJZZTS63SjcltbNDhScOpoAgON+4c4SaH6/UNljI2WgknLqnmEw2jwj4SsskArRVLjvLUGRE6Rhy8zIvfUZa30rZGpRnB+iNVtSIaBiXUX6D/PAOz8cNWKExcg9mnWHtWHK/vy5HW2bbY0Y0O/gtd5bVEb2GbtnHBJPvrlIq11bz1K7tBH7uo9BZ7Mqjx9z2XSsawli638YMiTCTguIJ2QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRIXGsnL7QrWNG+M+j8FmZT6OdtrMPMgYs1Uv68HFeA=;
 b=ejHClodezquDTPWbt3fIsV023c10E9AkVc54yjHRIlmJxPc/P28tQwZftoPAQ/cQhdwYNciTO0zE28bf5w65FJbO9ODGjOymZcD3RvEjbCVdFVNXD0oAVwChcJIj+kv7h89emouLsdQEhDKWfXqdMjGjanIfrks+kaNkMkqREtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM4PR0401MB2306.eurprd04.prod.outlook.com (2603:10a6:200:4e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 14:03:51 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:03:51 +0000
Message-ID: <8a194f2e-aae1-85ce-8bfe-0192961660d9@theobroma-systems.com>
Date: Tue, 1 Mar 2022 15:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] manuals: Update LICENSE vars in examples to use
 SPDX license identifiers
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 docs@lists.yoctoproject.org
References: <20220227182435.6239-1-peter.kjellerstedt@axis.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220227182435.6239-1-peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0043.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::20) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08590c40-d11f-4fc3-6acc-08d9fb8c505f
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2306:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR0401MB23062804DD56BC28D090DE69C2029@AM4PR0401MB2306.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TeAeUY2PO6WGOH7YJEvdeqKL+zmlV8CAi/bfIVWUoltbgkCyRTCGvMdWpPMPtZsyYNGWrv7rPKZciwT3DkdqwjexmcjrEzH/g70Caviskzy39j8W00bAsaTF/Ty6QEzBLITtUb2Ogx6/Swhn9v2na6QO8/2g+RFYA3yfo4q89uRSTgMyMN1sKmtMphKECiVw/2TbROrPCCOkq1KZEjiKHBWnSKmrtN1alKBr3J+ZjyCPQa8WzH9ycAWsnfOMUE8FLgFpaNC8C1Sd3Md23peMaVhDGz8QzwcbtPWmCuJmtyRyfJ6uIDR1KSOPGqGBxgDZLxARX6bDAu4JN9v0vUbP7YzP/Awk/obWI4e2XVlEdJEKDXR/qy3oaqY7WcMgdZKo3nuYKvvCVoeK6nc2YBk7NtK/YCPRfvguKtlFzpuDMBA8/UmPq5NawRIAQPqIzU2v++XV3RG8sNZq6Y38D3U/pRl8sZo5TQQMth4DJphW1qRmXKVJwvixAWHpI/RuJFwdGcSwQmvb856vDnh0sH8E5neVXdBGl6C5ck+Pj1AlonIjdx2ZLCHTleA926U5cGRLc3tYuUCWjor23G2yQoV4iramIAfuTdo8yib1W3fglxy9jOJLEOvmVA89avPvNx4CxZ+2HPKqX/nrbHkVJC0pqnYIQjuQxJwUI3hazvdY2asPW5Nk6RCl4UbAPFAYqYaPuvRGEOh0FeMI1wG3ipPDptfdfg3tmBMzQhu7hnINE0k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(36756003)(53546011)(31696002)(2616005)(6506007)(86362001)(508600001)(26005)(186003)(8676002)(66476007)(66946007)(66556008)(38100700002)(5660300002)(31686004)(44832011)(6512007)(8936002)(4744005)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEFGY0NqRGJ6TThsME9RVWo2Q0tIdVNMbjRlY2lIMkE0QTR4by9LeTJhUGJk?=
 =?utf-8?B?ejRoV1VoTXJXV1V3K3JDRklrWXlzNGRjdm42cEhqekl1NFNQYTJpekxrVzR6?=
 =?utf-8?B?YkRyMmEvcVNZQ05vSVdhWCtoMDhmZ1AzVWVUa21hL1VTMXZlaVJKSEhKNkpz?=
 =?utf-8?B?NFZTRmhpMitwcDI0S0p1N1liVWw4Z0kyc09mRnB6QXpBb0V4Mk15MlA5aFBt?=
 =?utf-8?B?UGN3Q3lPNGFkV1AzWDBWWlNpTTBTdVpLRnNIZHVsZWREVG95M0NwYUtubGF0?=
 =?utf-8?B?NXNkaEs1dEQwUXRoYm1NT0c5bWNkUGV6ME9VazBwQjBpaXBrekE3NTUwNkVH?=
 =?utf-8?B?a2pNc2IwV3o2T1dVVloyeTlMQVo1cDR6QTZQTU02a0tpRzl3Y0RSbGcvY1gx?=
 =?utf-8?B?R1o0MXJvSFVLZnUrNW8zMzdob0YvV0VnM3k4ellaeG9NQ0Ntb0xKeHB3aUxq?=
 =?utf-8?B?VXRYM1hZcWNDc2J1a2NmaCtRUzk2dHVsb0hUOXhFdjRvVWFQbW15REZuU1kr?=
 =?utf-8?B?aWJ0UG55RGo4MmNkWHc4UHkrY3BkM1lYbjI5TFB5YzhaeW9HcDRQbXN5ZEEw?=
 =?utf-8?B?S3U5bzJZRU9xejVOdmF5YURybUQ3UlBQdzFDNXZyT2ZLMGZ3THFXbVh3R2dv?=
 =?utf-8?B?SGsyUThPMU1jRzFnVXRqL1VIZCtjTm9Nc3RYbFNsdHZzY3FIVFJQdGZEZFg0?=
 =?utf-8?B?dlhzWVpGNXJUWUNFRzhJS3g0SWZIRGJpNjdRRTZMZmx1VkJZM1pjcVl0eGVn?=
 =?utf-8?B?QVZUNFE3bGVYb3puT3lJcGJvZDZqOWVQdlBQQ1A5bHR4T3R4T0JzWUI4RDRG?=
 =?utf-8?B?Snc4eGtVVTdVSVNFNmU3ZTZUS09ETytYT1I5bEZiS0g3RTRoMnRnWE0yakts?=
 =?utf-8?B?alozZlRveTNQVThpVmhmR0dxR2JscXJKVmtNVFVod2ZxQXlLWnJvV2RMZXk4?=
 =?utf-8?B?MlNhWmZLM0gyNlRHUFBYeVZNM3VjMzNxZ0k5cU1uOWp0T05WR1VKZHRoYXFE?=
 =?utf-8?B?VEVjSFFSbzdqZitvM3NRNDNIb0ViZUtHMytqUVZNS0FFa1VHcDhUMWZMNXVh?=
 =?utf-8?B?Um1FZjJ3NjZaZVZRWkx6MXZnY0xzM0RFRXcwMjduMmVLSUNnZmpBZkFGVHNy?=
 =?utf-8?B?YUcxTG1IYWYrYlFMc0UrSk16eGQ0dUt1Z2Z0VUdiZWl6eE1kdVcrZ0c3dWxB?=
 =?utf-8?B?b1pXblVLV05jajR2V002QTRMRTVZKzdoVzlLdXF0TmlHMGEyTDR3NHg2NVJI?=
 =?utf-8?B?KzBoR1czZlY5MEw1WW9xVGNIOXFlaVFHR3JKTFl2b3VWUkZMTHlLVG9Sai94?=
 =?utf-8?B?UTF6YW4zY045cWxSL0c4OE9MeUdieUdBRXF5SjNEb3VHUW9LNVBRVzMwMmJm?=
 =?utf-8?B?VU02am8xZFlRY242WU42OWZEQ08vdFVUV2NvYUxOaG9WeTI3eVluTnpFczNX?=
 =?utf-8?B?YllIOVd5YWZRb3NPeGM4MG56ejlJTHl2NE1sNURLYnRyUVBXSmtnRjgyL1Rw?=
 =?utf-8?B?Rms4TVdrTGc0SXI2T2p6S0YvR2tKQVNNY051Y1ozUWxGYVJCWGxvZ0Y5dmdp?=
 =?utf-8?B?cFhFd3dDWWJCZG9uenJ0ZHZlSzhJTWNJN0JyUXB1VzB0U3h5djBxU2FZeml2?=
 =?utf-8?B?cGc5WWswa0tMT1VIVi80NWNaRXdlWHo5cUtReDNJdC9ZMGtKaHNKeVVOYnVT?=
 =?utf-8?B?ajhKS0tEZHpmNkRWZUNRZzU0T0plT1l2ZEQ0Wk5PUGVkcWlTL2xnSmFweGla?=
 =?utf-8?B?UERrZlpKaGlkU1gzdHdVenN6YU43UWhsM0c3c3VjUHVnZ3VkNFhZTjUybzVx?=
 =?utf-8?B?aEtVaTlxck5jQjNWdzR0Y0NpTTRDaWE5ZXBIN1QrQjZBdk9SUFUyRm1xSFJZ?=
 =?utf-8?B?ZVBzL3d5U2ducy9DblF4TjZSSFFsWlUyMzlrek8zbFBpbXNiNTZQS1VYbTJH?=
 =?utf-8?B?NGlNWU5rYk9GaGFDWUZXZ2NnK3cvSVNrYWh5MkxneXh0dkJadlNBd2Vwajlq?=
 =?utf-8?B?YlZML0syTFZDRUpjdlhKTjJ6NzBrVldJUTRSYzdlRVRScFdZeXpYVnpQTTNJ?=
 =?utf-8?B?RUNIQWp3dENzbkF3TVJqakNpSVBaVHAraTlBLzlYYTRudWg4RUZyWVV1MjhH?=
 =?utf-8?B?YkNYQ1d6SUthOGk2UWp5ZDYwNUtId1d0cFQ2NW1XdXdySzFlck50aWNVb3d1?=
 =?utf-8?B?RnQ3aW15VVkva2E4Qi82ajhHRmlSN0VzaWFPenZqNE5RUUFWWHVQNmlpRlJn?=
 =?utf-8?B?Z1FnSGovNWo4bjM5dnpiTGprS3pSK25Ta2E3NXJ4WGdoMkdJOGdGMHhzVzlH?=
 =?utf-8?B?SWVQcVVxRkNxNHAyN0ZVMERhTW41aUk4R1JCZ1RyUS82MENySStaQT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08590c40-d11f-4fc3-6acc-08d9fb8c505f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:03:51.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W1PYFug2pXMLxjECfdsWrEvI6dg0xEJjWSUHc+Hz000L2o2hT+LT4p0ZRMLugcM6uMKQVElSog0vsx0HwyhJKbCHgpZ1khJafLjNLd5JZ5Cei0fjwlIyNZMI/4dFvUXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2306
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 14:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2516

Hi Peter,

On 2/27/22 19:24, Peter Kjellerstedt wrote:
> This is similar to the recent change in meta to only use SPDX license
> identifiers in the recipes.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Looks good to me.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Thanks!
Quentin


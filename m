Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D218CC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 14:50:23 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.32])
 by mx.groups.io with SMTP id smtpd.web10.22760.1752850221100492824
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 07:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=U8cphcN5;
 spf=pass (domain: cherry.de, ip: 52.101.71.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5Yre4FEtrK1VLu3H/DnPP7c9LTSjV/6SyaINP81KK27At5PxeOkoPRw9PGTrRGOk1S2yTNMS6EWNDjeyXeT2QSo4Tu2QK91HenfPFHnPwJqSrZHd+Cw+86GMt3jOWwH56BX5/n83NIdR+ziZpHpEyoTujZAqPo0PxG6if0BmPTF11sDw2ITlGZievbsjdLRyJmc9qSbZyyrGzOYNJpoKxxlj3Mky+509MoIqqZKGBqA/Kut8+nsHje8CWwOKG3nmQnvYFMfuCc/0L0/2nDYn3c4D77ZNGdRkUtZSS5YBnXLU80pnCTFZ9qDYZhkRcSb7g6uUrwWwBBjMcZbUklX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FS2etyuJbI/xeLSTioVWY2C4Bpi0UHnDW50oRk50dKM=;
 b=H9MobTwuvyYyQOESm71FAXJDLcyQE+Ino+w6izlK6hXJ28X7Bcio0Erve2WnTMUld2HILmpp0BZj5JWQxBUHT3pkzcEA4eJT+X3aRjf9eTecTLJnqv78rYWEV3W0nqtjU8P+IfJxPzNNemo6BcLx3AQUURq+QCjkuQz9/OJVl1IGylE9wtFzwXz01xa+ivoyammYhBz6Zs5RudZvehKK8Zl86mP1eDt/B6ZI/5A4SjZnIrmUjPT8Md2L/lmuIuxhb/mNF8QNTnXkANnwwWxY0jCyPGRi0yBUFva86r/gVZYD3PjJBrvB1RQKQsK9p4WExEvepBevNbBVQ59Hjvfx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FS2etyuJbI/xeLSTioVWY2C4Bpi0UHnDW50oRk50dKM=;
 b=U8cphcN5gNI2HrFOsykqOfXHIxjnVrk7HrSoV6ZXJaOIPcjkv44B9J1dYTeUYSuRrG0P5f7h8APR8W0+o7LxkWlAQgTbxYGL2dFWYDyvB6W8jd93aFqSHwzgKCwiUt8LEe4czW0Hbgt74SSOZXT4GAhlFJaqKqvwU6QSYv/oWuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8751.eurprd04.prod.outlook.com (2603:10a6:102:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 14:50:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 14:50:17 +0000
Message-ID: <827a03ee-26f4-4978-bebc-0b69a4eecf6d@cherry.de>
Date: Fri, 18 Jul 2025 16:50:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: document new toolchain classes and
 variables
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250718-new-toolchain-variables-v1-1-28c6b7054f73@bootlin.com>
 <067e7f70-651f-4c71-ace8-1add64d90144@cherry.de>
 <DBF991RS2X9V.243VRULH3AE9K@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DBF991RS2X9V.243VRULH3AE9K@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:802:16::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb3a718-d937-487e-c54f-08ddc60a691d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2gxMkNpR0ovRjFUcW5nY25yZVR1akFBV0FkYzFacDF0SG1PQ2xsVjdwaitj?=
 =?utf-8?B?VkYyZlpVdVJxUXZGQ2xYRmUxNGVNcnFraXYxdG1obnZFcW1UN1BVUzNFR3RD?=
 =?utf-8?B?OXhZajBTdkNqTk85Z3dPdElYc20vVjhSMWUrVTFNWlpjdHN6dFFjQ3VRYlov?=
 =?utf-8?B?VnV0MkJaNE1SRDYwUnlSdngvZ0FEUi9KbkYvV1JpOGpla0VCVExUZStNM1ZF?=
 =?utf-8?B?a3c5QjhqOUd5S09XR3FUZjRwUEtKUlorMzBIL2Naa2liL3BXTE1XQWNGQjgr?=
 =?utf-8?B?RmdvS25WMGRhb0U5N1FUQjhWcWNmc3JlQVJPYU05ME9ZVWZqeG9ZNDFzL1A3?=
 =?utf-8?B?Yy9NUkRpdHNQKzN5SVhFRkE2ZENvUG5rQVI0V041ckJidnZReGdKL2V5TEEy?=
 =?utf-8?B?Z3NCa1FVVGFSTGdFLzlJa3JsejlaRjhzYTl0WjlTaGJvb2NOYXBrd29BQkUv?=
 =?utf-8?B?TnVkNzErbFUxWVprcEk4MHVXcGM3L1JubWs4RHFRbGpUODJGdzRENTM0eER4?=
 =?utf-8?B?Nk5OMEJ1WURHUFRNSzkvd0RHcCs0Z0dNa1JuNENxaVpFdkFOQyt2RjdCRkFI?=
 =?utf-8?B?YlQrRC9yNEtRcnJITVoxbzVrL0tPTVg1NjFQRjdocW5qZFpldGxoa2x5UHQ1?=
 =?utf-8?B?T0M3VnNDT0FqcGxTRmVBemRTZUJTVWQwRXowSWw3b29EWm9uUWZSS3MrRGZo?=
 =?utf-8?B?SnhZb2ZjUDBVRWZHRERtVDNmUUp0cHFIUzNKQnl1cEZKZjJMUXdmdXA5Z09Y?=
 =?utf-8?B?ZDdvUEQxeklZSEd5dDlkWU5FaG5wWGxjekJXdTNlVGtiUkpXdnBhVHJSMkFi?=
 =?utf-8?B?eVFCeXQ0cUk4SFJlTFhPSndSKzVlWmR3b1ZobFJQMkIvV2RBUlRocDRiL04y?=
 =?utf-8?B?MERtZkVFVUZkK0xMcGlxdmNqRGtIS0dkRWpPaXJlU3BoS3NFam02OWVTV085?=
 =?utf-8?B?S0Q2Q2J0TU1oSDQzaXZTZFpWMlB3TFJXb2UvR1RWcDRJb1VLcTRyVm42ZDUx?=
 =?utf-8?B?RmsyVnpWVTV1ZXNmNmFVUVRtODBmakpuVzN3WWQxM1RuQ2VLOFp4a2ljMlhv?=
 =?utf-8?B?azh0K21KdEtTVFhtMVA3ZStYcVYzM0NZMXI0TGsyNzE4YkJGSWZ1alRsaExV?=
 =?utf-8?B?S0VMbzcvMjJYV1RwWkdYM3BHMDZISzhlcTJCakRMcmJsOXF5dEljcytkQ05U?=
 =?utf-8?B?QmMzZ2JROFF6VWVtRkVsNm5zVldIWXdudmRJYVFKcFNSVW9Za1M0TWtWOERt?=
 =?utf-8?B?bS83TkJlVlpRRTkrc25jZXlxQkFYcWVEK2RLMjlmSE52MXdaSzROQThzaE9S?=
 =?utf-8?B?cjJCaDF2UWpsK2orWm1kNnVmcytKNFVQYmpOZzR2dy9NWlFzK3FObXNYNmVW?=
 =?utf-8?B?QjRiWC9uWXFScGZseHlUQUE5YlBiWFZ2TXZFdHl1eWtTeHJVdlR3V25QbWdU?=
 =?utf-8?B?U0d0M2FFK1hxaFRSbFlRM2VhWE1PVGRMa0FYTy9Wc3dTczVSbEJZbVZXY0Ns?=
 =?utf-8?B?YXVydHkweEIvWjZHb3BqYy9VL2xPd2R6Nkw2MzY0NE9sVTVacjhLK0k3NmtJ?=
 =?utf-8?B?a0gxZnJSMktoaHJic253SXpXVUNrSWtRaFh6WFRUcXQ4dnpNYWNEb1Z5ZklC?=
 =?utf-8?B?YWJubHpkRHQwOEh5Yk5Zb05NTmEzZ1F5bVA3OVc4YTFIT3BFVmR2R1BtYnlm?=
 =?utf-8?B?YW9WamFlZXBHYm1SbU03ZkU3MVZoMWQ4VnJHVS9ORWlOYWRmMmFpbDF4aGpo?=
 =?utf-8?B?bi9wek9QWHlrYjNnUWxNc1ZTbEJ2SzllQkZqZk03QlJEQS9ZTFkwenlXMm1U?=
 =?utf-8?B?U1hqL3o5K0N1eGFpYTFEa1VtSTJCaEJ0TE84S2l3VVVHdHorVG5LZm9FUzIx?=
 =?utf-8?B?NnMzMEZLTUhoN1Q0bCtQZW5hZExaMUx6SExJditPNk4vM2xsNEVzVTdycnVE?=
 =?utf-8?Q?YgcrXXEU7KE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEpUaXRwRXN3NjZOYUhJUk1RREZxL1VlQk45VEN5Q1Q2YkpPSzNhbTRHZWtW?=
 =?utf-8?B?SWFZRTNIdHNQSTVJOVBiWXlETEw3QWFPalZQWENHK2JLdXRsSHg0NUlDTWMr?=
 =?utf-8?B?bm56aWpiWkpSbUpiZUNFdW1nWVBuWHB4bURWenBJR2VSWU5IM0o3ZytHMi9l?=
 =?utf-8?B?emZqdm9MMnArd1hVeVNUdkxkZWJLZG1TM051c3ZtU1piRk41U2E1Q3FnZ0F1?=
 =?utf-8?B?Nk1NL21OYVZGTXV3RExNSk9qZ2U3NkFNY1NqMTl2bm83NXVxTHplTHRSTnMv?=
 =?utf-8?B?QlpsVzhObDRXK3N5aU1JNlJIaVZERFJQRHhNUm93MWloV2NWaVNHVDVRYm5D?=
 =?utf-8?B?TDR3aUVOSVFQSm0rK3dIUVRLaFFTUjBkNElzbE5VbzBybFMzdW5yVmlDeklQ?=
 =?utf-8?B?NEgrN0U2R1dZL1ZTTE1KUEd5WVlUQlltWklBZFpIWHR5R3pKN1N1UFlBWGZo?=
 =?utf-8?B?R251QUpxOVk4eFl2UjVlZ1RGaTR4QlpKTWVGTDVpaGlZNGRlbTZiZHErRGdh?=
 =?utf-8?B?clR5Mk9XRkFyMlNacVJTSFFjcVhQakFhSGlpNFpmamlOblVKRHhiVmdNdWVv?=
 =?utf-8?B?b1JnOHMxRzJPcGhzUTdGbjYwbEJvaytjckR1N2ZUam50aEphbDFVbDhzSWpp?=
 =?utf-8?B?T3FoSGdMREFJZW96Tkdna0Y0Wlp4M2NMS2t3cUxXdFBocE5MUzZWN3hLU2ov?=
 =?utf-8?B?TTY2RGxVN2dzUldpY3JCZEx1bGVnQkxZSkJYbVhxWlRUNUQ4YTExaGo1YXlv?=
 =?utf-8?B?U1RTd2NyMnc4dHdPT1d3c0w0MStUN2x4bEVpZHc2QXgxa3E1WVFTZm1XYWRa?=
 =?utf-8?B?dWxHcFJkbVBranF3S2syb0tSQ2JMbjN4bG5VS0lhWStsRUN3aHRJdzhORjJ3?=
 =?utf-8?B?UFVIZW83c2MrcjBWek52WHN3bStTSlVwMlJrT2d5a3VDcWcvdjVBaE94MUJB?=
 =?utf-8?B?cFlQRnJaWUhRSFQ0TE93Ly9NSTlUWENxZlBPd1k1UjRJcGFEQkp6YmRFVGsy?=
 =?utf-8?B?U291azRFeEJualVhZnhMVFhPd3EvNzZUOE1jank0YzFLU09QSk9rNk14NGdU?=
 =?utf-8?B?LzZrM3o1N1ZLa0E4SEtoSnR1SmtsV0FGbjBiRE5MS3RCVzNqYkxKSFpWUDJ5?=
 =?utf-8?B?NUdkRS83c0l4Snl4amwrK2lqWXBFL0dIRWxKVzVFTktBUjlWMXNHOHk3U0Vp?=
 =?utf-8?B?aGVIU2ZGbXNMbHZkVVIrek9LT2FYOWZsOG1ScFF2L1hCTDY3czI3NUJnQ0p1?=
 =?utf-8?B?TXM0ZU50dGFIalQxK2pkVllLOXMxdm5RUVpaRDlkYUR4c1RCQ3N0Z1V4Y2Zs?=
 =?utf-8?B?MGVsTHlRWG9tMHdDWlI3WTdZTCtWUW1JSm8yc3JyakpTbXByVVlaNjJ3cnZK?=
 =?utf-8?B?Y2NVa000RGxPcTNIVnBybWtEazZ6L080MHRDUE1JY2VuSGtZU29URE5qUzVE?=
 =?utf-8?B?NEZDdnRjWTI0cnA3eXRUTTVMZS96OEFmaUFYZ1RlV0xwUDQ5NlZKcCttd0JO?=
 =?utf-8?B?N2QvT3E2aDh1bCtiMGNnWVdLRmVFZFhEaDdWTlpsTzUyOG5SMW5YVjJkK1N0?=
 =?utf-8?B?MmhWUnFUNjlyTk9VeXM5VndhbHp2VEl4NFNjaHcxYk80ZjZGR3NRM21EQjNY?=
 =?utf-8?B?Z0FROVlsVis1MlJXY0dhY0xJRUhpTlBNV1dJV0g2NENSdEx1QVh0U3V1Wmt2?=
 =?utf-8?B?cFRXeDFHTllYZ3FZUlBBUXBzb1VSZE5YanEyMzcrdEcyWTIxRXQ5bTlLNGlZ?=
 =?utf-8?B?eVFOZ2MzSFpkSEpGTVVGM0RWZlRBdjNYRDEzSlplV3VudExjWklDWEdhemVx?=
 =?utf-8?B?VThzWVZMVS9tbkdGUW5NN0ZIdDNydmFCVk5LNS9kQ1l2YXN0UVpIR0ZBYVhZ?=
 =?utf-8?B?MDl6Y3YxbjdEZ2tNL3QrZldITVN0RW0wZXd0MjRaUE1lRVMzUU8vb1Irek9O?=
 =?utf-8?B?eXVDQ3VFd3hSZzNQSGpLazZ0Q2Ixdit4di9rTHZZd1pyL0FLOHpCeWJBd2dS?=
 =?utf-8?B?ZmttMUxuWEZRSGhuQmhzT0F0R0o3Nm92b3ZQTVlPRUpFV3c4NWQrY0ZwWU9n?=
 =?utf-8?B?ZGZwNklNT2VvK3lYZ2Z3VnJVNEwrckFrSEt0K3Y1cWhaa1BGeVNNQ0hocEhj?=
 =?utf-8?B?czUxTEZrQ2s1MEZSSThwNmYxV0o0YllPN1UvWUJiVlpMeVh0NTk4VThsWGNy?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb3a718-d937-487e-c54f-08ddc60a691d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 14:50:17.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJwoFKCQDw+p5+ownFf38LMDEXZ9KOGGbl+lVjixIyOD6vz19gtdtvSQq3avKvZic5lLYPcq8CrnGQVsBVgIdfGkp6VMtE0oPEFCmPEYnCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8751
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Jul 2025 14:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7353

Hi Antonin,

On 7/18/25 4:36 PM, Antonin Godard wrote:
> On Fri Jul 18, 2025 at 4:22 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 7/18/25 10:22 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>> Should this be set globally in a conf file (distro I assume?)? Can this
>> be overridden from a recipe if requested (e.g. recipes which can only be
>> built with gcc or clang?). I see you document how to do this in the
>> variable glossary, do you think it makes sense to duplicate the info in
>> the class as well? I typically dislike doing this but I was wondering
>> while reading the diff and got the info because it's in the same patch,
>> maybe users won't think of this? /me shrugs
> 
> You're right I should probably duplicate here to avoid confusion. Basically:
> 
> - Set PREFERRED_TOOLCHAIN_{SDK,TARGET,NATIVE} from distro conf
> or
> - Set TOOLCHAIN from recipe (overrides the distro setting)
> 
> Is my understanding and is what Khem told me on IRC.
> 

Makes sense to me :)

> Right now, setting PREFERRED_TOOLCHAIN_{SDK,NATIVE} to clang fails for me, even
> though I believe it should be supported in the future which is why I haven't
> mentioned it here.
> 

I've seen some patches from Khem today related to libcxx and clang, 
maybe that would help. Maybe you can give a bit more info here than "it 
fails for me" so Khem/anyone may be able to help?

>>> +:term:`PREFERRED_TOOLCHAIN_TARGET`, :term:`PREFERRED_TOOLCHAIN_NATIVE` or
>>> +:term:`PREFERRED_TOOLCHAIN_SDK` variables to "clang". This will make the
>>> +:ref:`ref-classes-base` class use the :ref:`ref-classes-toolchain-clang`
>>> +accordingly.
>>> +
>>
>> No toolchain/clang-native documented here?
> 
> Good question, but there is none actually, only gcc-native. Perhaps related to
> what I mentioned above or something is missing in OE-Core.
> 

Isn't there?

$ git show-ref HEAD
f209f127e654df7424adf41de07f88714d7952ab refs/remotes/origin/HEAD

$ ls -l meta/classes/toolchain/clang-native.bbclass
-rw-r--r--. 1 qschulz qschulz 789 Jul 15 14:28 
meta/classes/toolchain/clang-native.bbclass

Triple check you pulled OE-Core recently and/or you don't have a dirty repo?

[...]
>>> +Exception be made in target recipes that need to use the compiler from the build
>>
>> Not native but I would have done s/in/of/ here.
> 
> Actually should be "for". that same phrasing is used in the description of
> BUILD_CC, and was suggested by you IIRC :)
> 

Oh well, the joy of trusting your intuition and not being native, 
there's sometimes different outcomes when I'm not too sure :D

>>> +host at some point during the build.
>>> +
>>> +This class should not be inherited directly. It is inherited by the
>>> +:ref:`ref-classes-base` class by default.
>>
>> Only when PREFERRED_TOOLCHAIN_NATIVE or TOOLCHAIN_NATIVE is set to gcc?
>> Which is the default yes, but could be changed if a recipe/conf file
>> changes that value?
> 
> Nope, this one is unconditionally inherited. Again, a bit strange, maybe an
> error, maybe voluntary (hoping to gets comments here from Khem / Richard :)).
> 

This seems fine now?

meta/classes-global/base.bbclass

has

inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
inherit_defer toolchain/${TOOLCHAIN}

>>> +
>>>    .. _ref-classes-typecheck:
>>>    
>>>    ``typecheck``
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index d079e4b59..2bad5cda0 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -7331,6 +7331,51 @@ system and gives an overview of their function and contents.
>>>          ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
>>>          Yocto Project Development Tasks Manual.
>>>    
>>> +   :term:`PREFERRED_TOOLCHAIN`
>>> +      The :term:`PREFERRED_TOOLCHAIN` variable selects the toolchain to use for
>>> +      cross-compiling recipes. This variable is not meant to be overidden
>>
>> s/overidden/overridden/
> 
> Gah, always this one - thanks.
> 

If you use vim/nvim for writing this, you can use :set spell 
spelllang=en_us for example :)

[...]
>>> +      globally. Instead, the values of :term:`PREFERRED_TOOLCHAIN_TARGET`,
>>> +      :term:`PREFERRED_TOOLCHAIN_NATIVE` and :term:`PREFERRED_TOOLCHAIN_SDK`
>>> +      should be overridden independently.
>>> +
>>
>> Not sure what you wanted to convey with "independently" here?
> 
> Yeah maybe bad/useless word here, I just wanted to say that these three should
> be set, not PREFERRED_TOOLCHAIN directly.
> 

"instead" would be enough I believe, and that's how you start your 
sentence so I would just remove "independently"?

[...]

>> Missing a :term:`TOOLCHAIN_NATIVE` entry here (actually probably a few
>> more lines below) maybe as well?
> 
> I can't find any reference to that variable anywhere across OE-Core, not sure it
> exists?
> 

Added a week ago via ef31bc3074fa in poky, so I think your OE-Core/poky 
master branch is a bit behind :)

Cheers,
Quentin


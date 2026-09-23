Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C1FC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:37:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3257.1790156255510957426
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 02:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Vf4Ek7Mu;
 spf=pass (domain: cherry.de, ip: 52.101.69.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pypx6IIdv9E3CYHiiJuqtOhOlUhrl+LgAag3pdwa5IcR0EjC24GLOEpxNDaF9dKM9gsHPBzNOMiq5TJiUFXW0X2nqgPLrO1jBprKnvdNMKxntlgGU0F/vhe8ueh2+31XI6XzeF6YoP2UUJ1E7/Pbq0EvfN+NV6MKPbQJbvKw9SCphOs9A1sH4Yi5glMt4lXuswgtKKyqj2WDIJYF9MATUrer3WvqmI4b2zgMrztx37g8fiY9eg/UXJkFGz+6hTujUvIkkSy7NIUDNlZ1oeu2I8sz4s5VSEITkqGzjySARfmaYYMentrw3IVwVLuDvf5Vf69wklLmb34DFRhPkh/MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rUM87FbJb9QSSSRfxTEaR9+YbFYujy64TOzgEDMFrk=;
 b=HI+ZDYYnktZetWNKmrJEih51F/D0C+0t/bPuY+K5NDrYw9FiOUxweJJvY+S3kYKX0OIbVLISlEoIEFfiXCedolwQktzic1lhe9XLYeRWIKRi9DCwBHWF5W/hVAqm9Z4mcJuQ8iiBRJCYHfS9xri7W1XJUnfX/+sPvRbypqLX8FxSDZ4mTX0veuPSwlhPX8+xT1tPuTa4aY/DK+9zt1uX7MaNBoCrk3x5uP479TFtjpNtFpsY7DbljILXwoddjrYL9U21fpHVOcaeR3lQMvQeuiOHqByuQCItjy6Qg0Jm8/uuQI8ZZRPJoaHcRDSYRDSYMZ6aVK+c/6pwf/Ily3hiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rUM87FbJb9QSSSRfxTEaR9+YbFYujy64TOzgEDMFrk=;
 b=Vf4Ek7Muoj8xgv3Qhl10WApL89fQAS20Ax0q62kNrQw5quC9Wi1WJzr/rhE6qvFE9q0Zr3odX/eFPmPoWqZTZGSJjIem8pilHT+6aT1WvrjnUnagXTbWx4pz0YvFQqAi43aNjlegO0qFb7i6oA+nuIJ6YMpCJVibOQFIrQyFiBA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:37:30 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:37:30 +0000
Message-ID: <88c9266d-4b79-47e9-aade-aea184acf13b@cherry.de>
Date: Wed, 23 Sep 2026 11:37:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: update recommendations for build
 system
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <2f13d128-1344-e8b2-9e75-9867224522e4@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2f13d128-1344-e8b2-9e75-9867224522e4@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0001.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::16) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a40ebe-8f67-407b-a2df-08df19564975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	d5sK4GIciRwPbfg0x3eeDnCSVL4gijglBQ9j02b6UU2YK3pDxyN8cqKACvSLphkkyS9CpHRchJdqwWzTOc3clUtAUfAauX47j8d46lU403cx6HxMJB6wSVE5WL9T9/mPpVUbToQSb5zVzOLLU8PX7Mjh4iw3ogbhSfvNrwNFtN2VK0CpLC57Ypiqri5hd3z7g4j4XnJ4iYGlEy+GcRFcgbXIjEpITl11ByMU20wWfTNypwvZw1MhhkpRqV/Wzsvc9d/l9Pn+pzLTHhZkWXv4CBNzgCvWiiVm4dYchPFoh8ABQN9smqW1XyfAxqKx/gL+BC4dOaHq2ZnN+oYEFWpu3VDN4FlB41Ai05p2BiTaamc5D8vIRRUBVDW8RpBW/Vbuzt9kLbRCRVoMqmoTvWpzQsGf+NU0iYpE+jB+4Z7ty7fACsUAUzyVXzLtmnsQUMsC5RZUGMWdnTGLb0P338TfpDCv8nuZxgG9ltN0+/rSXF1+T3QnsABDiTovzgRratj7cFdVAHP0ZbV5TVCvhQHtpqz9aLtsUwazpusWXKWwsCY1bDXlesQv7kY6L6icPeUgE2By8d4823FoP66ZNGkM6ELj8b56ptUoGKKlkm/nMjT0YGG0lB10Lzm1dojSKamWDLOVmQplvplPej6sWZXL3+1cMgXe6tkgflqcq/Al+6Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTA5NWxKaDhhdjg2dVRYVUEvd2F5U1hmU0lMa0RQMTB6K1hRYmxKZFJ2RVJj?=
 =?utf-8?B?SFhYWWZTdDFXYW1NSUVqMHlIU2ttZW9iK3QrM1Fnd2VFTkpZNHVobUQ4ZlNs?=
 =?utf-8?B?dVkwUjJBYTB3T2ZzQXlkTkxVeHBPUWFzUFliTlhwSVE1VVNXeUxTS1FETzRK?=
 =?utf-8?B?TDJ0OEZNdUtHTStGKzlpZWlMeGNpK0o5OHZhM2FDa0tCVEF4Z01lelI1Ty9r?=
 =?utf-8?B?K3kweklsdnhLWWdSb3o5dytrWVBCbTl6Y0xhQ0FTdmFkS1gyVThVR2NwaXBy?=
 =?utf-8?B?UW5Wam90N2FweDNwNCtScGxIK0RCRTU4VjhwQ05nT1VONjgxN24vYnFiazg2?=
 =?utf-8?B?VkJNZ05WM3ZmVkF1U01mQzBlVEF3ZjdUT3BNb1NPa25EZ1FLdjFaMThaTFJ3?=
 =?utf-8?B?aGFLT3dhdDNFSmt3bUlVRjZQUXR0MDhtcUoyRk9OL1hzWlU0SkNpamNwTVRo?=
 =?utf-8?B?ek1HOXI3VnRGVlVzMEw4RnJrS1R1R2N3RkY0QkdKci9rYzVwdk14aW9iTHVE?=
 =?utf-8?B?U3BlN3hWRlZpRG84cXlSOWFWQU9KWkI3cXZINkNKbVh6bWl6M0k3TlVBcVVK?=
 =?utf-8?B?V2RyamxPWlExK0JGNkYzai8vNjc3R21KckI0L2JGWWM0WmpVMHBKcXdCRlA4?=
 =?utf-8?B?UlBVUEs1eGN0VlpxcXlsaTBONlIwWkZHdHZUNVpwREhJSmNKNzg1a3puTU40?=
 =?utf-8?B?UnpaVTJUZ2FKVlovM1c2MzZrTS90aGpBem43V29BSkhGOVRndm5lMFV6Wnc5?=
 =?utf-8?B?WFpYdkFVdWFxODVrQmNhWlhKNGtEVnlqcjFya1ZQR0o2OUpaUmVzbStHdVlx?=
 =?utf-8?B?V2xPN1lHR1ZSbUpnelpSU1pDd2R1YnIxQVlVNFp0blpaVFFQMDkzNEJiU1JD?=
 =?utf-8?B?UWFRRTJWRXZhM1lNU0VTalFOeEVuay92VXJxUytNZ3p4Ny96S0txZ29wbXdw?=
 =?utf-8?B?bnlWaFd5ZFVyVEhsbGJVRUY5WHp3ZVkzOWt3TFVDczRoa0xBOFMraXBjdU1m?=
 =?utf-8?B?QUxGdHFNbVdIVlluNVpvcENkTzh3bEtvSGovNG40bSs0L1dkM01lWDhnRGtF?=
 =?utf-8?B?bTFXWklJM1I5V3hTTkxYUFJOeTlVK2QvbEZmUkduWFBFcG42clNSSjYyemVl?=
 =?utf-8?B?WkVCVkhWWGtoaXNBTTlaYzl3RTV6SHZHZ0wzMHlUMnhFWDNoZ3FzR3BFVGMx?=
 =?utf-8?B?N0NoNzloVVpLbDQ0T0JEbVdNa3NFN05oTEhxZW1uZC9FWTQ1T3d6S25MOThl?=
 =?utf-8?B?bG8wdkNRbVFZekNmRlpUVXEyVjk0TDNCZ2ZNdk5HU0wvQVpPclRqTm50QnVJ?=
 =?utf-8?B?WE4zTzVqaFR4SEk1QUJPUlhyTlJieGZIY0hsRmFMRGFVbzIzUjVUUXVGeVA5?=
 =?utf-8?B?b0IxNmRVTTdPWGJNSTlVTlFxYkJwTTFWRXlONkRSdVYrQTg3VllURWJ5MXo4?=
 =?utf-8?B?V1lWZTYwUHRsY3JGYlpmL2NScEY3K2szWnQxeHNMT2RTR2NzanEzY0VxQkxj?=
 =?utf-8?B?NGgrOU1DZTBPS2dESjhRbUkxVGhkTnpyb0RpeGZCUnk1RUI1aVVmTHNpUUxT?=
 =?utf-8?B?SlRHRk55T1RrU3dYWTd1REp5VHIvS2xrUGVOZlE5cVVqRDVVTWVpN1IwZnJx?=
 =?utf-8?B?OTM1bjdSTEhLYmg2M2FaTmZlaTZXdWtlR0lNNVpLQk4ySnhZRHEzcU5ZZmIy?=
 =?utf-8?B?cW5OOHdMQkVzcVUwVGpMNE9QdXRSMU45S0c2TFVhTngrRnFVZWpseG1PK25O?=
 =?utf-8?B?ZC9PRlU1K3h4MGpibEpBSW9YZ3JWSDVrdTNTTlhCWEpIVlVkU2FmL3VjVFhp?=
 =?utf-8?B?dHRTbVdTOGR5NFdwNmh5MW9FVmVTbCtsY0hqdkpzV1RzdGthcVg4Vk5WMzNC?=
 =?utf-8?B?a0dkRFZhVmM5QitOa1M4bFJTM1dxQWNOcDR3NGJHTmdwbW1ZQ0JqMkNCOTBG?=
 =?utf-8?B?UWFxRjFDVkhJdzFHTzU1aEVmMU9vYXdNdEowRlVJOW9SWFRjM1ZOTVVreHE5?=
 =?utf-8?B?NmZUaHB1ZFVhdW1rd2pNbU1NZWR1OVptTEwzVFRwaEk2bEd0NC9zSitrczlZ?=
 =?utf-8?B?RjRpZ1dRM0tnOXY3a2RHZGRyckw4SHhqRDZwRGdDWEdzekVWVE1NKzJ0aHZ4?=
 =?utf-8?B?RVQ3SGF2eUNtblA1R3NWUldrWmFGOVJyNGFDVjVjeW1RWitYSGppZzRWZk1i?=
 =?utf-8?B?OGhIN2F1dW9Zdmc4bWtIRUd4TTdUQzhndDViV3Q3ZDBLQTQ3aDF5SlZZVVRu?=
 =?utf-8?B?cS9PTTBQbEc4d2pBamhuNis5RFc2REZLTDBmUXpsVDN0b2dFOHVWVzZuQ2Rj?=
 =?utf-8?B?S1ZPNXp2eTM2dkpVeFRVM2JnZW4ySHR2RVJlK2F1SklZVmJVcXQ2Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a40ebe-8f67-407b-a2df-08df19564975
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:30.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVwgeZ0dT1WabwsYrjG5mi1tifdTh2f7MRo7h37EPRPhSfXm1AH7HhXaktC9Cg13wekd8X0s8Gc4ufeS6UoTQqUxYUiZqQuJuekpU65WXos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:37:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10599

Hi Robert,

On 9/14/26 11:07 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Drop the reference to "Xeon" and hard-coded RAM and disk space
> recommendations and get those values from poky.yaml.in.
> 

Sounds good to me. We actually don't mention the kind of processors you 
should use in documentation/brief-yoctoprojectqs/index.rst.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index 3b8e2334a..7def242e2 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -55,9 +55,9 @@ particular working environment and set of practices.
>   #.  *Gather the Hardware:* Based on the size and make-up of the team,
>       get the hardware together. Ideally, any development, build, or test
>       engineer uses a system that runs a supported Linux distribution.
> -    These systems, in general, should be high performance (e.g. dual,
> -    six-core Xeons with 24 Gbytes of RAM and plenty of disk space). You
> -    can help ensure efficiency by having any machines used for testing
> +    These systems, in general, should be high performance (e.g. a minimum
> +    of &MIN_RAM; Gbytes of RAM and at least &MIN_DISK_SPACE; Gbytes of disk space.)

I'm wondering if we shouldn't simply replace the previous two sentences 
with:

[...] uses :ref:`a system that runs a supported Linux distribution 
<brief-yoctoprojectqs/index:compatible linux distribution Compatible 
Linux Distribution>`.
You can help ensure [...]

(not tested).

This would avoid the need of keeping them both in sync and would also 
list what those machines need to run as distro and which package they 
depend on.

What do you think?

Cheers,
Quentin


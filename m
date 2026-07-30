Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3557BC54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:30:05 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8567.1785407403836099663
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jul 2026 03:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GjO3G9Vr;
 spf=pass (domain: cherry.de, ip: 40.107.130.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3dYFzcDpcJjJJ9d7tieOY/C2jEvF84UnUx+pKQNoyHHqWK/cPsUQYBi28jJOxaqL/s7GyCfwQUGOHux8DxjDIveod44264nzNbGdvY6Gx+PrhNx1G0c1bmIbLX1LUsstxzTRIw0cNZC+smupB3m7lWxvcOih83S5DDT45jDXGMqXhWKp8an0QLdpKLVR42+CDucOHMjqv0oC2IafYbZcKEq1uO5baYi7mS7XWlc9b3jKOKRHLSIQ6L3L2sgzasixDJCvxLCTZxEBb6RtBvvE3bXPQ1vW5Dxbvmep7u2JDA9Gfu47oGcMnaL+xJL7p2AT3hp5j7gj4XP1n5aeKaTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peK1PWWBEQ+MBwCqFg9gr41JnqLHStDLcsXekx/qkFw=;
 b=aMyydxTc/UMXkyJI/3s//ynIJQPTbZIFLqG0EAaieNQGRJZw5qVyStJ6HVjbpsL4jc1+jtkhiej1mpTyEIaKJ7+6HgDkBzvoVwyznjeqbm+ZTkqiDLDH6ycTvgDKk8q1M/0XOJPMVJGSNSNz9UsW6SlyNUVViyD9/DD+wvCNix6g1hvc24RKsbMdwk3dYnt4pShY7pOtO9UT9vLCEBBaeC+mCzkNDqOlfrkwxdDLrVtRLFazRpwFvpYpjUfMbQDCOw4pdhE5X3O9tNC1tDDzijvhKYq8GTHBgpDPv+w+x2Qstc8jCShorxF70FQMGSAD19U75fySW2KIN3BYJMlPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peK1PWWBEQ+MBwCqFg9gr41JnqLHStDLcsXekx/qkFw=;
 b=GjO3G9VrR5ZvnPmxYjXZ9NdoEqwmXKLh5l17n9BkaWh7uKojnqN+quwIwv4OEMgRldtSDtyACxHuLq2xSHBeHFPClqZTctAko8jVeKZB9oZGQW0CF69Izpa+5/Mle8veAtZSA7qbZiojYXOaBVczn0MiVcByPNrG19YrsZjy1DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by PA6PR04MB11888.eurprd04.prod.outlook.com (2603:10a6:102:519::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:29:55 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:29:55 +0000
Message-ID: <2b29f06b-5654-4f2d-9688-575e2516277e@cherry.de>
Date: Thu, 30 Jul 2026 12:29:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/5] sdk-manual: rename the section to remove
 "extensible"
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-4-661e65201bc7@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260729-sdk-clarifications-v1-4-661e65201bc7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::7) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|PA6PR04MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2c0b95-984a-422c-aade-08deee257f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A/V9x5Nkq+VLY97vcFa5vmXo4bPQ/MdlOy80dAC20Qh32iI9+HUvw4X6V2ITZ5na4K916M1g4dU3938MfcSjMPtRd+FCuS43WWcTgjXWvqzfY8HQkBOvXw0z34cRMysEtWnOZTFcwWcxkt6r5kUow+owUmlJZ8vcFPI+E4cTY4nEVerYBD8AyZ2TUjfFSHAAN0URP3LCRc7WBvX53nRVV+AXptagXHGlDNsPZ3YdFldgw1XC1sbPtVl8NlwpjLNlcYVyW/stPzhdUBEwN5I8qd3NEjtETCVIZh7Xnvymh2ny7XVQ66//+hFY0KuShvVsUCmPxMxXh9NSO/LPNVwC9krVRclV0xBdRwdrSygYB/GPx2Bzo1cKqMSFl/E1ELdyibLaEFLUx+MLUA2c0yAMKOOUDc73uH7az8fJfM+7iRbBakbQTcVtIsKqFTgyI/AX+QfsGmKvyyoKA6H7HmweJ6rZcfDgMSIdVT47gtI2sjaJmNdSKX8dPmkOaVGdWC7ZLad0PJH3BpoeY5b0+jQNTeZ6+9YyVKnnafP7pqtv/b9zGsu3uL/r4xylfHJRc9LeOhYRwLENJJKD1RGbDxDhyy7rAR1wodJUP8YUZwITSeDbHTa2dTpo/2WP1GNHz7GeHbHDfFy0ga/1l4qOM/MX+WANLjPtnUxfPSz6vzlCqpo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWVYOWlPYU9HK1pPRTRGNlhXZ2syQVg4NGd6d2F5VzJxTzlPYndwbzZqYW5p?=
 =?utf-8?B?TThGcnFKM00yN3U3QVZBQ3JobWNRTG1kTXRQck1nSUdGNE8xWENybnNGN1VN?=
 =?utf-8?B?NGNhdUY1d0owb2dvY09vYXlKMS93a2diVUduWTVHM0lFZlUvSkJLQXNlZFp4?=
 =?utf-8?B?NlNVc1RGZkc2TklkREp5eWtGU1UydE5tdDZPMmdtKzQrcEpzSytHUjRjeWVz?=
 =?utf-8?B?ZU9FbDJLNkFpcDhodDcreHVadVZ6ZFZ3Ump6Z0VGbzRRaTZ5MEdwQU82eDVE?=
 =?utf-8?B?Q1FJMFAxVGRwQnVtSy94WVI4RjRLdnU3RU5WSDlvdGUrQzdoVHhhSXhJMGxz?=
 =?utf-8?B?YUFNSHZQSDZNRTdYOGVOTVl2TDFWTi9TUGx4WE1FcUhxTnF6OFpUendyQ1Na?=
 =?utf-8?B?VHh5b1l5UzJPVlUzbnE4c2Y0UVlWRXYrQnNWRjE2L0tUZ2VWa0hsSGF4cG95?=
 =?utf-8?B?aW10SlVoS25SaFNBWFl4ajhKTXZud1JZTU5UemFQd2NHTW1EWVdPSUhKYi9w?=
 =?utf-8?B?cm52UXFPOFVQaFNxeUE0dUxKU0hMSkFqTi9wd3NoZlN3eWxLUzdONDlqUG5Q?=
 =?utf-8?B?R0FVemM5Y3FSRDlCWWlkMlhTVWd3bGVOTUxGTVpoOHc1czFQeHl1SVF2K1lR?=
 =?utf-8?B?TTBFLzlEeXd3b0pmYjFxeDExYWx3Vi9nZi9PZG96cDF6VmxPT1Iyd1VQclVv?=
 =?utf-8?B?c2RhL01xMEw2NEpNZmx6cGFXeXNHKytEQXJHbEJYZ0pYRzVZRTU1NmpweEVV?=
 =?utf-8?B?QjE5YVhQYkRTOEJkY250dGkyVTYzaHljQnlXdjEyVjZ6ajFSZThtM0JoZEdp?=
 =?utf-8?B?N0xabDZPcDVJOFg4Q0F5V3JZZURoL0U3eWxJcUlFdjlKKzdrVDM3Uk1QUG9F?=
 =?utf-8?B?MGJIbDdld1hXcjZUdDcyUE5RRUNNMVZKa3ZsanFxbVYzdDlaMzVoWElXeWc2?=
 =?utf-8?B?Nm9WWVpmOXJQUWFlRS9peUFLcnRndlc0V0s0bm8yNzQxcHYrZG52SVZkRWtO?=
 =?utf-8?B?Z1l3UDUxWVlOdXVnM21TQ0Ezd21BYVRYN1AvYnV3MWdUNHpnRjZ5c3JpQ3Bi?=
 =?utf-8?B?SlJ5d3VJYTV3REY2a2JSRWFGOFVob1FRcGNldHB5Y0ZhMTFKV0RnWC9GdXhX?=
 =?utf-8?B?M0J2d1cvTEZwalptZytLUk4xUS9IU2x6Z00wWmI1dHJPREIycVhJZ25abFd6?=
 =?utf-8?B?dXpwdHhLWlF2cTU0RDZEZDB5cW5jRUVqd0IyemtyMzZYclMvNUgyTDJoRmtj?=
 =?utf-8?B?Tm5hdTdhUFJJUUI1aWpGVDZPd1J5Sm5NUGxlc2RKSVh6VmVpRWVtSWIzaXJ0?=
 =?utf-8?B?aGl5eVF3WFA4NG42ejcvYzU1ak1wTGo1TmRuU0dkemVpbjA4NnRqbTVHN0Nj?=
 =?utf-8?B?VWlSdG1DN2ZLa3hxeVMvY0ZHTkovSlgwMVFXSVIvOUxCbW1JY1BCV040UlBH?=
 =?utf-8?B?YnBvbm9tQ1E5bjBicmNWZHN6cDltNEUyQm9CMWNrbFVmeVNRVmpscjQvd1VS?=
 =?utf-8?B?SndGLzRHWXZrSFB5NXVuOGxMcXhVNjUrREJlSGZTSnh2NUF6WFRFc3o3MHJr?=
 =?utf-8?B?dWhoZU5OQUxLdVdsa1EzY1Q2N00zam9YZmkxM0Q3MVl1aFRNczREL090VDJr?=
 =?utf-8?B?QVlFeE9LV2FqM3AyZFBZc2FkZjgvaWJSdFRxYkFiMXlSTXRxaVMwTXg4L0Rj?=
 =?utf-8?B?YlFtWHg4NnFnbkgvL2ZCQXE5MytUM0hBempsTW50U3ZZVWxMRmdmc2g4Q0xh?=
 =?utf-8?B?T0JaKzRqMzBSOHhuOCsxREdTNW4zdi9iWmp6d3lkNmhaRzBFdjNURXByK0lQ?=
 =?utf-8?B?YytsbDdnU1BlYzlkdkUvc2tCeDgxcWdPRWJTVytoVkJTREFnR3ZMY01pdm1r?=
 =?utf-8?B?dzlNaEt0NU9YUFdHZ013WXA3cGdidGE5TnRxZjM2ZFV3ZHUrKzZ1S2FLUmdX?=
 =?utf-8?B?SkRBN2hlY0JudDFPTHNoelRIaDEvV2FxdHkzUlFIbXdBOXlGQWRjbUxyS0hW?=
 =?utf-8?B?UjZ0UmFWaENFWFZVcFVzV2pKKy9vV2xVcDExT2tZWUFkZHVRUnVuaE41VHlz?=
 =?utf-8?B?Y0QvY1dhUjlEajQ1YWVMK3A1SFRERmRVTTJ3ejZmYVk5TytCaU0zSG8yNEV2?=
 =?utf-8?B?L0dGZ2lpQlEzcEJ0YW1aMFlUaHdmd0loVnZnU1lLTlFpcXRVQWM4ZVVxaXZo?=
 =?utf-8?B?cWhXc2VZQXZtaGJpUHp0bGlGbE9VTm10aDk0NU16aW1SOWNyVTJvSGRmNXE5?=
 =?utf-8?B?aXZHZ1k2NTNkZ3orcG1sQXl6Ni9aNlh5OCtoTmtOYVd1d01HTGlhd0VpZWp5?=
 =?utf-8?B?cFM4SXlNcFF4eHNwMExKTDY5TXovb0pMSW95ZkFDakFwTVk2Rll3Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2c0b95-984a-422c-aade-08deee257f44
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:29:55.0721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyeY7ILSUg9C2MiJ5SCf2+luJNy/URnGAJlFwEWNZ7h+C39v26imyaZZHSkKHDrsf/UeWn58DXfEPGSRNVKLnRGG8bpz5J5L2nqc/3lNQCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11888
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jul 2026 10:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10196

Hi Antonin,

On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The SDK manual covers both the standard and extensible SDKs yet the
> title does not imply that, so rename the section to "Yocto Project
> Application Development and the Software Development Kit (SDK) Manual".
> 

Well, now it's the opposite :)

> As a consequence, rename the first section title and reword the intro.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/index.rst            | 2 +-
>   documentation/sdk-manual/index.rst | 6 +++---
>   documentation/sdk-manual/intro.rst | 8 ++++----
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/documentation/index.rst b/documentation/index.rst
> index afabb6615..d8603c2f5 100644
> --- a/documentation/index.rst
> +++ b/documentation/index.rst
> @@ -67,7 +67,7 @@ infrastructure.
>      Linux Kernel Development Manual <kernel-dev/index>
>      Security Manual <security-manual/index>
>      Profile and Tracing Manual <profile-manual/index>
> -   Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
> +   Application Development and SDK Manual <sdk-manual/index>
>      Toaster Manual <toaster-manual/index>
>      Test Environment Manual <test-manual/index>
>      BitBake User Manual <bitbake>
> diff --git a/documentation/sdk-manual/index.rst b/documentation/sdk-manual/index.rst
> index dc7186b91..477274ab9 100644
> --- a/documentation/sdk-manual/index.rst
> +++ b/documentation/sdk-manual/index.rst
> @@ -1,8 +1,8 @@
>   .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>   
> -========================================================================================
> -Yocto Project Application Development and the Extensible Software Development Kit (eSDK)
> -========================================================================================
> +===================================================================================
> +Yocto Project Application Development and the Software Development Kit (SDK) Manual
> +===================================================================================
>   

Maybe "Software Development Kits (SDK/eSDK)"?

>   |
>   
> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
> index 53246bd9a..8ccbcfa20 100644
> --- a/documentation/sdk-manual/intro.rst
> +++ b/documentation/sdk-manual/intro.rst
> @@ -4,11 +4,11 @@
>   Introduction
>   ************
>   
> -eSDK Introduction
> -=================
> +SDK Introduction

SDK/eSDK?

> +================
>   
> -Welcome to the Yocto Project Application Development and the Extensible
> -Software Development Kit (eSDK) manual. This manual
> +Welcome to the Yocto Project Application Development and the
> +Software Development Kit (SDK) manual. This manual

Ditto.

It's a bit confusing to use SDK as 'either "standard" SDK or eSDK' and 
also '"standard" SDK'. I don't have anything to suggest though :/

Cheers,
Quentin


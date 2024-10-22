Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9B3D2C555
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:47:45 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.89])
 by mx.groups.io with SMTP id smtpd.web10.18741.1729604859359490024
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 06:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YIhJMGnq;
 spf=pass (domain: cherry.de, ip: 40.107.247.89, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7zX71l6Ry25tgKEQGtIvgSGKRIpmxN+60SAUxGpzSposPgeVb12wTSVuMoL2FTIJdYmOm+RyUEG4CvsmRo40S68Qi9UJeJc3Sx59OcY+tThEAs+EKHyvQI8yVZqT7TEVL6i3aSaUu+oAnNxMDeyi/YTIWoo1JDIOrdQBomfyq+qMNYpbmS1aTb3QhTef1n/Oyg4RyXzWIMLnsQ0q3KxK7gSWdLfor0pYomE4MWdyfFpkAhFj+eB4jdx0O2kR6pM/oVUZPdEv6SjYZ33e79RQLBxMtZAZxGR4+VchgqMyzo/c7GS6hFjLttQaU9htBLUx556E89oChs+aqq18LdcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8LZeewFuZNZNy3bJF2mwhO2nOs60voLl4stQsknzsU=;
 b=RhikG9pjPDgcJE9PfTml9MTqYdeQagV30bsbuzGjgdJwUDTE6ZqeX3HnpdztmJ/3HkfauJhHYn8y+TpNb3RoiqrhH0xm27bk/edto10s4p46JycltkMqWF+W6L+O1QEEwrSbtKj5VgwdWM4lHQvGteoqOPFw8kvC6PimYuWpcbiPlgp/5LSCMgDt7tNz5a4FdgOLcIzE/b+emF6uHpxMWnzvFM9rsX92LYunXYPubVVGJ0bG1Vyu5HVk9cco8dWp4M2IjLZUhDAhBMdSNvZ1dTw9BQqfQSH5PRJ7WBPnAmif7Pc1IKozV/XJZJF16s7/rRe8TYs8HzZ0QHajmYhTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8LZeewFuZNZNy3bJF2mwhO2nOs60voLl4stQsknzsU=;
 b=YIhJMGnqq20k+aqc+GOx/lXPXTipOB04FnfK0crXh8UJh1CbUdMOjqOsHB8X7bJSbyK3tNNy+5qp6i+zAUBEG+WvknSefFbHEkUFT4TdOD0edwqMErk7pVtn69aYimXWUjRJIpvNMJJHw4ECjfGAB7TXP69X+3BQBpAvY/M+ip4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 13:47:33 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Tue, 22 Oct 2024
 13:47:33 +0000
Message-ID: <b924ebb2-61f2-4d6a-8d57-b3807672ab61@cherry.de>
Date: Tue, 22 Oct 2024 15:47:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] overview-manual: concepts: add details on package
 splitting
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241022-bug-13225-package-split-v2-1-5715058872f0@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241022-bug-13225-package-split-v2-1-5715058872f0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: def03d05-869a-4d5c-d106-08dcf2a01495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnhHbkdUUFN4RjZ4cVVHNFZxeVNpVXZRT1Q3TUpJMW5WaGIzaG1HS3dWcThO?=
 =?utf-8?B?QTBUYjZEZmF6eEhabVZDM0VnSjExYTR2ZDduY0NzMm9tMGxKTExVb3QyVmIr?=
 =?utf-8?B?WmNReUY2NXBORlFvby9OM2FNWDYvTDhvKzMxZWJmWS9yVXM2cEQrcWZUdDBX?=
 =?utf-8?B?M0F5R1Nsb3piQ20wR3ZGbkhvZUZXelc0QkpNNVd6NnZ4YWJLUUJkbSs5Zzdo?=
 =?utf-8?B?UGZMUGExeEh0M3RPcXRHUGRXdXYyc2VvZVVVcFVUcjNQRmxyUEREYnd6K2lU?=
 =?utf-8?B?ZThDU0wrYXhZRkhGVjl2MWorRmM1K1lndHFYVFV5cEE2MSsvbWZxOEhHT0h5?=
 =?utf-8?B?d0FLcHR2ZDBMdGUzaG9sMHRnVGtxcExtcnk1UHcycU5GTVd1TGkwSWY4ZmRr?=
 =?utf-8?B?VnV5cFo5VldVdnhKcmlDaGx6VzZhaGtiWUtiQVVyRzNCN2NVaEJ2V3JLVm90?=
 =?utf-8?B?S2tueldEZ25Lcy9jVlhlRE5jWTJrVkIxajFFL1RxaXc3S0w1aCtETEhZcXBn?=
 =?utf-8?B?bnM2cmdVRnJVS2diaFhobkNvcTY2di94T1dIOEh1c3VES1JoK2hDVVdIaTdw?=
 =?utf-8?B?SEcvenVFTURaUlFGSGZxZDNFaFdacVZEK0dYaDFSTnMzNjdiS3pXVVNuTjhR?=
 =?utf-8?B?V2xvUWxtcVBDc2N1WTdPaGpkYkFCQUNwSFdnRVAyeG5pYzZ4ajFKa1lJRFVO?=
 =?utf-8?B?VlpuQThFMW9FaVF3VGFFcXZkRlV2TlZHUG9XZENMd2FRQzFBVHZOcDkzM1VL?=
 =?utf-8?B?Yk42WTVtcjF5ZmsxN01qZzBEOGJkeU03TlFBQTB6YkZ2MGNyYW9iK2ZzZ1dl?=
 =?utf-8?B?Snh4YWJ4V3kvK1BDWDFNdUJSbWV5dW11eUROS0NITDZ2TTZpQVZON2dXT1Vk?=
 =?utf-8?B?VElzaFZlWVhEVkZGUitETGxBa1dzT21taE4xNk1nZ2VBVVlxZkkyUEhkZEJU?=
 =?utf-8?B?US9aWjEyRm5ZMWhjMmM0ZFNmbUNaSWVXVkZtOEx0MEVnU0t5eUt5b21YcHo1?=
 =?utf-8?B?aTRucHZhL2xMMjUxbFpxT1kvTWhRbjU2Q1ZxRlJTdFl0WUlrS25WQnlLNHY5?=
 =?utf-8?B?Z3VZdWdRdTByZnNvUEp6TXZZZVo5NkVIeVpFNEFOa281RURsSTNXT2pjMmVB?=
 =?utf-8?B?V1AzN0czc1g4NzU0dDdhZnAvcGF4S1lvR0R1ZUxpMjRzR2JlNkdrTUVGNFJi?=
 =?utf-8?B?eHFtQkJ0NEVBYWdRMEt3bzVra2JxR2lnK1grbUFnWHRnV2V4QmNHN2FnRmVJ?=
 =?utf-8?B?TFNwV0tFMEg4YkNFWHpnT2RuOHh4UnNqZlVxUjNRRnRFb2l3RDlzOTVockZs?=
 =?utf-8?B?WkpFT0U3a0RVNzI2NTVqN3lnUmoxd3BxRDd1aDVZTkxQVmhLQytVY1plWkRj?=
 =?utf-8?B?cU1jRytIYmRZeDlUT2kwWEtDaFcybjc3UWJLQlU0TVM2NnZnYW9xMU5ONnpv?=
 =?utf-8?B?T0V3c3ZGS3NBdTVaRGowN3NEY0dQVWhMczNCcUEwSEQ1NTB6VXRzSS8xS0ZT?=
 =?utf-8?B?S2tVbTVCSUh4NU5PQ3BEV2U5MXM4aDVORU05WmFNeGZuQlZkM2xYN0UvL0Mz?=
 =?utf-8?B?VmFleEdKbUhrMWd5M3h4dllGTDhjV3YyS2VtVnF0b0VaekJ1eHluT2UxRWhX?=
 =?utf-8?B?RHcvU0dUOGQrWi9UcEVyR2JOR3F0RjJFZ0s5VCtvdmdZU0JKeWlSTkhTanhU?=
 =?utf-8?B?citSM3U4c0dYQ2IzZTg4UUs0ODZ2NkpjOW11RjFxa1VEWUV2WWkvcEFyUHc1?=
 =?utf-8?Q?ywpLHQcVnf/c9OeDgP9Xx9gynDSAuvzBMzjK3be?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1M2OUx6bExhcnloeFkwb2VwQVZabTFzaEhzaXhtTHVxK2svWGxOVlZzVit0?=
 =?utf-8?B?YVFTdlBIZzlLR2tBeW83SXpkN0ZOWmZOVWVIb2tKcFZHaStEcnRaaTEzWlRG?=
 =?utf-8?B?d1BIaWEvSEhQby8wMWdKdk5mUjh5d20xZ3lDdjJydmNFTlAwVWpkWlk5dmlq?=
 =?utf-8?B?Q3NWZW84OVFXUnEwUUV5VkNiTGh0dGIrWGlPcFNXRGd5bndxcWpqbzBGQm9x?=
 =?utf-8?B?R1ppa2dMK2JJN2pDZUc5NnZpTUJZMDMzRXlQU0NVT0Vnb3c2ZGRST3A0Z1cr?=
 =?utf-8?B?VHpvaTc4K2lNMkJYN25MZ25iWldIVThyekNxdjBTQnkvTitLakUxNmVMSnJM?=
 =?utf-8?B?QW5pU2dTQzgyVlVrcVd0Uk40MzhmMlN4bXRhaUFvK2h2WXprQXNSbFhpaVA1?=
 =?utf-8?B?UzdKYTBGNVN5Y2pMdCtUc29MYzVEUmJmMDhkZ20vdDhLZlMwRitVY2Y2QlU3?=
 =?utf-8?B?WUhVdjFLbDBEL0thZG1HaW9WWnJHa2JPQjR2N1hxK25FWUJvWWxJNU1GK1lx?=
 =?utf-8?B?MjdwTDdoYzlqNDJGb1NJVkFrVmZTK3dVRXZmOXRPKzZnQm5JQmswQ09QTjlp?=
 =?utf-8?B?NFVOaDNGVUlpbGowQVpEdlNCRHY4UURSUFJ6bThoOERFcHVUS3NSM0J1anNO?=
 =?utf-8?B?YTZtVmY2NWtoVDNtalRWRktXSFZHY2tLbGV4VzhyL3dNMmxxb2k0NTBuUFhQ?=
 =?utf-8?B?Ymx1VHNRbjV1T3UvcUNVc0lseWQ1djVTMXdYcW5ETmpmVFVIL3hmZWkwMXlk?=
 =?utf-8?B?Y2JwZGxUL2RobFN3OUtIbzJMZys5UjFNamx6dDQxZFFSNkJKR2srN2FmOVdp?=
 =?utf-8?B?RjB3Q3ZhNjJrQm1yQ0JXcWhhcDdiUmxPNkZ1ajd6RlNtN3NUZEE2WHlKY2pV?=
 =?utf-8?B?Skl4ZXhDVWdUREZiVW1PMmxDS25pVFNrVTVLSG1IU2Z2NWxLNWFDeEZ2cnFX?=
 =?utf-8?B?NDJaNEJRSXNYMW95anY4V29uVlkrd1Nwd05FblZ1NkVYa3YvVk1iS3BFNWV0?=
 =?utf-8?B?dzJnYXNMNGpUQ21JcHFXamFYc1A0aEZmcmhPSGFoQVJGRTJkc1JRTzlIVExP?=
 =?utf-8?B?bit2WHh3b3ZNOG1qc1BtcjV2Nmd0RjBnQll4VU5zODk4VjhJUlVFZGwrSHZ0?=
 =?utf-8?B?aG1EMjJzeGRzOFZmSGxmbnNjb1UxUDl6ZlBBb3BqVmthR05iZk5BRUJ0SWQx?=
 =?utf-8?B?aGhmdk5nT0duNVZ0OEdBcHBYTVg4NlhUM0dGeVNiNWxzQzYyUXhKcVdVYUZp?=
 =?utf-8?B?ZGphMkN0UG5CbWw0ZXBDQ1NqZFBEWERRbG5qYWpnM1ZhT2NKdmlOWWVUa1kv?=
 =?utf-8?B?Q2w4aUVrbEs0c1I1QXFxakNuN1YzQzZtMHR2d2lSazhRU09Sa0Z2NkdqY0Vs?=
 =?utf-8?B?V0xYYXJOVjBQdjBMV0tSQUVmc1dyVWtsQVIzZ0tHL3Y2NnAvOWszOW4rU2FD?=
 =?utf-8?B?bFpZNm9JdHZ3ZkxTdEQ2QlAzUTM2N016RDM0a2hwS29ydDM3ZUlJTzI3TjdH?=
 =?utf-8?B?alVNUFdQN1Q5NElQMy9HMnFyeHRZczF4SVo2WEx1K2xUQ1Rpc013SnhRQWMx?=
 =?utf-8?B?OGhQejVzbGV6TThzS2VpcnE3d0MrMVlGOEVBY2l2ZTJBbWtkeXZMZndOWXZo?=
 =?utf-8?B?aWVZVTFQS2l0b2o5bjNFL0VLRjFvT0MrWWJXVThBNlRsbmNtZjlVdlVteU1r?=
 =?utf-8?B?c1k4cEU5SUpRTFg1aFBqcml2bHB6VzNFNGxwc3ZKa0ZhTXlpRnVRSGJqc2xn?=
 =?utf-8?B?MVhjbWJoSmYxTXp5bEk4dlJKRGVPdktlLzR4TmxaSllSb2NkLzRtZjd4T0o1?=
 =?utf-8?B?b255Qng3dHRLdll5dTA5TlZKb0ZrcWxOYnZiVnljU1FUdlF3VWhjRjgrSHRR?=
 =?utf-8?B?WFl3dld4VTFOMlBEVFF2SjJtVUk2KzRYckFKOU5BZzZkS2V3ajhrZy9EWWZD?=
 =?utf-8?B?bHlISWZ5NUluN1dobEZqejVrRzd2WHRYeG9HZUNYakFwZzZ5OHZueGU0aFZK?=
 =?utf-8?B?V1p3bThuUDQ4YTUxYThnV1lZYklWa28wY2tBVThCMEhrNUlLaWRCdzNheURM?=
 =?utf-8?B?UG9JTXlvVERNTFZseitmVllFY21VbUppTUFHQUtTYXpmZFFIQXNqZXB6S3VZ?=
 =?utf-8?B?TFN1RENNeG5JaFdPWDMzK1doZVY3bzBhMndkcDhvQUk0S0dncUFzRmZ6OTB5?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: def03d05-869a-4d5c-d106-08dcf2a01495
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:47:33.6105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SonXEm1bMmdAGpNiI+jrfqby+g7b7oCDT558EyAnwWEfkTd9p5dKq9mOj/1ViowFtCRs5nqSdOwGNDvOPrxYaPahLt9SXBVMmfLB/zMTOCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 13:47:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5564

Hi Antonin,

On 10/22/24 3:38 PM, Antonin Godard wrote:
> The package splitting section of the overview manual currently lacks any
> explanation of how package splitting is implemented and redirects to
> the package class, which is not really understandable for newcomers to
> the project.
> 
> This patch adds a short explanation of what is done:
> 
> * How the PACKAGES variable is defined.
> * How the FILES variable is defined.
> * How the two work together.
> * How to add a custom package.
> 
> This should give enough details to a new user on what package splitting
> achieves and how to add a custom package.
> 
> Adresses [YOCTO #13225]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Rewrite multiple paragraphs after reviews from Quentin.
> - Be explicit on _NOT_ using D in FILES!
> - Mention the oe-pkgdata-util cli tool.
> - Link to v1: https://lore.kernel.org/r/20241016-bug-13225-package-split-v1-1-20681130d7eb@bootlin.com
> ---
>   documentation/overview-manual/concepts.rst | 61 +++++++++++++++++++++++++++---
>   1 file changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index 62f2327a7e27a777f738523e7fafe62422186abb..e38ca196260c1f7ece2dcd0cfd3aafe41fd27147 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -912,11 +912,62 @@ the analysis and package splitting process use several areas:
>      execute on a system and it generates code for yet another machine
>      (e.g. :ref:`ref-classes-cross-canadian` recipes).
>   
> -The :term:`FILES` variable defines the
> -files that go into each package in
> -:term:`PACKAGES`. If you want
> -details on how this is accomplished, you can look at
> -:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbclass>`.
> +Packages for a recipe are listed in the :term:`PACKAGES` variable. The
> +:oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
> +configuration file defines the following default list of packages::
> +
> +  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
> +
> +Each of these packages contain a default list of files defined with the

s/contain/contains/ since it's "each" so singular.

> +:term:`FILES` variable. For example, the package ``${PN}-dev`` represents files
> +useful to the development of applications depending on ``${PN}``. The default
> +list of files for ``${PN}-dev``, also defined in :oe_git:`bitbake.conf
> +</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follows::
> +
> +  FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
> +                  ${datadir}/aclocal ${base_libdir}/*.o \
> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
> +                  ${libdir}/cmake ${datadir}/cmake"
> +
> +The paths in this list must be *absolute* paths from the point of view of the
> +root filesystem on the target, and must *not* make references to the variable

I would use the singular here for reference as a path can only make a 
reference to another path and not multiple ones.

> +:term:`D` or any :term:`WORKDIR` related variable. A correct example would be::
> +
> +  ${sysconfdir}/foo.conf
> +
> +.. note::
> +
> +   The list of files for a package is defined using the override syntax by
> +   separating :term:`FILES` and the package name by a semi-colon (``:``).
> +
> +.. note::
> +
> +  To find out which package installs a file, the ``oe-pkgdata-util``
> +  command-line utility can be used::
> +
> +    $ oe-pkgdata-util find-path '/etc/fstab'
> +    base-files: /etc/fstab
> +> +  For more information on the ``oe-pkgdata-util`` utility, see the 
section
> +  :ref:`dev-manual/debugging:Viewing Package Information with
> +  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manual.
> +

I would move the second note to after the paragraph in which the "a file 
is only in one package" statement below, but that's personal taste at 
that point :)

Looks good to me.

With the contain/contains typo fixed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Cheers,
Quentin


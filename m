Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B182C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:26:30 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.31])
 by mx.groups.io with SMTP id smtpd.web11.9146.1749133586852983402
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 07:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Aa+6YrV6;
 spf=pass (domain: cherry.de, ip: 52.101.71.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqF2ReBdwszxnlDqY44GaGq1yUvVFE3hGxgSBtK8SHlxiSU+vaP556h9SCKnhKHX+hpE50X2KUzyKBiWA2AecLGZ6u+f+8MtA/+rLXJsk3tY7zwhn5QCVI+Jy7d2qHUl0EnWEvE7o4OwIO3TQh5++sWCeD4qwQXqQq/nammYE2ldsUuo2tjJceMYqebBdYW+AR0/HcEQ/rzaK++te0G1xpbP4HsUluiz9PJPCV3JXUxk1iE9LYtAusalnW0TYgLJaxENbDi6qzGrXewZUkVxCNXXxI3xhw4M0hXTU3rNrkkTiJNg5bC+aV2ytQRSrMqSIEZh6cg+HOf+Niagm6fSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FzojM17SGsgQp6aCEyD3LJYjhrWH16de7FpOJsNW/Q=;
 b=KxLSlczj71uD8+KPGdBPU0FHRDvCfVmY/CDcIvE4oto6HqwmK/Enf24U9SzpYJ00HLP/me7F0GgEX64jr+2j2ClTGyoBmYEjKfaVy6ywgkjTdyJpA3vVxe4izE3H+9aw9U5uRBdgig7ZuMKlAMIi7tVUJ5DzpVGmNCXgjwoeoSf5+f+V4BvKSx6YTIoopzxEESpMfkm3t7xWnS5VcXR2E+Om3UsOnClc/705Qhy2Za7AVCZs2QVS2emhddhdXu0xQbYetD+hbl1uJTraECKsvfrsToySXuIYbFBgioww/nkZV7oVGni8sMDBd/RGBl7Txa51amaVqpCOH/lJyRmL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FzojM17SGsgQp6aCEyD3LJYjhrWH16de7FpOJsNW/Q=;
 b=Aa+6YrV62sk02gi7MyCKJB/KcpVUn5TrQGVlsjiK9/KNRWMCYemtce5gqY303Oa2jTBZuXCQ10Tgz/6bCnt1vgoNOus9WnvJKCI2gOm6CFIvqGEavxogKj2h/l6ToCuXYSlshqfWcS0BSrCOP72gUhAdUqpbj8wPG8bzeWPAPyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 14:26:22 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 14:26:22 +0000
Message-ID: <f546a7c2-5033-40f1-b47d-c519646c7026@cherry.de>
Date: Thu, 5 Jun 2025 16:26:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
To: dixitparmar19@gmail.com, docs@lists.yoctoproject.org
References: <20250605140314.369551-1-dixitparmar19@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250605140314.369551-1-dixitparmar19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0199.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb009b5-8405-4bef-3524-08dda43cf206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SEhleDJwWFA1VXFZdWN2ZU9HZ0ErYkRqampSN21PYXQzeHlmN09TZDQvTk9u?=
 =?utf-8?B?blpoaWVSMzlWVDI2S0k2YldVREd0MXF1SklsZEVhRW82OEpsc0ZrR01Ja1Ro?=
 =?utf-8?B?NmJUcHpVRFpjUWZ6dVNNVkxSMFlGbXdWMFhsNDZlNDJvZU9mWGRleTYzbGJm?=
 =?utf-8?B?NGdrWGVseXA2QUxIU2hpN2xFdnJtRWtCbEtTWTN5MWkwYmExMGFIWE1GaHRV?=
 =?utf-8?B?M2xPbUc1YUEwTTZrUjV6dWJaTUpTREhMNmZVVTVFd0dsbFl1UjFSeXNRVlFm?=
 =?utf-8?B?OVJQNm1weGt6MFgxVVR4Z0xmVG44cEFYQ3Vka0tzaWRRTzU1NVl3YUJEakw3?=
 =?utf-8?B?Wld0WTFMZXN6cnVST1BwNUhneWdCR3RUNHRrdGd6Z1ZOcXp0ZERNQkN2REo3?=
 =?utf-8?B?UzhpTjRGK1Z0R0IwYmxiL1RxL251aDVnazQ5RFFyVTFMa0NtdGVaUHY3dlF6?=
 =?utf-8?B?MjhsY1RwOUMwZE90OFFKNlp2SDFma1YrSytaeGZ2QlNWRUZ2MlBOOXkyV0gx?=
 =?utf-8?B?TVRkdG80emt0cERkbnczTG9hYzc5d2tDR2xRZEF3V3RLam9GVzhrM0xUUXpS?=
 =?utf-8?B?OUxaQlM2dHRlcUxKd01pVE9leUF3U0JwUS82cW9tMytvQ2RIL3d4ZDI4c2Js?=
 =?utf-8?B?SzhBejNvRG1KRkp5dFp6R3F5QTFxVENXVTVoelhwVVlaN3lkcG5ENkxrVXJs?=
 =?utf-8?B?V3BRa1ZsaXIzZ2w0WnVjdytsZ243ZW5waHFISjFzMjc0dEJoaXB6bVJSZzdL?=
 =?utf-8?B?MWRteTlDdWlRSnpzYktjZm9JVC9tQy9YejhmWDhpWDltMHNwZG45d2JDR1Z0?=
 =?utf-8?B?VVpBbXcyb1pLS0NkK1lvY3R2V2xnaEU4YklwcVpVazV0NTFYQWdhcEo0NTBi?=
 =?utf-8?B?dDUxOTltTkp2bmJEanBHenhHZ0I4Si8yNTgxclljM3pwRHgvTU4xMVd6Tkcx?=
 =?utf-8?B?ejFkZzNvZjY5b1NvTnRMb092TWdhZWw4RGQrRUM4VUt1Zk9SQzhnaXR3TXIw?=
 =?utf-8?B?eGd3M3k4eUhxdHNlaTRoc1NLcW91VGY0MFUrVzBSdXdPZDMwemk2RHJwTlJX?=
 =?utf-8?B?NS82OFpJaW9ub3lzcFRhLzJpT3daOURQNTdlZ0EvMi95QmliNHoyR21HZWJH?=
 =?utf-8?B?RExNN2VhTnU2RExmWHh4Nys4NGVCQVJVSXNQVkhEcjBuZm5aSmJwOWRYbTU4?=
 =?utf-8?B?R3EybE0vZW1BQnJkUldOSFJJSUtZek5nWnQ3UVBEd3FOcW1maHJKdWhNY2VH?=
 =?utf-8?B?eTlJV3J5RENnUENsV0lzbkR4ZUhseVBxV3lnQU1hTWUwQklvNUNTSXhtTWFs?=
 =?utf-8?B?Ykt6bVhoVjJ2NlFoT1ZVZXJmK1k5SkpGM3ZOWkNudHdCTWw0amNpTkNjaTJw?=
 =?utf-8?B?UlhmV1N1MENuelN6ODVjSHd3Um5NSUVnQkhQZTBzTkFvbTJSN3h1MDFjbVZG?=
 =?utf-8?B?dzhxV1FhanZPNEtBa2JnQjJ1WkI0ZWgwUDA5LzVtcGl2bFQ1dzJrRm9TWHBw?=
 =?utf-8?B?cExUR1o1MXRTdlhDNzFsNUx6TzdYcUFzZXN1KzZMWDdBbVQrWTVNdHdZcWNR?=
 =?utf-8?B?M1RlOUlhL1ZUSnByNXBVNWNCUGU1OHVuaDdXMUREeWQybmpVY2JQbVUreXNQ?=
 =?utf-8?B?Ym5ncWp1OURVbGpua0M3eXFsQlFzRmNuVHBPNmZxUXlmUXY5a1JFZ1o5TXNB?=
 =?utf-8?B?ZUtMajBrSEZtVVEvTUpNK0VoUWxSTFkxaDBadlhtM3FudE1RcFNRRFdQYXB4?=
 =?utf-8?B?ZEpRQWtmQmNqMmY5RWVwb0xhNEkyN005YmFpQ2dFRnYrYkFVaWRRK2ZWbXls?=
 =?utf-8?B?NCtlYWhvODRsWEFOU2xlM3pLL2hraUpsZ3hlQm0reUg0dVd5dExzVTlLVGNN?=
 =?utf-8?B?S3NGVERMb3NNVHordmNiL3RzY25hcHViNFozeXpOdS9pdEtJdFZkUCs0cXFH?=
 =?utf-8?Q?ixBcrqvYoyw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1U3UlZualNaNHVMZ1Y4Wmw4bzhjcmNiWHN3K2d0cURScU54cFZJbGI1ak9Q?=
 =?utf-8?B?dk9tWWdFN3FOUE1NQm1LOTlDcVkrTmhEL2tXQVhXWW5NTlliTllYMmNoTCsw?=
 =?utf-8?B?ZmNJWmFNNG9KWmlQWk1SUU9ySXdzaWhFM3czVE5BSjlyMUJNejVKblZ6cjUy?=
 =?utf-8?B?K3o5ZXVWU2tjQ2pWbmxlTW9wcDdRQTh0Tm15emphRjVwbUNXT0EvTzBndDlo?=
 =?utf-8?B?bGRHa01QeWQ5aTZ4dldWaTVYa2d4VTFRc3JScVZGZWFXMlc3bTllSUFQQjc4?=
 =?utf-8?B?a3NFcEh5a1NtcktBM0RIWnE0WCtOaHNCaHZ0SzM0VzI5ZTN2QWhpbk00Rkt2?=
 =?utf-8?B?L0gzYU9ZbTUzNWUxVUNabXRjS1k5NXFSZkgrTEgzZFBpQWhrTnVKQ0JGVGdW?=
 =?utf-8?B?bTRiSkRpM0Fjc2dhUlRiZWRXWGF4MW9vMnVoamk2Zy85SjVuYlJKMzYrRjl4?=
 =?utf-8?B?clJEaEJMS3JhbmxITXRnSGpoczhxTGVUaCs3M0ZpUUkrOUFZaFVRdExQeGcw?=
 =?utf-8?B?V3d4dVYrMUlrMkZBUlA2VmNLZ24wekhZWXR1bml1Z29UcnM1NDFYRGk3Z1p3?=
 =?utf-8?B?M2tGaXhpVTdNTTU2VlRzOVR1QXZscXZYMFBoU3d5NTNUN2w0UFR6S3Arekw4?=
 =?utf-8?B?Z0VVRkorWW1DU25sRC9LRllvTUZjOTBXelBHMlN5UXVXZWVFK05mNVZQdlVq?=
 =?utf-8?B?dlZzVFpvSDFTZ25YZnhiQ0JCWHlDa0hpaFZ2Ym1JU0xxUzI0dnFNVE1NZTlt?=
 =?utf-8?B?ckkrUTlzSTFIT2Exbi9ZVkx2M3NqQnlQbGpSbHhrUVJWRVE1eUxHQXpvSTlF?=
 =?utf-8?B?OEttNVlHdVduM3BxbDIxZFByWXpqaXRzZWF4OHQrVG9jL01rWWZLeWZ6VlFa?=
 =?utf-8?B?SVdBMUtJS2xNRXBuK3M2OUs4YUhMVmNGTUR1OU00aEtvTWRFclUvZjhMcWk4?=
 =?utf-8?B?MlNPZGFoYmRiVHBIYmpZcFVSaUlBM0lKejRGN3FqTGZqREh4SmNHWlR0RjBD?=
 =?utf-8?B?OG9NMHJZbVZGZWo1b1FQY2tLZWlDMHBlaU1sWUtGNFY5OGUwdjl6NEZnSHBL?=
 =?utf-8?B?Uis1bTVGSlpsQXJnSmFGQWxZdlNkeHlyM29kODAzUmRzSDdZLy9GSWk4T0hs?=
 =?utf-8?B?WUVTeUUyL0t1ZzlwNVlFMW5vdXREWS9LejV3YTVUclVpTTBlM3ArSWFkVlI5?=
 =?utf-8?B?UE1SbHYyMkUzRVhaQlZhZkwyNEpjaituNTkzYnJCMkZvRC9yY1dkRFJqRm9k?=
 =?utf-8?B?VEJiK2FRRmN3R0FyRnV3UHlINmlwenJjYUFKRE5UdjZndW95bjAzWUQxK0Q0?=
 =?utf-8?B?WVU3b0FyYXFiMjlKaWFYVXNJNzVCeWJDcmZkRFJmcHdZaDBoVHA5U2xMTFpv?=
 =?utf-8?B?ZE5BTm1Ud0U5dGxQVHJPVnhOMVlaNmtIT0hQWjJ6NFprbVpFOGtnRU5TNHAz?=
 =?utf-8?B?b3dxanEzbmJ3bHF0NU9QM3Q5TEdoN1V1SEJ2SW1iSFhtaStHOHE5VnJlMHdJ?=
 =?utf-8?B?NzlhOW1MMU84blkrVnBPa0VrdDFsZlFDUTZxVHIxSGRQN1RJeWRrTTJWVXdE?=
 =?utf-8?B?cCtnUm5QSUJWK0FvMVR2aUdKRG9qVHpxVVBoWTk0SGo5SGd0Z1R6QUJjWkll?=
 =?utf-8?B?SHJMb2NDZmpubkVUU2hISEhlTmtTRU9wUlhqcWErV3BwNDN5YlBOTjJONU5h?=
 =?utf-8?B?bDgwVDdDOWtFQzFOMGw1cVZjNG9jc0xhSzB6c2lwdHkvMEc5ZUFMVTlMQmpT?=
 =?utf-8?B?bmRIcHhFSStKT0JvdDhvdVdtV0llTGdHSnArTUhLYWFjWVpDYUhob2FidWhm?=
 =?utf-8?B?eTV1NWE3SjFRU2NzNmZEUi9kaEJxWmtyK0hVOWFmaVJjREdkZUhneXI4NjYv?=
 =?utf-8?B?bkY4VTlGOVhkSUNEak1vbmZBZVpYRGc0UHVTMTBpZUIxeUR0cWRiVnJLcnh3?=
 =?utf-8?B?empGUGxpVXU3V0VyL25qTWNaTHJzMlc2WmFSYWlpZU1LMmdTMzBlWHdvUyt5?=
 =?utf-8?B?VjhrMTh1UE9pdjgwZVM3bVVnN09OUkVJeGZua0hOSkZFTkJXelYrUlVMemJV?=
 =?utf-8?B?aUV5blFvcnJzdUlFbEpzcSs1MVZGZmwyTTdjL3pSUkVwVFE1VVR0SC96OXV5?=
 =?utf-8?B?VE9nTHVWTjhrRlIxM0NuVVlITkFsZDdac3g4YUpkQ0Y3VnBBTTFVWkxkY3pX?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb009b5-8405-4bef-3524-08dda43cf206
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:26:22.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjArBgpBZMP2VuXFeXa8XckRA93rp338vCclhYjegoHNqE5ecK7Laf8w9Ap/rXcvOBOge42P2bT6oUYdIfrwlf6fCPdaE/ITXsYtzXqkxXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9644
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 14:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7010

Hi Dixit,

Thanks for the patch!

Please wait a bit (a day at least) between versions to let other people 
the time to review, otherwise it'll be difficult to keep up with what 
the latest version is and what we should review :)

On that topic, this is missing the version number (you typically add it 
with -v2 when using git-format-patch or git-send-email if I remember 
correctly).

On 6/5/25 4:03 PM, Dixit Parmar via lists.yoctoproject.org wrote:
> This variable controls the kernel module spliting.
> 
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 9768d8f5b..2c23b6864 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
>         the :term:`KERNEL_PATH` variable. Both variables are common variables
>         used by external Makefiles to point to the kernel source directory.
>   
> +   :term:`KERNEL_SPLIT_MODULES`

This variable can only be used if inheriting kernel-module-split, so we 
should say that, we typically use this wording in the glossary:

When inheriting the :ref:`ref-classes-kernel-module-split` class,

> +      Allow opt-out of split kernel modules. For some use cases, a monolithic

I suggest to reword to

"""
Allows to skip splitting kernel modules into separate packages and 
instead have all in one big package.
"""

Or something along those lines.

> +      kernel-modules package containing all modules built from the kernel

It's not necessarily called kernel-modules as far as I could tell?

If it comes from the Linux kernel recipe, yes because 
KERNEL_PACKAGE_NAME is set to kernel by default.

But otherwise, for recipe for out-of-tree kernel modules, it will likely 
be something different.

> +      sources may be preferred. For one, download time is shorter and

What download time? I assume you're talking about this from the 
perspective of running the package manager from the target and not the 
fetch task in BitBake.

> +      installation time is faster.
> +      Default set to 1, one subpackage per module. Setting it to 0 will

s/subpackage/package/

Yes, setting to 0 will do that, but so will do any other value. So say 
that :), e.g.:

"""
Setting it to any other value will
"""

> +      generate a monolithic kernel-modules package containing all modules

Not necessarily called kernel-modules.

It's likely most often going to be the case so we can make a 
note/example specific to a kernel recipe and/or also for out-of-tree 
kernel module recipes.

Cheers,
Quentin


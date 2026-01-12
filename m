Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182EFC9EC7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 11:40:33 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31251.1768218023054853026
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 03:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=dhqQWhmV;
 spf=pass (domain: cherry.de, ip: 52.101.72.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICKiblJfoOu8047VaAVj9Xmz2LD+gvYjUBLdi3LNr9zdQEnT/PPYu3h7Jwc8wKFfADb3FbAOgvbjgNtYeTl+t7LmU7UbXk77m1VkyiVtgqnyzgQM3HuBVNmd1PeKY5raG9phaPfL1tox3aWncKVittc+R52CEB9dPAWhmojyENk1EJd6sHOiPCSAypgeqYDiyOXsdCS1PQo7IYQYmGPaFzsmojGUmtmm+rFpj++WJmGCcXZNaxS/XLQB0oO0y8t74VM3CqF2ViSYcsQNelN/+sglvPFqkizKvWYs/zZHASLDHCtLjaDU0aI5IXuPnNE4SjGG+mkUm31jTh/rT6YY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSo6J9UQ/djs7E8nRTrG2ug4NecWWCch/dBZ3PucZbA=;
 b=uurUo/Q090kc1glNretLMVPgQfBC0XMBNEXYiyFUkc0jsyPoveWY32ObHeMiU7a9OyG/zau+GnQZo4+akkTlqtIv3YZ8QgIjWxKGzV+l364KY4+KXH/OcDZITCpzX/2++CDoQmqCX9r8EtczuMIw7dUYzYZNZM8ejziTOp5afqWitEva+a1wcaISyD1eioUZYKYoE2p+xNFnpJcAPsJUYvnHbu3RoeuJBAC5vYn2XNQ21SYfvZz5yYq3NbLUQB3E4DW9P/XPkkIeaSlUOfj0ovcjAhOrbp1Fw3hlD7BueV4k7wicOYekYqXiqsHXTOjJrFgSoRt49HLp6J0KysTVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSo6J9UQ/djs7E8nRTrG2ug4NecWWCch/dBZ3PucZbA=;
 b=dhqQWhmV2UpgkoqO0vLW3EWDeLZlP5QQNt6fiFnT4E490q4GGWeI9ipiG/jvc5WJwpJQmdXhVcsLCcMWoW5j0rY1NItRnIX4Zs8TzogSjoU0p5fO/wedzOs5HX1t5J23emvP7OG71lAtq2wnOZpJs+1k6h4e9sifB7sBDFV+GE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8258.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:40:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:40:19 +0000
Message-ID: <f576860a-b852-4771-8ac0-77b4bc7f21a2@cherry.de>
Date: Mon, 12 Jan 2026 12:40:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 5/8] Makefile: wrap set_versions.py with flock
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251222-concurrent-safety-v1-0-e3d86e44cd38@bootlin.com>
 <20251222-concurrent-safety-v1-5-e3d86e44cd38@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251222-concurrent-safety-v1-5-e3d86e44cd38@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 02496c59-ebb8-4f55-c790-08de51cf5ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sk9LLzQ0cGRYWndGNTVSVjhtc01maWNVMW11ZGlNZmpyNk9Gc3NJblZWL2FQ?=
 =?utf-8?B?NElFMW5sMEppZDVtMUVYSlNpUFpHREpLOC9ML1VJWUxYT1lNNCtseHBQeE5n?=
 =?utf-8?B?VDg0N0R5Ky8yQ2xUekZRRVNqNW42bFNxZTZkZkthR0pPaTgxT09rcHBnR1NO?=
 =?utf-8?B?YmVvZ1hFeVVHTWZFbExSREYyclhiNmVUeUVDa0NaNGRxUGJ5QXMrbTUvdlZu?=
 =?utf-8?B?Q1Q4SUdQMjlMeXFiTTlYTzBYSmx3RGVwRzBoY1hEbUlQd2xLYURYanR3ZmQ4?=
 =?utf-8?B?b0xXeVFKYWJNUzFtYkpBcFdNN3ZsMU4wb3MxcS9VdUZMT3N2Nk1GdzJ0eHJM?=
 =?utf-8?B?TFF5VERIMzBRQ1owcVlqS1R2VEM0ZlFvWFh3QlpTMTFIdzZKVTRKQi90ZVFF?=
 =?utf-8?B?ZWRlMmJJVW1LU1pIQlVreHhPUDdFRS9ZYytoOXpjd1c4RVAyVmlZTndiWEY5?=
 =?utf-8?B?LzRsbTQzL3NHRFJTamlBeWhjNmprdnNvVkVxSkpCeEpDQm9tZ1FVQ20wSDVC?=
 =?utf-8?B?VTNtaWxQTWdjc3BEQjNYakJYREdFY3RyTkdQZkNYQTdneFdueFpXWEhNZE9s?=
 =?utf-8?B?VFY5MDF5T0ZVS3JjNlRNWk44WDJQVWdvTUl5WEIxYk84ZFRETW1GRit3bnEx?=
 =?utf-8?B?QzZjNU1MejRtaklwU1Q5REp6bnd3eHpZUXNXQlY5bU10SG5sd3dlaUhwTXJM?=
 =?utf-8?B?V2YzRFd3NjByS040aTgyeEVNcHpKMDlEb3R2SjRhbkI0UUN6NlJyZGpLTUNh?=
 =?utf-8?B?dTQ4anhrVWNnMk53dG1yajdnSXhUeHcrKzZRb3pCSEVNNkV6RC9KclZTZkFa?=
 =?utf-8?B?aGlXQUMxZ2FSbU8yeVFrY2xRQ1o0RU1LRXlZdFF0S2ZxYWYyZEM5K0ZyVWV3?=
 =?utf-8?B?NnI3Wk1NcE9tNDU3YWRpVjFld0VKdXJSN1dNclN0Z2EzdEtNdkhRYUY5Zm56?=
 =?utf-8?B?MXBuN1BVUkRPQ080KzRqMk9RUGJuNkt4c0NvV2FRWU94TVhzYUZRVElHaWYz?=
 =?utf-8?B?Mkp1dmUxaTV4M3hxRmhHYkc4dnFpQTk2MC83Ujh2NUVuVEpFL2xhSkdHYWU5?=
 =?utf-8?B?anQyb2NaenZNRVNHbzcyVXZ2dU5ZemloWm9YSUFTL00wN0pBMktwSDJTdDFx?=
 =?utf-8?B?bFdOeHI4Ykt4ZFB3RzVrM3pYSVZDYWpMUU9MQ2hLdjA4T3VBNm1kK0Z6SVQ3?=
 =?utf-8?B?WFRvRW5HcTFNVU0xQ1pvZ1h5b3Qxa0hGSlhJZ1JzQ3BucmxiY21aMTVIdExG?=
 =?utf-8?B?V05Hd1JMMExDV3o3U3JxcXJ6bThQMEI3R3pjbkluQTZlRmhibUtFWWl3NHZi?=
 =?utf-8?B?TWVGOGVSRkdaSFVleWUzQm9id3J1cTJEZFJvTWpCckg2UUhpWFRmTmVYaHBN?=
 =?utf-8?B?aHR3LzFPYjFYT0RXbDdzRnN5UjhYcEt6ZVIwallUdDZscU44UmNXWXQ1U3Jl?=
 =?utf-8?B?MHYxTEwvRzdWZDFQb0hjRlUycDVZTTNvT1dwUmRudGY0aEljdFRDNjMxL2E2?=
 =?utf-8?B?MWdyYkpFQTc4WUZYN1owQ2FpcUdZZzY5TnJLWWI2Zit3SU9WdVlSc1dRV0Qz?=
 =?utf-8?B?NlBaajQ4aGFXcUl2RUo5c2M5NThWYjJSZE9IcHNWME4vRG41U2V0YkJvOExR?=
 =?utf-8?B?K1NIYlNHZS9JOTl3ZVVDUTdMek5CcTJvMmpjbXNhTXVWdU9CQVFLM1VjWGRr?=
 =?utf-8?B?QitqaHZkdUZMSHNORFNiK0xhRDR2ejBGUUFuUzN6MldBWXR3QjgxbW1ZQWhk?=
 =?utf-8?B?WldJNm9SYzdXbTNoZnY4ZnRKN251d2JlajR4SitCeVF4SWFHZmxwMWNMeGZC?=
 =?utf-8?B?Qno4eUprWHFmUkRxQ1MwenZvbDkwWkh0Z0NYVEYvL1I4MHJXQnRTVysxR2cy?=
 =?utf-8?B?SnUyWVdZRlVFbW8xZWZqYlE3cmxOMHR3TzVveWdsVlJEZjFHSm5FMDdQL2JP?=
 =?utf-8?Q?VYigKl8AiIwTOP6RhFwiqhFydIm6aXVR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTA3Wnd5dDlpZU9zY1BzUVlUS2FkNG5sZVVsOGMzWGd0alpmZFRGYnhrdk5s?=
 =?utf-8?B?M2lITXZiY3dOaEwza29ncHJpNTg1eFhCanZrWHVDUkZZa1g0ek9sOCtFbTBl?=
 =?utf-8?B?MXg1cjI1MUtyQXpGWGNyOVZpeE16SGtXY0V3NWtud09lOU9sTWdNRlpEVHg0?=
 =?utf-8?B?SG8vYmJQSUhhcGVEUzlRVWc0TjBpcld4OEhWdm9IU0xIQmlMQjFBMHBxZWU3?=
 =?utf-8?B?bkNoNjBLcVVKYWtzWlVBZ1hpWGFCR3VibWdrcFh2aHNBSTFJTUxWS0JwUEF5?=
 =?utf-8?B?U2R3bzRMTnhtbW5tZnpGUW9Ed3lYZGNwUmllcDh3Ly9NSlRUUU5SZGxMS0pT?=
 =?utf-8?B?SS9mRUhoQ2RNd2V2T2ZrS2xLcms1dzNBakFVbStVWi9iNFJsL1hjcDF0anpK?=
 =?utf-8?B?ZXNiTVlEYWY5cXg5RmM3NXBRMXZuSDlIWGJoK0loSm00V0NyUWNkcFAxRGNS?=
 =?utf-8?B?Um8zVDltU3VocjNjd2JGaTRiL0ZtUHZpSHBNcENCRk8ycmdYWURtRGZhbk4y?=
 =?utf-8?B?WVNXZGpab1o4dHl1a1pIZHEyRlB3VHdDOEtxRUR4bE4vTGFqZjQzNEl5UW52?=
 =?utf-8?B?dERpOXpYdlRwR0tadm9vaW5HTzNwNEJSY09UcG91S2pHT3JQUFN6bEhkRUlX?=
 =?utf-8?B?WlJxTU1jeE9xQzlhNkRuL2d3Y3JybjdFN1ZwTTROczlWZXBNRE9BS28wckJT?=
 =?utf-8?B?K21vUVpSbVVkYm8wVU5EbGJIWHlGaXBJeHk0b1ZIRnp4b05LblZWVjZ3SS9K?=
 =?utf-8?B?Um96OUpEdzlOMk12YkFwKzZ0dDJOSGNRalN2cjA4cGNNZG5SYk5ZSmlXN2Yv?=
 =?utf-8?B?UFYzZndRZmdDNTd6WDE4ckZFcHEvcmpieFJ1b0tvNy9yOVFMdTQ3cG1uaEFr?=
 =?utf-8?B?ZVpCKzcwUzZXenhtQWdOckxlRDV6dkNBZS9qeVhCeWhoQytuZVl3OGw0bjh1?=
 =?utf-8?B?SEFvWjZ1L1NWNnArTHJEeDR0ZWZvTnEreVZnSzBsU1pDZGNVcnhYclJjamc0?=
 =?utf-8?B?bFAyd3o5VkVybU5VYWVUS28rdm15T1dZellwdGEvQTVIZ05lbUxNMy92TnVU?=
 =?utf-8?B?anBNRWFqN3hSbEdZVWlPUURReHZMaWpEd0pLc0g4MWxUakU0NThEOVBMMDlX?=
 =?utf-8?B?UW04NUVZdExIcGI0VENNZHVaR0g2djlpK0l2ZnRUcGlXSENVMmJMVDFaV1hB?=
 =?utf-8?B?Q0xOQldPcDc5UitEM1BVbFlxaU51Ymc1Z1FIM3RlcFBKRFBQM2hDUWNxaUxs?=
 =?utf-8?B?SmgyblRabUpGMW5xaWNRVm13NnQrKzlqL1RCcFZGb09KUFFQN1JXZ2M1K2V2?=
 =?utf-8?B?M05JYmNWNHVxRmtPK1d5akpjVllEYXNTb0VxOHZPa3VjbWRNdjFTbUNjOWQ1?=
 =?utf-8?B?U21NbklqczJ3Zjc4QmR1anpQUUN2N2VyZXI2SlpVWTNvSUpUSlluSFExTytG?=
 =?utf-8?B?TUxkcTU3M3hhVEM4VWxoVzFTa0pRYWovYUYzdEpONFNPd085V2JwaCtxTUVu?=
 =?utf-8?B?a2pydjRLTDRPVVdYWXFjeDJDVlBoNlFQbmtranRBYkp6Z2U0VVg2eTE4cVN4?=
 =?utf-8?B?aVhzR2lBQ2Jqd3FXc2ZDNXJUMy9WbW5IbGhqUlVoWnljOXZmU05QaVBYMjRO?=
 =?utf-8?B?RWVndTlwUytrTWtEM1orckF0YU9zUlV2TzhtV1pmY0FGZFlFQVQrR1Q5RGVS?=
 =?utf-8?B?T01td0V3NG83b1ZOTUd3dTFkTkJtNDFSaE0xcGx5OVhiMS8yTWZWNFFQTldt?=
 =?utf-8?B?Um51VUpMTThVMDZpQjVDSTRRZGlqeVlUT1hnOVRGL3VLc3ZvVDBBaGN0eHVG?=
 =?utf-8?B?UTdxTi85NEVRZmswRFhhcEJ3YkJxUjRNM1Z1WkFoYmVpT29aWU51VWFBUEpj?=
 =?utf-8?B?RHdsVUd5UFc2TC9ERHdzUWlQZ2svK1pNd3dIdWx1cEtUSGRDOE1ad3REdEdi?=
 =?utf-8?B?K3gzdDFnNkNub2RZYWdjSVV1cXlIdWNOZGYvTE05RWdvSnNUMVhvSmp2Y2Rh?=
 =?utf-8?B?dXZIRm0zaTdPZE5YRXluaDJvbmkrNWUvRkJ1TW13L2p5N2REVEM3WTZtMC9s?=
 =?utf-8?B?SXRlc1RBQms3QXIvT2hxd0dRSHlsd1NrTGFxV2VLZDQwYmtPSTUrZjNmR2gr?=
 =?utf-8?B?eVB5S0VvQmpNVnBsYU40dXV6M01uSVdYN2lVckdBSjZMRlZSMVBKRHNqWS9Z?=
 =?utf-8?B?VGkraUhUblJZNHNwYnRsNnBjcEtRR3JDMUtDOFFNczRxTHh2SjVabVhmaUhm?=
 =?utf-8?B?NXgyQzU5ZW9rQnJFRXhCYnhUaHNCRDBoUHUzSTFLN2gxM0RDN3JvRVcwRTBS?=
 =?utf-8?B?S05DNllzclBGZDZ5ZVhPVTVtRFdYdzA1ZTl0dW1vTHhMWC90TXZZUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02496c59-ebb8-4f55-c790-08de51cf5ce3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:40:19.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UW2pWj2Jle9y6zACD1+JnyxVtEjU0Z/jeyy98HJ8HOSR49ld4hLggxD8c7FkbmIlQAagKBYXbDXJE5W8BRr+hao5I+hUpfq25F3V/wWu1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8258
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8453

Hi Antonin,

On 12/22/25 1:27 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The set_versions.py script modified files in the source directory. To
> improve concurrent docs builds, wrap the set_versions.py with flock,
> with a 30 seconds timeout.
> 

I don't think that's enough.

I can have sphinx-build of build A use poky.yaml, switchers.js, 
releases.rst while set_versions.py from build B (over)write the files, 
ending with corrupted or partial files.

I think we'd need a lock on set_versions.py + sphinx-build run inside a 
subshell, something like the fourth example in the manpage.

(; flock -w 30 9 || exit 1; # ... commands executed under lock ...; ) 
9>/var/lock/mylockfile

Another option (haven't looked up if it's possible) might be to migrate 
set_versions.py into a sphinx plugin such that the plugin is keeping the 
files in DRAM, or writing them to the BUILDDIR directly for consumption.

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/.gitignore | 1 +
>   documentation/Makefile   | 8 ++++----
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/.gitignore b/documentation/.gitignore
> index b23d598054..a5a5efc19c 100644
> --- a/documentation/.gitignore
> +++ b/documentation/.gitignore
> @@ -9,3 +9,4 @@ releases.rst
>   */svg/*.pdf
>   styles/*
>   !styles/config
> +set-versions.lock
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 5f84a93e32..fe49d74cc6 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -50,7 +50,7 @@ PNGs := $(foreach dir, $(IMAGEDIRS), $(patsubst %.svg,%.png,$(wildcard $(SOURCED
>   	$(SVG2PNG) --format=png --output=$@ $<
>   
>   clean:
> -	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst
> +	@rm -rf $(BUILDDIR) $(PNGs) $(PDFs) poky.yaml sphinx-static/switchers.js releases.rst set-versions.lock
>   

That would allow us to run

make clean; make html

in parallel and bypass the flock entirely. If the lock is released, it's 
fine to still have the file no? If it's stuck for some reason (someone 
Ctrl+C the build and flock doesn't release the lock?), we can always say 
you need to remove the lock by hand?

Cheers,
Quentin


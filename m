Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1648ACCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:06:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.8])
 by mx.groups.io with SMTP id smtpd.web10.4352.1760609159229928406
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JkVKVWwI;
 spf=pass (domain: cherry.de, ip: 40.107.130.8, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URltEEXR+yfcMJGgaeRxpwGCvNh+IvQU5N+56JAsVyI/k+rev6XVn1n0J1BX0AfsO9GgwUCrQXolTSUUvqdpZSD0rb+UkBzA7vb/Urg43eFtydeh8uioejDw8WtSqY4GLwGOnpZYxRH55bo5FRFRxFAYz1YckDxVRNitw9tCIIL0QQJ/8TjJjo7tVI2Bq2vGFeqC+xs795U2y3Uoh0POTRCk+JxXRU51t9sAUwv2LzyQ3LxdS4ip09dYfQeMQu8dUagTPNPODUhA18c9OJ2DJB3Y9FvCiTubPmGwYHL1gurFLmga+J9kNJq4iAFa8woIRvSC9F8oMdn+aIpARLrFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEZ1ofhJ2ekSbukbP4Lk+C5IckvRL/k+l93RatM7H8w=;
 b=C+HTOPV77uWYMq39RbMvBLuJBfJU6NidD4l06ILurRzCU7bJ9q9EfYpuIykTDFRiF30xaFsn6Hg7SPCkPzotOXxyGkO0ei3Nm21PC6f6KLq6r6oCJLHdvn2eklkYrUo3gIoX3xEM5yVnD4KPXdxlo9YcKpwqWWGhahJsuIbINQDmaN3mBG1uZVOjIS9Z9dqXIEvN8ApTlVl/w1Hd2rHso2j7daX3zYRKMGbDZn5rvOdaM1MIU3MwrFIoxgzZDs3w60ZzjjqyYXnwjs1IJVU55TpTTfexQKHIIePy/NSHwJzR0ykh8+2uru4N+CzeVNEENgsv1wLlE3V45Xc84/2YrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEZ1ofhJ2ekSbukbP4Lk+C5IckvRL/k+l93RatM7H8w=;
 b=JkVKVWwIE1ph89Agysg0I2XSxtndhWglt8CcDqJdXp372mkcRkRSfq0zyPhoP7l24+gbXCrsYMsefMETLnVZJl7FO9AvBKIc11cXBqwJ7lAv4q9QExSMv5Ne8MHZUJNMKwe9lBKi7M/JBJr/Y+u8Ruk8hsR0jYhr3ElPKqppA5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10635.eurprd04.prod.outlook.com (2603:10a6:150:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Thu, 16 Oct
 2025 10:05:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:05:53 +0000
Message-ID: <797f1d09-53da-4590-9d2e-69fda8c65580@cherry.de>
Date: Thu, 16 Oct 2025 12:05:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 04/17] ref-manual/classes.rst: ccache: mention that
 the host's ccache can be used
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-4-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-4-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10635:EE_
X-MS-Office365-Filtering-Correlation-Id: 323a4fd1-bbff-405b-53ca-08de0c9b973a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nzl0OHBtR3p3K0p6QTlRZm9paFpyL2pScUlTNzNRQmQrN3J0bnVuUGpDOUVM?=
 =?utf-8?B?WVI0aEJlbmdBQVhWU2x5TW41YitQUVU1dFNraWtyWmxlSG9Qd3Y1YW9BczdR?=
 =?utf-8?B?MnhpSmdyWWRtajlPa0t6cmN2Z05sMkdId3R6ZDJHcDExWmFJN3VSS0hVeTJz?=
 =?utf-8?B?UG1mRmR0dHI5RHRhbnhLMXRpMEdUbzBGM3ZuTWZGV3EwbWNRWGpRa2Ztb202?=
 =?utf-8?B?dHBxVTZlakNhNE1mWHBKRVBpRmdzT2RJS0V0U3dqcUw1WE02VUZ6NEQ5OTdu?=
 =?utf-8?B?TWdjWWdSVnM1L3NjZlRLYW5MTGRud0R6S2VKMFQ1R3poQVgydkFWN3RaVjJp?=
 =?utf-8?B?NnZMV0kvb1F6MWZmRzdUSElIKzd6NHI1QzNoTkloZnB1dWZ6THFmVnVvZCt5?=
 =?utf-8?B?VlNDb1lGSU0rcUlkUTQ2Rm9wUmN4T1kxQUM3UDRWbUtoL25DZ0hseHc3U3FY?=
 =?utf-8?B?bldCcFlScytXemdncDFoVGJDNlZCYk0xV2tadFU2eEZHczQ3RHJsREUvNFJ0?=
 =?utf-8?B?VFNjR1gvdXRvTjRaODVLSWlaMnV0OEhzVzQrakpaanh4YVNuTVBFUHJQYVJH?=
 =?utf-8?B?SE9sSEhISXFseW5KZmNVc0NGV0dKTENtMHlrc0thYTh4NEwrOFdGUUE3UnhO?=
 =?utf-8?B?OWc4TTVjY29GbmZXNUZ3VWRuR1hNK2tnVmxWckFuV1ArNUt3YnlML1M4Y1Ur?=
 =?utf-8?B?TVVsdVdHRytlY3BIRWkySUJXTDJnQ2c4dkorRlpsU1ZKM3F3N3lUMCtUdGRO?=
 =?utf-8?B?L3c4eEVZK2RjbFpQQU5TMHhSQVFYVG9RMGlvQ1ExOFNpblZwVFhLWTRiVVJM?=
 =?utf-8?B?ZWIwV1Q3VFZkcXN1SE4wWTJWYlNaY1JpMUVIY2VYNllPbTROdm5NalZ2amZ1?=
 =?utf-8?B?L0d2L1ZuL21ZTE1Xb2JPT2g3UDBaN3dRNGRXcmEwK282cDRJWVZWVUpRdWNj?=
 =?utf-8?B?NThLODhHOU1pTE95a0dCbHFyeS92QVo0OG1SSFduUzZZRUlMcUdLUmRjS2hj?=
 =?utf-8?B?UUR2SUEvK080YnRuMFBPMDFySC9STXR1QUUrSXczcGRMOWk5dFRqSk52a3Zh?=
 =?utf-8?B?SHJpZGI1SkVnZk1OcW9KQk5XRiswMGhrc2hEVjZ0L1pzeXB0Ym5YZ0pkcVhy?=
 =?utf-8?B?VTM0emhNMTdOM25QTzgwMFB4S1IwbGNNZjZNdDNyOE5nRDB4KzdzM2U5WWph?=
 =?utf-8?B?bFdkK1B2YjFLNmNjMWpZY2lGby9LL2NLMTBWRURuVzR0ZmtSVW1JM1NiTC9L?=
 =?utf-8?B?RWNQcnp1NXBEalFUeWRmbFlYQW0vV2kwODJRUXN1ZStuWHAvTFV0MGFYdWFj?=
 =?utf-8?B?dXIyTSsyeVFJWDkvclhLNUdsbGpWbStiTnoyVEJNam4rbmE2SWJCRW9zRXNo?=
 =?utf-8?B?bFhNSnN3ZnB1amljRXhzQ0UyOFFRNG9JZUl2Q0ZyVnJ5VUo0MGVJUWlDQWpk?=
 =?utf-8?B?WkdlUmF2bEl2WHNrajdGMG1FVzZRV2h0K3FoZzAwSGRsUitBWjJIeVIwSTIr?=
 =?utf-8?B?L3hkL1UvUXlKZW5HN2Y2TEwySk1VV3JiQXFwYU5IdHVyRDVYenk1cGJNTDVx?=
 =?utf-8?B?bVh4Q0pBUzJQVFh6bm1ZRVNYanBUTEFNeC9CUHVtbGJqZVFoakhiLzU2NjNH?=
 =?utf-8?B?eVpQK0RtcXJDbWtOaHdPbmxxTk44d3V0M2VpVWY0WDFpVXR5ejU5SFZhQ2xi?=
 =?utf-8?B?aUx4a2ljc3JodVNjbDJ6ZEVJNkdrTzRvcDREODRjSE5MNzhvOVZvU0ozMjZh?=
 =?utf-8?B?anVqSXUya2dKUzFQT3hWeW1SbXo0Z2kxY1F5cEtLQ3Z6ODR1QnkyWmlSOVpK?=
 =?utf-8?B?SEdMVGoxYzhrT0tsbXBXM3FPeTYzbCtWSHhXQmh0bkZpUGlWek1VbENKUHlv?=
 =?utf-8?B?VnRjSEJwR3JCdW0xa0hheFNTakwwTy82cVgvZVBrR3JRbzlESngyQlRPNDlR?=
 =?utf-8?Q?qnXWHbL7YBwABMFBGryiwxJAm2hZiGpJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RERGWWRvbHZSY3ZXTnNvWnNkNXE0aXFHbmp4dk5WbTN2amRIZVBmM2JWYWFo?=
 =?utf-8?B?VTRJaEt4bHYvSllSbUpQM2xsUkVlZEs3SnRVbFFVYU5yK3JKckcvM1Y4bnJV?=
 =?utf-8?B?TENIWmN6QU13STUzNVJqOTgyOXRtME9kaU1IQkRETGZUZlFEZ09LR0xwSjQw?=
 =?utf-8?B?bVQ3OWp6My93YXVlL3d0Y3JQaVdVRlVSMmxsM2pSemx5c3ZlbU1YdE9UM2dU?=
 =?utf-8?B?S3NUTGgvNXFOZjJBNDVrdzRrR3c4ZHRzL3dJYVJZZlJ3STF2aGdKdjREd0xH?=
 =?utf-8?B?Um14SnUyWkJCNmhnZGhtdm9kc2xydnVVYTg4b2ljYmNsc0ZORVBCbGZ1d20z?=
 =?utf-8?B?N1Q0eTU0SUdqd2R1NHROWVJWbVQvV3JNYWlXNCtkbU1yK001MFRESjJ4cU56?=
 =?utf-8?B?Z1BBNm1QVDJJNk83d2ZFcEhkQ285a2E0TGkrajE3ZWVrOXNPUXdqOENDaktI?=
 =?utf-8?B?dkd4R29vMjROd0ZkU3ZLNHpPL3lObW5JdHdJa2NmZk4xZE80REdXRjZBc0tY?=
 =?utf-8?B?WE94Ni9sMFNQSjJ6blhPUmc3cUpVNFhvODhCZ2FmZHRleFhCcTE4M05QTFBo?=
 =?utf-8?B?M2VBN0hNQVZWb0psbk1rZ2NCb3dDZlk0SG82N1M4S3Zmb09rdmc1dnlvb2FN?=
 =?utf-8?B?ajhEcXRsRG9QdklCYndMUndueVpEMFdLM1pJN3l5WDRkZ1E4S1VsNHZHL0NW?=
 =?utf-8?B?WjJENGR5QlNJMGI0cEhyNmJ5bi9nVUYwTzJYNS90cGZTcVlCUlRYSkVzMFMr?=
 =?utf-8?B?bllhYlJHam1UV1RweFZ2Y0xTN3VDNmNtYWdWaGVKSVVqTXliUHFZdFNxRGtW?=
 =?utf-8?B?azlyS3p4bHpkQjh2MWpSdEdsN1NFei9EV0RDNVp4K0RGTXNsdVlVanBscnhs?=
 =?utf-8?B?RkdEV1psVmhyUUFLN2YxSUV5aVhKL1VvTTdrV2NUVXNkMW1xMTFiSVdQcmRu?=
 =?utf-8?B?bUZYSG9PNVF4c1NYQWRERk1aVy9oOEZaVURHdS92WHlFVVl2c0lUbkdBQmg1?=
 =?utf-8?B?anE2SzNuV1pXWWphQWl3dnJMT0FpTTgyRkd1eUlIZjExYms4ajRZWDRyVURW?=
 =?utf-8?B?QWowQjgzT2VTZVVhOW83aGU5QmZCNVZIWERBSVk1SkcrUm1vZDlwTXpoTWxu?=
 =?utf-8?B?bFQzWHZ4WCtIZXJQRUsyUUFtUWY3ejBZZndyLzhtOStTdVp2YmRGRHFHU3pX?=
 =?utf-8?B?bGR1TUhsMjJ5SitsbFNOVEZKY2VvV2w2UkVLMTd0ZUdsY2RGTmFHbnNucVNh?=
 =?utf-8?B?TTUxVlNzOVVLUlNaRmRJeU5hVEROSVpjbE9wUHRMMGF3K3dhakV6cklZd3hx?=
 =?utf-8?B?TThsdUFuRDhZZnR6OEozOFEyRmp3TlJwTWUzTTFIdjQveTJjNWZBWEpGQ2M0?=
 =?utf-8?B?UWJ4c2pHTXhyZHhoWlhKK1lia0JQMHVyRUZkdFo2NVM0M2R4dWZ0RGJtR3h3?=
 =?utf-8?B?MUdvVjdrU1NkdXpDV3hBOUFKUWxVOGFEdHFwa3VQVmpNQWt2VjZ0dDNOY1Vu?=
 =?utf-8?B?c25Tb0dkSGlMYnpzQmhCRGxnSHN3bGUrTy9PMDVvRHVLS3pVYkhHemR4YVZM?=
 =?utf-8?B?TitzOURCQVAxWHRLWi80ZW9HUHVKVzJ1anFONGZxZTNlZmVRczByYU5Ma0ty?=
 =?utf-8?B?SG9HTkZSeVlGMk5uUDY2dDc3Rm5GY0k2VW02eUo5Z3NiVUpMVUQycWxjckY4?=
 =?utf-8?B?cGgzc1IwaHJ5Z1MrVnN5Q3BMd0NVeCtxclQ1QURxWWRGMXRCbmpmTXVkQTZR?=
 =?utf-8?B?TnFVUnllejNkU3pZNFlxc3FxSjRlME5VbTFlbk81M0tTckd1VDhOWnFpSEU0?=
 =?utf-8?B?Z0hKTCtOdmQwTmFLbVRPVUM4czIyVVVJOXhEaG90VWVhdHBTRXNDZlY1OXVs?=
 =?utf-8?B?MlVVQ3JvQnJYSUlVMG9zeFN6M1kyWHk2OFZHc05tMUZJZWtIZHU4V2M1VUFJ?=
 =?utf-8?B?bTd5T3NMNFVxbFRCNFVFOWlaekt5V0pNcWRZdmVUdUJ2WXZYcEJDN3lJemtG?=
 =?utf-8?B?WHY5bUFZamdrU2x0Z1E2bWxJYit6MVBtekNrQUNZMjZvekordDNWcVNjVEp2?=
 =?utf-8?B?bkd0NVdzMG4ybEFJSThxL2NFcFJQcitCYVluQW0rTmFFYlZOeTBLaDNlakNG?=
 =?utf-8?B?aDQ4eXNLb0EvQ2tYL1kySUxsUlF4TFVmcHFoQ1VSMDVrSmdRU2lzSWdDOFpv?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 323a4fd1-bbff-405b-53ca-08de0c9b973a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:05:53.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tdPnGn/fTeBXzP4oICS6KR+TUJKCUDZplJZO01ZdgLjPwnxgFbM5RFUrRKICVj59Zo7SaibiotJgajcez4DQwAMY7A/cSea+shO0jdVAM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10635
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:06:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7728

Hi Antonin,

On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
> This feature was added by commit cc91a0f6500e ("ccache: enable ccache
> for all recipes if it is in HOSTTOOLS") in OE-Core.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index e89b27eec..f10903e74 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -392,8 +392,17 @@ file for details about how to enable this mechanism in your configuration
>   file, how to disable it for specific recipes, and how to share ``ccache``
>   files between builds.
>   
> -However, using the class can lead to unexpected side-effects. Thus, using
> -this class is not recommended.
> +By default, :ref:`ref-classes-native` recipes are not supported by the
> +:ref:`ref-classes-ccache` class. It is possible to add Ccache support for these
> +recipes if the following configuration statements are provided from a
> +:term:`configuration file`, which makes the class use the host's Ccache
> +instead::
> +
> +   ASSUME_PROVIDED += "ccache-native"
> +   HOSTTOOLS += "ccache"
> +
> +Using the :ref:`ref-classes-ccache` class can lead to unexpected side-effects.
> +Using this class is not recommended.

I was absolutely convinced ccache was enabled by default for target 
recipes, but doesn't seem to be the case?

Are we not recommending using ccache for **any** recipe or simply native 
recipe? I'm asking because this seems to imply we shouldn't use it for 
anything but the paragraph before only applies to native recipes. Maybe 
we could add something to make it explicit non-native recipes also are 
discouraged to use ccache?

So now I'm wondering if we can remove ccache from 
documentation/tools/host_packages_scripts/almalinux_essential.sh and 
documentation/tools/host_packages_scripts/fedora_essential.sh? If we do, 
we should probably add a note here stating you need to have ccache 
installed on your host system (which is kind of implied above when we 
say "use the host's Ccache" but maybe we could do better?).

Cheers,
Quentin


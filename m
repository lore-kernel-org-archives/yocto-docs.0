Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE03D2B92B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:33:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web11.17956.1730813630786590064
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 05:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=QKmj6tWS;
 spf=pass (domain: cherry.de, ip: 40.107.22.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwcqNPKdkG/B8xn4BtSbURxR5xT9qT9Lxjrp+8MphuGDT/kVuztykxyJOh1DH/I8h7fOuyRrU+p38SI0G5tJr4TVzClMohEdpIbRn81enXCooqhCA3LChUeXiZmfdbRwjgOug5RrA6d8Qy77A3d6Q+CNtUAMOUCJCMnwNGTl8ruPZNXeiRqwmucLK+ZuLNngztEAZBhmMyos8COnom6XkPC0yEGzFPXNg7creUUVA5qW5Kn6wRYNd431AoOzbkaJU2CtD2qA9Yhe58ODWChOzeUuEkkRC7YJKMdf80Buw65H0OiB2M0+QuV0YnK4jyhMDqq88zQ2ICtBRnfYAFQ50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9okpFoJth3TDMTZoqb63P4pe/zzRLQtm5RYAhWoi7C8=;
 b=vCikAgrJowOmlHqJungF1zhZ0o1xK3sA/0a92v55tZXSNAEC/5IVg9VgwpvldRgA2ZzoKdIz9GMMFjZpdwSVgi3DK9ehudnV7Js3GL+nvBxA+O9ItwqUHEGw+vOpA4CUYRescICpWrlrZ2NXbRc+HPlqyZjZz19MpTKpbBqBeHmipU/TDKLOMwWGmgo8aOd/+WMDZgolnHHXwRmIgH9YIAfjnSuLuNYyFq3CXu3TUe8NEoDKoFNnuIkkSR0lfUA9WSUD8pWLSYnZejdbediVtHAbG6C7WopGJsrEBy2VRvcfytuWOUarGHNUBciR3RdaXsWgT0Exbenlm7Y4UkGrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9okpFoJth3TDMTZoqb63P4pe/zzRLQtm5RYAhWoi7C8=;
 b=QKmj6tWSkG3C/gzgUaSEugsoRgCZDmrMZA4D18NU8O7N6/pUrGw0NGD5y+s4eAzcjLWzN1bBZXDsuKNGTbwag88AoGknz4FFX/dqTReDnUJmFvQifS6X3tQ4NsTHzfHF7nxUdjm9tPfXp3DdOBFfq2FE5k7AFj4I6lz+053oyCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10264.eurprd04.prod.outlook.com (2603:10a6:102:456::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:33:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 13:33:47 +0000
Message-ID: <37be0713-d238-44a6-a4da-a6e8b33d9cbf@cherry.de>
Date: Tue, 5 Nov 2024 14:33:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 0/2] Add bblock documentation
To: Antonin Godard <antonin.godard@bootlin.com>,
 Julien Stephan <jstephan@baylibre.com>, docs@lists.yoctoproject.org
References: <20241104-add-bblock-documentation-v2-0-74a8a2cff0f8@baylibre.com>
 <D5E9RNX36GZW.10MSD4UHMX2LR@bootlin.com>
 <2a77885c-43ff-4574-bf1c-d35ed77935d5@cherry.de>
 <D5EA30PTOQXJ.3CMF3M4B07K5R@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5EA30PTOQXJ.3CMF3M4B07K5R@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10264:EE_
X-MS-Office365-Filtering-Correlation-Id: 0080dc63-f5bb-4c08-69c0-08dcfd9e79e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUJNMXJrZE5HMmI1UGJaU0tCa25RaE1WWE9CMWptNmFpWGJuZ0JRdTlGQjZI?=
 =?utf-8?B?NlFDWll0ZStvWkJEaGdhcTJQMW1zVnM5aHl2aFY5QzRKRTl5bVpyaEs0MHhq?=
 =?utf-8?B?akw3TjRldXZmNzhnS2R3QWd6bitLQ3R3VUIzREVDTWg0QVpRMHpwN1F0SDVI?=
 =?utf-8?B?WHVXbGk4ODhqUlkwcklNYjVkTlhYOHBsQ2t0NllGN1NDR00xc2orUE1UZUFt?=
 =?utf-8?B?cVoxUncwNnNWME5ZcG44c3k3Q25OK3lCYlBGTGo2azAzQ2czR28xVHhUbVY5?=
 =?utf-8?B?ZWVVZlgvcmZRSk94akhDU3d6UVB4UkJ4WFhFNTJXeW5MbTlRQTFMSzBQU1dn?=
 =?utf-8?B?anB1bUdtMWNqTWo1SUxpcTRiV2VjcC9uZ3dIUytTek9TcG11RkhLWktGdTJh?=
 =?utf-8?B?aXNBcEd4WTRGM1FHWFk5Umh0cG83ZU1uNndsQ21IbFJTRG56NlB3THgySXBS?=
 =?utf-8?B?c1lNSVRqdkhNMTVnU283TEVJWWxlanVqTjNOT3B4UHNMZ2YrY25UUHZBNmhE?=
 =?utf-8?B?WGlpVUZ1NVI4WHh3end6MlhPemNzZTFtYlY2ZlRtVmdkS1l3UUNTaW1HS0Vj?=
 =?utf-8?B?MHhWUXVZT1RraUJjYU8rRE56NnFJb2RZS1RIMGYvS1ZXRHU1Nm1mb2VxS0l2?=
 =?utf-8?B?R09veVRMVUZyZ2FJblZqWWhQZmFHSWYvcGJlRGppNnhoMWdyY3dPbTRqOXBB?=
 =?utf-8?B?KzEzaVBqNnRqVGVhYVhvV3BLSjdZUmhEYkQ3NWlMNFh0U2JFcDVkSHg2bll6?=
 =?utf-8?B?c3VsRFI2V2MwU1VCakRDamRNd1FHUEkra3VuVE9udEo5QW1JMFFocXBYcmdV?=
 =?utf-8?B?bVc3dkJ5WXQzQnNGYy9mQ3ZXS3JISkFFdzU1T0RHOE5iWVRIbkREZWN1UkN1?=
 =?utf-8?B?S2F0THZFcnpFWjBGOElEbEFCYm91ZHh2WEFndFlHN0dNdkV1bGJmdjJvUklH?=
 =?utf-8?B?VGpTRHJmZk9ENC9kK1FQT2d1SFpMVjhKdGNQakN5VitEeXRJYnlJRU5BcVor?=
 =?utf-8?B?M0JMVkZPclBPb1hJcmZlV2VSdS96RWpIdm1icGJGOTF0Mi9Lenkxc1YxdE9p?=
 =?utf-8?B?K0lHVFUzZ0cvaThkQmszY3pZbTl4YWViU0xXbE5pR2xXWUpFUVFOTU1zZzRO?=
 =?utf-8?B?dmtrNWdqUEtsdU4raGc3Tmc3SVdzVXAwalUxUGY5Snp3aDkyd3Y5OS81Ynds?=
 =?utf-8?B?bHR5ZFNpSlZuZWRkUTFQTTdjbmQ2ZjhjWUtVRk5lUjlzeXpGcXBWMmxEaDhR?=
 =?utf-8?B?N2NhMDdjWGRLMkdjc3FGcSt0a044eWFEcnhrOVNhZzZrdnNDNTNHSWFkdllT?=
 =?utf-8?B?SVNwVS84K1ZLUjVLc3p5UW1mOEF5amVLOGRJZmFMaEYxSUw1QjBQMm8rSTNS?=
 =?utf-8?B?NXlwWmltRHNLRGlFcWRuZXpTUWttbzMvU2pTMmxYK3lZdjFXRjJVNDlIK3Qv?=
 =?utf-8?B?bHp1SVFoNDlMR0s3UG5BNE5QT0xONWZUVVNGRmpLWmJiUUozU2UyUmpTSVpt?=
 =?utf-8?B?ZTdPUjI1dGNZZ2pScEl2Y1JoZ1lRclMvUnRLN1BzMTBVWksvejNmQ3F2YjI5?=
 =?utf-8?B?b3VUcGVUNkxZV1djVGF4cWZSMnVJYTFTeFk3cWFIZHA3SWthK2lHUFAxSVpH?=
 =?utf-8?B?QUJSajhzQnF5cmJjNjVVV3JpRDc4dytJME5LNXg1TmpOcGlTQmg4WXBHZE95?=
 =?utf-8?B?cXJNRlpmM3RHQ0J0d2pmbFZkc2UxWGVVK0hOWkdtWGkycldBdWdPTzU5Y3dO?=
 =?utf-8?Q?BRZuGNkafcbtx2NTqulfX9tdknDLn4P06wjEhnF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2d0K3QrM3RyL1pwYloyTlJ2ZVpxUjlHMTZuck5IdkxyUDdUVG5mbmZyYk5K?=
 =?utf-8?B?Zkt5a3R5MEhwcGkrejFqYk5YN3FoS2FOMGZlU3VnVlpiWUJJQWpvUXp4WGo3?=
 =?utf-8?B?QTh0bXZ1K09yOEJaSERTYWVpVWt3dnVhM2I5QXhxVTRTb0hUUmFtZnJ0aWxF?=
 =?utf-8?B?c3lXYTJZQWxoT1pzVkJrRTNWSVNvbWozOEs0TmhzNUwwOTYvNWdhd1RaUlBX?=
 =?utf-8?B?VE5lYUJLUEZlZlNpeGlBYldCdHVHVlo0aGs4SHAvNEJQTGJSbzg5enExeWFr?=
 =?utf-8?B?MktwUmZtWXNMb2tRTVBNRzlPOFFHdFhtbVloenJWeExmY2NjVGJncGw1bGRM?=
 =?utf-8?B?T1BHQVBvSWJCOWVEVEgyd2IzL1Q1QkFBQ2RGK1h2Z2ZjN3RmYllldzhaZllZ?=
 =?utf-8?B?U1BjWmlNak9XbmdKT3YzSEFFQ1dvd0tXQjBzeHdmN3FLU2c0UW4zc21PZUV4?=
 =?utf-8?B?UXFhL1BNUkpKRndCcGF3dnFLdFB1bVlrdXJibGZhcGdWZXU2NUdTUVZIb3Jk?=
 =?utf-8?B?L2RmbklpMXNBKzEvQ0FzTlAzWUtDVXAyQXFxNUhJVVJtZTBpekhtUk5UcFZa?=
 =?utf-8?B?OHZSQUJlTEY3K0pIWDlEb2pOdFJXRU5RNjk5azdZUHdrc01udEJsdVpkVEh6?=
 =?utf-8?B?UmtZQnd6YVFnVTZQL25NV0F3ZDRJNEt5dE9SZko0U3pETzQ3SHJYdGVpMnA3?=
 =?utf-8?B?M0VvdXc3cDR4YnQ1bzNyZmFTUk5qQXdwbGhQalBQNnZNUWN2TW1HVUdiYlYw?=
 =?utf-8?B?RDNIWFRYaTZsb1k1Y3U3LzZuYVlsQUNwSmNUUXp4TEJoU1RyS3dKY1A3bVhY?=
 =?utf-8?B?cDdGcnZCUjZiNFhSc1NaemJiQVczZWFFbWR0eGZqdVpPNi9QZS9MNEMvU1ov?=
 =?utf-8?B?OHg5c2pLbFlWWDJOcGVEK3M2aDV0Vm9MK3hYM0tybmlkL3RlR1ZWQWU3Ulgy?=
 =?utf-8?B?Sld5SERJeHB0a1R1cGtEOWpqM1RlazIxUzcwdjNlN050eW1LaVFJQWNxSzRj?=
 =?utf-8?B?cG4wU0lJRWVEZThwWWR2RDZRaXVZeE5XejJadFBLU1BsVGdGYUpISlUyVDZL?=
 =?utf-8?B?RDR5RWVhOHVqSGNFTlRFMjIxYStjdWVEdGRDRFZQeUtKYStDRTI5c3QvbDJz?=
 =?utf-8?B?SDBjYU1sSTZUMzErQkN1QjVENUlrbHkrdXNWdWp0b1pvVnpNTzlMMzVsNytO?=
 =?utf-8?B?QWFuMkJ2NWJUUWV2TndqbDRoQVM4M2RZNFVqNC9makZjZzd5enNtekE2RzE1?=
 =?utf-8?B?UzEzODFDL0E4TUtSZWtoOUFOcy9sejMxMTFvTkFRUi9VdSt3TnVxNzFlY2pa?=
 =?utf-8?B?VjcvWXVXaGlPTTJqVlZXU3NsdEhVdXh5Ti8zbTltemQwV1lQT0xmbVE0ZGp1?=
 =?utf-8?B?b255bkxTRk43Q3JYQkNZcWpEdHhMblJXNzZ1V0hoS24xbTJiSjduQkpsRU55?=
 =?utf-8?B?MnJNdklhWkZrWVplSVVIOHc1NkN5WmpDNEtJT0hmN3hucUN5RFZCaTcrbFRk?=
 =?utf-8?B?RWlIVC9ZVlcvYmVCUTR2a25sd1JRb2RHSTFKTTFPWldzOWtJZ3BVeGszVmZQ?=
 =?utf-8?B?OVhUSHZ2SXNRcUJUMXZQSnc0ZWZqTWl1M0kwYjY0MHcvNk1URy9rMVVpVWNV?=
 =?utf-8?B?cjdQdHZRbW9oVm4yOWJwVFNPT0oveGRPcUhxM0lVQTBNVncwQldoWHU4c3hS?=
 =?utf-8?B?dk9uQ3hjcm5pcGhmbUtDeHQ2YytHeUtMak5TK2phMDhMaDI4MFNOVjJYZDFl?=
 =?utf-8?B?bHFYN0MrSTd0K2piRWNuczNtZXZqRjVsQWI2bUhkTy9WTE1TK3FxU2lEeWdr?=
 =?utf-8?B?SFFyWXVzOU5NWWU5Uk1CZVJHb0UzN2JJNjc1WW5UVVBQc29xZ0JxN1YvZW5r?=
 =?utf-8?B?eHlrVFMyZ3daR0ZyN3hjV0E0RUxRMFJHTGNEdWdHZmVlbnJpYzdjNGJPckpI?=
 =?utf-8?B?VEQwbkI1OVZoWUMrUndBMkRORGlwK3NScWE4RTlrSDBEZzdxa01YZmFQZ0FP?=
 =?utf-8?B?Q3ZXSkxXUHU5d1V1SDFBOWZKRHVFYUwzYkJHR09nYVFKRWJMNW0xUnhVSmF4?=
 =?utf-8?B?YjdGb0t6RWJJR3F3dWhQY3l4bjJpZjhJdDRwcmg3RlJjVVlwY2hLRHpmTk1C?=
 =?utf-8?B?eFBGRFZMMHh0T1MvWjBIeWs0WUZVaitiKzUxZlJPcGorNVJObGNSQTJGMVA3?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0080dc63-f5bb-4c08-69c0-08dcfd9e79e9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:33:47.3593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeYVeiRwtg6sG49l5oudsgnJ/RrRJRdSWPLtCRDL/yvMAmGi0wzaBUFK1/KmcfP2lcb7oCfyTuTaxY54/QDTAuvUw0XCL53KFQ1h383VTHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10264
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 13:33:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5681

On 11/5/24 2:27 PM, Antonin Godard wrote:
> Hi Quentin
> 
> On Tue Nov 5, 2024 at 2:14 PM CET, Quentin Schulz wrote:
> [...]
>>
>> There's a v3 already BTW, so maybe take/review that one instead?
>>
>> Cheers,
>> Quentin
> 
> The original series was split in two, and only the other half was sent as a v3 I
> believe. Thanks for your vigilance! :)
> 

Oof, two different series with the same title for the cover letter? I 
wouldn't even have read the v2 at all not knowing it was a different 
series of patches!

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064CBD58D74
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:04:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.29])
 by mx.groups.io with SMTP id smtpd.web10.25084.1732557894673699885
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 10:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=AK3L9XiW;
 spf=pass (domain: cherry.de, ip: 40.107.162.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWXmKQb5j2wAlyO7NZPxxe4JxwB6xGpCXtE3daf624V/POKb+txAu2FTcrkZSqKbbhTaG2AT6U/nArVLM+++pb4jZIawyFfjpSz2C9wWIfTOgOWO9sYnPqLv9DyZsZbYeMj+fChnR3ZrFVv5WLrDrXr2TZU1EF0CZwDs6x7ESd+jGBlJBgAVHb0J9+gY47W/93Xqdk0SZ+IeohSsVNqZdCJeC7JzReCiFnPv9vOajtLgHMzc1aYtDZFmoB+hC2xnK/9EfRL2WnwDCPCAi+m2W/++E62tBan3Fy1tf9kH7/2IJ+jxWxdornKs2cPZwKn9SEV7zV5xPpk1BrY2Vprpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzgjaxRdSw8ctXiwBGebXk5Y//E3uR53uqI/rc9bFhk=;
 b=y/baP20qch/eqSUx0uC3bKbDZfQcIJ4JLYAIq47wKS+3dpvYySULKRClECyL537YxBSWQh4VsSmO0ATqYArI7LtdBCSemrfNBp/H7JKLD7ayV9zxHKMyJLk5FHf+AAxWqTMgIAWHEEKK8Wr7brXTH5DrWkFMQbg4Iuzb13W58rWxCO3g8gfX8fDUyvP9HIu1hJtscy4r0l/RPlRr8ydkux2pgVKSBjxze2q01lFLR59W+4MKf94SmN8/w+ybdVB5Bnb/I+5MjBjVul9u3qujrq0/oYLTNGpeNV+Y3eHDn1he+iaOGW2dnjUEOFtWSfIctqOdt7W0oFwAPYYgRhU1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzgjaxRdSw8ctXiwBGebXk5Y//E3uR53uqI/rc9bFhk=;
 b=AK3L9XiWiJO/op40DSKFGbibn5yGEk/AQNYmjLDh2T5XFY3nrR3awvC6ghtQXVWEbEJGhRvKX4NbnuLYADc1ZcDFbB3roqQ4guF1LXd3xggmLvna4Gr2SH79QnCDqc+5Gqj3wP4wQpV0WafEqVFeAaZ8CrU15O1TIn0ZeRTOiNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8303.eurprd04.prod.outlook.com (2603:10a6:102:1c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 18:04:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:04:50 +0000
Message-ID: <03c99b8e-d3f7-4293-b304-760856e035dd@cherry.de>
Date: Mon, 25 Nov 2024 19:04:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 3/5] system-requirements: update list of
 supported distros
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-3-50e267ae4123@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120-update-doc-deps-v1-3-50e267ae4123@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4034509d-c2dc-4e61-8516-08dd0d7ba802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlQ0ODdBNWdOTFo3Z3FiM0hjV2o3YXhwSW9EcDc4bzMrdW81Wnk0RkFtdFhn?=
 =?utf-8?B?Mm5wOHFMWldGVFJmYXl2TnhwYVhLOFNIcUVEYTV3QkxKTUtNNUtTN1RIUHFI?=
 =?utf-8?B?U29qVGczVU9VaU9BMTRzR0QybVhUZE1kV2ZOUEg2L3VSQkNSZ285VDd5VzB2?=
 =?utf-8?B?R213TkYwSy91UkJwMzJ5MlJDOVpJRTc3OHlaekRhTW5vVkV6bFgxV0lPbXl0?=
 =?utf-8?B?K0ptQzRlVjRXUTNJMzNONnJSMTdxdVdFbTJIWm9wVmpSaGl6bXpGRGFUeWF6?=
 =?utf-8?B?Z3B2SlorSDQrN0pCQlJMTENLT3NVa0dhem42cTFSL0Yxc1daWFI5amlBVyt2?=
 =?utf-8?B?TFF3amU1emZtWGtqK1lTNzZ1Ym9GNVlHUjFvci84ZXNSWXJEeDB1bjhOdDJl?=
 =?utf-8?B?alBVcnNkRVdpRnNJcWMrVjlMV1NKWXIwdjB2enk5bUdGdG1lL0x2cy9WdEl1?=
 =?utf-8?B?ZkFjak0zcHVuVE9EZUhmT2dicFdCRzBrMnVZYkQybDdXTHNnVVB4cU84OXRX?=
 =?utf-8?B?Sk9yOGpLWEUvUHZ2RG1XdGw1MUtZZ0FVUzQvT080eWJpZ0U4WTZheFFTU1J0?=
 =?utf-8?B?MU1UZGpEMThkU0todldoWHRGRGwweE84Q0dzS1VHSngxRU1nTS9RbjBWTXlH?=
 =?utf-8?B?UFA0bjhYYm9KM1lOdHRtMkJGeEJQK2szcXZmM0hNbUtlL3grWDRUMHJJZkRH?=
 =?utf-8?B?Qi9XVURwUDlVSkduc3RkU2hDeUNlc00yOEJqdW5JY201MVBIY3h4czZ5M2hi?=
 =?utf-8?B?S2U3aHF0NWY1N0dvbU5UNU9tVkRSbFo0R0NXZDNyVWJlNm1GakRmdGhHZTc2?=
 =?utf-8?B?WDFhdFpPdXkwUUVVQm9oRWxnS0hiRjVwVS9JYWZGYkRBM0dmZmpTdVFUV1VV?=
 =?utf-8?B?SkFjTlpmdG5lMU5QZm1LZlp2RjVwYXdFMExYdXdaMUxMdnhpMEZtckZiSk9m?=
 =?utf-8?B?bzRrSm9Kc2lRVjVwaGdiZWhQcm9FZXpQdmMzYlJiRHlkZU44bjkxK2g3Y0xK?=
 =?utf-8?B?bUlXUzNocGI0YWtZT1FsN0RudytDN3VEK2JHNDMzeDcySk5McW4zNUQ2UEhW?=
 =?utf-8?B?eE10S3BlUVJvYlpCTXFxazJSYmxyYlp5RmFCSENXN2ZmSFZtTUZRbnVyM2w1?=
 =?utf-8?B?MW5rbktsN2pFcjhzZWwrOVdtWXVHVEtTajZtYVd6TjdXNitrbkxla2EyMVNZ?=
 =?utf-8?B?OUZXaDZPZnVkdHBQc0dncGFFUUMwS0NlSDFIazJSeTVMQmkyS3VBZEVJR3dj?=
 =?utf-8?B?bnRuUGZaZFBUR0VRMkEyUUZ6WHlTTmE1enhGYWRwUUcwNHVUWEVGNTF0Wmg0?=
 =?utf-8?B?bjVDRS9vaCtSSDlaZDQvQnBLcUdzRG1Xdm9sczk3dFZCSE5YUHdnOTZkVWF3?=
 =?utf-8?B?WlRwUGY4VUVZZFZmdmZpRjBoMFRIejB0bE8rS2ZYcXFDZWlWWXBIcEp3dUJ3?=
 =?utf-8?B?TUtPU2VZOGR6cUIwOXNDV2lSOUtZNGMxRGo4TTJKOTRRdTErTDdUaFJDSkdu?=
 =?utf-8?B?aEs5Vm1wclJHaVkwaXRBM1RvT1kzVEQ1b0k2MXJJN2Mva0NnZmxrYm1UeFZB?=
 =?utf-8?B?SUt5UDR6VUx2ZXAvNDBBMEl1dUJtejZOYnlUckp1NVdsd0xDMzlYNFZNUVdO?=
 =?utf-8?B?ZUFQWmtvbkNwMFF3RHpkb1JSTGRNejZOSndrZ055VzUyaXNPRDdaZm9pM2hw?=
 =?utf-8?B?ZlpSVWllSXFYWTF0VnpEZy91YXhPbWhmUk51V1hpODJTQm5idWlsUlh4TjNl?=
 =?utf-8?B?ZElqOHpzbTl4UlFsVU9maFBDNEZYU2N4elNPZ1NWVU41ZUtZQXc5ekxnZTJt?=
 =?utf-8?B?QlpqNUd5VlkxbzlXNThLZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THp2eU9mbGdnSi8wd2dYamVITUQ2WVdKTFFKYUJGUnNheG1LaXpsRzM1WFV2?=
 =?utf-8?B?MUFiaDY2U0FMczRUdFAwNE5LSCtYUUJzdjRQbXh3SnpGc2ZYRUdtTW9tL0JU?=
 =?utf-8?B?MXVuaGJjTzc1T2tVQ0xDYjU3Vmg0U2t2NEcwRXNHei8rWXBjL2NjNG9SaUxp?=
 =?utf-8?B?WWRERVJIaU5la282aS9weEtWK3YrN2wrdGI3SlpXL3VmRzFOdHgvSjJDZ1R6?=
 =?utf-8?B?eWUzaythS0c5WW10Rm1sdTFkNDRiazgvWk80cnpJYlhxaXd6RDdpYjhmOGNS?=
 =?utf-8?B?SmsxWTRnWmYvbmM5YTVaakpDbC8yRHhPSTF3S2hHZHFwd01adURKSDNlNFVM?=
 =?utf-8?B?Z003dmd3OVI2ZDROR3JRL1Ztak1FUU5UWWx0ck5uSEk2NzlBTDNkQ3JRTnF3?=
 =?utf-8?B?MEdnWTBmQU1mT2RrdElGSFZWTWV2b1FOeFhQL1FRcmxPamVVUnl6MFl6bTdY?=
 =?utf-8?B?SUtVamRhUTNkVENCcStRNlhrM1Z0dzltMjduVC9VaEE3Ti9rTTcyLzJZakVR?=
 =?utf-8?B?c0lvb2ZhZHJJZlVZeE5PS0g4S2sxL0hBVVJDSlRYVm1ldHc1U1NQV3ExWHV0?=
 =?utf-8?B?R2J3L1laY0N6WDRoWU5TRnR0VDB6eEFqdXA2OE5aWkt0Ky9IekVEWXVIalZj?=
 =?utf-8?B?VU5uNXorczJFQ05HWXEyd09lTG13WWFmM0Qwa3RwQ2xVRWIrcnROVEs4engx?=
 =?utf-8?B?MGNVYjFDY3laNDc4MDhyUHMxeHl3dmJpaEZtckJRVUJRNE5XcnVoaStrNjNR?=
 =?utf-8?B?NlJDUHVRSnVJMFNHZkRmc2RMMjZwbWlzSUp4UkVSbi9VS2ZDY0w4SXp5dVlZ?=
 =?utf-8?B?SUNSMHhkYWRBWGZLY0dDY2JiZHN0QlhhUlh3S3pKaGE0c0xqb0YxK1k1b2RZ?=
 =?utf-8?B?TTlZUmlXaVVwU0V1M1J3VFJ5cW1wcUwvYXlTUDlwVDlxWVJLcytIbzVMdGJ6?=
 =?utf-8?B?eEgyNDFuekVWRWxaM1lqSGMzOFFLTWpGdXpsQVBWdFRtMVJ6andScjdYb0Yy?=
 =?utf-8?B?RW1rSVVqa1MyK2RoOGp6YytzVURuZW01ME42WG92ZVh4Rkx6TGplL3k3T1ow?=
 =?utf-8?B?ODdmL0dCMVFuS1Btd0M4WFdQa2dockoyYzJIeE9YK1lOMmFmajBYN1FoRHo1?=
 =?utf-8?B?Um4zWWlNMXJ5SmhjejhMa0dQOFhCVFJtZ1AxUm53RDVHeGcwMWQ1c0JhQS9n?=
 =?utf-8?B?ZGcvZ3d6a05FWTBlN2FUQktUUnlJRnM4VlVVcmFIK1RiVjY5Rk1DMWQ3NXpY?=
 =?utf-8?B?RElnVUx2RWEyRGZsemxrbG1rZFlVQXU5bmtLVzZ3SzRwK2o5UHBuYURXeHN4?=
 =?utf-8?B?bmNjR1g2bVVLU0RBd2FXc2FleWFmc0JhVkZ5VTBSZ0xIb2RHaEpPZGVjUkFk?=
 =?utf-8?B?WndHTG0yTkFaWVlMYzBHZU5sT0cxMWZDWHl3Rkt3SFlIaDZKWDJDS2RUbGt3?=
 =?utf-8?B?L1J0enVFMUhKV3lwRFlXU0J6SnVEY2FHUlRZREhvTkVmeFFXL0I3Y0d0RnJL?=
 =?utf-8?B?LzJ1M0xGcjUxODhJM0dSQU5uNDFhbVMzS0ZjMkVpNGlaQzFJZFh6L3pUNjA1?=
 =?utf-8?B?bVQzNVlpL0FYVTlyMWJwSk1qTHRRYzRIWnR1VW5EcmVUNU55U0p2RC8vQUtw?=
 =?utf-8?B?UnRYV3V2V3R4TXk3OGpyd0QxeitvQlM1Qm9sV0pBN2g1Nzc3MTRIZkVBK2FK?=
 =?utf-8?B?elpDS0lVRStsT0Q5SlFPaHgvSXUrU0RBODluZ0o2V1BOSFNpUGpoMkFIcmFj?=
 =?utf-8?B?aFhLWnM1NitYeURlVlpTMVZ5elZmdFd0SXpnMkpCZGZWNHRwZm83cDJZQ09U?=
 =?utf-8?B?d2dWZVpiZ1hiNXJPT1U4TFlnT3MySzAvZHlZelJqNndwRUUrMTJMRkFKUXBO?=
 =?utf-8?B?cnU4aWl4d0FqQlF2TG53OEF0V0dQYW5ubjMrRU1jeGI2amZPUXFkb1l4MnB1?=
 =?utf-8?B?Z1RVOTYyZm5VWDJxejhnWjZQYVdlVEpoa1BZVmJ4bG5YNHlxQ3BObG9nNXQz?=
 =?utf-8?B?MzE0SlhWbnVBRnlQOFZod21CaitRK1FxUHAwb1V3OEVoR2JUa0dXNEJBRE0v?=
 =?utf-8?B?SVlULzEyeDYrRE5JSkQrMXl6U1U0bm9BVmVCaUdJM2w5VFZDZXpZM0RzaXZm?=
 =?utf-8?B?cHBrNHVudERnbHdyZVV5RW4xUjBZbFUzcmV3ODVpNyt5MndQOEM2YjRwb0d4?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4034509d-c2dc-4e61-8516-08dd0d7ba802
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:04:50.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaBnxyeIUo5kCQ1fAsO+bYod3mKQ2pyHn3y7wFTmoP85a+pY5FsdpQasvY/MUkKPM23+IohVm8aS00nYbtXS9VVz6LHAF7HAD13oANP8knY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8303
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 18:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5806

Hi Antonin,

On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
> To match the list in meta-poky/conf/distro/poky.conf.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index ca75f849d0ad10344900c7525f7163726ffe5400..50c153ad7cc68a3ad175d6aad7f4527d9e4d219b 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -62,8 +62,14 @@ supported on the following distributions:
>   
>   -  Ubuntu 22.04 (LTS)
>   
> +-  Ubuntu 24.04 (LTS)
> +

24.10 as well it seems.

>   -  Fedora 38
>   
> +-  Fedora 39
> +

This one should already be in Scarthgap so split into a separate commit 
so it can be backported?

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E8AD15D82
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:14:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17611.1764774853763263382
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WZ1FlnfU;
 spf=pass (domain: cherry.de, ip: 52.101.66.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAzsCaXBKDHZ3H6KGoaZT5HpW04rQMFVRtSqRG1RAiipvpzZ4iTWaW84KzVP6E8j69N56aKPw2jT1DHW5S0auBq5tzSmDcCOcfSc6Q38+bVLXX8TD4ff1oSgzwcMOgkGNwMCr6dgk0fnMHCUZS81iPK+c3KW30DHjmJwXsfXCeDWFkLl/7n1PFmAzOn5tbay5abzI/lUH/f8E43wPNnZxOf4TOipSs8zJxmn1Uc6Zn669+le1s6K70z3XXYwkf8CkRowiHft+ZYMtaKB+BFGsXkJg1aDiEnXjWqcMFcXiQLf3n0yr0dZ6J2UmtW15I6bTKuX/IH90VA3oSoSPnpyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EUCNyOSpsKcUNxPMlPqx3NQNX47854NKCwb61y+A1U=;
 b=mjXG8y9+ObrDMqLwXKTPD5jkF+YQ5lpPjmYXuolT1S3ulbfDuyU32mK+2Tnms/LSxVro5iXzmAFpIlqThtPs0Qpc4m+tQSqJcE2xCRInPxOStkaSR4K3kR7OuRNzYqEc+i/jzxBVntz7FqH35jxy8r7x3arfn28A9DhDs5NuN9GM7JREcYCwpAtHpz9kBeXvQcABKdaOcv2bKCmCPxFA0mRnkJKrx6X/w9LPDkYRWmxANH4AHOGu+YgDgLwSosbv7yLCVPTMPNmQms+AZXom9U/OfPG+7/TBOmn0eIgCBYluu19i4rgfX6LSvhucwUqXJwPX7/cU9+0ZvXOq5d7ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EUCNyOSpsKcUNxPMlPqx3NQNX47854NKCwb61y+A1U=;
 b=WZ1FlnfU+K44Q2eDD8/MZ0bTy86VCN48GAaSqIG4IrWrrMTiP7P5sqpNMX93Dy8eD7Aj+bPKvYS+wm0I9HL3L8y8XunQ7fAF3+kGQXty3iaKzdwGrYO9ZJRsq5BG340/AKNrNtPMS3AeZm0JQZG+O/l27I4v3tfalOPYRu+Q7zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AS8PR04MB8658.eurprd04.prod.outlook.com (2603:10a6:20b:429::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:14:10 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:14:10 +0000
Message-ID: <1cb8ec06-827d-4d5a-bb27-bd1c21b4d26f@cherry.de>
Date: Wed, 3 Dec 2025 16:14:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes.rst: remove
 mention of Upstream-Status
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251202-remove-upstream-status-mention-v1-1-410d15493349@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251202-remove-upstream-status-mention-v1-1-410d15493349@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AS8PR04MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c9147f-6283-4eb7-9320-08de327e9c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVJpajRRR0JVbklPUldzN3QyL1lQTHNVOHU1czdzVHVySCtPY0s4VGx1Q2sy?=
 =?utf-8?B?bTdNdkRvWHhiSkhZdC9sNmpGcm02MW5venlnSHA3cEhhUlRXK1NBSjVHY1BR?=
 =?utf-8?B?Y044eWlFQUZRSmtTQzQvakRlL2V5S0lTQVAvZnNYZy9PY3oyemZNS0lSc000?=
 =?utf-8?B?NHdJWjlJRStTV1VyZitZSTFpUTFic0JuS2diL0R0NlA3R29EL3NrNVpqRWgw?=
 =?utf-8?B?c3BYNHpqTm9vTEFjMTgxRVRrSTREaGc2VG04blZXUkZQRG1MbW95aCtncHRR?=
 =?utf-8?B?U1FqYVUrRjJYdVMxTDRSdisrNVd6aVJnV05oWXJqdDY3UmFuMkNKSUQ1bG11?=
 =?utf-8?B?cVhybDVBT25JRUhReStmOTNZYlhoOFRPUWl0djRZNDVlRWVHUHVBQzFoVERk?=
 =?utf-8?B?UDR4dDE3RjdXcXNDeGp5Sm9WTlFzODNsV05ETmtVbW5DMWxJTGdFNjJQSjNO?=
 =?utf-8?B?MktsRDNYWmtuMjFBYTY5ZkZXL1htNzV0K01KWDRoYzhmMUdHYkMwNHJ6ZzNi?=
 =?utf-8?B?M0llQkx5Q3dGOTdrcFZ2MjRQK1RaVzloeDJlNFBZdThEWDZqaHhvcFhhNWtO?=
 =?utf-8?B?UXZYNjVDV2ovUWpLMTRFdTdjOTZPdldnd0FEdFhYa2lXQ3FiZ1gxZ2UybUE3?=
 =?utf-8?B?ZUI0dEU2UUhvTFA1QWJvNjVQUVlsUWp6U0RCOHg2VitCZGUvaEZUeGFBTmg0?=
 =?utf-8?B?cHBDWUlEUXp5eEFqOUJXR3B4ckhGZ1VDcUpmVnJHalFhY1lFRXFJUGlqNXgr?=
 =?utf-8?B?a3c1OWFWamxsMUhjVjJZL3FXSVQ2R1k2bjBsbFA0Z3UzV0tDQUE2SEp3ZXg1?=
 =?utf-8?B?YS9rTHpIc0RtemNCeWlJdGxZM3cyNVVuZDRCYjVNVnJFMHphbEo2UkptZ0tI?=
 =?utf-8?B?OGczVWxhd1RLM3FUdjRWMHB0aytCOWV6R0d1cjE2MXBiQVZkQjJGK0hZNWZZ?=
 =?utf-8?B?SzlmMmxSSlFNUThTSURDbXpaRUJGRnpBUTdVSVdmMFRxNDNBNlcwN0dwV1JM?=
 =?utf-8?B?UTdsc0JnTWdXODRaZk9qTEcrNDk2cm1vT0NWWmtKNUd4QXlTc2FBdzNJUkIx?=
 =?utf-8?B?NlBVMTZUYVR1NmV2QTUrc2N2UXJ1SGtVOEhQb1FIZkRJWXU1a3g2Z0NsdDQ4?=
 =?utf-8?B?MjJ2aDFheDhCUUozK1dQQkMxSFVTcGRIQUFzTzA1RlkrZ2NrSmowbmxXZHlv?=
 =?utf-8?B?UHQwc1FnVlR4bmVpQ0h4dGRYNU5sY3dkbVRGbU8vRUNNcUlMbnJPM2FvS2d0?=
 =?utf-8?B?cXBVRkpvMzkxMHlrQkdFUUlGOG5nUFJLcTllSmZaRnNZcG9UL3h5VS9JUHBp?=
 =?utf-8?B?NWs0eXhXM3BHYWRDNWtjR091RHRvVFpyL2R0K2Z3QldDR2pDbkRqc214M1Qr?=
 =?utf-8?B?ZWJhakdoSVdNa1VSUlV0aTlQa1RQeHNiYlZRTEVRMnBVSGRwbXYyQnpnblVG?=
 =?utf-8?B?Tm1NdkpzUWx3Skh5YkZ6dHlodkdWdEt2VVFpbWhOZWdSVnBqcFlMaWtJM2Vm?=
 =?utf-8?B?OGFMc0JZMmNFd3ZIcEEwS0M1UG1xcnNzR0xzSjRxd2htaWRpZGVyRTNjT3NM?=
 =?utf-8?B?bm52cUpXRlZFRFdmYVQxNU80SkFJRW5Da2dxTWZ0UmNjY2RmQTNlZHZQQUoy?=
 =?utf-8?B?K3l5QUU2dGcwb2gzUlcwY0NOd1NVeGlSUXA4RTRqNEcyQnQyK0RlZTN6Nmg2?=
 =?utf-8?B?UUFRdDJOR1FLYVhJUDRZZ24xRHhvTFppZkUzby9scHRJNEVXejIxMC9qL25M?=
 =?utf-8?B?Wi9CT3UybjZhOG5FT25MaysvMHVDVjh3bHlxZ0VOVXNLUDM1WWpSSkVWZmV4?=
 =?utf-8?B?bzNITkpXaG1yRzc0NjJmaHI1K3FYdXJ4Yjg1YkszYTROZHNPU251RW1MSWo4?=
 =?utf-8?B?UTJpWWoxYU5DNWsrYTlkWk1ZUWo5a0pQSlVURlE5dnFERnhZVGpHMzVGbFRU?=
 =?utf-8?Q?sWhdovlKTYvIWFwbjNaH82ZS5SutKfLh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2pDaVExbVV0d0xxVE5HZ2FhVC9pblhOYlFPemlPdHpEUk9ZUDdvS1dRQjVj?=
 =?utf-8?B?cU5CZ2ZvTWxGdEpCZ3F2T3BkK3VncHExVHF2dzB6ZXJXcEJaRGREYzRjVHNv?=
 =?utf-8?B?S3hUQ0JydEJzUC9YeVJDa0NHcUpaSnBNQW9EbHp5S2JWRXpkVEg2U3dJdk1i?=
 =?utf-8?B?QnJvNnQyNm9hWVM3TmUya2tialEwRndnMG9aaXE2MkpKaU9nNStLbHhrY20x?=
 =?utf-8?B?N3ZTbzFnTGZFcE5GWWJXajZWemNUN1RhNnczSVFob0k0d0xBNStoZnNCVlRS?=
 =?utf-8?B?VUtBNHk4VWlRYTh6ZXdjZzlVc3VPdVMrTUg1V1ZDc0x4QVNuS09TTWpRTjlC?=
 =?utf-8?B?SXVFVmtBZUVwWEYwMVVLcG1SWHBtKzBjY0pHTVhTMWZOQk8yazVwbS9nZEo2?=
 =?utf-8?B?RHAzSzhaNWI0VHVBN0t5czJWSTMvN0dLSUFNOEYzK0ltdEc3QklpT3kySGd5?=
 =?utf-8?B?MHg3Um1ieWgvSlM0Z2U4SERscTFlbXRQTDJTeHh2K3Q1RGt0VHVIWFk5dFlD?=
 =?utf-8?B?ekRQRTRrbnFWMHg3MitmVHAyKzB1dFVFQUtOM2ZvTDY0dWRFNExuRXNleXBr?=
 =?utf-8?B?NWJrbmhsMVNQcXJIVWpGWTRGVjZ3QXNsWTIxc2RTclh3VnY3YTc2SmFCWFNG?=
 =?utf-8?B?T1h5UGpQWDdNNUlFdXZBUGE2bTBFUTdPVTlDczRnc0NsY2pFWklQd3lpYjc1?=
 =?utf-8?B?VzNISFRGbUk1SzBTWmJLNGszd0dHZTE4OVFnZ1JWY25MR0ozUzRxYWxCM2Zw?=
 =?utf-8?B?YXJYL1NDdk1lRzM4bytHQWxMK0p3MEZJVGh2amp5dnhCZTBoeFlXQzdFcU5L?=
 =?utf-8?B?eWNxNHljbXBpdGNkcGhuY3N1R2hXWk9wTjBpbmpSNmRNQTl3bUVOQzNFNFhS?=
 =?utf-8?B?a1gvcXBMeWg2VDdBY2JHODA3YS9oTU5PTU1NMUF5TjlOclFoVzFvYWU2d1h5?=
 =?utf-8?B?UzNYRzRZeW5JUXNiZmRFbHRYRVUzZkRSMzUzNFVDSHdPTTdKMi8yWlYyWURS?=
 =?utf-8?B?V1FRVlFXSzVFZHZlQTQ1enRxVURrNHFseFZvQUFpSDdwSzc4YW1zUE5odEdu?=
 =?utf-8?B?b3dUZUtYOGYxNk9QZzE3a28raDZFT1NOamwrMkZUa3lOL0FzSkZMQ0krMW9D?=
 =?utf-8?B?V1VOeVhrT095YWpJSnJsTFQzMVd5TFNQVWZqUkxNRll3Rm5PQ0tkSWFxOUo3?=
 =?utf-8?B?NjBzbWM3Y3JpTGc5a2ZtOXA5c2lYbHl5cE1FNHp2ZkI0QWJXM1NRcExXZzcz?=
 =?utf-8?B?ekl4enJMVWRYb0ZSR0lzWFdZZkhrZ1B2ZEg1ZjBvR0x4YXVkaGpJeGpvUUlV?=
 =?utf-8?B?MTRBcVQ2MS9vakV1b0t0VzVCZ2xzWUI0dVR2Tjl3ZS9EV2JCWFJMVjczQkVi?=
 =?utf-8?B?RnBxN1lxaWh5RHZaVVJ2emNtRGdrYzV4dnVnS2pkUklKTWtpSkswL3BiWlA4?=
 =?utf-8?B?UXFBRDdTWnhDTi9ydXNkc0tNRUs4ditqQVZLZEpVOGlwejZSZ2c3eFFFeWps?=
 =?utf-8?B?aGRJNGpZaGVRbXp1VXh6WDRQSnJGRDNTU1NwSEJXYTJYNVBvSFg1QlB3RG5a?=
 =?utf-8?B?MGlBdjVDWjcwVG5TZGxQSVZZcDhKNUtMTFR2akpSTG85L3YwQUIxTzRZOTc1?=
 =?utf-8?B?M2RQbEJ2WmxzMTZEdUlPbEsvd2NrdVEzUHAxYk9JOTlBN1RaS0M3WEc3MThr?=
 =?utf-8?B?cWNlcG1yaTBOOGg1aFNGQXI3Wjh6L0VhWURvdjI2Q0xQNHVIUEM4MFg4TTRv?=
 =?utf-8?B?NkhqaGt1K1dka2lXMnA2aStFOFBmSGE1N1VXaStORTF2VmtkckM3RTN6b2pT?=
 =?utf-8?B?TVN1Nnl2T1lnUkNUTE0rdWt2RnlwWk1tZk5WaDJhYzBTUVg3UXVJRzJJZWRi?=
 =?utf-8?B?UE8rNmNoT25tSGY4RlVXTitoTXFlalkyNmxOanZieVBTL3MvbTB3QitOZTBZ?=
 =?utf-8?B?QjNER252M3JCcWtyaUxtR0dwLzNjdk1FbjliVGFmaUlvNVhrUHUvOGtXYlVs?=
 =?utf-8?B?YStpaEgzcmhNS1FKQjB2dGZ5OVVzQUpZbWdZbTRJaHhoSXkyWFQ2a0h2bml4?=
 =?utf-8?B?RytWT0kvYytOWkg3UFdwZXJVZXdST2t2bWpCRHJQZVVaMUQ4SGNWdmpNMjk1?=
 =?utf-8?B?WXJDMlRzQ1d6d0dKdGwyUURkL0tvMjBhVnoveWZONGtqQkJzNkh3azhEZ1U3?=
 =?utf-8?Q?jac+HolGP2MmSYAbdgtFbtQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c9147f-6283-4eb7-9320-08de327e9c2f
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:14:10.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63OxGhcSlKWwKJ2uQi6HKN4E/iEyphGhanDu4ID4HyjQ/weEb/MMfibYYOaM0ZYjViHFO1a2zei/aaX8clzgFWes2hVLHkTxLBbVAOxtKiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8658
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8199

Hi Antonin,

On 12/2/25 6:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The Upstream-Status tag is not used for patches sent on mailing lists,

It should be, for patches within the patches sent on the mailing list.

> but for patches to be applied to recipes. To avoid confusion in this
> Contributor Guide, remove the mention of this tag as part of the
> Patchtest examples as it can be misinterpreted as something to include
> in a regular patch.
> 

But I guess this rewording is fine, the error would be shown by running 
the script anyway so we don't need to list some or all errors it may return.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


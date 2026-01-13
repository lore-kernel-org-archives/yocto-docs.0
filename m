Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50176D2D0E4
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:05:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57248.1768305947246682186
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 04:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XjzCquRj;
 spf=pass (domain: cherry.de, ip: 52.101.72.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkim4elp+OOlph/3302YWf6scqF4pfQsfmQX+Po2eb+svD5O8Z1QlvdojayxibyOrAg6AwEzq0aNjBOmcpQupqtx7LXK1QU6fjr+ikfM/DJPL/B2T4h3AyFD7oIPktiF0cWUbvpBGqbQZXLhsEuFijWMXX4yOgGkcuVYPnYxIrZzBcJnzGbIlXmeCvPsNfGJqUHhPXlBCvDs6We3Oecmo2azp/KCkHW9LqypOxnL2WRypPHLy4RYhaA0ciSO7eOGp2xOiRnvia4cppfJENH7POTWv9YYPNZ+SnFM8QWsxewOvRsQyDA5phDAXW2sAZX6cMhC6/h5TLljbAzEefMX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+xFs5fQfBEGmP+/R7GOLC1sBORkTZbx+g7ffbRgblg=;
 b=f96cX7CvCRCujf7PQAIT9vWAS2NW116DdnmIZ9rbwryUy6U7tsAHcWznXwTV7jk5kC9J8weBM+F4aRoGms+6iGbEhhTga4NwMzSLyHKzJ5EgmmGKN49NgcynoJU1CIfW43cNmiGnPRpw+lzJ+e4JPNsMoP5cMqR6EH3JNEiBlNQBpApzGoy8zbmCQ5qiICongHVSdutd1QXbD0hDTqaiShsX5ctOPclz1a/vBECktmkYM66oYa56xo6b/v30Vud5CxDgDrthoZ/qsY/oPwfJwVrHKbCtv3+VchtczEmgUsErnFOvA8elkfGBz5AUzjBrBPedeZtErB5yXquSJLes+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+xFs5fQfBEGmP+/R7GOLC1sBORkTZbx+g7ffbRgblg=;
 b=XjzCquRjISe9zq4n+ECdTt9u8L3Q5lhx4RCeCmEt+GcV9ULBpCDv7HhnY0XoLvh1JC0xCooUv3pS2518tZIAyXuYVESHonYIp6keI0vNeK1+mh9KkXTrUVAb0jBwyOY0FM4eae/+HtWIuJDVm4udQzjDrODF89FPLmbBiA4Txjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9328.eurprd04.prod.outlook.com (2603:10a6:102:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:05:41 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:05:39 +0000
Message-ID: <ff2d6543-db76-4045-8fc6-1108c65bb999@cherry.de>
Date: Tue, 13 Jan 2026 13:05:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 11/53] dev-manual/layers.rst: remove obsolete poky
 repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-11-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-11-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: e5178385-81b8-4f64-7548-08de529c118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QTAzZWNnY056MVQxeFczeHR1V0k3YkdoZFR2Q1dNVHFDdXdkbTh3Q1VkeHVL?=
 =?utf-8?B?LzVhajU5KzFPZVgvQm0vRnVkbEFRZ1h1K2xudDhyMnhsZG0zejhXZTNUU3RZ?=
 =?utf-8?B?TGduWk5LL0RoWUREYS85b0h6WTNrVWdjeThlWU45UFVSbmg0SnBHNm9lOGJq?=
 =?utf-8?B?RzUyRzlXck92aHZhTnlyc1NaQzhMazQvN3RSRGhqMDhGSmVkQ1YrcU0raGZS?=
 =?utf-8?B?cm4zMFBsSkcweE1BQlBycUFScW5IalBlQ3dZUHhsTFc3WkU0c0U1dkQzWmxl?=
 =?utf-8?B?bExPaFlhV0YvRk5PeUY4Q0w0ZUdqNVhyL0JwMlBTdGNyMXV5RW9HMTRzK1k5?=
 =?utf-8?B?bk0zeWtGSUZ2ZWFSSjZDTTVwOFBuV2JhRWN0K2ZZQ3gybUpGcDdIaGdZSnBR?=
 =?utf-8?B?dnZqQXlBMi9BYTk2MVBnZDVjbGN5Q2RRR1J0bjErcDdnSEhYbEFOYTJjMHFE?=
 =?utf-8?B?VEJNejhJVmNrZ0t6Y0dZby9wQ2x6ZDJEUkVjNVgzTCszNCtjWlZEVVVmZCtV?=
 =?utf-8?B?cE1DOUY0L1IyNDZ4RnVqV1MyZjg2VE4xdGdPam5YY21yMFBRZkZ6SWhvM1J0?=
 =?utf-8?B?Z2laUmp2RXVGNWN1UzhzWnhnWkpRdVZxTXRoYTZ1MkhoS0wySGpvZTNXZWcw?=
 =?utf-8?B?dmo1MGp0bFNlb0diQTkzUFRhSC9nS3VwSXkyU2UyY0xvS3hyYnlWaStuT1RO?=
 =?utf-8?B?a21ZVlRSTTlZUDYvQ3JtSEZSanlkZFhweGNkRmU5R1Zuc3ZxWlBIWkVMK0RE?=
 =?utf-8?B?SWV0cGxHWWlZMUdFdkxjVlZsREY4OEJ3Tm91M1Njc1JCM1hxbmpUSzBDdWNh?=
 =?utf-8?B?bzJaWUs5cHNTSXBwK2lrWTV1SnFBZXlHOXlMR3hNL2lOYlQzbjRKQmFVTjFk?=
 =?utf-8?B?K3l6MmpzOFFLSmZNa2FMN1o1Rm9PQmI3OEh4OFZ2RVhnOFpMUlhaVlRRL1lY?=
 =?utf-8?B?R095YmwrRzE3U0VkRGNvbmlvOEgwUEFBUzlxNkhjKzlFU29TUEppVkZVNlNB?=
 =?utf-8?B?eFFRS2NJMzh4ak55a2dTamxjck5uTEh0UkF0VVI0bDlZK1FUaFRMWnVnbVl4?=
 =?utf-8?B?bG40Sjh0aWJpUVprbU5BbjB2RzJCRGJRNDEyUk93SUxGUHBDalpnSU9nT1h6?=
 =?utf-8?B?YW93dTA2OXp1N1YxYnA5dDl6R1dOMHJLMjNTUFcwbWFDdHRkQjVWY3lTU0ds?=
 =?utf-8?B?M2V6ZFBmMFNLTFpOL3I2RWZiSUJQRlFoQ0QrTXJvZEdXbXh1RjBHT0dpQTh6?=
 =?utf-8?B?dVp5TjZaNXVwT2JLL0dHVnh3ZU1oeWczMldkSWNSclRhdWdQRXIzaG00T2dz?=
 =?utf-8?B?eE53anlrNFNSVkFWYWtzanJNVUJyVzh6RTlIZ3RtdTJ5aXprWWY4OTNobHZU?=
 =?utf-8?B?N2tMK0N0eGxHVlJFQ3RWd0kxbkhTaW5aQmsvYlZVVVRBWHpRRmtIQy80NmZj?=
 =?utf-8?B?bDgxRHpoMUg2ZytNTzFtZ3R4VzFIYVJGWCt2UE5lZ3FYN05SQnR5VWh2UlJZ?=
 =?utf-8?B?S3ovY2FKU1BocUFTTzhGdmozc01ZNE1rdVZtRDBHOHF1aWU5Y1A0SU1uZitr?=
 =?utf-8?B?bFRYS0lkd3orWlpGYUdJQVo3ZXlIREVMRjhldnU3c1R0VDRwS3F5aFp6Z3dJ?=
 =?utf-8?B?a2NIRjAwUUszbEkxZWFzRlZ4eVFYRW9zQld2SjBHenVDTHVIT0M3eUo1bEJa?=
 =?utf-8?B?QVRWRGZTbU00ZG9VUlUvY2dvOG9mVVMxUnJEMCtEc2ZpREFsT1d4SnlBTjRU?=
 =?utf-8?B?UFlCNElYdElxMklXcFd2YXhrTTRNdCtzekw5Vk4vcmxCS1ZSd3R4Mi8rbUcw?=
 =?utf-8?B?WHJaL21Hcy9iTmcreWJ6aXNKc1F2dGlvMFNJREdKaU5OczR4TUhZWHdPU3cr?=
 =?utf-8?B?L2JhYnpzYnNJd1JYcFdvd1NtcG45a1hzaUlHb1VrMmJHdkROczRmUmo3a0U3?=
 =?utf-8?Q?pScFB7Z6BUmkLA13u4rgT8WlbN09RsdN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjNTWnFoMmJKNm54MkVGbkRiU0Mxc1lXWkZJeFYyRkFiK2hmRU16V2VHNjhz?=
 =?utf-8?B?LzBwNEtXQnBReG9pK3ZDUXY5SHZoOGwraTRXTFpCS2N4OTRCUnpuL2dFaDZp?=
 =?utf-8?B?SFI4UjdTVU04OGpmZzBPemRaTEFxSlk5K2VOWmtLZmpaUzhTV3A2ZzJydWVM?=
 =?utf-8?B?Tm9WWkpZamFCUVNHengyUTJQbnpRaUxKSklCS0p5Qm1wcldBMVI4Um5LcThP?=
 =?utf-8?B?c081TWJRQnFvNzdjdUJ5N0hRMHRVdTVLRmN3czhTbjZ6SjFlT1AzN2k1cncx?=
 =?utf-8?B?UnFFazNlV1NIVllVYjBCNUpiLzhLUFVCbHpSWW5qeXpwVkppcUZqNlByK1Z1?=
 =?utf-8?B?ZTVRS1BOZnRiMGNPT212WGNkRmQ5ZDdKSmZuOFZVN0lONktkbjVWTm4xTzdn?=
 =?utf-8?B?UlRrdG0rKzNrS1B6cmVacWlYV2FiNXRyNElmd3IwMHVnWkJHQzE1b2ZhMkRx?=
 =?utf-8?B?TTRMTThCMy8yc3dCQWVxZFBtWjZDNTRiWXJEaHVwWG42RkFMY050ay9GUlVn?=
 =?utf-8?B?OXZvUTBHeldmbkFRTnZ3L3hSdkFjcmo3dmJPNHRFQVI5elRuZzBpd1d5SVdM?=
 =?utf-8?B?MkM1SUZNbU1rSVcreHU0NVJiMm8yV0JTcGJKQ3VYRmovRWYxKzRqcHlJNk0y?=
 =?utf-8?B?cWd0elpzSjZSZ1BOOEZDSmRISWM4KzA5eTNsTTI2T21vUUd4L1R0dnQvRXRh?=
 =?utf-8?B?NjRaTDh5dDNMcHp6dFlNMjVMWHZITWI3d3hHeXllellaYzFuSGRjVmJJaW9k?=
 =?utf-8?B?YzV6S2htZDVyRzdmWWpFd3ZJN0YreVNidVVZNUlGZzZ1aG8rRGoxSHpWNGRB?=
 =?utf-8?B?RjFJUS94SG5mOUo4NG1hMzl1SnE0NDcwdzYrL2thb3pLdXBSSnczV083bnZO?=
 =?utf-8?B?VGNmVERkOWprWElKSWsxcUVVRzMrMWFLTVhjeGdOSmNEaitEVERDM1RwVnFK?=
 =?utf-8?B?bndmeXhkUm9QNFFSTUhjNzNYN1k3UlFzcFh2bEt4M3pRRERYV0RuRHkyM0ZC?=
 =?utf-8?B?V1Njb1JRWWlBR3lodnNYUldaR0Fpd1pmYTNBYUsvTy9mTzRtUExQb1pQazBP?=
 =?utf-8?B?NmNjYkR6a0U0cHJxREVNMlRIOVRBYmN5aGFidmU3dTN2VlBiNmJiYWV2NFhU?=
 =?utf-8?B?ejEwWmR0Nys0V2JIb1VLdldDWFlERVFNb3FSd3llZlVydzdaVzRjb0dBdEJW?=
 =?utf-8?B?MjN6M0U2ZVFockcxRGVncm92VmZzM3FzZXFmTkhKVlU1WUtUbkNGdGVYbjFm?=
 =?utf-8?B?OXRiL29tbk1VWDNTWTlXNzFKaldENXlNcmtPTjJSQWdHVVh5Q3hTR2tZNTRU?=
 =?utf-8?B?U1IxZGI5SVgxVlBXQ2twRFU2VTZlOVUxc1BBalR6cE1STUgvVWZkbC9URXdl?=
 =?utf-8?B?RzIxNHRrWG9uSzVxTnlRZkxKaStyNks4QU9NWXQxeDJ3cEJkS3FBQm1iTjVI?=
 =?utf-8?B?MmJEMW5RdEZFQnFua3RTVHlmbE5WQTdJaEhoQVkrYlF4TXUvN3BwRnhmR2RF?=
 =?utf-8?B?SmxUS2hxWXArc1NTQ1hiK3A4TUM4YitieDZ0OUsxaGZTUzd3bCtxOHNveHpT?=
 =?utf-8?B?cFVWYXdIa2hsMDE4ZGF2TFRObDNQWkdBT3FESk00UXVSTmNzUnJpUkVyeTNk?=
 =?utf-8?B?VWxaQUFzb1NqRnZZU2kwUDR5S3VSdHhLenc1cEI0Q29oQ3hOTU5kNjR6c1hG?=
 =?utf-8?B?YUhFS0NKeDJ4M29ZdVh3MXVSb3I2RHFOYUhTVFFacytQS2ptRlpqRjBDQkwy?=
 =?utf-8?B?VlhwYmJLNnZYSzNSTzYxTE54M0tYNy93MGpoOTZzSElKMzF6VU1uOXgwS1E1?=
 =?utf-8?B?d0ZPay9SeWtUOHorRGhwU3llZ3d1eXplR0hiUDdmcStEeHVpT1ByVWlJaStP?=
 =?utf-8?B?RVBVbVRGbm5VdVh5NkxHNUhObmV3Y2p0dnFlQlVWUWdBVVpaajZXV0lnSzlB?=
 =?utf-8?B?M3FWYW9ZME5yVWZIT0l1ZC9zNk5kTERZQ2tmSUdSbUM1aVQ4Wm1SbXdmSTlS?=
 =?utf-8?B?VXFpQ29ESWZQMkUxWk1MK3BWTUF1dkdWR1JuQlEvejJyVW15d3A1QTR5eDRC?=
 =?utf-8?B?eERCbmQvbEhJSWJHSWozSkVwWld6R2ROOW16VjFlYW9XMExPK2E5YXZZMkxx?=
 =?utf-8?B?Ni9UM3NzTnRENFZubnRpQmhROUNCeXpJYkh3VDhvWDV2QzhUKysvNUpnZE5R?=
 =?utf-8?B?cXViMVJDdXRrUTc0K1BqYmtlNEZGZm8vZGVhZmhUSnNvVi9hNUp1Mi9UZ1hh?=
 =?utf-8?B?amk5UThMbWc1M3BDamlEQ0lBNGJEQld6MnFJMjNWZXNwM1NncmlTRmVRanlx?=
 =?utf-8?B?ZGFzcFMwVWlNblhsQjc2TGxzc3FMaG84SzR4VmcwWnR6TlRTbWNaUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e5178385-81b8-4f64-7548-08de529c118c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:05:39.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7Y7LA1Cm2k4BIhnEd64JRFWbUJtn/HJZ85mjsTiv8GnM/NT66MEdwm5kIvqAnBHnSACDATdmNbkIXcoLSllIfvWPTiaxIZcSrNJV1VxyoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9328
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 12:05:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8492

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The first section of the layers document shows how to manually create a
> layer step-by-step, and references bitbake-layers create-layer at the
> end. Change the approach of this section to show how to use the
> bitbake-layers create-layer command to create a layer, and then explain
> how a layer is organized and configured. This avoids repetition, and we
> should encourage users to use pre-built tools when they can do things in
> a less error-prone way.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/brief-yoctoprojectqs/index.rst       |   2 +-
>   documentation/bsp-guide/bsp.rst                    |   2 +-
>   documentation/dev-manual/custom-distribution.rst   |   2 +-
>   documentation/dev-manual/layers.rst                | 266 +++++++--------------
>   documentation/kernel-dev/common.rst                |   6 +-
>   .../transitioning-to-a-custom-environment.rst      |   3 +-
>   6 files changed, 99 insertions(+), 182 deletions(-)
> 
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 84eb63c937..903dc242eb 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -452,7 +452,7 @@ The following commands run the tool to create a layer named
>   
>   For more information
>   on layers and how to create them, see the
> -:ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`
> +:ref:`dev-manual/layers:Creating Your Own Layer`
>   section in the Yocto Project Development Tasks Manual.
>   
>   Where To Go Next
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 2a451b2139..8e332aec07 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -1154,7 +1154,7 @@ Use these steps to create a BSP layer:
>      ``create-layer`` subcommand to create a new general layer. For
>      instructions on how to create a general layer using the
>      ``bitbake-layers`` script, see the
> -   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
> +   ":ref:`dev-manual/layers:Creating Your Own Layer`"
>      section in the Yocto Project Development Tasks Manual.
>   
>   -  *Create a Layer Configuration File:* Every layer needs a layer
> diff --git a/documentation/dev-manual/custom-distribution.rst b/documentation/dev-manual/custom-distribution.rst
> index 0bc386d606..55854f00ea 100644
> --- a/documentation/dev-manual/custom-distribution.rst
> +++ b/documentation/dev-manual/custom-distribution.rst
> @@ -27,7 +27,7 @@ layer. The following steps provide some more detail:
>      just placing configurations in a ``local.conf`` configuration file
>      makes it easier to reproduce the same build configuration when using
>      multiple build machines. See the
> -   ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
> +   ":ref:`dev-manual/layers:Creating Your Own Layer`"
>      section for information on how to quickly set up a layer.
>   
>   -  *Create the distribution configuration file:* The distribution
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 667708e32b..15d54cc021 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -14,18 +14,6 @@ section in the Yocto Project Overview and Concepts Manual.
>   Creating Your Own Layer
>   =======================
>   
> -.. note::
> -
> -   It is very easy to create your own layers to use with the OpenEmbedded
> -   build system, as the Yocto Project ships with tools that speed up creating
> -   layers. This section describes the steps you perform by hand to create
> -   layers so that you can better understand them. For information about the
> -   layer-creation tools, see the
> -   ":ref:`bsp-guide/bsp:creating a new bsp layer using the \`\`bitbake-layers\`\` script`"
> -   section in the Yocto Project Board Support Package (BSP) Developer's
> -   Guide and the ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`"
> -   section further down in this manual.
> -
>   Follow these general steps to create your layer without using tools:
>   
>   #. *Check Existing Layers:* Before creating a new layer, you should be
> @@ -35,10 +23,23 @@ Follow these general steps to create your layer without using tools:
>      the Yocto Project. You could find a layer that is identical or close
>      to what you need.
>   
> -#. *Create a Directory:* Create the directory for your layer. When you
> -   create the layer, be sure to create the directory in an area not
> -   associated with the Yocto Project :term:`Source Directory`
> -   (e.g. the cloned ``poky`` repository).
> +   .. note::
> +
> +      For information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
> +      section in the Yocto Project Board Specific (BSP) Developer's Guide.
> +
> +#. *Create a new Layer:* Create the directory for your layer. The
> +   ``bitbake-layers`` script with the ``create-layer`` subcommand simplifies
> +   creating a new general layer. Place it next to the other layers in your
> +   :term:`Source Directory`.
> +
> +   In its simplest form, you can use the following command form to create a
> +   layer. The command creates a layer whose name corresponds to
> +   "your_layer_name" in the current directory:
> +

suggestion:

"""
In its simplest form, you can use the following command to create a 
layer named "your_layer_name" in the current directory.
"""

> +   .. code-block:: console
> +
> +      $ bitbake-layers create-layer your_layer_name
>   
>      While not strictly required, prepend the name of the directory with
>      the string "meta-". For example::
> @@ -58,88 +59,84 @@ Follow these general steps to create your layer without using tools:
>      "meta-" string are appended to several variables used in the
>      configuration.
>   
> -#. *Create a Layer Configuration File:* Inside your new layer folder,
> -   you need to create a ``conf/layer.conf`` file. It is easiest to take
> -   an existing layer configuration file and copy that to your layer's
> -   ``conf`` directory and then modify the file as needed.
> -
> -   The ``meta-yocto-bsp/conf/layer.conf`` file in the Yocto Project
> -   :yocto_git:`Source Repositories </poky/tree/meta-yocto-bsp/conf>`
> -   demonstrates the required syntax. For your layer, you need to replace
> -   "yoctobsp" with a unique identifier for your layer (e.g. "machinexyz"
> -   for a layer named "meta-machinexyz")::
> -
> -      # We have a conf and classes directory, add to BBPATH
> -      BBPATH .= ":${LAYERDIR}"
> -
> -      # We have recipes-* directories, add to BBFILES
> -      BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
> -                  ${LAYERDIR}/recipes-*/*/*.bbappend"
> -
> -      BBFILE_COLLECTIONS += "yoctobsp"
> -      BBFILE_PATTERN_yoctobsp = "^${LAYERDIR}/"
> -      BBFILE_PRIORITY_yoctobsp = "5"
> -      LAYERVERSION_yoctobsp = "4"
> -      LAYERSERIES_COMPAT_yoctobsp = "walnascar"
> -
> -   Here is an explanation of the layer configuration file:
> -
> -   -  :term:`BBPATH`: Adds the layer's
> -      root directory to BitBake's search path. Through the use of the
> -      :term:`BBPATH` variable, BitBake locates class files (``.bbclass``),
> -      configuration files, and files that are included with ``include``
> -      and ``require`` statements. For these cases, BitBake uses the
> -      first file that matches the name found in :term:`BBPATH`. This is
> -      similar to the way the ``PATH`` variable is used for binaries. It
> -      is recommended, therefore, that you use unique class and
> -      configuration filenames in your custom layer.
> -
> -   -  :term:`BBFILES`: Defines the
> -      location for all recipes in the layer.
> -
> -   -  :term:`BBFILE_COLLECTIONS`:
> -      Establishes the current layer through a unique identifier that is
> -      used throughout the OpenEmbedded build system to refer to the
> -      layer. In this example, the identifier "yoctobsp" is the
> -      representation for the container layer named "meta-yocto-bsp".
> -
> -   -  :term:`BBFILE_PATTERN`:
> -      Expands immediately during parsing to provide the directory of the
> -      layer.
> -
> -   -  :term:`BBFILE_PRIORITY`:
> -      Establishes a priority to use for recipes in the layer when the
> -      OpenEmbedded build finds recipes of the same name in different
> -      layers.
> -
> -   -  :term:`LAYERVERSION`:
> -      Establishes a version number for the layer. You can use this
> -      version number to specify this exact version of the layer as a
> -      dependency when using the
> -      :term:`LAYERDEPENDS`
> -      variable.
> -
> -   -  :term:`LAYERDEPENDS`:
> -      Lists all layers on which this layer depends (if any).
> -
> -   -  :term:`LAYERSERIES_COMPAT`:
> -      Lists the :yocto_home:`Yocto Project releases </development/releases/>`
> -      for which the current version is compatible. This variable is a good
> -      way to indicate if your particular layer is current.
> +   As an example, the following command creates a layer named ``meta-scottrif``
> +   in your home directory:
>   
> +   .. code-block:: console
> +
> +      $ bitbake-layers create-layer meta-scottrif
> +      NOTE: Starting bitbake server...
> +      Add your new layer with 'bitbake-layers add-layer meta-scottrif'
> +
> +   In order to use a layer with the OpenEmbedded build system, you

:term:`OpenEmbedded Build System`

> +   need to add the layer to your ``bblayers.conf`` configuration
> +   file. See the ":ref:`dev-manual/layers:adding a layer using the
> +   \`\`bitbake-layers\`\` script`" section for more information.
> +

Maybe hint at bitbake-layers add-layer meta-scottrif as returned by the 
command just above?

> +   The default mode of the script's operation with this subcommand is to
> +   create a layer with the following:
> +
> +   -  A ``conf/layer.conf`` configuration file with default definitions.
> +
> +      Here is an explanation of the layer configuration file:

"of the typical content of the layer configuration file"?

> +
> +      -  :term:`BBPATH`: Adds the layer's root directory to BitBake's search
> +         path. Through the use of the :term:`BBPATH` variable, BitBake locates
> +         class files (``.bbclass``), configuration files, and files that are
> +         included with ``include`` and ``require`` statements. For these cases,

Please use cross-references for include and require statements (also, 
include_all applies here as well).

> +         BitBake uses the first file that matches the name found in
> +         :term:`BBPATH`. This is similar to the way the ``PATH`` variable is
> +         used for binaries. It is recommended, therefore, that you use unique
> +         class and configuration filenames in your custom layer.
> +

Please point at the bitbake documentation for this where we have nice 
examples of how to locate an include'd/require'd/include_all'd file.

> +      -  :term:`BBFILES`: Defines the location for all recipes in the layer.
> +
> +      -  :term:`BBFILE_COLLECTIONS`: Establishes the current layer through a
> +         unique identifier that is used throughout the OpenEmbedded build system

:term:`OpenEmbedded Build System`

> +         to refer to the layer. In this example, the identifier "yoctobsp" is
> +         the representation for the container layer named "meta-yocto-bsp".
> +

Should we specify that this name is then used by other layers when 
specifying their dependencies via :term:`LAYERDEPENDS`?

> +      -  :term:`BBFILE_PATTERN`: Expands immediately during parsing to provide
> +         the directory of the layer.
> +

I think we need to explain this better (not necessarily in this patch) 
as it's the first time I pay attention to it. Is this why we can use 
${LAYERDIR} in BBFILES and it points to the proper absolute paths in the 
variable afterwards?

> +      -  :term:`BBFILE_PRIORITY`: Establishes a priority to use for recipes in
> +         the layer when the OpenEmbedded build finds recipes of the same name in

:term:`OpenEmbedded Build System` (missing "system" if you don't want to 
be using the cross-reference).

> +         different layers.
> +
> +      -  :term:`LAYERVERSION`: Establishes a version number for the layer. You
> +         can use this version number to specify this exact version of the layer
> +         as a dependency when using the :term:`LAYERDEPENDS` variable.
> +
> +      -  :term:`LAYERDEPENDS`: Lists all layers on which this layer depends (if
> +         any).
> +

Please specify this will try to find a layer whose BBFILE_COLLECTIONS 
contains this string (I believe that is the logic, but I'm not sure). 
E.g. you would depend on yoctobsp and not meta-yocto-bsp if you wanted 
to depend on meta-yocto-bsp?

> +      -  :term:`LAYERSERIES_COMPAT`: Lists the :yocto_home:`Yocto Project
> +         releases </development/releases/>` for which the current version is
> +         compatible. This variable is a good way to indicate if your particular
> +         layer is current.
> +

Specify that this is the release *names* (all lowercase) and not the 
release version?

> +   -  A ``recipes-example`` subdirectory that contains a further
> +      subdirectory named ``example``, which contains an ``example.bb``
> +      recipe file.
> +
> +   -  A ``COPYING.MIT``, which is the license statement for the layer. The
> +      script assumes you want to use the MIT license, which is typical for
> +      most layers, for the contents of the layer itself.
> +
> +   -  A ``README`` file, which is a file describing the contents of your
> +      new layer.
>   
> -   .. note::
>   
> -      A layer does not have to contain only recipes ``.bb`` or append files
> -      ``.bbappend``. Generally, developers create layers using
> -      ``bitbake-layers create-layer``.
> -      See ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`",
> -      explaining how the ``layer.conf`` file is created from a template located in
> -      ``meta/lib/bblayers/templates/layer.conf``.
> -      In fact, none of the variables set in ``layer.conf`` are mandatory,
> -      except when :term:`BBFILE_COLLECTIONS` is present. In this case
> -      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` have to be
> -      defined too.
> +   If you want to set the priority of the layer to other than the default value
> +   of "6", you can either use the ``--priority`` option or you can edit the
> +   :term:`BBFILE_PRIORITY` value in the ``conf/layer.conf`` after the script
> +   creates it. Furthermore, if you want to give the example recipe file some
> +   name other than the default, you can use the ``--example-recipe-name``
> +   option.
> +
> +   The easiest way to see how the ``bitbake-layers create-layer`` command
> +   works is to experiment with the script. You can also read the usage
> +   information by running ``bitbake-layers --help``.
>   

``bitbake-layers create-layer --help`` rather no?

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944E3CC6B31
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:22:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11111.1775118146171327548
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aQkPEtfj;
 spf=pass (domain: cherry.de, ip: 52.101.84.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/dRxY6hDHTl4n/yNXzCLLQhrIoObB1EIAeZgtDZJrDUzaPxQjQ6XzNDX1kdx2a9T6piNdaY8MvTP3pF45+T9PtXbb+VMFVPM1vRBiMwG65ChpnI6iXzQ3RO9idU6deDBXuNFZEmIsUdkYeO4OOX5/MlIDXdunrSbD1eGYeStCMjU+Bx8xj4aISfPn2jtEnUW+2di7GpHj6NTLlQNsUz99bzjNGDPdaABI9NvkeucQpgUQ/0ZG+8vpGlxk+/rxclJMV5gKpzMvKcE/q8LJFbHy99ajecE/mU9OQ6rrl7Ih3t0irNIuzp3lS6GNYyklBAbJXeb7VinOfrm+DdamHHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z3nVFbXP1Ms5NwCJNOZutRjVoFuuwrFJdo0hxn7NZw=;
 b=UpLY5SMMzn3s6m4rBSf9e/ISiyvvHH5i8JO2qGFMW0hWnfhFzu1Clgox8XzhxmDUYgwNGJYWmQ4w8tQdGC3GsVyYSlNTGhkCXPOpInE7YAQxkB6NIz4hDn4aHvzuiDTaKcrOZulwPfGrLLODFEV9e0RXFNnVPSrFY/jweguPIB8Zy8Ex+eGkYwB3ZDR8EcY/r2fG5kKQ0bLq/gDlcllRKtNneoCys6pR6d11MKA7AR7+/6DKQSVI5TucrRtnReTcZMgqZLJ374MDjQPQBSWw5RVsrHN7+Zij4J0/cO5xJ8hM+KcakG/zeORUj326fOI4y2MW5IvbBJ3CZD7IUv/8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z3nVFbXP1Ms5NwCJNOZutRjVoFuuwrFJdo0hxn7NZw=;
 b=aQkPEtfjXSvF2N9jk+som20qFEZX5iPLwR0N67Ur6ulUd34rHxObjhyvP6+4kVM0/SoYL2jTMTnSYn73m/FK/wZfcYJP5BMVu2EL09Bp8jZCN9zaMytEFl9LiUBH35ec+fl4hXwi9o1mPdZdmcZOh1Gvi1aV42kcvN+y0uVg+/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by VI0PR04MB12005.eurprd04.prod.outlook.com (2603:10a6:800:310::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 08:22:20 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:22:20 +0000
Message-ID: <9955c1bf-c6ea-4e6b-aa68-f0a6df16ac95@cherry.de>
Date: Thu, 2 Apr 2026 10:22:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] set_versions.py: skip laverne branch for
 closest branch
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
 <20260402-set-versions-fixes-v1-1-0609a8747b96@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260402-set-versions-fixes-v1-1-0609a8747b96@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|VI0PR04MB12005:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c2fdde-bfb1-46d9-0547-08de9090f56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4n9zksxjVwrzOwVaucqy483ca4vGcQikd+kt4vyNaHrLqbAeFjLQs4ckfqqEo15fqX8ryLpu1OwDVdhRPNcKeoxXJH5+rodiffXEzGr0xdVZnl70GbUaCCZDM3bCAa9NT2VBICWt0u9CQOuqdLX51FNkeLi4gsijBTZ7OpdeVlno6N4ZeJO7byfo+NqJ4E+Z+Cejy5YfIl1tr/e27oemSZMS4H2y3qanf/1Jn4wZpgFCgDGWmaTIfu/iko2dRY3KS8rAIFs3twbewfNUYfJ+B99yw5tUlnbba4/MJeN2j7sm6YdPajRjj7TRU//jTJhpJnH+OpkGuU128Y9MglkYDpWaZPx5kxc71jSyWIY3blg6k2mFISzNAgKqMbK5htfctgEm5oPrTeK0TN69EhTluW7tyZozzY11o6J7aLuL+tAse14vfPWTw66dxjV3atWV/eIpHEedtObpVQ5jguF3EjnWa7Ur+pZ3GjIeqfNkAKYDVpmOVt6JdTXeUXjzMqSI+r2dV8AP7AErqX8rcyFXDZz7pYGjqbODWvWCUu7Hd51h7erClOSXJ73m4xlc0N6bpfpetBbjfF8ysxg1MtmxG5sjodpGFrS6Xq6gXINmhwS4ErnqMBuXDX8MfeScOTZrEhtwO2NUwCEmJza+anZX2aFO+wSjUpHUNkxNEv/20tzU056LwsZnZtGNSVjDZLbSDVYwQ0rjYlaC+suUXEDBrVQ/JhKvuOIKHWkgu0l/CPI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1M2ZHVDNXB4WEhZQ2tVZVpLTkxTZDFYdDJCTGpqcDhMSS9VbjZaTEZjc3JW?=
 =?utf-8?B?R2dxbG9WQkdhNDJaVXBIS0FXamdUSjJQMFoyWTlvZ0hGM3lPblp4clJUZDFp?=
 =?utf-8?B?YW1KbmFrODFaSmcybXV4WkVhalNsdC9tdDIzWDVpWktrN0xDcTdFQ2t0TnFw?=
 =?utf-8?B?TlNhWmI4NDY4NldvRXFjMVVBaTRvWk9HZnphTkRDVlNoZXI1ZkpzWDRTZCt0?=
 =?utf-8?B?SnFmdzFUbHNCM3dqcnVzdGJDaGs0dFk4Y1VuRjMxcUt4SXV0N3h3cmpsZVhS?=
 =?utf-8?B?dTZNUFlQUktsZE5RNC80TDdDR0o2cVBRM1MyUnhFUXB0YURUMlFIY09CNGVo?=
 =?utf-8?B?VUx5RDB5ZWJHV3BabklkZUhrQms0OGdHV2FDM1pFQ0g1d3JVM1JqclNjZDA3?=
 =?utf-8?B?RFcyekNLQllJMDg1emxxSHdvOEw5SXpkUWI5bXA0K3U0UGJWQWdaOWVqQkZ2?=
 =?utf-8?B?V2dhdE0xK0NXNnY3am0yWjdmQ3ZYTEhiZVFScnVNV002ZDdsZHNJWk9yYWNR?=
 =?utf-8?B?VTV5RE1zNUJUbjkzMllKa3kzeFdJUk40MWlUZ3ZORHF5eXN6YmEwUE1CVWx6?=
 =?utf-8?B?Y1ZReUxVTXJiSktmQXJITEkyamZDUjBlSldQVS9EZWpkUmQrdHN6U1dlZFFs?=
 =?utf-8?B?OUVnbk9TSUlSV29yTEk1bUpFMllYUzN4ejZhSnl3M2tzZ1BPRlY4Uk82Tm10?=
 =?utf-8?B?QkEyL1pwUHRPMFlUM2FSYXNaT25DV0t1QTYxUzQ1YmlKT3NrOFhnS3lkZXJy?=
 =?utf-8?B?VVN3ZXM0VCtwWk1YMHh2VWRRZ2MzZ2E2WG1Va0xsaFhzNTlRQzdiUGNoeWRS?=
 =?utf-8?B?K1huang1M09uUUN1WDZrRjl4VzBJZEJNWThnSWx5dFJyTGxUQVdGRFhTNWF2?=
 =?utf-8?B?OWwzbWdsOCtiS0Z5VUtnKzFsNURtMFl2Yk5RcFQvSFMvMUR1RVd0STcvOFF1?=
 =?utf-8?B?V010WVczVVZzUlRnSnNnWUpuckh1cDNtMVU1VFJCZHNVbGV2V2V1TDlsRmMy?=
 =?utf-8?B?RFl3MkwvaWZrLzdJNzdnbHVLcXdYVURMc0hpejNCbFJjYXpKMlMzeGk1b2tx?=
 =?utf-8?B?bUlRWDJ0ZGM3d0J2VTY4M3REZVh1YWZDazZ0UFFTbGYzcmZxcmhVMWY4MlBP?=
 =?utf-8?B?d1h4YUI4OGp6cjhBbnRqQXNvQ0VBREdFcm9XT0E1TzlUSSt6VVp5MkhHYVU4?=
 =?utf-8?B?K2RhaUdnL2xTQzc3RFFCRDMxOUZPbWFWc1FPdGxMUDZPVkxRZ1ZJSWxQVy8z?=
 =?utf-8?B?YTN1NHdkcXFNbnEyZzZQK2hidjdNOXpjUVcxS0RvcDEwMjc0UEZEcXZkanRx?=
 =?utf-8?B?RjUwSE9QTTlaOHh0ZlFYdkdDRERTY3hJWHMxVStaVHo4NVNhOHNTSnluNkFo?=
 =?utf-8?B?STlYcFRGVnVTYmJaWVF1M21BcEVsVEpLZDhHVUNtQlZPSDZERG1halBOUGVZ?=
 =?utf-8?B?TGFmNlpuTSs5WUkyM3ZXUW16SlJrR0I1LzdaekN0RTdvMkk0SVU4bWxCUDkv?=
 =?utf-8?B?UER3U1hkOTkrOEI3bjBIQjJIOU1UNi85VFlSNVJSSEZrMW9ncVpRY3RXanRy?=
 =?utf-8?B?ZG9JUTM0aGx4ZWRtZkM1bTFWWDZuazlZeXlTaXl6cXFxL0tqRGNSS0tQQ0l6?=
 =?utf-8?B?ZkF5dEJmZDhqalFpWnVXcEU5ZFN4UjVBZExaQWNyNDJFVThUT0gwanpqYzZF?=
 =?utf-8?B?Q2I3VGNlV1pEMXc2c2FLOWc1dzBXT0JTS1JaTkNOQS9RWjhCcU9CVzhUd0xy?=
 =?utf-8?B?TnI0VVp3UkFlT0Jyb3dQQ0NJMzJ2MXhOQmJnaFpBVlMzZlNEb1ZDR3VzQjBM?=
 =?utf-8?B?RzU4c1lSQmxqMGhMMEk4WFhHR2ZVY1IwWllVYnA4MXRpZ3NQL0pQLytiR1NW?=
 =?utf-8?B?Lzk3NnlGdVN0ZzdDNlIreER0UERuSys5dnpOV0VMQnM2VXp0N252cE5zWlpL?=
 =?utf-8?B?K2RDeWNkQ0Vvak5hV0t0SXozblZINHRJdE0xeFdiV2lqYlVTb1dPQUlzOUho?=
 =?utf-8?B?QmdteFl6WWp2MWZZY2xvSnRNdWNVbEQxRkNtQjNuTHBKVHVneW5ySzIxeitU?=
 =?utf-8?B?Wm9PaVRwTUlXWGx0ZE0ya0ZXQlAxTW9FaHNpQTlta1VsK0kwWkh4MCtRRVFp?=
 =?utf-8?B?MUVla0VMWlBaT0xPUXh6dFhtaTBDQ2x4SWpHRU1LdjFVYUo0cnZXWmhad2Nn?=
 =?utf-8?B?OWRBc29yZUZBODY1MFdUenZoWmJEcXhEUGszNXQ4T0lOWVE2T2NES3Z3VjdU?=
 =?utf-8?B?K0lnWTlPQnQ1TGdaQ25XdFBsY09YVkF6TDh6QjN4ZU9odS9yVGtzdnZjRTF2?=
 =?utf-8?B?VU1MQmtyYzlySElMb0VlNldaMG9CQkdBcnIrc1NuaUY3Z09JV2owVWdDNzFM?=
 =?utf-8?Q?6m8QhS0e6T2NROzU9h5SW3tszQCrlK4T5vfYN?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c2fdde-bfb1-46d9-0547-08de9090f56e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:22:20.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNcgrcd01fOOG6r0uxwwIvuM8thLFDrGWF1DzTL5xxGdirEgE07l+3+TNTwGszgs2CWotICD2r5Ypxk0SghEDsqkGI1lkL4WrCOfNo07yTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12005
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9161

Hi Antonin,

On 4/2/26 10:13 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The laverne branch was created but never branched off, which breaks the
> algorithm trying to determine the closest branch as it always gets count
> 0. Skip this branch as it is old and we'll never branch off of it now.
> 
> This fixes the following issue:
> 
> Branch laverne has count 0
> Nearest release branch estimated to be laverne
> Traceback (most recent call last):
>    File "/data/yoctoproject/ws/repos/yocto-docs/documentation/./set_versions.py", line 167, in <module>
>      bitbakeversion = bitbake_mapping[ourseries]
>                       ~~~~~~~~~~~~~~~^^^^^^^^^^^
> KeyError: 'laverne'
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/set_versions.py | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index 29638b324..465204998 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -142,6 +142,11 @@ if ourversion is None:
>               result = subprocess.run(["git", "log", "--format=oneline", "HEAD..origin/" + b],
>                                       stdout=subprocess.PIPE, stderr=subprocess.PIPE,
>                                       universal_newlines=True)
> +            # The laverne branch was created but never branched off, which
> +            # breaks this algorithm as this always gets count 0. Skip this
> +            # branch as it is old and we'll never branch off of it now.
> +            if b == "laverne":
> +                continue

Why run the command if we're gonna skip the loop regardless of the 
result of the command? Just do the continue before the subprocess.run?

Cheers,
Quentin


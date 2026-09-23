Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14DDC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 11:02:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4447.1790161331920931723
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 04:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M/DaY3L3;
 spf=pass (domain: cherry.de, ip: 52.101.65.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSTyLwwEwuPAUnRZUjvK2z9uitsDWFOqQgPJdQefyzrY/SJKwFeh0+wSez0g9emYGtqwoI1lp9Bwifc028FP/53NdvjEb66eFvLq5Pz3LycIkU2ckmHWJVDEyVBptkESYtMJxrhvOVFfubZ47GV+M7GDVYBMXopWLCldqXkb0YWjLasDXtp1WWmnZGaErUsrPgCrBtExq3x0LpGvkZwEO5GoQ/CKonC1unzZ1bNhnPVu/ELq/H6QoVs9olQLm+BROiqjCAd/WWomOu2VJCWeE3Oesvs+CS4nFZi1dk4XdzKZUBK9ON3J3zz3Oy3f/p/zNH6VUiZ+Wd7pFfRuVoGNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jo194h7W24/PmaLxHYxFH0otaWbAtEf1FR6zXj4/mk=;
 b=R3XrX6nik+tY/MTcD9+xUCYdWmSd+SPVucvKUAlFP0gNDmoP++Bis9d1ra1vfWMrXAT1y4/fG2YOD2o4kRQE+ncPNdt5y7vOq+GBK5E/otpDLay6+7lDhABHi5/in/i1Ow3rZMr5UlwMPWGxlq3CWPQKAUeI+tviel4sNU6NtmV3zQawUJQDi4M4MP4yTwuxbiKxVqjVoCp+x4DiMuViJboAY4c9aCswL1KtT02/OT44BPuVgAqgcwG5biM5XC2npnlJsikhxTCXym6pjyB6WowuHpmQEsHQYqPU5EEzb5IqB02Xh0RGkeBaWZX+Go3aT18yv3cFJfWRAyu33UqbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jo194h7W24/PmaLxHYxFH0otaWbAtEf1FR6zXj4/mk=;
 b=M/DaY3L3PaE96Gnev5ZwKuWrrKuoz3ELDjcIFue0IM4W3F+N97vqMqobezP8K19yof4kimpVcr7eA+tauTSed/gIr7zS+Q/JS8km83XJiVn7XM1fz1IYkFuFOtq1TkNeJpCJN4Os/HOQ5oX2tgettq3jCzQgzTeE7D7dwapD+kE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 11:02:06 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:02:06 +0000
Message-ID: <8c5111cf-4018-4e01-9043-b4c567091d75@cherry.de>
Date: Wed, 23 Sep 2026 13:02:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 6/8] docs: remove real accounts from the
 examples
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-7-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260922183249.2433345-7-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0078.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:352::18) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DB9PR04MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: b57539ec-319f-4299-a527-08df19621afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|3023799007|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vCmnP9nDlKZblmITXA0teNYKZg2gynl/53Glk+soy38crtNronELPm8O254P/PuO51rfu/8hL6PJgGj3oI1ofhq6jryfOpOKqYs6uRcshSEsBZFaYaHrEHTN6l3GMPksMIm29VXBybZ1P3eUILmYUtCY4FVF/cedap3wYjV3oLyzb5qSsMK7ODYMrJcfJsLyeqrNY2eguuiLsGpU4UmTejssMiFZJc0GyT5ekL6ZMqsVHQPKRdqnWIFGv7Sd/Joh2007SyD4VQVXDCbeXau5S3RfjRmAd+cNk1dGiNRJk9yJDY63gQwKYD1z8g0OAB9hgsbhkDmd9fMU0LSnzxyoNoE+CEseQhkdV6Ql9wHvcOS6hkxxKr2IwJ8R3HL6iE1yyxO86TayQOsecYvGl9TSeG8xUSJkVZYAQRiUVEojBVC3Y6vBcmqKLRGC/sA3cnkdWIn4CcO0QOV1nxstZf6mb0N8aJiBQ5tRt0TCMZlg74tVu98GyQktDCXPZmT3nZZ28S3nm+V6VhaCQQ9EtOJ+rFcHDs+IAvImU0PEGdKpQkr6jwJGmPeHcAAT93YYiAB7xaxCV38eedlZwvYZCRGIjiNzmWz8GBAWoTqDucmNUA0zunR0bZEcclRN1pWby0yq9eKTUcPk9wWJiGKl0rp8iFQOo4D5I86krgxMl0DYags=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmFCWTlYd3ZIS09HM0xBKzRERFFFZDJUMVVnWFg2bXFXWGRnbEFLb1dQMFJi?=
 =?utf-8?B?Zm9SNmNmVldWZ0pvVXFkRzVaNUVBL1A0S0xaYmVJZnk3L1k0dWJ3ME8waFlX?=
 =?utf-8?B?U05sZmhYaStBcjBPWTEvMXVPNEJqbHo4eWMvU0lTQjBnWmV2WFkwcUNzdkNY?=
 =?utf-8?B?akhaZzFoU2tCWFdUWVZuL1ZVUTIrY0ZxZ3dJZkI5dU01TWJPendVQ1hzdTlO?=
 =?utf-8?B?L0pMVW9Za2w0VldyaFgwUGxhUUkvM1VlOWJRbC8wMEUzQ3BOMEgxRURnYjJw?=
 =?utf-8?B?cG0wRUpjQy9iOXBKL2NaL3lrRXBIWTBWeFVBcVNUT1JtWkV2dmFnenNQSi9S?=
 =?utf-8?B?b2FNQ0VhWWIreno2cTJ3dFJhb29UcmdhTWtNeHNKTVNqR2ZwOUVxQTBvMmp0?=
 =?utf-8?B?V1J3TDMrSC8rQi9MTVc3bFNXcTdGSzBYS3FMOGd6NHZwS2NyRkZDejFwMWVX?=
 =?utf-8?B?aDlZRzk2S3FiL1lwZndhay95QmFxVHlTSURtYU1WQ2Z3VUZIWGNpdFNhOEpC?=
 =?utf-8?B?d3loWnJHZWkwL0ZndjJ5aXIvc1BBVGxXbmJ3K2NrbWladUZ4cktnUUhFLzBG?=
 =?utf-8?B?RU1kUEUveEFqTlRSL25aR1l0Wkk0NGkwbnJWVUkyV3hIekxCSUdGZFcwSjVK?=
 =?utf-8?B?Tm5NWFU3NDJCVU45VFlDL2phUThQR2Y0Z0NSSHRPRFlXcHpNRFVJL2F3S0Uv?=
 =?utf-8?B?WUE1MUtCVWJKTFVEVG1kZlFKaktiVmpWcHl2c01nNmYzVTFxRm9UTGRXVWRQ?=
 =?utf-8?B?WXZ4OEt4c3FadUl3R0VkNmVjS3lRMTNaVXFjRzM1aUlBYWhoN1JMR3hGbmlN?=
 =?utf-8?B?WG94SHFCU0xocFZ5ZndnN2Z4YjUzY0VUdGZzK3J0YXV0akdZbm56bjZqcHBp?=
 =?utf-8?B?eGxHWWFMbFF5dVh1ZkZyaGdxUExjU1BNek9WbjFnNmFGaEF0VmVRWENKb2lz?=
 =?utf-8?B?MlFGTDNmUkM3cXlta3pNekc1UUFEVDZ2dnNEL1R3dlBVRHpwZVJvMjZrNGUv?=
 =?utf-8?B?by9mUVkwYjBaZnhkVlZRVVA1RkpUd0xDY3U0cy9ibXpPenhwVFBMb1ZxVEZP?=
 =?utf-8?B?dWhPM3RsdWlxY3IyZThvaWdkeGsvbU5iTE9ETEJuaTdnZ0JiOW5sQjJrNVVy?=
 =?utf-8?B?WmpzMnFycjJFZ1JjOVBBSW12UVc5OHA4dWFXQS82aFdlNWFxN2pZb2R0a1U4?=
 =?utf-8?B?ejFpSkpRck04cE4rVlJJNm00aFV1eEZZWVdQTTBUcnJzRnlSV3k0aFZCY3BP?=
 =?utf-8?B?NlJkb3kyZkNrdUF4anFGTDNicnFzeUVsMGQ3S2tXSGZ5UFgxOFp0Kzc4RFZs?=
 =?utf-8?B?QkQxUWd5SzB2ai9aNmlYUktxblJxMGY3OUcreGhEMi95U056ZmdLS0hMb3N5?=
 =?utf-8?B?Mm5XRmY1M1Voa3Yvc28zUmxXZDBGdE5lWFdtd2lNdnhMcG9sVHVXZzVzN1dX?=
 =?utf-8?B?ajhjaUR5T1cvRFhsc0FkZndWQzhpd0xzYXBOZGtYZjAwZStsNG1kekdTYmFR?=
 =?utf-8?B?Z1pFejZ5U05TanlkVmxBc0Y0Zjk4ZTZTQkJKVVp4eXVEaHk2VFN5VkZkcy9B?=
 =?utf-8?B?TUFLdWNMSDJsclI2ZjRuMFhYYWlqcSthcCtFS2VHeHJ4Tlo0RHRPR1NpWERm?=
 =?utf-8?B?eXM2UVVTOFN3S3NzYnZMaDN5blA0TVdTQ1dGd3ZDeGZlbWxJNTRUMENBVmh4?=
 =?utf-8?B?dnFPWTNFZVlWWXdMZU9wRVJGWko5c1JrK3UxSXg1bUVaZytXNmRheWR2VmNC?=
 =?utf-8?B?TG1PUmZ5OVl0Ti9Lc0RXdjdDcjc4U2UrSWErN2JIOGlPS3Z2TDY2MFZxNkNq?=
 =?utf-8?B?YVNkVnZYdTlVNWtoZ1hpV1FHVFZEcnJscjhoU1piYlduY1cvSXpZRCthbis5?=
 =?utf-8?B?VmdseCtJY0h4dUVmRGpSeENvZ3o3V3gvOVF2V0RObzNBTVVNWURoVW5Gc3JV?=
 =?utf-8?B?d1F5WGV4ZWtzNDkvU0ROQ1p6NkZrYzVuQ2gvdlV3VXJ2V0gxd29PWWcvRklZ?=
 =?utf-8?B?N051YVZFRmpqbjUvRXc3ak5aZXpJY2FqQ05xZUlITnB1SnZYd3hVaGdJQlkx?=
 =?utf-8?B?Tk9HSDhCMzlWYTlzYUhsdGdFSXBXM2FrN3VCSENrbDJqazBlWW9iUTRaTkpL?=
 =?utf-8?B?Rkpwb0tqdk9wbmE4TTE2bTRlR2xLOFFZWmRWVWxmYlRtR3ErZkxwZ3BjUUVO?=
 =?utf-8?B?aTFPcEk5b1Y2UGhYSW5ielAveEk5UGtvN3k1aDE2NHVLZCt5S0wweUJqTGxi?=
 =?utf-8?B?c0dneDNiWjlNRkl3NzYzdUs0N1NCRDFlbHZaL1REV3lJU2pzQVh2TktYUFN0?=
 =?utf-8?B?TU41aXBrY1A2RHVML3U2U0tkN1dIVks0VytwbUcydmxpbE1CYjdmQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b57539ec-319f-4299-a527-08df19621afb
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:02:06.1537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFRvD+yJhUv33dhO0J6R/jgxvUMH5GX2qMpEv6+wXHNEXJAyED5zV8uWOGWX91GVkwUND5Vymf8KcWqNpqEc09YELC2gophBInyszFS9go4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9426
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 11:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10607

Hi Trevor,

On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> Examples across the manuals carry the account names of the people who
> wrote them, in home directory paths and in shell prompts that also
> name a machine. Use "/home/user" and a bare "$", which is what the rest
> of the manuals already do.
> 
> The autobuilder's own service account is left alone: the paths containing
> it are about autobuilder output rather than about somebody's machine.
> 
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - rebased on master-next; no other change
> ---
[...]
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> index 185a63feb700..a36f849a0c3f 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
[...]
> @@ -958,7 +958,7 @@ above:
>   
>   #. Run the script directly with no options::
>   
> -      alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> +      $ meta-alex/setup-layers

No, the path is known there and is important. If you prefer, you can 
modify /srv/work/alex/meta-alex all over the file to something that 
works better for you, but the path in the prompt is important.

Cheers,
Quentin


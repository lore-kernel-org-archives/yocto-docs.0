Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F98C5AC7E
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 12:42:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18853.1786020133943842754
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 05:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HucNURhx;
 spf=pass (domain: cherry.de, ip: 52.101.66.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9JZKZJ69Ev1UU+kt1FYu62oMagl+U+2V1vQ56uaR3FJtkKf0DE3EAzAkq2nZonEXaRjHtZd5kDBPbcMalyMISyxNfVLU5wPus/FwrBIZid7tnoVfK1PXDLmG10cHPZbdgGky/kOK8dsUkznFQ3lL35+f5g8W30w8Z2X30wmjP6LZwiZ5noOYBxd8alZuOgisGc01arVI0mi6d1vDd2MWh0bCpq1Bz8bbIZH9/8GtSt5Mo/f2g9Fr1+FLBHLxoUNMZprgiK4d8u01F5EZUFgX3Y0qK2u658ln5Uc+SzHzETyBI8KlvivaIH7rPBGBiBmq9Y03EHbMkrX4v03XgYVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCFxpBm6BI3qQpCpnCsvaxCSfYW2F8QpThRHQ8F8T3s=;
 b=nIDyKZOGbR+L42SaCV5fpPbiJDEI/dFvkLqGHmaaM5tFRHqvbzk7HyeoKBNg4MoJsZaLhESwv+6Jz0aj3OR+DF1KTgJ/Mxy7zrGpQUaEl/HW2YUXbxhYShufBjBM4u0/yyyiPDzu65bX3lCoXzb+cW4JJ3zLUCFvhQtUv6g5h/x2ow9cqjkNQlT4pxJyCRX5wy3bim6jymkq6wFmxJ4UnCiQq7Sos8tPPW5AoMZqaxH9wWM99WSLwKL14G5WDCVVuCJ907IUKZYJ2+4PUPhK012c0geTtemy8fhXj1Qv4Fv/mCOhbol5e2lnYt0GKtSZLGcStyQP7cg+dEDMUp3+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCFxpBm6BI3qQpCpnCsvaxCSfYW2F8QpThRHQ8F8T3s=;
 b=HucNURhxjEvqBplxejKoKJmmPYWF+YGGlgGZf+4V6qSy2QiKWVFv6nSlZI0ZBtMzjU7t9heX6vovTSFfuJ42RL3JfsciGaRhosB30m4ML7rye+4+tVGgsevKYcMAB/jIxb3r8gTC9kTxv/3xBjW4xobnQ+WopAUCebmoCSeNvc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com (2603:10a6:20b:288::18)
 by FRRPR04MB12571.eurprd04.prod.outlook.com (2603:10a6:d10:1cf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 12:42:14 +0000
Received: from AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5]) by AS8PR04MB7733.eurprd04.prod.outlook.com
 ([fe80::8f86:fafb:dce7:bcd5%3]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 12:42:14 +0000
Message-ID: <3f6054a6-fa20-47e9-99ac-d4b5a64e0e13@cherry.de>
Date: Thu, 6 Aug 2026 11:07:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the
 QB_DEFAULT_BIOS variable
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260804-qb-default-bios-v1-1-bc851931973d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::18) To AS8PR04MB7733.eurprd04.prod.outlook.com
 (2603:10a6:20b:288::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB7733:EE_|FRRPR04MB12571:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b0db39-fc09-40b7-30f8-08def3b82476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|376014|366016|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	k5Q1RP6+0sCkcrpAHrY+BdKcgn/7qYrXha0GDjAZkkQ/UO2kdT+tlSPZIqQeNK70WXVEtxW97UPbJKlFx3BNZaNQJOx/1aenwacPhcI5YO7AMBQ5bsVJblCWfkuH381C3JX0v8HYQDyEVrOk1rouW0U/vkcGTo8HfJpMLLo9nRql0qVME2VEVEhl6qXB8UZIVCMCoppaK6fCurH5N50xUsUlDaGeQ3mGUjAQtn/CKFNTV8JrgMNb/fb1UQ3Yam+hvfPKiObAtZnWboWku/Ma/F0e2IZGsfzYFIrB/rUeB3IhoCgzlCzxHNV7Di/2+kOhfWeFablK4EBdJffU6kjRUaqOvQpXVmAgD62gr7wOXKwU16nicmJANiI2Zjm79qjenEfugxWcBjyAbIafJ5rW6eTdCpsV0nHJv25olKcpBGDhZCzngp4Zl3xKy5e14Vc0vt3wuaQRLVHac3di0qKjiPj8I7tEVkZeupgFXvt2eQ604rhJ0SjbcfTWHp6P9FFtcHWT/lgDBfEliXm2oxZsn9/MtO8etqs4WYR4ow0B7txBXd96TwmiTdpoi5AbAy1RDhJHmGsPMoLwssUCVRMb5qns0JdSjcCiH5p2xV3jQ8WNUqOh3rru8DpM4ORGmICXarjSMTHm6h42WRWZWyFACstMlfgPdedA4i6hmid699s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7733.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zmh6b0pMaVhzbmhNWWtpSEFBYnJyZnJUWTk2YjBFV2ZwS04xWnRFYXg2UjRu?=
 =?utf-8?B?QXh3ZmVaSnc2MTdPTHdIUGkzTU9xVWRtREZ3VjU0bmFTaTJjMlhUM1BTZ1pK?=
 =?utf-8?B?eHNEQ1ZYblV0Z1BLc3YzVnV6WnBHaXB1U1hIMnBhZ204dnVpQ3hVbGsyT3BL?=
 =?utf-8?B?SnJFVkdhL2VkT0Ric3EyOUtKd0VUS3JNdnlSWHphWnNkK0JaZUNxclY1RGhI?=
 =?utf-8?B?M0VtT1dWQ2lGbUpWeENIV05pKzdmcm55NVl4STVPdlI5WmxzNDZ2YXh3aGU2?=
 =?utf-8?B?a1M1Q0tZb3BCaDhYWm5YODlYbkJZdVZBQ3htc0NsSjk3SVgwcGFjWndXNVhP?=
 =?utf-8?B?NlJkSHgrUXJ4WGRHZ2VFUm16dEZBbXNIelRRYW1JaktxYjVmN08rU1VyejBj?=
 =?utf-8?B?cXNFa0I4elkycmtlbEU5Q2hpd3I2ZWwzZk52TGpUaUdSSnQ0cTJ4dGZwNEl1?=
 =?utf-8?B?S1B3ejBrL2RuNHZRTmY2dFFXNEpBbW5SV0VzRUFISW90OW9vSHZHVTA4YUsz?=
 =?utf-8?B?QkdDNkJZcmYrTTdkNXhobkNVV28wQVNzRmRPRSt3SkVIV3ZwbCtxTW1naTg0?=
 =?utf-8?B?Zy9sVVlXL0RIN3ZabU9Tb1V3YzBJN0g3dFFBYzZoamNPYktvUlZadmtLQ2VR?=
 =?utf-8?B?MFU3VFM4QlAwOTZ2SEEwSG5QZ2JpV3g0YzlSSndrUjFaZmF3cDV4WGkvN3BF?=
 =?utf-8?B?Wjg0NlhLeHFOb3Mxa3QyQmwwUjFzdk4vS0dVaUpuVk40Sk82VklrOVQ2TC9Z?=
 =?utf-8?B?WVl1RkdjU0ZSZ21hakk5ajJCRlBDVktjYWxNOFZsM3NsSVBCZFROWmVsVWZz?=
 =?utf-8?B?RGx5SlRUQTVrNVhnRXYzbnltSnRNcGJWUFpHSDVnUHRjanBqakQrcDBLWXVZ?=
 =?utf-8?B?TVNxdE5xMmJicENoQlRSOVFsdGNVSnZocFNLZVIxU0ZXMGk4YzJyczNhTDh2?=
 =?utf-8?B?eGxRNEtvMlhRVG5GL2hJaHBCU3FYWUtqaXhReXlOSnZXS2JiMXVEUTJ2cW02?=
 =?utf-8?B?UmM2NUN1dEdmUUw5RVFZcTNyb2VEVkVLb1VqbWJsaHdrYWFoN1cvYW9PMzVN?=
 =?utf-8?B?OEZZcTVXOGtMMENGU1JtMTNEZ2trd0ZON2NPVVgzeVhJMnB0aC8zMU5YS3pp?=
 =?utf-8?B?bnZzbXNaZ1E3MmR0Y0toeCtQQTZxVUFRakdrb0RwNi9LZXpYeGc3N250OXJq?=
 =?utf-8?B?eTJpSGN1UnpsVWNiMXJwajkrUGppejhIT1FlNEJ2anVaa1NDREV2MjhUWXNz?=
 =?utf-8?B?MllCVlpUMGJ0QVFzMUxYUTN6b3RJQjhadktHcHd5V2cxMGpqc1dBMy9jSnpP?=
 =?utf-8?B?US9HRlJiTi9Ndlk5RE1GNVl0ZXY1NDVsNlJtNDI1SG1NWCt5cDc0aldESUFn?=
 =?utf-8?B?Y1llSis5NUs2MkFlK21xZHU0KzZwR2xDUHhKZHl6SFhaN1haZFdHaHhud2hB?=
 =?utf-8?B?d0NwWG8xRFJwaWx2Yi9Hd0dWckFTTzFRNWZ1cEgzdjJpVG90NzdEdXVtTjE1?=
 =?utf-8?B?V29MYUVqK2dQTUZiZFN0aE5na3kwaHE4Mlp2ZmE0N0x0SkdTRXU3ZUk4TGx1?=
 =?utf-8?B?aWxBNmZ1NThYeWJWOEpmakFVTk1aYmxPbDBDc1licVI2Ly9seTd4b3RndHFP?=
 =?utf-8?B?UjFhUWt5QVF6ejN6Rnd2Vi9GY2h5OTdaNnNERVZhZFRtZzI2MTJRd3g3cFND?=
 =?utf-8?B?T2hWdnJKQVJZb2owL0tncFBETTBhaDJQWUJuUUNaV2VPb0xzdDBkdzNQZDc0?=
 =?utf-8?B?V2dhbjROR1BiWnkxNitBalJwU2tpbDRURmNHVWFFR0tBdHR2dVUySDE4eFdr?=
 =?utf-8?B?aUhmd2Nlek1UdCs3cnd5OGZPOE9BaHZiTEFBZURBUFQ2SG9SZiswc2tmZGpB?=
 =?utf-8?B?OEZ6OGQ0ZHdTOVR2L3JIcUtqMHp4SWZkZXkwTGNFc3RoSG45VTRKSEJTRVJV?=
 =?utf-8?B?dG5ISFp5TFkvNVl0OENvejIzQlFKVXY1VjhMT0tIb3VXajcxK0Y2Sm56blRO?=
 =?utf-8?B?U25HVWRwb0gvVTc1YmhzcnNzVTI2RnJ6RG5tMFd3VHFGRC9hc1kvKzhzckhT?=
 =?utf-8?B?Z2tORm9VZ2tkaVI4YW9CVWw2RC9aVld6REFMYnBlb0wzclVOU2thbTRmbERo?=
 =?utf-8?B?TS9UeEYyakRRQTV1dmkvZkpHTHpTV0cvZ3FjVG9mMTJtVGZQa2JYbHpBVExZ?=
 =?utf-8?B?OTBsSVo4MXBpUXNYVEppR3JSMDlzTGlOV0tCbU15MXFOWVhqbGZ3V3VSa1Zp?=
 =?utf-8?B?RUdEaS9RQytmdE1kMEFyVEFRZHNBUlIxbTlmZGI0N2xQNTZ6TTliNy84N0JR?=
 =?utf-8?B?UWV1WWV5aGdBblBHbTFyUTAvc0lVWHVobVJsS0ZLMjdQVWhwZVRvQXZTdzha?=
 =?utf-8?Q?NXeuE6NUsdrnMzdAdsMQD5lpPOODVbRhij99huZt6VXZ7?=
X-MS-Exchange-AntiSpam-MessageData-1: DhskAPNJBN4zq2HJjvLTOKl09lzfryRQSgA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b0db39-fc09-40b7-30f8-08def3b82476
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7733.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:42:14.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTlCXMQl1ai2X5+qHM2XbBd+j4yisj4yhQmI8t98V8DTwdkKs5C23Ph/cPxcv1iCsTRLaxJb+sO1hpx4OgKUnvzNZJV566AK26lkZLted/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12571
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 12:42:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10241

Hi Antonin,

On 8/4/26 11:01 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The QB_DEFAULT_BIOS allows setting the -bios parameter of QEMU, which
> can be used to emulate U-Boot, for example.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e75f42afe..cfc764961 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8084,6 +8084,18 @@ system and gives an overview of their function and contents.
>         replaces the ``@CLIENT@`` and ``@GATEWAY@`` place holders by the IP and
>         the gateway address of the QEMU guest.
>   
> +   :term:`QB_DEFAULT_BIOS`
> +      the `QB_DEFAULT_BIOS` variable can be used to add the ``-bios`` option to
> +      the initialization parameters of QEMU. For example, this parameter can be

No. It is the path of the file relative to DEPLOY_DIR_IMAGE that is then 
passed to QEMU via the -bios option. The wording here seems to imply 
that setting this variable passes -bios as a parameter to QEMU and 
that's it.

Also this only applies if BIOS is not set otherwise it takes precedence 
and this variable isn't actually used. We probably take this opportunity 
to document this variable as it'll achieve the same goal as 
QB_DEFAULT_BIOS, just that it takes precedence over it and that it'll 
expect a path differently formatted than QB_DFAULT_BIOS which expects it 
to be in DEPLOY_DIR_IMAGE (unclear if BIOS can be a relative path (and 
relative to which directory) or if it needs to be absolute (which is 
disastrous for reusability across machines).

I\m traveling currently so cannot check, but is there a link to the QEMU 
docs to explain what this -bios argument should be set to by any chance? 
If there is one, it'd be nice to add a link to it here.

> +      set as follows to emulate U-Boot for the :oecore_path:`qemuarm64
> +      <meta/conf/machine/qemuarm64.conf>` machine::
> +
> +         QB_DEFAULT_BIOS = "u-boot.bin"
> +
> +      The above example makes the assumption you have built the U-Boot recipe
> +      and that the ``u-boot.bin`` file is located in the

s/is located in the/deployed to the root directory at/ ?

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D51CE7D01
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:41:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.31])
 by mx.groups.io with SMTP id smtpd.web10.77035.1727775658856254463
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 02:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Se92k16K;
 spf=pass (domain: cherry.de, ip: 52.101.70.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khtCYlJTMToBM6n45WICMg/SF3stVwiefaJSz16gy9FT5H4uwt4cf9Fak3PPo4nSdf+FzxGcdekfXYcHJk/mVz23TPfrgpZJlYahL8/m3/Mox38CYFHse3Sj61IEoHl4b6ad0XfCcDuM9CPYSh4CYNDM++EM3kw+rRd+LmhbJz2IiBHLXEPkCzLTOOUYaIGL0o5X/K+QIJLQJQ7NPXtmWHY2aKk96Alv97ZoN6rbtEghpYkv6+yNG0yzVKts7GyNCOzh/j4eTj9KRhajjuX4iOZPSIgtsz9ylKEVs462T+Y3sU/iWS8V7zTHjUcLzwtvhXMhjLWdxsj+N5kOzXUHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M7XsEn8t4IXu9NJKoGB/S1LguGkRkAbTCR8NSLR8vs=;
 b=TK2yvWRST6WjWbGwDW2MKOD+Sm5sANYZFV1lYSV496Lx13ul8+CbynyJQndD+mQjJhVJBcr3UCVgXwvkOTqwNQfcPb3lbTYfCuWwVtIqdZcIfD1hxMQsxF9NxRX2m+G2l2vzsF4jmp+p+jlTSQwfI88ur0LxH8+ZTqpDu0s7AlGbOopiWAZxPqs7Q+h1JE8InAKsZn40lRqVHczx+51ys3xny259qCcniv1bLWz9R7gnmPTUeGXEYzuajDU5KcYRRfAHIWjYo/aUyvfe7ocdDC6/6jxUi0EVcqqaCfB2Ger2Gc1JLzPMOD+CzSDXaLAHKILsQjteIUmfAj3BVWrMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M7XsEn8t4IXu9NJKoGB/S1LguGkRkAbTCR8NSLR8vs=;
 b=Se92k16K2lcSHAUQsQ5/EzdBIqE1fc4H0lqVgfAMqWVu6pBmBh4NRiO5Ap0yh+yXUn3EA+E2tFENIGFO/I4I/GEh81PqCbMxO1V+ZnYDx+hPDbYbV7dLuqqHYF2BBU4YJ20OcfgcFGOP00YPDMUv/z5pb6T5XhQMZr92wABR5Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AS8PR04MB7832.eurprd04.prod.outlook.com (2603:10a6:20b:2af::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 09:40:54 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 1 Oct 2024
 09:40:54 +0000
Message-ID: <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
Date: Tue, 1 Oct 2024 11:40:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240927220033.3941455-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AS8PR04MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 8388ea54-61fe-4a56-b62d-08dce1fd24cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MVNueUtzUVhGY0JCODBOa2pXQzdiVk1GOW9XSjhzdE5kS2UzMDFPVHFPMzhZ?=
 =?utf-8?B?Y3RSVXBWc3NRM2xwKzFQb0pSM2RPRFg0RVVLaEE1ckVSQlIxM0x0V0VaZTl2?=
 =?utf-8?B?MUdLTGx6Z2hhRWNlZ2Q3NDIrT2R1Yld2VmhMRm5aZU1kazNZWlU2cE5oQmJJ?=
 =?utf-8?B?TUFJSEVTWkpGLzVFczdqVDQxQWlYMUNhc09jRm84V2QrRU0zTHRFbk9YY25P?=
 =?utf-8?B?NXd2RWlVSHVYaWg1YktEWkhqN0lEclFqWDVhLzFYdGI5MjhIT0dlY2ZFYVd3?=
 =?utf-8?B?Rjd5WGJLY2JnZ0t2RXNrakkxbXpEYkVveE1jZSt5Q1BydDA2eVM4aHlQZ1Q5?=
 =?utf-8?B?MlUrNzRvdnNzZXRmNm1mUEY1YXRLaTNmZ2M3cmhGb01PR3ROVVN6ZnJ2TGd4?=
 =?utf-8?B?aENHM1I5QXZmZGM1VnBkSVFUQW1DRmxhb1NsWEJRRERZcGlsYzNvQ3AvL21x?=
 =?utf-8?B?MVExSm4zbTdpOThzenVMNFNTMENvcnN1Y0dCaFJPVHp6RGNHcENmcFg1QThx?=
 =?utf-8?B?a0s0dEkrTUtXT1RWWW11eDZCWEswMXByN0RyU0ZDQ2RiR3hlK05NOVFRdzJP?=
 =?utf-8?B?UFpvWHJ1V2V1UkRXR3RWL0dQMm9Wb0ZPRlBCSVh1RUNlK211aWM1aHdYaGMz?=
 =?utf-8?B?QzZ1TXowZmQ5dmppK2xGcG50K0JiUS9pU2J1djlVWlJ2bXlqbG5WckJmVHhO?=
 =?utf-8?B?NWQwWkdRdGJvVnJqeGRYQytTampTajFhWjd2b0V0bHRKME9KS0VPNEFueUE1?=
 =?utf-8?B?bUNhN0xWd2Jnd0xYeDJJc2Mwd2tlRGVtTmFtd0pBYzJvNDlLNlpYTUlQTWJ0?=
 =?utf-8?B?U1BkR1hkN2tuMlVlamFoOEt4dlFQWms0L1FwcG90V2MwOFBtYmd5WjJyZGVG?=
 =?utf-8?B?UnZhS0hmb0F5OTgyUnR3dnlyRG5scjVFRFBmNnZuSDZXZlFHd1REL29TSDU3?=
 =?utf-8?B?WElPNkUzS3ZrcnBVMTJnRWFDYXN4cGxFYXlNRXRxOVhRZFBSSGpINFQvL3RX?=
 =?utf-8?B?MzAzRmEzcTZ3ZGZTcVlhRTRtNmdFdmQxMGc0MXhHd1d2eXdMNXQ0R0EvU0Jr?=
 =?utf-8?B?V29Vd2FaL1V4cENZcXNKQ1BHRDI3NUVzOWpVWVdERzdnbjAvcFVLTGFmRlhI?=
 =?utf-8?B?d0QzWWRvK0k4bUtvd1g2QVZHTVp1QXg4Q1doV0tDQVdxYjVVOFZPdjlNTnJ3?=
 =?utf-8?B?ckJXV2pycDRrNkk0aVFxeFVBQnFpNzhDVUVUay8rUDA4cUY5bFd5emMrcTYx?=
 =?utf-8?B?V2Y2REJKSC9GNVJYWWpSNE9sWXJnNUo5b0QrTlNpODRaZFV1VXFFTEJCbnBD?=
 =?utf-8?B?bWd0T3BXY2hrR3dteGxxQVNpdVI0cVN4UjlCaXBkVlcyQ2xURzk2Q0xNRDk1?=
 =?utf-8?B?UlRKYTlwdkc0a1ZhQmQ4QnJ3YjBNb3JOb0k2QTRCSGQrb2c5aFN1bXpPZC9t?=
 =?utf-8?B?bXp0bjBuRFBQbDBHb1FiVktsSDcxcFB0aVpEazBSMjJtbUtyWEV0U21FZ21l?=
 =?utf-8?B?WXFtQ2VKOUt0RFNmTlBVS3FjSG4rQkg1ODNWWWZSUzZCcXRGdW90bndITTFF?=
 =?utf-8?B?aEoyNmtLc2kxQjdDTysxQjU1bGhNVUhLVy8reXR4WXA5Y0YyMkRWT3RyQWhl?=
 =?utf-8?B?Z2RHTWgyRzRRemUwSkhsNFJTTU9YaXRid2Q0RXR4cHNpVWFTM1QyWGlyU3ds?=
 =?utf-8?B?Z3FMMTZVaWZLbXY0YVdrdnNEVEpWU0srS25NT0V0VGNsdzJpcUJHZDdjZ1Nh?=
 =?utf-8?Q?+RZHsrnFsy9l++keok=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RDdXRWp1K1U4aXhHUWNiajRYalI1RE9IelVHU2lpWnFFTXJxOWIzYTdYVFNX?=
 =?utf-8?B?WDRzTTRqYVZrTDdtenY4RkpyYXY1VnY3TU42VWt2YXEzL25YZmxRWXRHZ1JC?=
 =?utf-8?B?ZXp0SGFPc0svV1NNMExtZnJCZkhrMFNManBpOW51aEVQNVdxb2FiWVFKb3FJ?=
 =?utf-8?B?eXRKTzRYWWlERVF3eC91TzhKSm9kVFRGODdKTmNqd3ZGeVJmUHNtRjRnZjY5?=
 =?utf-8?B?b3NycmdWZWgzdjlNZ0tOTFNVMVRuT3NySDMyYTFCZ3owY1VTL0hYSitMV3Rv?=
 =?utf-8?B?OFQyT3JjOWFVRmFnbFVKSFF6QWMvU0NTckpUY3E3WWF4YVNHMWJJNk96ZGdH?=
 =?utf-8?B?R2tPaWpFZEJRaEFCa0ZSWnROZ0FNQjUvZUR1ZkVjYnl6NHYvcXZnQS96RSt1?=
 =?utf-8?B?dFZiUjFmRXRTS1RaM3ZNSzU5d3I5SnBNZG9Objh4Qm90OUlkblJuSlI4NGJv?=
 =?utf-8?B?a3pwc0REOEJaeFV4TzdJRXYrTkpHcE1FMHVaS2JmWkpzM2xNYkdTdkNRSWUy?=
 =?utf-8?B?SGZrRzcwZC9Yd2kwMDljZXFBSUZSaGNzOTdaNFQvOGdFUk5IMkJqbFNmYmpt?=
 =?utf-8?B?dUdHcWJNV0h0c0FsODdBbkNha0hUNnJpL1ozaDY4SlN4TTRLd21RQTEyQlpK?=
 =?utf-8?B?YXBCNmduUUJOVWNPWDBOM09NZ3M4OTFlc1pzWWlmNDJWVVBMRzRNU0trUGR5?=
 =?utf-8?B?eDFrd1lmclNsT0ZBSWZHcDRIMGVwLzRGMGdJNGtQdGNVTHpxb0tSb3BNOEJy?=
 =?utf-8?B?cFhrZFplYWhxNzlETHJ4dWk4Y0tWUVZuRks2YTl2K09WYW5zb2VNbGJLS0pF?=
 =?utf-8?B?WEUxeStpMWQvWTMxUVlVSXUxUEFzRkpqMEFBaEpDY2hJY2FZbS90TmtWcG52?=
 =?utf-8?B?OVUxbm1EdFZCOUpZQUt1NU1nMjVUNHUxRGZkYVdwdkt0amtDU3diSHZzNUVz?=
 =?utf-8?B?MFd3MnFOZU1sMWRxWlNLN0tpZ1FvZmhlK1pSKytoVXk1UWF0RkViRitLc1lH?=
 =?utf-8?B?aVd4K09uS1YzK2g2Qng3Z1liK2pZM0cvY2ExWEtqVWRqMjgveG5vRy94Rysz?=
 =?utf-8?B?VUhoZXF1Rld6UnVXRmJwdkFzSUNSbFFTMWRDTkR4VkxZM1RZZHczOU1LcUZx?=
 =?utf-8?B?Y2VkeHFvMEhrbUxCNEVTTzNWSUpBQnBqS2FUYXpuVENOLzIwQlVZem1LakVl?=
 =?utf-8?B?SjZibDBNZXBvcUN0eWlrWlVqdmN0ckVZeCtRWHlXWkx0OStIelpscTlxWjJ2?=
 =?utf-8?B?QkNPRHVvVDRvb2hpcnZNRHl3MDFxZVl1VlRMRCsrMXBhZzc5K1VtWll4Nk9P?=
 =?utf-8?B?azc2Z3NoaHRwWmhhMzNyRU05d0JqNGpHeHVxcWZsZndtTXlXREhYd0VaRXRl?=
 =?utf-8?B?MXQ0R2dIa1R3WGZXL1pKR1hVclpuWGhlK245b1lYdWt3bElzZlYvSWhMZEVv?=
 =?utf-8?B?TVVJeU5SL0UwamJsaERhNkxhQUJ0WGJ2Wk85SUI1VTJmUG1BS1JqRWpIdTdm?=
 =?utf-8?B?Ymk2L1VrZ1NEN1g1OXpTSWVwaERXb0lTOGQxRUV1SGVVZGZOYmlQU0FMM0Rk?=
 =?utf-8?B?U3RabDl4MDdpMFdxRFJVeDVmR1JTZlluTk1iNzk4RTg0S0tmTGFCKzdVTjlF?=
 =?utf-8?B?SnJOZ2hNeGRhSTVQWDRRbWMxSlVCUmhLc1ZpcHNsRUhqVTA0Tkt2Nm9uTXo5?=
 =?utf-8?B?NnF4ZzBIcUE1dkhjS0FzRDg4SjVZN0RjMDB5ZVF2c0libGxOeSsyZU5wRUpV?=
 =?utf-8?B?TWhFQjc3MkJsSmdHSmxLSVdTOXRqRWNmQnoraGhPcDVqRm9kUk8wY0l2K0o2?=
 =?utf-8?B?TFFPK0FmazlxMTVIY05BUHJsL25jYlN2Z2tnSm83ODhlcnNRN1NUUEFrS000?=
 =?utf-8?B?T0FNUjJaRWY4dTQ5Y1psaUtqYmxSZVdHbUxwWWhXajlIR1U1ZjJLeG4xUGVR?=
 =?utf-8?B?MStWVUVlOEJucnBlT1BxMTVwSlZNelA3WTFydEdUZnpqblJNdVNVYzV3R1Jz?=
 =?utf-8?B?Y3UvOGd3WExRcExOUzZiSUY0bWRvb2JiUlFUa1BHVFcyTTdqQkxuNlJwenVr?=
 =?utf-8?B?c0VMZ0NKNFNrNjRVY3NpSkVHSWIrd3JoT3piYjdCUDlKNU9ybDF1UndyYlUr?=
 =?utf-8?B?b2RyR2VWWTRod1Y1UHNvVXppaklkRkJKelFYbWtWMllqSzJqRitKZDhmclRY?=
 =?utf-8?B?MlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8388ea54-61fe-4a56-b62d-08dce1fd24cb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:40:54.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNyAKis9eJSZw2mMQA8P6lSbEFHoBtlxaJ62HjQnrXhPPazSfLX7/RpI7qVVunhoQK7641ScCHghW4fGEgxJFAddtM8b2BDQC3HUArWEpMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7832
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 09:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5384

Hi Yoann,

On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> This covers the Poky commit:
> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v1->v2: Reviews from Quentin Schulz:
> * environnement -> environment
> * oeqa/selftest now only rewrite*s*
> * Add exemples for the selftest change
> ---
>   documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
>   .../migration-guides/release-notes-5.1.rst        |  2 ++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
> index b43fecc2d..4625ff0e1 100644
> --- a/documentation/migration-guides/migration-5.1.rst
> +++ b/documentation/migration-guides/migration-5.1.rst
> @@ -141,3 +141,18 @@ QEMU changes
>   Miscellaneous changes
>   ~~~~~~~~~~~~~~~~~~~~~
>   
> +-  oeqa/selftest now only rewrites environment variable paths that absolutely
> +   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to point to
> +   the selftest ``conf/`` directory but not ``Y=$BUILDDIR/../bitbake/`` which
> +   still point to the ``bitbake/`` directory)
> +
> +   For example (taken from autobuilder environment): ``BB_LOGCONFIG`` is an

nit: could use :term:`BB_LOGCONFIG` here since we have it defined in the 
reference manual? We could probably even avoid explaining what it means 
here (not necessarily though).

> +   environment variable containing a path that configures bitbake logs. In
> +   autobuilder, it is set as:
> +   ``BB_LOGCONFIG="${BUILDDIR}/../bitbake/contrib/autobuilderlog.json"``.
> +   Note the relative path starting from the build directory to outside of it.
> +   This path is not changed by selftest anymore.
> +
> +   Environment variables containing relative paths from tested build directory
> +   to outside of the original build directory may need to be updated as they
> +   won't be changed by selftest.

selftest should be single-tick-quoted as defined as standard in the git 
repo, c.f. 
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md

This was done by Michael but he's not the maintainer anymore so I guess 
whoever replaces him may have a different opinion, in which case 
extending or replacing it would be most welcome, is that you Antonin?

On a side note, I still wouldn't really know which variables I need to 
look after or what happens if I don't (is there an explicit error, are 
there side effects, if so, how do they show up?). But admittedly, I have 
zero experience with oeqa or selftest so people in the know probably 
know what this is talking about? In any case, I guess we can revisit 
this later on, it's not written in stone, and better have something than 
nothing :)

Cheers,
Quentin


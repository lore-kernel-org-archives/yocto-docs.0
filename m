Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C52DCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:36:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.5])
 by mx.groups.io with SMTP id smtpd.web10.4768.1760610983722742223
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 03:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IT6BfvjC;
 spf=pass (domain: cherry.de, ip: 40.107.162.5, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb+zX9ekwGS8gl56P5OW6zmKFi8iBbQ6+97yS+BuoTyaRxpmvDamuyJPucKHtO/AalfqXfwuXR8r2aum69Idn6yKodnSNnGXCEjPrd8qo37ThIptqtLysvX5fLq1WiuR5QL0Ki6/NPTIv/VfnhoCCNc0fHnJs1FrHeqTM+m1c6B/rTUo9Sd3GNsddTNyl47LOvggqc4GtzWU9Upps+modwJ7ZmOxwT4FF00ijAL/aazm8k1FzxBkuUWRyWehoWU34oEJ+lVFWTPhiAeCc8yyBTpISOwpMwuHNY9Ww0ZN1A06f3oSy/6AqTgZocWfWlOIcUTghnYNDYMprirpfEghjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmKCBd/RcbPM9DF1lswoohTGo3YQyzgHy+0BIeRYER8=;
 b=Kv/3Ls2hEIrCTB5m5RNuqKAhrVFWorYqkndPDsNYBy1tPwAgKuEQWSKUwRdhxjEWkhJ+7m2hg4Taagt8ACvZ23MbEraMTgtMbFUbzZ2ZsgwxuBXSRQFOXWCXNXVoRHlsYSIDw1/CaNUAupxr4GjVysvWWlM7+Cc87jhcVJtakUe4sr59zWWt2YuProbaF1q8LsdOhP/S0QVE9wc0luGzgSu8oCXbhcEP+3tHv2nd1YKNnnzGYIPp6qR3KjT7S1kykUDQAmjGoLj/6+pkvQc5r6BEn4z1ie//9T5NvWX1Hn6a4Vf6ItXmN9QI7YGFOop1CadAXtg1UCkqexfzMg7aVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmKCBd/RcbPM9DF1lswoohTGo3YQyzgHy+0BIeRYER8=;
 b=IT6BfvjCb2ZyWONmWg8SQcJJkn0pWr6WA0cq/Il/FYHIrwh6gIq05f/SilFuCYYbZjbbi8Zhm2xB31likVxQTf5xpf3lDY5562sqDzSggggoKmT+UZzET1gb2cgURBgJsGcivc2jRVBJcho3u77HuvBObmkeS/dJ10+dQFGgOfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10438.eurprd04.prod.outlook.com (2603:10a6:800:21b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 10:36:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 10:36:18 +0000
Message-ID: <b3d0359a-a5ec-4f52-9e03-9dea39f9929e@cherry.de>
Date: Thu, 16 Oct 2025 12:36:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 11/17] ref-manual/classes.rst: gettext: extend the
 documentation of the class
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-11-20f21db1f93c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-11-20f21db1f93c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10438:EE_
X-MS-Office365-Filtering-Correlation-Id: eac846ca-1f56-4e6b-76fc-08de0c9fd706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlRiTlB5MW5RQXZQUHV5V1hFTUhCS0dlbnltR28reW8veFJOR1BNSmg0MTdm?=
 =?utf-8?B?eWsyenZROVg3WUtJeEowM2lodkY1WjZvR28yWk9rYjkycXVkRDh4eENHdzFU?=
 =?utf-8?B?Y2I4dThzSFVmZnVaMVo3ZFZPQjQ5ZkhsT2huSmJnMU5JTDhMVG9TVHdqakl5?=
 =?utf-8?B?a2RrSkVwaG1GODhoakRxL2toNHNDeXhILzZYSmduMGFKKzBaejVGSGhSNDNj?=
 =?utf-8?B?OWhGS3krOUpGYXBWSHFFbjVhOEF0dGtmSVpSNW4vdzZaMWFYaytUZWpCUkRp?=
 =?utf-8?B?eG85ZWJoMlRRZEhNOEcvNGdLTE5CZC9aSTFwdi82ZGUvOFlNQUEwbWx2ZWFQ?=
 =?utf-8?B?ai81VEpBNkM3UWo2OWhMSXBqUWpIUjdmMHc1ZnhkbHBBamRtRTQ1N2F3WThJ?=
 =?utf-8?B?WVNxdmhBTVo2RDQxNUYvMWxnVk4vVGhJRm8xVHdRMmtzdFdtQ3dRWkQwS3VL?=
 =?utf-8?B?YS9uUXVJYzJBK25oVy81WExpY2VWUEVtajFSM1NKYVJMZFZvM0tmOWVzK0wr?=
 =?utf-8?B?WkVBdy9KQ1lmaStSYThzNnk2QVA0NG1ybHBhc3BxakZmeVBOTWwyaHVqRldJ?=
 =?utf-8?B?aWd4dGN4SFFnMEp2bGJicjgvM2FKS0gvYnVNMDBmdEY2d1NPNjhwdWIwRWk0?=
 =?utf-8?B?bEVQVUVjb3YxUjFrT3lDUlhTekdRbzdQamJtR2ZZSVJpUjQvVi9rSzltTDhx?=
 =?utf-8?B?ZzRwOGJiSm5velkvcWc0ai9zSE1uM2N2aStBOTRHR3g5bzdDL2ExaXd6Yk41?=
 =?utf-8?B?ME4vbXBTb3RHZDN5YnZ1SDNSaVBvOVloaTBpZHhkbFg3MGt3V014U2NmblJF?=
 =?utf-8?B?YmtmK3NoTGhvUEpmQUdzdHIvRnNOYUU2MHB1VGJ3NmpnemN3SCt1YWZ1MHdm?=
 =?utf-8?B?ZDE3WWY5NHU3SWJWVnFvU0JmS2RHWmE3dUxWWkUwVERsWWVOL1NjUDQrU2tX?=
 =?utf-8?B?VTBFWnppa2ZOL09Bb1ZvY3g0UFhyRDVmV1laOWVSL3dFdFZIZzdSeEltZzFU?=
 =?utf-8?B?enc0Q2p4ZG8zU3cyT3RaR2NBZ1p2ZHR3UlZMOEFXUnYvUFdBY3NqaGE5N21H?=
 =?utf-8?B?ZDRlOUl0RmpGdHVBN3JWUUx5RTNWang0cUExSUV3YlkrcGVOL1U5Qjcwb3c0?=
 =?utf-8?B?RnBsT05IMU9CZHlMVEJTdmFOMjVEczUyc0svVk1sRFg2c2JiZzhLcjQ4dTBI?=
 =?utf-8?B?MGVkZ3VaWndnZ3phVUV4U0VmQmpKVlE1S2h5OXJzUmE1NjdzRDVxUVlwSnV0?=
 =?utf-8?B?THUxdXdHOFBYemNzR2RBWmFZQ1VERkU2blFvWTg5d2x2S0pnRW1jdUFBamFw?=
 =?utf-8?B?WVg5UDhqeUFYa2JCSVZhaVJqTGxidFNiblhaZmVnQXU4d0hQcUFMN1NvNVdR?=
 =?utf-8?B?ZHNxaEhpYjRMcXgvanNjVzF2UW9ONWhXaU1kOXhFVFNRK1g2Y0JFMldKSURM?=
 =?utf-8?B?MFVTdEJXZ0NSdnJLK0J0b0hIOFB6b0pScUY3TnJGMU5Sam5vblRwcG9JbkFm?=
 =?utf-8?B?eG1ZK01VYjZML0lCWFVIYzkvVUdMY0hITWhwMXJVM2JYcHJJTE44K211VTgv?=
 =?utf-8?B?ZitMK3ZhQXAwelRWVThYTjU0dmMwcUdQV0RCWEh1NEljaWZ3YlVFZ1o3Ukgy?=
 =?utf-8?B?a1BvMXFXcUlHbUEyTUx0Z3RnbURBWUplUDcrTS9PMmtYdFN6eGFqYllEUjRT?=
 =?utf-8?B?TzR2OWNOS0xwL1pzQ0czNHdFdjVEZUkrUEJTamIwOStXZmdPVjIzcWdMeGlT?=
 =?utf-8?B?QjYvT3VQRXBocG5SS0JudHJEVzBKOW1qLzJzR0NNNnQ4S253emZ2cGprMHNT?=
 =?utf-8?B?aUZPaVBUOEUvSFhEZEsxTkVadXJvUmpBS0VHdzRrWmdlWnVuVkg5emJHN1dF?=
 =?utf-8?B?ek5zTzlUbVpSNTJaRWhsRjhESGN3UVhFOERVbTRQSUFDZGMrOXllNDladUhC?=
 =?utf-8?Q?mHZF7DBr31G3sbGJKXvP0dM7xvOHix2p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2tuM0xVeG5EWFpSL05YYmhzV2tJVmRmd1BmM1J5SDdCQXB4a252YmpBVnp4?=
 =?utf-8?B?TW9oaG9aU2lRaC9tQlB1bVdsc0cvdzY4WFJYNlBRNGdqNWpQRmh0Y1RESGNn?=
 =?utf-8?B?ajI0R0dIVnFBMHN0cDU3Wnk1WVQ2cU9VZGpBWnErVUN1S0p1MEkrTkJyTjBp?=
 =?utf-8?B?YkZuSmJ1M3RUemg3TVdPY0dVREFEZjNSOHBLb1M3TTFxYk1DUXl4QytVMURM?=
 =?utf-8?B?MFI2MEFIYm9SUWdMVVhRUUg2a1RMTUt2QUpuK2s1czhEUGlFdWNmM1lRMHI1?=
 =?utf-8?B?dVBnMWxqSVVROW8vVS90KytsNTlDdHRNK2RSaStrbVpya2F4TWxvb3kveTVj?=
 =?utf-8?B?SEtTYzlrc051TDZ5OXZiTVpSWW12LzVKUkVTNEh3SDhaNU04dzY0ajlKc1FK?=
 =?utf-8?B?Mmw4cTJ0NjhVRVdGZHFvcFNVS3ZPU0tYRjRveHNXR3A3K3JOb2ljRG5yZEtG?=
 =?utf-8?B?RXl1cnRKdVMyb1U3T0xtelVmWm9WMjhjdjJ5SDA4Z2xhU3FWZFcrTm1GRU8y?=
 =?utf-8?B?R3YrSFVjTVgyN3B3OXFZR2FsaEtuaXg5NmVhYXdrOVFpd1J0WGVzN3pQdHZD?=
 =?utf-8?B?ZTltd0ZPeVB5S2hqY1hqcXM4dEVJbGhaTUZSbHRpUElzTjVza3Q1VGhaZCsw?=
 =?utf-8?B?Q3dCM0tVaG1PQzIvblFTVUF0Q2JrQjJnaXB1NER6SFIrZDVGR2RnZ1VodExn?=
 =?utf-8?B?bUpaMHplU3VweDh2elJJSUtXN1BtSGhQNnNEOE5WZ2xLYm13MHZzVnYvWUln?=
 =?utf-8?B?TTRqYlVzV1pHMFdQZzVTSFFTM2l4V3VkNjcrR09vQU1VT0NJUENZeWYxelZQ?=
 =?utf-8?B?dnYvNXVnOU93R0RWeUpSUWd3VXFjQWpLbW1LQjM0R0d6dnRZdFU5OVpyMWd3?=
 =?utf-8?B?c2k2ZUtwa29adG4veG0wS0YzZk5GSWljcEVvRkhDRElZOWNUUDVTTmhCbHdh?=
 =?utf-8?B?R1R0TFZ1eGhUQXc3VWFseTY5NnRrQUhnWE4vRkIwbys3dEhsWTNDUVcrcXFV?=
 =?utf-8?B?dWtuQkx3eHIzekxyWG5vaDRCcC9vZ09Gd0JUWjNlQ1V1VlJ5V2ZYU2xyWkhZ?=
 =?utf-8?B?Q2RmOFFmMkhPOWFvQkc0WGJSWXJ6YXhiaXVqM1Q2b2h3VlpHVmRPUTZQYnNP?=
 =?utf-8?B?N3BOZGJHQVJ4TWtUdjV4VVE1c2tMajBoUkJJYUtUM211dlZIbjNWQVBDSnhS?=
 =?utf-8?B?TjlvMTJYTTBUTkNSaDRuNEl4MzFVYWJibzBxNnhob21VbUxSZXJ1dEM1OU8v?=
 =?utf-8?B?MG1GNkJXUmNTSlk2dkEyUHdoY1ZtR1JrbUoxNndCa3JJSzM1QWw1ZkMzWDlp?=
 =?utf-8?B?M0s5cUlFanlPUmFuYXdScWlHd1ZlYno1NEk5YTlwcU9YamREOFQ0S3lvbkcy?=
 =?utf-8?B?dEdOYWVKZ0l2M2t3dFZDNmRiREQwRTA4R0U5TVhEelNFc1pCbElPaHhlMjYv?=
 =?utf-8?B?ZHhHS1gzTmNWNWo1Zy83ZyswUlpxSmhyRDJ0Z1huTjVqbHdOUmIyM1dtYkVC?=
 =?utf-8?B?Q2pBN3VQWTNaTkFWMVRuR0M1TnNZUDNBeWNySERkVXpTbTJxeUNTMThtY0Ew?=
 =?utf-8?B?Q3Brdm95bHBxRmFtcUR4NGd4aWNqd3V4elV3SnhZdE84bEhDaE1wdlZTRXoy?=
 =?utf-8?B?WG45Q3I4aWp4aXMyVnAwQndtbVk1bkFER2F4UnZtbkEwR3JaaVl3MXptSzgz?=
 =?utf-8?B?OEllMzA1V2pkT0pQdTJGbTRXMy9tWHMyRkhYSnZzY1kyR21OSktCWC9OeWZl?=
 =?utf-8?B?ZnhxdXZQU3hwdnJ0UndHUW5aQllJSEpXMHJRVnF0ZXhic01senNhY0gzL2dV?=
 =?utf-8?B?cHM2blVmRnFGcUljcU1zR21RZFQzd1QxZU1lYXFoaUo1UVppNk1EZ09icExN?=
 =?utf-8?B?NDNxUG40cGFyRU5MUjhEQnVacjltclFhVjk4NmVjWlJDbXVYa29Eck5MdDZQ?=
 =?utf-8?B?aUJXR3RhNWJaaWZlQkJ1VE9abUtyamJ4TXpDQUxEM09LYUlLWlVCRUFNTXQ0?=
 =?utf-8?B?T0MrenpDVUVPOCtFYXhaTCtDenJLV3FucDdod2IxN0wwZGxUZlIvWGlxZEdj?=
 =?utf-8?B?bGdZQUlrZXNmTmFuUTY4OHBtd0xnL3A1SFo5ekt0VjBaU0lMNlZQOGVieDJj?=
 =?utf-8?B?OHpxRzZjdDJqamhMbktnVkhvc1RCeTcxdVA3STBkOVhiNWpMOC9NTzlBQXlK?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: eac846ca-1f56-4e6b-76fc-08de0c9fd706
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:36:18.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTB+Gkj9S7ve5OtWivScTlC1ehWVLVobLkk4STb7vQcYQIbIhoNw0X8ws0/2hmW1QTWWmigU/VC6TyWBWYOIvgrUCuLza6zjCq+kkz4jfPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10438
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 10:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7736

Hi Antonin,

On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
> class.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 68edbc9dd..d898034f4 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -968,6 +968,11 @@ software that uses the GNU ``gettext`` internationalization and localization
>   system. All recipes building software that use ``gettext`` should inherit this
>   class.
>   
> +This class will configure recipes to *not* build translations if the
> +:term:`USE_NLS` variable is set to ``no``. It will also do the same if the
> +:term:`INHIBIT_DEFAULT_DEPS` variable is set (unless the recipe inheriting the
> +class also inherits the :ref:`ref-classes-cross-canadian` class).
> +

I think using a list here would help with readability, e.g.:

"""
This class will configure recipes to *not* build translations if either:

- :term:`USE_NLS` variable is set to ``no``, or
- :term:`INHIBIT_DEFAULT_DEPS` variable is set, unless the recipe 
inheriting the :ref:`ref-classes-gettext` class also inherits the 
:ref:`ref-classes-cross-canadian` class.
"""

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


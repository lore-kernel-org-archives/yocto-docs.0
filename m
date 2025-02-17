Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8EAC0219E
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 11:10:59 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.35])
 by mx.groups.io with SMTP id smtpd.web11.48743.1739790657360012882
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 03:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Bebry2sh;
 spf=pass (domain: cherry.de, ip: 52.101.71.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF8iOZzbfHw/ok+Scqs7L8jRtJtsF5qNV3EIjQQJY++/4sxm5x3kC7gQXd45YyyNUb+yGSnW6iuhlpupXkXytb03OFTvSj/W+CziUaeo+EiPMF/L0V2hSohH3ZLDNdkQvgwp55IONoR167PckeKDE0B8byHML/HjIz7SME/cqPkej8e2h0fX/ZlGPrMvBhPgJXO9oDnnIQie2to+IsvePxjSMfpgLabIIO7SPcMjsOwQW1qiTw0gXiZwGoE0VSdwkQDlIO5oiMSWIu5PJBXEjFLZPmLuWNvTSKOiuQyclFOh5sKyEmxBnLetZ/cOQA20Ip24s8uFUhAD+hyYWH0QJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDjnvDvhewN0myxwVlq03nOCZbE4KmKLZ97Za8xs9TM=;
 b=yg53t33UmNLeARsqj9DvsVm7T/fZPq1csvkorxe/cwfF03fSPY+sBGvdQCXkMebFZPpudNrCJrt3RHWe1iDccibKVJ3s/Z1pG2SuOGfEwyKPTSLbJv5XcIxnoWZjXovrTvatewbA1sqGfkIqjIdKAjti1yYFF/q86P3mSzLsEVGpPSvy5RX06HJrjt2f3mrGYWGfgKg1MNIP46gx0qQTeOFISsM/UERc2zA9LX69Ah8Fu2fWvA9BzRXRuvY+ulMuIEBcn+TGUsoeob7tB4cNv5KSHS1WZYlsYIYS0I/gZM+ovCN97ubXx57M5dWbbmtNqUWHZRqxoGdukh+idWTh2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDjnvDvhewN0myxwVlq03nOCZbE4KmKLZ97Za8xs9TM=;
 b=Bebry2shexgspB7/OwXM4QLZscbGqoCTzVG+w7SjRArN3yuDDdECQSBMmZTE7D0k4BvgJmYDP+S8oB6iCcT9L1h4BDlQY5QT7E8l86ZOkCenJIKdqE5DgTIT1kt/QvXQzox8igdsGSN7aolcNhNKw34e/QNnupN412o5iWi1SxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10965.eurprd04.prod.outlook.com (2603:10a6:150:207::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Mon, 17 Feb
 2025 11:10:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 11:10:51 +0000
Message-ID: <570e660f-2149-4497-9740-7d4cacbc84cd@cherry.de>
Date: Mon, 17 Feb 2025 12:10:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 3/4] reproducible-builds: add a "How to" section
 with OEQA* variables
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
 <20250211234738.2633971-3-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250211234738.2633971-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f10767c-a275-47a6-d3d6-08dd4f43bd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wk05RmpJMXdQOGgrSXdoSXdrcXdMRGQ4ZExBK0J5T2FBOERZRkpMM2pham9K?=
 =?utf-8?B?NFNaQkQxb1ZKV0JoSGJ1SXdRNlpxZFdTcGJKWjhOUmRLc2wyNjlFczIxdGJG?=
 =?utf-8?B?TmJydEU2aUthMEx6Z3dkYmNBWDJYR1dHTlY3NWwvdDRhK29PMkh6Z3NUbHpZ?=
 =?utf-8?B?dHpTYVhnU3VZYlE2dzNMNXQ2SGhLRDBLQVA0dTFZMm9kbDhYR0p3ZFNBYnVV?=
 =?utf-8?B?RFZ6aStrVE0wQnZnYWNvZU5wVjZXOGpPU2MyWjF2ZVdWWFlJamhyd25ydEJO?=
 =?utf-8?B?YmtpbytwVmlsVjkvcDFHb0IrTmpkTFFmSFR5MERoRk1GMTNrMVBabG03R3RL?=
 =?utf-8?B?YW9lZVVQK0ZvNnYzMlloWDRjTnlHcmRncDN4Q1YyVzVhY01DeE1LcVFQOVUy?=
 =?utf-8?B?clRCdnd2TXZieGlITXdUbmlVVHZjYlRXU1V3S2tKbW1RT1A3b0FUVlVlQm0r?=
 =?utf-8?B?R3J2a3kzdi9rRXd5Mkx5aDl1a295K00wMDJqNjRoUWRJYUExbDM4ZGIyanV0?=
 =?utf-8?B?NUtSUU1xVFFXS2NLdXVtVFNZRGd4eWl1QVptTzBHaGNxZ0dpME80VnFGNm1R?=
 =?utf-8?B?VnVYekVpL0V3WDlQK3B5RXlnOW8zUlI4anc2QmczNW1qeTJDQ01zVjVJRU90?=
 =?utf-8?B?bFlwNTFjR0xUYWxDWXZxZUdyNjdmUHlGRU5zT0VvdWFEOHh3VHVsekdrcGN1?=
 =?utf-8?B?WExmK1BiMjlpK2kvTmdPMzhyV2NCeFNyZ3loQ0hXdjAxWXlFWUFSL3VwcGdN?=
 =?utf-8?B?azFTcjAraU1kUnA2K211Y2JxSko1UDFUTmtDTkhwVWZMdGxnOXNWamdMVG41?=
 =?utf-8?B?SEhnc2ttWENvMjdqLzc0NHlaMW15dGs1ZS8zbVQycFJ3TzBRdXJnbEpKM24r?=
 =?utf-8?B?QzB0ZFJWY1B0Lzh2dWlObi9rUzZqckQ5YUlQWWQxVys1cWlzYXV1SlVRaWRx?=
 =?utf-8?B?UFNweDdZWGhFazVnd1lhWXBvaEtqNndwclpUMSswNnhlNGwxczZDWVcyb1Qz?=
 =?utf-8?B?RGlVN1Bwd0lFV3lRWFJUNDFEMjhSQ05FSndHQWdxTm5pODUycHlMa3hZL05I?=
 =?utf-8?B?bU1abWZTY0U3b3VKcXc5blU1ckUrdXlxM090aXljdFJaK2tJM2dROEhQYlNt?=
 =?utf-8?B?Z0FvUEZjZDMrdHJHQnhYa0VVazUxa2tlejAzK3hVVGpxRUV0RzQyU3ZLMHlI?=
 =?utf-8?B?ZitNUXBnNHF2M050aUdWOHlXWnYwRm51VjFmeno1blpNdVhETXpUajBYa2Yx?=
 =?utf-8?B?UTdod1FhMGd5dTAvYStvV3M0SEg5bFhzYVBic2d4WUw4Rm11RFB6eDZlNmF0?=
 =?utf-8?B?bG1QWTlTdldTVkpmUExOU0NzK2ZiT29CQVNadzNrRmdMTTA5bjBuOGY1U3JP?=
 =?utf-8?B?WEdwQ2x1Tkh1bGIvSU5MNmFIQXUrY3ZRcjF0K3Q1NzRkcEJmbWNxcEE1MVlh?=
 =?utf-8?B?aHRyOWMvUkF6YVJ2SEEvUzhoN1R4Mnd6SWFLWExUbzlyUU1DSCtLYTl5UzRj?=
 =?utf-8?B?VUhmY2NpdmM5eFhrVEYzOWVLWWlDTVVyY2luWXJxWkNpS1Vka1I1emlYVEZn?=
 =?utf-8?B?MHYyTng2cG1kclczK0FxZmJwT2dhSDZxZmdYUFo0dzgyNTBMMGdCd3RZVG5R?=
 =?utf-8?B?OS9ySUJzaGR2cU44RFBtc0ZOVnVqTjlodjYwZnZnQU84SXNXVGRkSk9UUjNL?=
 =?utf-8?B?QzA3MUlrUmlYOFZPZ3ZoVElGeDVTT0ZacW9NSjlid202Z3FGYmNEZkZ6S2ZO?=
 =?utf-8?B?UUIwTDd3dFN1S3h2ZkFBMENudlRBdFRCbGNRYk5lL3V6R2pMZ081QXZ5OElB?=
 =?utf-8?B?bXB6bDRValo3bzN5TGg0bzlHUDZYOEQ0eElNZFRzNFNBam1lN21sb2FiM21E?=
 =?utf-8?Q?eg6ocfiqCuC53?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjdicHZ0OERxMFpJa1Zjd0pxeXVHMG9FUmdtejF0UjIxL0xOUlFxNU1aL0o4?=
 =?utf-8?B?Q3VkNVI2ZkdOK09wMmtMMGNRYVJkZWZsMTBTL3M0V0xyMWtVcEEvSXlidFpj?=
 =?utf-8?B?cmpMV0lRK2tRRjNXQ1NJR2RZRzB5RVJBNlEvUmFNcUE2L0ZBYjU4MGZURUhw?=
 =?utf-8?B?U0JKYXdpSFl1WkZpa2dka3JQbDZwMXhRcVptTU9nSUpuYkVvVjYwT2xpN2hs?=
 =?utf-8?B?S1hHTTA0M0tjVjhieFh6Qi9tc2Y1SXNIa25xWERsam5tdk1Fa0g0bmxJSHNr?=
 =?utf-8?B?TlpPOUNRWmlmMWxqTzVPUnBObTJBdi9LdWkxLzZFaDU0UXJnSE05UUEzdUVY?=
 =?utf-8?B?VGJsU3dOUXk1bEoraHFHcXNtQ0wvR1p3YTIrQlhxeDg0SUZxazVNWEp5MTRI?=
 =?utf-8?B?aStvZUV3Z1JCbUJrZGlGbmF0aC9ieFRFL2FnS0R3WDM5MHNXTXM2MkY1K2dq?=
 =?utf-8?B?VUZheHloKzZWSUJsRm83bUF1Y2pidi9wMUtqNHprUTV2bHc1UHlkamd6bzVQ?=
 =?utf-8?B?TEQ3OElmOTVPam5kOVRXdjlYV3J4Qm1iVmVoTENvVXFxOWhPaVpEK2dzUlE5?=
 =?utf-8?B?QVFUNVozYWExNDdod2JlM3NhdnAvbTY5SzZyZXlkcENna0diU3M0ZE93WElO?=
 =?utf-8?B?Nkd0eUdjb3BHcU5NL2RFTi9vUnNBNjFiNVRxQnRJTkl4RmZtUkFBVktnNUVH?=
 =?utf-8?B?WFZQRnU3VGREQ09aQTUvYjZOOVBhSTRkcXQ5ek5WeTdDV0RpRWYyeXdQQVBn?=
 =?utf-8?B?dDVhZGFtOEVkMjd0VkFuOUNJT3R3dXJZUWxHbzFZNVBLWis4THZaMU1rNU5h?=
 =?utf-8?B?dXdtSnhudnVHejBFa09pQ0UxMU5yT0R4Z2ViS0htSUNLRkw0SUZlemtTblNm?=
 =?utf-8?B?ZjlobGxoTEk4OTk4UlhLMkgxdWRsSnBZMjEwdVRsTER4Sjk3L3FWRU5hbHVk?=
 =?utf-8?B?Slh0aTdmMkhmMThFRmxiM3A5SlM4N3V0THByNXBlakpmVXlWMFRUUWVlNHpU?=
 =?utf-8?B?dEdFMVlMSmI5eDhlcUpvNEcvVkprNGVUVUs5OWtYMENnRzlJZml3SUVpZHZK?=
 =?utf-8?B?QTdhQjAzcldSOENQUGRUNFpHb1hkSjd4am9iLzBVTTJ6enRCN240WWVicUV6?=
 =?utf-8?B?QmFNdVNYNDBpU0J1UG9KQzlHZCtsWEJLUWZhWDY4WmVER2ZjYWJLNThNaUZy?=
 =?utf-8?B?MDMrdm9RMkdqSUZwcGtnTVFWdndGTHpXQStlMTAydWMwZDYvRXloK1VlTStl?=
 =?utf-8?B?V3VzSGw5am1kSUM4clA3SXA1RW9oSEdLRFA4RDZZbWZ4clVCNXlNZytrajlz?=
 =?utf-8?B?Z2Q2Z3BJVnhwWnhPWjBKUlJmc3JCcXhvbHpTSzd3VjBFQjdBaUNwbkRMamEv?=
 =?utf-8?B?Y3NQa1V2VUNINlpPZXh6ZUVZZ2hDV05KSzZheDByYWtRenZBZW1rQ21qZ0J6?=
 =?utf-8?B?Z1ZnakpCd0dnTHovUGVUVURzM2dlQ3JqMngweVVCNlVoSS9ybjVUaEl4ZDBB?=
 =?utf-8?B?eXRMaGhHTXJrVDR0VUwwQ0tubldEMSt4WEpFSjJXUFl6eFFLTWpRbVV3dm9S?=
 =?utf-8?B?LzJBWUhRbWdaZEJydGJzKzhDVlFiSmJxemxNbm5sbTJNREF3RGRTOGV1UmxL?=
 =?utf-8?B?TU1OcjV1TWk1UGpmZFN4TWdCL1B5dVhrdXlrR1FKYnU4R1MyeWJSbUVReThm?=
 =?utf-8?B?VHZGbEd6OUMyNVdrUTNaWm1VZ3I2Sk1UQWpSWmdscjVpdEdGaGRHNnN1VlJy?=
 =?utf-8?B?UmlDa0VWbUc0MjQ1MkU0ZjJPY09ickh4bzVZODdOeTk3ZWpCL2tyZnd5WXJX?=
 =?utf-8?B?cm9TUW5qMEI0L2xGaFdLaytzUklSQkI0d0N1Q29SaGlSN1BSQXBiS2IwY2Nx?=
 =?utf-8?B?OUpkZHZ2dnpXbFZkWVpuRWJrbVY4TStibUpmK1hsK3dTODNEeHViMUFkU0VY?=
 =?utf-8?B?QW03S2lXWVcveWV0UTJHTzFLTnFFZk8xZVFoR1NnY2UxWXJpeVpTSWdvekU0?=
 =?utf-8?B?RkhCMGxzSlFmbVdPbHllQVpyZC96NmNYMllaQUk2NE9oVkVOaTBEK3NHWEQz?=
 =?utf-8?B?ZkFyYnU2OERJMHNZUk5QclpmNUZlQ0RqRHJBSHBGRU45bzh2T3hjWDZlMzlY?=
 =?utf-8?B?RWxiQi9LdkU5Q0pIcC9mREZ2WUZJSzVxeE9kaFBpWWcxcHdhNXdMREt3UWlB?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f10767c-a275-47a6-d3d6-08dd4f43bd52
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 11:10:51.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XEfzvfjJVR9Fxifeor73cuvXPL4DMrGj+7YssTv+DdboGRK/O8pOgLOVSvOrZMS+gtwRxbtFDbPpAh8a4dqOzp1gSDSJGhqBL+4tBJIhDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10965
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 11:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6378

Hi Yoann,

On 2/12/25 12:47 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
> shown earlier.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
> v4->v5: Quentin's review:
> * use :term: link in title
> 
> v3->v4:
> Quentin's Review
> * make missing dependencies more explicit
> Guillaume's Reviewed-by
> 
> v2->v3: Quentin's review
> * Double tick quote variable in title
> * Removed Guillaume Reviewed-by (given privately)
> 
> v1->v2: Quentin's review
> * tick-quote variable in title
> * a set of recipeS
> * 3 spaces to align a code block (not 4)
> ---
>   .../test-manual/reproducible-builds.rst       | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index b9f671d68..b913aa4ea 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -145,3 +145,23 @@ set of recipes before the test, meaning they are excluded from reproducibility
>   testing. As a practical example, you could set ``sstate_targets`` to
>   ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
>   run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> +
> +Using :term:`OEQA_REPRODUCIBLE_TEST_* <OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS>` variables
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If you want to test the reproducibility of a set of recipes, you can define
> +:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
> +
> +   OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
> +
> +This will test the reproducibility of ``my-recipe`` but will use the
> +:ref:`Shared State <overview-manual/concepts:Shared State>` for most its

I think this is proper English, but it itches me a bit, feels like it's 
missing an "of". Up to you to add it or not.

> +dependencies (i.e. the ones explicitly listed in DEPENDS, which may not be all
> +dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other
> +implementations).
> +

Same remark as for patch 1 in the series, with that:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


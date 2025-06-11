Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D79C61CE7
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 10:23:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.web11.4382.1749637420743584250
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 03:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RK9uytc2;
 spf=pass (domain: cherry.de, ip: 52.101.65.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obq2iBdJpyMlTOBm3JQGYj9qydzknNr7KU+4wtytaCaoSvZ8BgJ61WRIkZbz/ULZgvttpQaPsPn1Wu7Q9L/QybilebDfnisfDwWVR4egMFZmRB373xIoz32JD2uOKL6UlnBJIKvOUOat/TiBvCBjhc0jfRMZTNvmaw1/XYa53EGx4R+57Reev10sWKN2gtLtkB3BhusnTEP0vZvctRaosUJJ0omt+sn5cmhNEGJBxj3R4ULtsUDBDtN/akwFEnfkQqrcTrAzT4SDqd/W74BujHanOioG51M9oXt/SI++Qe8I9avKKmtFtc/Ew+Q0yeidBoVUFCmfSiLu+0U3xEqlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T802tNwn9MimSU0ZfO3GaBQHNvnmuY+EAgPZwSH6ejI=;
 b=iAMkR3pGr5XklAp7ClnYhT/G65Sf+H7Me96yRze74MvkCwEN/sA+eAze34dFEjOC1LCXC1TnoA0pdY/VHf/YpIxcVuKX/f5i2Cqg6tCTWo0xLIV+RcQMz9mXNkRe+Sz/d00glBDugiLCNw2DcjuYPFHSGFpgMKcG1HgrUBTJj+iYVE6reB4RsFpwtima4b0bobP4vqFVG5+9HeDLqrcAwYswmUsGHqaSBHdL8oaSIrnAGx60lLg/TtQWoJvx3PiNqCrEdd52YciN3zvOOqMJjs329uNBRlbISUZwHTKg0/SYenLytjKSKLRSWzMUqVV3Bt0kdNhgizPb4SgOPy7gWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T802tNwn9MimSU0ZfO3GaBQHNvnmuY+EAgPZwSH6ejI=;
 b=RK9uytc2CaC2q+ym3GTj9Ijli3i50lIyl67Ue+sHGHJwBbo0VXB1bbaMajIOIH+pbUjZs6EuqtDkD3rMc3VTLzBEeYbgNo2xx+re59J6sVV/0cia2XNH0MThRjhNktGFhCqr3qDbq2Q7Bq8ZxF+z0Szq8i1t2bIkS0g58xo8X7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 10:23:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:23:37 +0000
Message-ID: <06189ef1-544a-48e4-97e5-bc9a4f934f33@cherry.de>
Date: Wed, 11 Jun 2025 12:23:35 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH][ref-manual] clarify definition of PROVIDES
 variable
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <6686fc57-f92d-8c76-704d-ebc5046561a9@crashcourse.ca>
Content-Language: en-US
In-Reply-To: <6686fc57-f92d-8c76-704d-ebc5046561a9@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:803:64::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: b56e4554-fdd5-4b43-4d29-08dda8d206d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlhqQ1YybnRuRU9mVUVxbjBIQy9CSE1qWmt4QXE5cnZWMmVOOG10Njg2eUMz?=
 =?utf-8?B?SjM2V2h1eEE2OFBkdDh2czEvd09FNmcrdVFFZjVKS2pmNUNIWDdDc2w2ekhM?=
 =?utf-8?B?TjVISjJYeUN3R3prd291UW9RajB5UWdEZnFvVzI1bXk0dG1FcWVXWGQyZ0xL?=
 =?utf-8?B?SnVMbjQxeGhxcUh6Vzh3aWpZS3Jja25RcDBRWFlKcDZ1NzJ1bzFTMy9kckdr?=
 =?utf-8?B?dVFERWg1MWlxcE9CNk5YWE9oRVZuR3ZPc1ZHaThUQVYwK24yMXR0cnEzdjI0?=
 =?utf-8?B?MDZBY0VKN3RkOXdIdUpWTFpSa0lyTHNKY3hURXRUQldsMDVWdWM5emQreGxn?=
 =?utf-8?B?Y09MeTJCTU5oaUhVMXVpWmZWZlNBaE41TXVkc1AzQnhLN0lnL2dGdkNpMG1Q?=
 =?utf-8?B?em5ISTVvMHA1RnlwRDVqSGFCYU1mTWUvRFZKRUhIa1IrZmUvTGtIRG16dmVi?=
 =?utf-8?B?aWxxcy9YSmJQK3ViTUJGdndJZGdhb0l1S3FxVHZqcVNlOFZ2QU5zU1Z5OVhx?=
 =?utf-8?B?aWdXUVZ6NlNYdmhBV2grRDhqWHc2NjNNb3gvK1ljYmRWY0xVTzdOM243NHA4?=
 =?utf-8?B?SUI2c0FmQWtlWk1xRitvMTNBSGcrMkIzNVVBcWxzYkZ5cDY2d3YzWXNuRVI2?=
 =?utf-8?B?eGlnZ3dMQlpXbVFhbFNMOUJCczdBUStndE0vSEI2endGbk1ibFE2ZWUxTzlq?=
 =?utf-8?B?dW1YN0EvbHppbEpCS1FNSzRHaTlRNGJYVG9vZUlTR2JzOSt1cXRuRXNwellu?=
 =?utf-8?B?ZHpRcVNUcW9QYzhuQXlSNEgwS2IzQ3JzbDBtdm11UHNjRDgwd1RTMDZ6YXJw?=
 =?utf-8?B?TkU2QTZLdWNVWmlXQWN4TFI1SXdvOGVxMFdaeDhuVUd3SUZ5ZXJYYkZlL3p5?=
 =?utf-8?B?NHBGWTRqS3hLOHd1T0QxVDFZMXE0UWowcHRTTjV6eDBvMHBUQjdIM1RxM3F5?=
 =?utf-8?B?NElaTEdVYmlLNE4xSzNKSUpYMjRnMlVKd3FjZ1FGR0JSODFEZVY4VzhnNXBY?=
 =?utf-8?B?TUZLWVpkc1FCTWFSdm1VTnU0YWJDNVJpRW1ldkd3ZlVtTmt2SjFJMTVCWFRR?=
 =?utf-8?B?ejBVYUlQdk5VNmdISDVQZndOaWlmMGJnU1B3R2h1SGlVbG5ObytyREFObTJS?=
 =?utf-8?B?QWJac05kaURndjM3ZkFXS0x0c3pGOGpmN0xSTDlvZGtCMExaajBNMFJXNVVy?=
 =?utf-8?B?MHdoTnl5c25ERWFrMTE2TldtMC9yVVo5Nm15SW1lb3dNSVc3RGVGSjhqM3Qr?=
 =?utf-8?B?MWtLN1p2TzhyODZBTzhFdmVZTWR4SXhhaTlmdmxxR25hUzNEclI0OGVveDJn?=
 =?utf-8?B?T0d4RTFCQnhjVU5rNU9OZlpCeWdvYzFXQVlLci9YdVV2eWR6cUw2YzJzSUZR?=
 =?utf-8?B?YWlQUWtmQ2EyRWV6ZWh5NFVSTDdJL2pCbnNyU21zTlh5ZXo3SENFV3NQbDJM?=
 =?utf-8?B?OHhaYUVCcm9USENyM3UyaGZibG52Zk9EOE9VNHBFWDVWcnpVS1lGSXFKSTRm?=
 =?utf-8?B?WjJkK3RyZkFqR3phdlAwcE9VTG1vamJNK1lTVVkxZVhRZ3BMVDFIaS9mYXNh?=
 =?utf-8?B?TVNxMjhtSWoxUmxYN0Z4SGtDVW9aamUxUUwxK0NmTlQ2VlJVZHpCeXozMjE1?=
 =?utf-8?B?RUExQ25Kb3ZQSE5CckRSMk1jNHNGdUdlKzlTLzEydUZzVm93VjdBYk4yVDZp?=
 =?utf-8?B?QUtuQlJDRWRvMWd3YjFBNUFpanpCK0lzM014SXVIdlFDWlNSM25LL2kzU2ZB?=
 =?utf-8?B?cHVZQ3VJaUtIMS9PU05oS1g0WVBLUmhwTkg5Ukx2VDlqR3hyVktQZjdwSW9S?=
 =?utf-8?B?VGg3MFRVbHlaaUNrbUY0c3QwV0JoZlBrdjY5Y1RRWVJ4NENvUWM2RTZQM0dW?=
 =?utf-8?B?TUhDcWtJUzRPSHFNRi9hK2hhTGNSbmUyQiswcitTQWZ4YXptZTNsQXYrT1Mr?=
 =?utf-8?Q?KfhoevggqKo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFBTRW16Q2I1SmRsNkFBOVZpSjROdEZPNlRGVi91TmlEM0pJV2Z3bVNNWlFE?=
 =?utf-8?B?RWsydkprVnE2REVDWkNzdnd3Y0s3RDEyUm1wdkVHcjN4N2F1c085cVpLQXNG?=
 =?utf-8?B?RVpDQ2xoVGZ5Z1lQSlJ6VVlDcm1FYmFWNWc3WXAyWGFpaURUV0tyTmtlUGU5?=
 =?utf-8?B?cklhb3BrZFhmMHdWSUZQYzhZeGxUcHRMMTIxazhPMkx2YmVDNUtVL3A0Mi8z?=
 =?utf-8?B?THV1RlBDdkNOYzFvU1BuK01TVHRxVjhkbVNzdlpYbDY3bkt2bk1QdXBlVktE?=
 =?utf-8?B?VkRmUTJTeEp1SnNFQ3l4MjVhS2EydUJxTWdraldwOGlWZnpjc3VCd0hwS3VZ?=
 =?utf-8?B?RDhSdEl5UWN6bFM5Zm1iT2luRDAyOUd2cUpvN2RKanlQbTZZbjhSbUxDYS9B?=
 =?utf-8?B?eVk0azY5WktkSlZWSCtXdWp3MVFzTk9Wc0RETHVWOVhoRCtnK2ZubmsrMXB1?=
 =?utf-8?B?azRBYkR4Z293UHNPRThoZHVJMWprZXlnVjM3d2syVndWa3laMHJzUGRqcHYr?=
 =?utf-8?B?dGNyQm5qU0wxa2tZRnR4VHdRbFYvVU1TclR1MGxiQXM2UDNJZTdDNCtXblVQ?=
 =?utf-8?B?TFFCMUxxM0h6ZDgvU0Z0WWJTVVM3TkFsbW1UdDE2eXU0bWdxSkErSHRWUUFX?=
 =?utf-8?B?OW9TOHJiTjVES2s2TUY2YUhyZEcyUjJNdnF5UnhvRk9GQ1h3Rlp5UXFGamRD?=
 =?utf-8?B?OFJvUUtDSXBGdlNaTkt1VjArOE9UTWhFNUQ0dkp6UHVXV3UwUHNIaml3OVhz?=
 =?utf-8?B?WTgyNmx6dGlCZ3pwNkRmWld3VHB2bzBSUXRzd3pvQlQyR25oaGdrNURNMzdM?=
 =?utf-8?B?WktjRVg1a0twdmJNeFJEc0ZjWVZzU2NHQnVOTFNxTmNPb0dDTEJaWVYxYXFt?=
 =?utf-8?B?VThJeFpBM0N4STdEZWZsNkhKWW5vRk9UNlArMi9TN2tOZVVPWnh3VjNaa3h4?=
 =?utf-8?B?Y3hLVDIwZEQwM1owYnJ2N005V2VJOE1pTkpjSTdYVWlHUFNFN1Zxd01obTZ3?=
 =?utf-8?B?U1BnMXY3RGtXVTNKMW45bHR2NzFWYzZsU0JaK3ZzNFZRbVM0WXBSY3grVVlF?=
 =?utf-8?B?ZldJM3ZIL2ZPN3lBWVJIaHJDRVoza2swSS9wVFZuRW1XejdNTnU3cUhDdUdw?=
 =?utf-8?B?MExIdXlUa0VBTi95Mm9pSnBjOHFpaEZWVHZiQUFvTW5CK1pHMlZJTTh2OW9l?=
 =?utf-8?B?ZGJKdmUyUnE0QXozcmNTWXV1bHBzM2oyL0YwT2lRWmNOQnBXdURzYVVDS1ly?=
 =?utf-8?B?TlFrQ1h5OGlIbEV0ZUVyOUZRYXhuUk1LTGt6cjB2c2d6V1BZMVExRVB0QmVZ?=
 =?utf-8?B?KzRXUlNQd3FENXdMdUQzQlNMdktIMTNaTGduNzBvMjUwTWVBUjlQeXVZMDJJ?=
 =?utf-8?B?VTAxdVZwejNvSzYvWXpyY256QWlFcENQZ1BSRms3djQ5bTZVK1J2bFZORDR1?=
 =?utf-8?B?MzhpK2ZkZi8zZTBxUzVuU0VsVWJnZjNYUVR2NzF4WEExU0d0azFvMEVTTG1L?=
 =?utf-8?B?VlFEQUtpSmcxaXp5ZnM1V0Z5SndhN3IxN0IybW1hWSt2Q2xIeGpzM0NWaHVQ?=
 =?utf-8?B?akp2bUFvQzExM1NUVjBMNjVuVTBBRHdTRzlZY2FaSGNBb1ZRLzlKeDIrdTNF?=
 =?utf-8?B?YWM1RHBJcnFYWG14MElKZjJQUjBwK2lNb0N5eUVLcm9zSjlJRW1iVDhvZWQ3?=
 =?utf-8?B?WlhMdE5DclZqYS96Tmd1Z2g5cXBUUWN6YlVmNXFsb0VJNnJsVG1lMTB1R29L?=
 =?utf-8?B?c0FTKzJQRUUwWVU2M1d2eFZEYmFXK2lad3Q4VnpVdGw3NlBNVnVQQ2k2OFFQ?=
 =?utf-8?B?bE5scTJldFQ1RndYZ0lPUk5iaGdsM2Q2T1BSZ3RoN0l2elFLWDVyQmErNlNp?=
 =?utf-8?B?a1RqSjd2bWpNcTNoekcvUUxaNkk5ZGtoTlgxTFBUR2xZemY4bGo0SFdjVE1W?=
 =?utf-8?B?VkhaeHo3bUlLTFo5US8wVEk2c3VHdjRDaFhZQ1ptUlMraG5BV0M3RVNRUTVQ?=
 =?utf-8?B?L0FkSW9ma1hqVUVTMnJiZHVhbTBDZnFGcmlxcEtsVXlyUlNyb3M1VW1HNXoy?=
 =?utf-8?B?Nno3c3ZleDNWdk5GbCtvdWVvalhITk0vNXB2Vkp0QzNTSnQ5ZEtsRkplb3BP?=
 =?utf-8?B?Rnp1eE9jeHJGTFhNM2NMMmFwNzcxR09ZSlJFZWh2eGVFc1d3d1NyZFZ5bGo2?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b56e4554-fdd5-4b43-4d29-08dda8d206d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:23:37.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyj/M7aLHayfa0wJkmXS+Qe89nkz6DPKoIhZylHj6clHsM2bT/rtVk1XCAFMH39AMczUfIu9aa1TamDJD5Ekv+TbXmdsTitgqPh0sFD4Unk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 10:23:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7059

Hi Robert,

No need for [ref-manual] in the subject, or use:

ref-manual: clarify definition of PROVIDES

if you want.

On 6/11/25 10:49 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Correct the example used in the definition, and add a bit more detail,
> including the use of both assignment operators.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 5c18b852d..2d3af4966 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7411,21 +7411,25 @@ system and gives an overview of their function and contents.
>         provides itself. If a recipe uses :term:`PROVIDES`, the additional
>         aliases are synonyms for the recipe and can be useful for satisfying
>         dependencies of other recipes during the build as specified by
> -      :term:`DEPENDS`.
> +      :term:`DEPENDS` without needing to be specific as to which package

recipe != package. PROVIDES is for the recipe, not the package.

> +      provides that dependency.
> 

I still feel this isn't making it that much clearer because we don't 
make it explicit that two recipes can have the same alias (which is 
actually the whole point of aliases). We do explain it in a few 
paragraphs though.

> -      Consider the following example :term:`PROVIDES` statement from the recipe
> -      file ``eudev_3.2.9.bb``::
> +      As an example, the term "udev" refers to the Linux subsystem for
> +      managing device events. Depending on how you configure your build,

I don't think udev is a Linux subsystem?

I would reword it to something like:

"""
As an example, "udev" `Linux dynamic device 
management<https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html>`__ 
functionality is handled by ``eudev`` and ``systemd`` recipes, which is 
why they both have the following::

    PROVIDES = "udev"
"""

what do you think?

> +      that functionality can be supplied by either the ``eudev`` package

package != recipe

> +      or by ``systemd``, which is why both of those BitBake recipes advertise
> +      that with the line:
> 

You need to end the paragraph with :: instead of : otherwise what 
follows isn't a code block.

> -         PROVIDES += "udev"
> +         PROVIDES = "udev"
> 
> -      The :term:`PROVIDES` statement
> -      results in the "eudev" recipe also being available as simply "udev".
> +      Those :term:`PROVIDES` assignments result in both the ``eudev`` and
> +      ``systemd`` packages being available as simply "udev".
> 

s/packages/recipes/

s/being available as simply "udev"/being also available under the "udev" 
alias/

I'm not entirely sure but I also believe that you cannot install 
packages from two recipes providing the same alias? Also, your build 
dependency tree probably shouldn't have a dependency on multiple recipes 
providing the same alias?

As a test, I copied kmscube into kmscube2 in poky, made them both have 
PROVIDES = "kmscube-test", then have my bootloader DEPENDS on kmscube 
and my kernel DEPENDS on kmscube2 and I get the following error:

ERROR: Multiple .bb files are due to be built which each provide 
kmscube-test:             | ETA:  0:00:00
   /build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb
   /build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb
A list of tasks depending on these providers is shown and may help 
explain where the dependency comes from.
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has 
unique dependees:
  
/build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_package_write_rpm
  
/build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_package
  
/build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_collect_spdx_deps
  
/build/../repo/meta-bsp/recipes-kernel/linux/linux-cherry-es-dev_git.bb:do_prepare_recipe_sysroot
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has 
unique dependees:
  
/build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_package
  
/build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_package_write_rpm
  
/build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_prepare_recipe_sysroot
  
/build/../repo/meta-bsp/recipes-bsp/u-boot/u-boot-cherry-es_2024.07.bb:do_collect_spdx_deps
It could be that one recipe provides something the other doesn't and 
should. The following provider and runtime provider differences may be 
helpful.
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has 
unique provides:
   kmscube2
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube2_git.bb has 
unique rprovides:
   kmscube2
   kmscube2-doc
   kmscube2-locale
   ^kmscube2-locale-.*
   kmscube2-staticdev
   kmscube2-src
   kmscube2-dev
   kmscube2-dbg
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has 
unique provides:
   kmscube
/build/../work/poky/meta/recipes-graphics/kmscube/kmscube_git.bb has 
unique rprovides:
   ^kmscube-locale-.*
   kmscube-doc
   kmscube-src
   kmscube-dev
   kmscube-dbg
   kmscube-staticdev
   kmscube-locale
   kmscube

I think this is an important note as well, one should be really thinking 
twice before (ab)using the PROVIDES mechanism :) Doesn't need to be in 
this patch though.

Cheers,
Quentin


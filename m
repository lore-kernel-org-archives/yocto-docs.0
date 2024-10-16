Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5A0D1AD5A
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 13:30:47 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.88])
 by mx.groups.io with SMTP id smtpd.web10.22922.1729085441443274883
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 06:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ff1+Lj4v;
 spf=pass (domain: cherry.de, ip: 40.107.247.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u08NmyhmUk47AIetrGPYK16VOCE6dP0onIcQMikTI9QyYKH+WSJAqmzzgsNx91jlydVVt6GgFYr5ldZJ0D6+Oq5KCZBgwqi8xw0LAaJaERNGHljDbzB9KY5Phn9Uyaqa+eJQef/MJzkptmSCnUu1tg47a+qXIJVk0sIDBVvcw0pZ1CLU68z3zyswcDmszA1zrXIPR1+Am84BC77VecqjfHeXltsY0bAE/wKkh1SCXO612zOr6IB7/LHQYAR/mMiTxAa6MNUie/71WILB/tkbHu11XWMlw+hH+khdah7IEH9xZMDxEpqPqE83OOCQzpht/6zkViHURmBA9ReppjoR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z+ODcuYuWejnv8TzEvV0hFLAtJcmcr9B/ra4v2HSyc=;
 b=Qi3fe9IoNBBDgQigE+or3urq6PI3ODUwaCSq0/um+U6NbXt3KxdtMxNXwMtF9cdzUkcbAdM5Xv8WJcgfLLvc2v2O9TwX+bAY4nrBJPzQsGLz5lBKocDYqMkohybibt11uMvsVd0mpOIDSuKDQZCOgP8LcxysBRpszDf321P+/mEo8D++8ruuLeejQanz5Ho8fIemCN3pryDUQKyzJNhGxZTNVPrn5Irn8IZVUlOzqYIRBSb4R/B8ZOMGG4EdjG2Ls+WQL/0orzng0zHbCN/fBfKJnGj77q5m8CgvMtaaPxHv1wFoo+U/Dc3iAFe/MaZXeeVP811BjUt2qffapznD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z+ODcuYuWejnv8TzEvV0hFLAtJcmcr9B/ra4v2HSyc=;
 b=ff1+Lj4vzIR7T5hfkmL3YKy//omnm+lGzvDSVXhE3BAmwhWzyPXg7Gnw40idXMAm+QGio6C2YZSWolaQBd8JbXH4yFwnDs3z+2BfArFjosuXxJHXtohgruepkUxIvpiJ7C0lgSc+KRKy7rXttl5G/4dc0rCLJN0+wBgV5BKLN/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8281.eurprd04.prod.outlook.com (2603:10a6:10:25f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 13:30:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 13:30:36 +0000
Message-ID: <023f8e3f-2dfd-4f99-a3c0-f3205ebf9e6e@cherry.de>
Date: Wed, 16 Oct 2024 15:30:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ref-manual: structure.rst: document missing tmp/ dirs
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20241016-bug-14543-v2-1-df3038344377@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016-bug-14543-v2-1-df3038344377@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0381.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a3b2c4-1055-46f7-f3ee-08dcede6b80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NVRiMU1OWEd5aWh2VHpzZXNyYi9xYmF4NFhFcGVWVmdzSTdFWFhMVGtZRkhK?=
 =?utf-8?B?ditUN2JMRk00ZFJmWE9pSmJRS1M4eEV5Q3NHV0JRV1ZaUFdSaHdyTjRNYk1X?=
 =?utf-8?B?U3lTdWpGak1OU3Q5K3hUc0txUlFZaXp1NktUU1FoVnZqbGRvMG1zNElaZnYx?=
 =?utf-8?B?YTVxN0lyVzFkVENtcGRLOVlxaDN0NGoyWVFZN3JxdHhmTHZtSlV0V09QLzZI?=
 =?utf-8?B?Z3U1am5JL2VVT05ubFA2RDM3bzhNTUd4ZkZnQVpmZ2VhdU8yNzlCWWU0NmVI?=
 =?utf-8?B?MldtblJ4M25DSHhmZTlEYjB0YWVBck0vZVVaL0x1Znl6cUlrWE5VUUk2dEFM?=
 =?utf-8?B?bDJzVnFvVjFCYktNM0kyN1JKMDV0WkFCeVVLdjJqV2ExaWFrUFRxUVhiRlNl?=
 =?utf-8?B?Z3VhZXNjdHZtUWhnUHVDT1pMOHZFbWlPcUUyVDR6a0lWTkdNdW1zL2RZUXZU?=
 =?utf-8?B?dGZnbFp3dmV5R2MrK3RWQlVZSWFPZ1U1aU5pN3cwSnNkMmFEb0Q3QzZSaDRi?=
 =?utf-8?B?cDlja3FPNDVmQUZpNjFJcjJxZXB4QTh6ajRGWE94S25FbW9TNmxFanNKZDR5?=
 =?utf-8?B?VVQ3U1ZHbWFlOHJTK0hleXFCSit6NUhLVHB1Z0Q0THgvZ2VGYjA1dHJYM1B1?=
 =?utf-8?B?NUVkT0w5bklMQzRzMkVER200YTJCbWhSRzdobTZFamFTb1o0Z0kwUEczQkdF?=
 =?utf-8?B?ZEl3WXFsdkQvNEpWaXR0anRwVHVLcU5DQWJYbHlCc25SUHp2OEpXK2dyMHF5?=
 =?utf-8?B?T1ZuWTVZUjNaYUtzNEl5alZEcGxHb2d0YjJCUnoxTlB6YnVyYWtkVVNUZ2ph?=
 =?utf-8?B?dnRFd0NWUzJIT1dnRlIwNWp5OEZoaExFa1EvSlE3VHFXMW5jbFJ4YjFZVHBx?=
 =?utf-8?B?dGtUM1FVSmV5c2F4VzZFOGxsc093bGJML1FPZEdDbk0wZkx0UFF1R0FDclBQ?=
 =?utf-8?B?SG50eHpTZzU4L0Z6RXM4UUxJN3lFZk90c3lEWmdBTG1vaGpybmU4VVEydDh6?=
 =?utf-8?B?UHZQdDRVaTNKUDVQR28yRXI5YUJ5UVBxRHJVb0F0cFlzTzNYbkt0OXpMZVg3?=
 =?utf-8?B?T2Zvb0hKMGNjTVdMcW82bHJDMmYxY1Rtb3F6M0REcnZNWTRTMUlJZzE5aTZi?=
 =?utf-8?B?T0xRckhGTjZEbkVOTm5HZWsycyttQkVzZnM0TXNOV2NLMEhJMGwyYkVLa1JM?=
 =?utf-8?B?andKMUEwS1VyWVVlL2xTbmNNVWZlYWNLOXVJeEZJOU96b015ZWpjWTNZb0ZY?=
 =?utf-8?B?eXdLMVlpQ3YyYmwxNjBxckhZeDBYWnN2SnJMdGdpM1VUOWx3VzFTTkx3aVF0?=
 =?utf-8?B?TGFDOG5hUFpmMkY3RjFDN1dJdFNxa2dKR0NTUWVOQktzbHlJdUFqMTJMcVdG?=
 =?utf-8?B?WGxGT2JRbWozQ0gxREk2eWFWK0JwZEUwUlk4b0hGa1JFaUxnSFNKdzZhMW05?=
 =?utf-8?B?Um53amZrd0ZtR085T0RSSzNSbFV1ejZzMTRINnQ4Tyt0clh6cm9weWJFQXBq?=
 =?utf-8?B?eUR2MDdlTCtaT0lPUENOZHNyRlpQSGFGa3B4eHRWd3c0N1pwbzlFNWhSalRi?=
 =?utf-8?B?NENYTHo5RHdHVGszRFR4Zkh0d29xbUJkYktrTDBRd1g4SGlFUVo5U0dCdVNL?=
 =?utf-8?B?bXdOeEN0UHBSbjZjdVdVVWExYVUzWTFsajBnb3h4MjU1WWhzbUxHWG5xdTA5?=
 =?utf-8?B?emZWdUFzL0tYRXhQemFxTklMTWJQU1h3RDJ4cU9VRTZ0aDQzR3NYbG9nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGw1NkllTXpsNmpQbVFrQjRBdThORnFHWWJoek9ibTA2dkpXRjNtc2ZWK05L?=
 =?utf-8?B?REVBanRPWlpEYVFZNmt1N1BVZFhyZ0JNS3Ric3U1WGVOZnc0V0RKQXFjMWl1?=
 =?utf-8?B?elVoSXE2QUZQbzdaVEJBTzRZZVlhNzh6UFFTdGZjUG1BU2RxcTY2VG8wRFVR?=
 =?utf-8?B?SlU2bDN5b3J2YmUvc3QxcHpHMnAwWDdWL25QejdsQ0UyQWJRNGZvL1paMXZD?=
 =?utf-8?B?Qk9RNS90UUNEU1ZMVVh6c2RtdDBhNzhPNjJiL09BU0RGZ1JlaFN1bGgwN2ZE?=
 =?utf-8?B?U1ViSWYydzNxVE1RdmQrZy8xL1FPWElVTm9GaWNtaWdocGdxRzVqRXhUaGhL?=
 =?utf-8?B?UFYzaDA5b0RibWJ3YmNzdVJtczNjZmtRdmkxQnYwVlNLUzZYSVlnUTdmaWh1?=
 =?utf-8?B?Q1E3RDFrOFNibXJlNFFKYTBQYXBtclI3QlRsYVlyYkY2RWZITDFsSmdXa3pV?=
 =?utf-8?B?U250VmZEOW53YkM4M3FhMkljZWJOTnR4YlkwL0JWdHJEcE02SlRGMzhRdVFh?=
 =?utf-8?B?WUk3QVlDOS8zbEZaZ1lESE83bENrbnl0K3ZyT2dGZXZYV2k5TUhhKzlQVmg3?=
 =?utf-8?B?RmNscExEUWY2TytMUi9ZZGc1ZnM4bGZTTXFReU1VNzhnbm8waUxZeTAxVmtP?=
 =?utf-8?B?RlQ1amRTSzZKQ0xCUG93Vm05L1JiamJ1d04ycmQwdkNFYUNjS1dTWU9Pdm0z?=
 =?utf-8?B?V2EyRmZqMVAxQk9lM25LVWpXd2NjQnQ4T21hQSs4OHl1QkcxVGx4SVFXWkdP?=
 =?utf-8?B?MHhuQ2tOVnFDMFhlV2ExeGsxeUdjYk9NYUJrZHA3dnkrZGhPY1oybnlvaGpt?=
 =?utf-8?B?Y2VJNkFVVGRGczFXVWNuTEhBM1FWZUlQZk5WUGZHd1NTQXY0emtlL2RjT21E?=
 =?utf-8?B?QUtwU0lHQ2wzVHJONGRqUU5mZ2lmSWJ6M1FDRXhNUTRMNG00ZjFhdmtLMEdN?=
 =?utf-8?B?ZXJ0VllGM3o2bDQ5NnorVkJ0Q2svZFdlTndkZWtrdlp2eXhyRmE1MkhNZVdi?=
 =?utf-8?B?aVIyNEEzb1BxYVFGVGJlMi9mOG10QktOaEdGaWJlYWNtM3hzTnU2VWRiSC9h?=
 =?utf-8?B?ZFFhRzZNeXdMcWxkLzlZMXZxWk5SU0lVOU0venlTTlJsc0k1WDFRbmtoUU8z?=
 =?utf-8?B?YUFPM1k1UWtBTGFqRWQ4ZlY3M3JGUzNUc0hlRmV6NnMrWHp2U1pBMTJnc3dt?=
 =?utf-8?B?MDY0M212b0V3NzlVNzluT0s4MjVJWC9CYVoyWVhPNkh3SllNdHdPQ1prMnFM?=
 =?utf-8?B?SU0rbnRoT1FMR0tmbGsvazU0Qnd2c2hyYitMTW5NK2pOSzJJK1Q4Sy9iajJB?=
 =?utf-8?B?Vm5URm5yb1pVWWhoRmVEZ3lhUkNOWmVydkNrR3UvTURxbkhOYThraGxoSDFN?=
 =?utf-8?B?WHhOcFZCS3BWWEFSU0RlVzlVUElkTXpUUGtFK1pHc0lvNUlUL05vNk5PWGpz?=
 =?utf-8?B?TEpNYlcyck1GRzVDUmgyL25rcnp2aWw5OWprTEY5aXJBeEpFcjl0K3FsKy9n?=
 =?utf-8?B?ZktueWtwSGk4K2doNzBxWk5vcmdkMzJ0NVhMUHpPQS9FVGlpa3pJSFNJaUlo?=
 =?utf-8?B?WkVDTUt2T2J2MmhPUlgxMEhiR3crOEtpZlNwS29Nd0J3dXhyNGdnZEViQmxE?=
 =?utf-8?B?a3RUajlaTG5WZjlQMlJ5OWhlT0xLVC9WanhPQzBUNjJQWDgzSHZuTUJSY0lE?=
 =?utf-8?B?TXBNSFFZNzJLbU83ai9uem9aSnlYQ1M3N2krSzRJSU5kZ2REWm9tcEtnTVdM?=
 =?utf-8?B?OVFna3J3MDlFTXJ0eXJRYkI4cXRlVk5rMUZyOFZVV2tJQTB5bVhJOGttdENM?=
 =?utf-8?B?NnBudVNNTjhzZzFzMHpDUlR5S3RUc3Z5ZDdmVVlKUWVkUU4wN3NwRDF3OFV0?=
 =?utf-8?B?Z21KMkUvVGNiQ3Y4MkFGYVQyMzg4bjREaXhQZVBrRFI0QzNCTGtkM0RJUHl2?=
 =?utf-8?B?MURiekwxTWRuYkxiSVpyaFF2QTZ3c2lWWFJ6OVlIemh4L2MvYTAwdjB1M3Zj?=
 =?utf-8?B?UHdTU2haOVY0Zm9ncVgySk9CcWpaNU5pTTN6eElodmd6c0wzQm5nN1ZvZW5L?=
 =?utf-8?B?YXRQdFRQNXY1bU55eEx2NHJ2ZmNZZll4VGJZbWgyS3JiUVQ4Tkp5MlVLUGdW?=
 =?utf-8?B?UXV2UUdWMmVnUmUrZ1JseHVYeCtDc0pvZHY1MmJBT2xwcTUyYjEvVVFWZ2kx?=
 =?utf-8?Q?yyRSopm6CQZpS15jp5IP5ds=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a3b2c4-1055-46f7-f3ee-08dcede6b80f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:30:36.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4ClH+S/4QuMGzmhrlp57JBBSSM7RPUdrVYjMuIUPhTr2zl2FSxnUlApdg/XUXb94G/IVJhIBs2D6BUFu462AtHlwlsVUNc/NJi1sc1DZEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8281
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 13:30:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5507

Hi Antonin,

On 10/16/24 9:27 AM, Antonin Godard wrote:
> Document `hosttools/`, `pkgdata/` and add some more information on
> `work-shared/`.
> 
> Adresses [YOCTO #14543].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
> Changes in v2:
> - hosttools: add missing "the"
> - hosttools: Remove "pre-installed" packages and point to host
>    requirements section instead.
> - work-shared: s/as a way to make it common to/to make it available to/
> - Link to v1: https://lore.kernel.org/r/20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com
> ---
>   documentation/ref-manual/structure.rst | 31 +++++++++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..738d4a6a8e1bc968abd4c0dcce8e0b6cde9db4e4 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -484,6 +484,30 @@ the ":ref:`sdk-manual/appendix-obtain:building an sdk installer`"
>   section in the Yocto Project Application Development and the Extensible
>   Software Development Kit (eSDK) manual.
>   
> +.. _structure-build-tmp-hosttools:
> +
> +``build/tmp/hosttools/``
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The OpenEmbedded build system uses this directory to create symbolic links to
> +some of the host components that are allowed to be called within tasks. These
> +are basic components listed in the :ref:`ref-manual/system-requirements:required
> +packages for the build host` section. These components are also listed in the
> +:term:`HOSTTOOLS` variable and are limited to this list to prevent host
> +contamination.
> +
> +.. _structure-build-tmp-pkgdata:
> +
> +``build/tmp/pkgdata/``
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The OpenEmbedded build system uses this directory to store package metadata
> +generated during the :ref:`ref-tasks-packagedata` task. The files stored in this
> +directory contain information about each output package produced by the
> +OpenEmbedded build system, and are used in different ways by the build system
> +such as ":ref:`dev-manual/debugging:viewing package information with
> +\`\`oe-pkgdata-util\`\``".
> +
>   .. _structure-build-tmp-sstate-control:
>   
>   ``build/tmp/sstate-control/``
> @@ -657,8 +681,11 @@ Here are key subdirectories within each recipe work directory:
>   
>   For efficiency, the OpenEmbedded build system creates and uses this
>   directory to hold recipes that share a work directory with other
> -recipes. In practice, this is only used for ``gcc`` and its variants
> -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> +recipes. This is for example used for ``gcc`` and its variants (e.g.
> +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> +:ref:`ref-classes-kernel` class to store the kernel source code and kernel build
> +artifacts to make it available to out-of-tree kernel modules or other

s/it/them/

I would also try to avoid one of the three "to" we have in the same 
sentence, so maybe:

"""
or by the :ref:`ref-classes-kernel` class to make the kernel source code 
and kernel build artifacts available to...
"""

Also, I'm wondering if we shouldn't expand a bit more on the 
"efficiency" part or what makes a recipe a candidate for using 
work-shared? I assume this is mostly because if we were to use the 
normal sysroot mechanism, it would be overgrown and take even more 
storage space than currently? I honestly do not know. Also, this doesn't 
need to be done in this commit, incremental changes are fine here :)

With the it/them swap or the second suggestion:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


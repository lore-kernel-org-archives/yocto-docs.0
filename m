Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB535D2A52C
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 15:35:07 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.56])
 by mx.groups.io with SMTP id smtpd.web11.26398.1729092900147777279
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 08:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Zy2RStlx;
 spf=pass (domain: cherry.de, ip: 40.107.249.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9RvXdcgzAxJqU26SgDcZAJva0kF8ljbfpGJDS8j2OkbTtt5IbVVilpEHUgKb2mZx42Wvo5fAZBngGSKzeaNJfwo1Dx4J1NGrz990b7Qaeoz11ExPRw8I/2x+3ezZOkm9DlL16VjjVMWl2GDX+xGLHNUsYbpQrErWoF9G5pXI6Vp2oGwfZcYU09h/KZ1nQVfebldMUN9ZisaLOLfh+VNpR674aM78mszzDibFZ4P0bnsQBEx+NQEiVLm796EAVWbGeCAVkt2hhVztxOi59OVyNsul9PUc9BCcKMsdiBMrs8Yt0CQMJxFclNA2ZImDfGs0R9G97tIQDWg6uw3dNcEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP5VD3Xc0Nj2g4QacYecjZG93atq2m6pT56AK/z4Txw=;
 b=Vm6/xKyEYrT2n5dXsFmQwAPfjLCiuy54qYHTY4TsHsSv9L2iTMcDNwcPjyUKQou2J9XOpoZ/ZLEl6uxOw9JWTHGBpUA/hJu4YcliUNVsz4W+BtX8glQNlJbq2t21i1IB4mIGk+wW8SMkxdNX2ZoQ7XSdipW/WVyfiAGg6ND0e07MD3n2DbcEsqtynZ/dUGd9GC8Wh5PAFD7DknVKvh7+KFjF/LqLggfbsI4NZUeLQWVsj+7S6zW7valA970NKlRN9dfRnbR4D3Ug4peOP/k7A3ci/uC5jcwKJ0pnTqBnCItNLmfl7fEWlZbGckLJ89BABGkAg307Zcjt8veNo+HIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP5VD3Xc0Nj2g4QacYecjZG93atq2m6pT56AK/z4Txw=;
 b=Zy2RStlxoST0LL3aev1RgNSTVmeno+Q8+AR7zhE34mB21r2SRGHxRIhrvxVxpH+TSXStqOX3JhTBecjYnl+mJjtnFF68OJfwfughW+FR5+VJ1jG4FKKjhQodI2Qeu/jcCncNd+gaK/UZmoVN4UqNk5GGj7zmziWBzVjjIUOpGhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10224.eurprd04.prod.outlook.com (2603:10a6:800:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 15:34:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 15:34:54 +0000
Message-ID: <a468864b-3ab6-4d29-baf5-8d56bae8e68d@cherry.de>
Date: Wed, 16 Oct 2024 17:34:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ref-manual: structure.rst: document missing tmp/ dirs
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <20241016-bug-14543-v3-1-35ff2724e662@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016-bug-14543-v3-1-35ff2724e662@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR06CA0176.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::33) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a9bec5-bebd-4f23-00d8-08dcedf8153e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUhZd3cxdXdNcGxtT0ZUWjNrNEliclBVcnNHWlZXTkNSbXVwRjFDTGJBLzFE?=
 =?utf-8?B?am8zM1ZsUW9Ba0w5UzVMbTBHbnFCOWVTYnVoaXpWVndyNHRoVmxTOUREcncr?=
 =?utf-8?B?MEptQ0Q3QXpuYmZ6SklETWRQRlBVY0NxWHYxME9oTi9xNGhsaDV2ZUw0T1Ni?=
 =?utf-8?B?VlNnWGlCd3BVUUZzcXFxay9ueXlHNjhoM3lHRUlPOFBraC9VUWJHdTJ3Vnc1?=
 =?utf-8?B?aUcwZjlKQVUzeTZwdzNIK281RFF2NlY0NnhRU0lnRTVBeXRrZXhmQmIzTmV1?=
 =?utf-8?B?d2dmUFFTcTl6bkhFVDhHdHROUytpRGxLVVZ4UllyYWtyMG8rN0szYWNTRnk5?=
 =?utf-8?B?b2xMdFVsRWE5VkJHYmdkUHdEMml2RWhoMDZUREdqWEFYQnk1VGlmcEpRdXJ3?=
 =?utf-8?B?bW1VUEZkakZ3RExJVS9ob3JQYTJqczhheml6aHB1WHBuMXJNVVladUxudFpj?=
 =?utf-8?B?Vm93YkdMZGpEcVpjWW1TYkRlM0xOdURBKytKeWpQVGdhNGhkZ29SeGJCbTcv?=
 =?utf-8?B?VWp2My8vbGp0U0U1VUdRdmhzZnJpbnRBUC9DblRSR1pGekxrTUhzQVNrREgr?=
 =?utf-8?B?RUxMQ3ZnWUlROGNZQUhMdkNHRnRXWUxuaXJMdlZ3ZWUvejJDYUFFSFhtMUhT?=
 =?utf-8?B?QUFUejhYdjVudEtUVlpuVGFnbFFOejZjOFdJcDdVL0thWk41VmM1ek1nVUVR?=
 =?utf-8?B?WFY4SUxXdnZqR2trU3liakViQkVHQlpVN2NEc1BoUGhJMW9lWGh2NDljU0Rv?=
 =?utf-8?B?UEV5c2tZOWVYMUtaQnNZT252NUx5ZG5qVVhYVWpUZVVGUnhkb3lxREprUWl3?=
 =?utf-8?B?SEIydG03eHlNM1pETmJZRnJBYVR4SzF0MHhWN1RZRkFHVVlOTHArSGdjRHFu?=
 =?utf-8?B?Z2dlWm9rKzNmd0ZaQkZVcWhGczB6eUdxQmRKNEYzakdkV0R2R21LK2tydTNu?=
 =?utf-8?B?NEhDZTlyaXJBWTNKWFVIUFFUSis3RGdWN1dFUStDYndOTGoyZDhTOHVodzRp?=
 =?utf-8?B?WXJRaWhtbGdXeXEzS0p2N2pOTFBIczYwL3VCSVQ3b0wwNS9zSGdnOE42bUhn?=
 =?utf-8?B?SGJHZVM3ZlRWbkEvR2g3SnpjSGFhVy9HNkFGWkdGNEQwSzlpT2xGSWVLbENV?=
 =?utf-8?B?cFUvQ21EQTJXNll3UkdpZDQ4NUxPbGV1ZU5tVWNTWlFJeDRHWS91Rk9EQ3d1?=
 =?utf-8?B?T25IZHZTNG5nUmltcU5ka1AwcUQ2b3UyVG5iSWFiYUVQalNkR212K1hiVk1C?=
 =?utf-8?B?bUVZL0hSeVBIRDRzc2RqLzgwamhlSnB1SVp2UGR1V3Y4K25FSml1djJiSjcr?=
 =?utf-8?B?ZjcyNnZSNlB2bktQWVVPMnl2VU1qdEszU21HQkZlbHkwWFlNaHkrOWZQRlZF?=
 =?utf-8?B?eHRCZTVUQWZid1hFSGM3NkgwY1JKS3BkTWpiWTlWZytYZWtjbkN0NWFyaU5T?=
 =?utf-8?B?cUl5QytwdnBLR2xMYmN4RkVhWkhQZ0ZDNHFRMVdtK0tEY1htNVJNdUFCWTdw?=
 =?utf-8?B?elIzM2tMVjA1MXo2cU1xZzhjSkJGblU0TngrMXdaTy9vckkvVkI2ekRXYXFv?=
 =?utf-8?B?WWxaZUJNS2Q1ZlRpcGJCdTBFMjFleGxIbmRRK0diM0ZUZlErOXFFYmZMb1R1?=
 =?utf-8?B?V2hSSWVzVHlDSUdoVlZ4czI0V2xRWUFlOFVIblFYWlBoaXJIYTN4bWNYVzRU?=
 =?utf-8?B?Nzl0eldlcmg5bDJYTlhyTTYreGZRd2pJNDdzNmpyTE5Vajh1emtJOWdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enM5MmlxaUNDWlhkejBVVVRyY0ZRckgyYnN6eHZUL1I1VDVOeHN2MTk3Rm9C?=
 =?utf-8?B?RWlPb2JEV05pNE5pZlZVOUVUV3hPVU9qenlUREU4bExqQW94a0FvWjNwdzc3?=
 =?utf-8?B?U3Fnek5sWUc3TERLOWQ1dHIvdTNBM2lEUm9SKzc4VnlBNlJ1dGk3Vnc0M2lF?=
 =?utf-8?B?SEYraUo5eXJxTVVLbE81UVY0eUlNUVQzZWl4dC9DcTNVUmRsSHVIbjRWbml2?=
 =?utf-8?B?RFJtR3VKODhyWjlGeURVYVJmdnU2bDVsaFlHN2c1V3paV1RYbFgwRU1zTE1L?=
 =?utf-8?B?SHorMXRwYUNkbFRPcmN2a3NxcUNyVENvcXhRZHFMOVlNMGczaFNZV1ZkNG1M?=
 =?utf-8?B?cDYyUlJ5Uk5JM3lrUVQxMUh5ZDhmUmhFbFJoa0gxNHJRSVZkbHFQWlJHSzZy?=
 =?utf-8?B?OEtUMHViYXY5Q0JpQjM5QTcxNmVpSlV2MTF1RjdFTmE1ZCtMcHQ5MUVxeFBt?=
 =?utf-8?B?RWI2cm94cWFBT2VJdEo4cnpvSysweGNXd2lKQkdIeUdHbDBabHQ0NFczak5F?=
 =?utf-8?B?SGJvSHdyNXAyaEFVMXpGekNHa2Y4cGhHM3JJeGdCR0dLVEpSYzZuRUhrMXEr?=
 =?utf-8?B?SGFUaUFKMWZqVU9TSVM5SnFJUlh6ZFlkQXRJaVhVVWRWN3FVWUNTNHJrMEtL?=
 =?utf-8?B?L2JmV3VWMzZoUDVjWjl4RUdGZWdMakJWbnE3S1dVSm93SWdjT29FZ1hjUVdJ?=
 =?utf-8?B?bnl5WmNOZ3hra3BkdWtEYWxkWHFzTFRzK1JMK3BmQ3pxN3E2SmlMdWNrcnNm?=
 =?utf-8?B?dlZwT1QzQk5Pb1l1STBaL2t3c2U2dGFLeCtwcDAxNmlxSC9SY2Y4VkROSFVK?=
 =?utf-8?B?RGhKVkZjRlBYZFdCaWIvaVY5NnhiTFdBTk1EbkVNek04bE5WMjJGaXVYTHlG?=
 =?utf-8?B?NHB5T21tVUUzVnhyRW42SEpzWEN5SVg4bkt4TU82TzhyUTl1b0lkcDRySDZ5?=
 =?utf-8?B?NDdmaXdIUnZrQVh0N1JMWms5cDlvWUNxWklKVmRmdjBVejR3eWlLbHpMSkpO?=
 =?utf-8?B?d05ObjZEdThoLytyRHVvcndHd3dsV2xvN0VIQUN3VGpvWVlYUEVML1U2ZnA3?=
 =?utf-8?B?amxnbjgyQXV0TWVqQW5wY0J1eENIRVYyb290VW1sdGRVL3pHOTFHbFNvNUo4?=
 =?utf-8?B?Mmx4ckxKZ21McE5VYXNtdHFuZEM0N3J5MWFFL2JHUS9vYkRNaGZEYndHNEsy?=
 =?utf-8?B?OFo4cyt4dnRDVGt2L0NEeVA5a2tqM0JOK2dDa0FBQkJJQjkwU0padzgxdFQx?=
 =?utf-8?B?clRITkNlZjEvdjBCYTFrNWFiaWMwNmt0S0ErdmJtT1V0WFhZZTBuYU5NOXpr?=
 =?utf-8?B?Qm9NU0ROa1kyS05idUx5RzRoWTF4bzgzbE9MbjUwMHgwNFhBeU56VlJBZnI0?=
 =?utf-8?B?TUlHRUhqNVJzTC82Zlh4L1FabndIcFkxcjUwWnhhYXpGUHVRdUJBOFVZZ1p2?=
 =?utf-8?B?bVdoNkFMQm9TazBSdFRGUTl1QzdaUThqYy9VMy9KNURvaVN1bk4ySUhSRnpR?=
 =?utf-8?B?RVlGQndQUjE3aUs0eEVPRnVGY3piK0RjL3dJUnlveExyNXJHSjJXWXBCMXVE?=
 =?utf-8?B?VUZ5QVI0eDVkdThWazV0NHk2UVdGTDFSdUxtTXdjU21MRUEyTjcrOGt5VHAv?=
 =?utf-8?B?aE9FR2VnTk1QZUhkenhuM1dKUGlwKy9XelIyV3p2YjZkU3hvNjRBK0xLL0Jy?=
 =?utf-8?B?RHVEcDhESTB0Ri9wSzR2cFhLdjg1Um9wcUdqY29CUld5Y3FIeDJtQ216U0tI?=
 =?utf-8?B?eUFNeitQejBVVy9RVVB2M1orU3ExMi8xZzdXQWpQSERERmkwaWtueW5PZUlL?=
 =?utf-8?B?RGFwNEIvZFFPLzFUdXhCK3JNMEVHSGxVV3NZOW9mRmxIL1dTYXF2QzVuRzJr?=
 =?utf-8?B?bEFaaVI3aFZlS3VnU3dMUG0zWUdHeHlvSU9iOUlLT2lOYTZSSCtTb2dqczNZ?=
 =?utf-8?B?MFBtUGsreUkrMWFDSWlkd0JpV2JxRUhoLzZvejhCeStMNHpkcXUwemxndkcr?=
 =?utf-8?B?RWVHYTZvSXJYcHVCZmd6bGltamNvRUJvMUJSdG9wR0M2K0l4QUN3bXpMY1JH?=
 =?utf-8?B?aHcvUVg4cm9OLzdCSENJN2dVZ3g2SXd2cWpYbndRanhCUHdWQ3JZbHQ0U0s5?=
 =?utf-8?B?SG93NXBWYy9hZGg0K0psZHNlS0NYVi94OFJ0TWNMVDU0Z0xtZmxhQ2tHNDE4?=
 =?utf-8?Q?wNgM30XBrMTeCbDvcxpnzZo=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a9bec5-bebd-4f23-00d8-08dcedf8153e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:34:54.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nb31XRZPignGOviGyJxtMYcSC55pB7r7p3CQ6ZqaGpBeIAAuvCiomVUK4w13Hny1lFJaNyjz50G0Gnm0o8UyUWDjPLoRy2tGXiihZDDyrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 15:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5524

Hi Antonin,

On 10/16/24 5:24 PM, Antonin Godard wrote:
> Document `hosttools/`, `pkgdata/` and add some more information on
> `work-shared/`.
> 
> Adresses [YOCTO #14543].
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> ---
> Changes in v3:
> - Rephrase triple "to" to "to make the kernel source code and kernel
>    build artifacts available to..."
> - Add a note on the rarity of using this directory, and an example of
>    when it's used.
> - Link to v2: https://lore.kernel.org/r/20241016-bug-14543-v2-1-df3038344377@bootlin.com
> 
> Changes in v2:
> - hosttools: add missing "the"
> - hosttools: Remove "pre-installed" packages and point to host
>    requirements section instead.
> - work-shared: s/as a way to make it common to/to make it available to/
> - Link to v1: https://lore.kernel.org/r/20241014-bug-14543-v1-1-7c8519be9c9c@bootlin.com
> ---
>   documentation/ref-manual/structure.rst | 35 ++++++++++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
> index e4d8b54bb9e39ffe344d2db1798e4fe76c742f4e..bbeda78c791d430faa55356a3209f5eeb1402837 100644
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
> @@ -657,8 +681,15 @@ Here are key subdirectories within each recipe work directory:
>   
>   For efficiency, the OpenEmbedded build system creates and uses this
>   directory to hold recipes that share a work directory with other
> -recipes. In practice, this is only used for ``gcc`` and its variants
> -(e.g. ``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth).
> +recipes. This is for example used for ``gcc`` and its variants (e.g.
> +``gcc-cross``, ``libgcc``, ``gcc-runtime``, and so forth), or by the
> +:ref:`ref-classes-kernel` class to make the kernel source code and kernel build
> +artifacts available to out-of-tree kernel modules or other kernel-dependent
> +recipes.
> +
> +In practice, only a few recipes make use of the ``work-shared`` directory. This
> +directory is especially useful for recipes that would induce a lot of storage
> +space if they were to be shared with the standard :term:`Sysroot` mechanism.
>   

Provided that's a legit justification for using work-shared (I really do 
not know :) ),

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


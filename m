Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC81CC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:06:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.31])
 by mx.groups.io with SMTP id smtpd.web11.78894.1752501979924479477
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 07:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RBF9oOCc;
 spf=pass (domain: cherry.de, ip: 52.101.65.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCP1WHhWaLSuBzg3UAwRsuof2wIhxGtoAWfwgLolytTh1RUW0EWFQnUslrO9GoAN5Mx3GY/TdfeO2vJddAqnk9sO/pQpbG6oQLIrs/Qpr5Sva30AjaamzpwTm5l5i0LxlMuSZGX2mPIUaE5Wypuz0bbB8N0RcxwM3H6ti79fbM1OFpwnNIHcPqOiBHwt3OqEUksK+G3rGVc01p0P6cYqGp0JkAKHIsVaCTQbjdTch+CE4FaEVr7gvFcrCt/odOmEkJ+a5fxiPDu3sfniOARywVvrLOaO36Og7g4h4ocKq8jB1P1d3xhMboCOoa8eMguJVvIzVNkr/GCTBGSRm3gDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQHgLzWWQ04K7b2vwZOdMk4wxL2ZaUsrvVXfPP2hT4g=;
 b=X4Qc5hpfrzId0cJqeGvrRLabLXZ+XqV1c299uo7CyffJJ2+CVkB+cZ5h+0TYfdvru69DZYK59fE+Th2iVTeth9YIX3gJJroELck93bC6YYzAGGade04JIFP2dWgkW3kiPe/GP82IaimFh0OzlOmvQGtUpF3y1DnksHy95XAx+jWOH38xn/bChKpoDMaMQbHTN5+j/Bp2H5HhskfX7FRryeyiTEoGBAfkQfSDDRrFtW8FY847iZFzjccWbVxv+IeNJ2iwJLioLz0SVGYlvDTVHnJgI3sJ3Pi+15RogsSFNqz0BNNZ9jvP+k1OLk/hvtPrVPHyw9IRUyy/oGNuTwgMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQHgLzWWQ04K7b2vwZOdMk4wxL2ZaUsrvVXfPP2hT4g=;
 b=RBF9oOCcWH0ca+ljaIdtpDr58YzJFStoDhmDevBdxD4nVUqeErrSEa8NTdmi6CFtM6BloUu4i6aj6QYPX9KbTOV7QF74o3U/c5K3+ANfiNgQnhASQlwa4JNaVn0EfcI4/edFGO8MyIyWOBwPcTMI1RsJfOD6p9p5tlGhaEJcMc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 14:06:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 14:06:16 +0000
Message-ID: <9e5a7530-7e54-4895-9979-65aa8773f391@cherry.de>
Date: Mon, 14 Jul 2025 16:06:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] a couple random thoughts about YP docs and examples
To: rpjday@crashcourse.ca, antonin.godard@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <d2261e4d-bfe5-3c97-a580-ed25d69e228c@crashcourse.ca>
 <DB6KCKNX3JJJ.3VF9X2K4S5HWR@bootlin.com>
 <14e2cbf5-1080-9e2d-ca4a-77fd3bb7df37@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <14e2cbf5-1080-9e2d-ca4a-77fd3bb7df37@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b0d360-8b06-4d3a-6d7a-08ddc2df991e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0liaEMxcXcxVnRyS3MrL0tob1JEMUxnRVpZVlpMcUdiYTlsQWFwR2lSUFlQ?=
 =?utf-8?B?RzZCUkdYYkYrY295dmJQMXU0dmh6dGFYUU43MTl5Umx5b2xsdHJiTFZtQWRV?=
 =?utf-8?B?dnMwUm52S28vQXJzZEJXYnE2bU1LejVUR1I2Nnk2alRta243S3NOYllveW1N?=
 =?utf-8?B?ZXJVRG9HUC94a0VGNlAxejMxSnNXaHA5a3F2YXlLSkxWQ1NobCtqWFQxY2cx?=
 =?utf-8?B?UVgrYWRGNWVLR1lSSEY3bVVlblBFNlIraXM1aGtBV0NCRGNJNFRmTWNhNmdl?=
 =?utf-8?B?QWdQY3J1TCtyd21iZlR3b0hGRmZiNUFuRHJ0Zk44M0dyajR0bDk3OG9nWHlw?=
 =?utf-8?B?NWVnNXl4TEI0S1dJZ1lJT2hSUDdCOWFJVE1wdDZGMDVFTDR3bmFaV1l5WEVD?=
 =?utf-8?B?aEp4bGZOT0JMMnd5M01BWHU0NzlVbUkxbUVHVThtWGpiNzJmVlU1RGRaUEh4?=
 =?utf-8?B?dW0rZ2dDTnZzN1ByRFZDRFZuWmxEazFBaTRHejVsSlN6VUMreHQ2NGVwa01T?=
 =?utf-8?B?c0dkS1FmWno5RWxSMkZvQTNhTThxcnVUZFNmUHN5dmUzSWlmNTZQeGRiRG1M?=
 =?utf-8?B?RXhlc1JyYW50ZllmTytoQlNqUk0vdm5rWCtWQloweFJQWmlqdVdTQmswUVBF?=
 =?utf-8?B?SVBwZW55OENUcjU2MU1tYi93TGhDQzVQUWNDTFZYTzI3UU5hSW05OThwaVI3?=
 =?utf-8?B?QU5kQnRxYnBzdjNEbCtLdXVlZGtlcHRqeUpOODRtWGRXZTdESWxyQi9zV0JQ?=
 =?utf-8?B?dUl6ekE3TUdpcWFyYW9obkFycU5aUDUyTDUybjY0clRWS1lFSDdFNFhXUG1G?=
 =?utf-8?B?ZFNwVkxGWVR1Nmw0eHNOZ21idzFBaXNDdVlqS1BvNURqcnk5Z3AraWVYVkZy?=
 =?utf-8?B?WjJwK2ZMNkJaUUEzWW1ycTJJdUJYdGJoMG8wV0xHSlU1b3Q1bU9BZmxIVzFi?=
 =?utf-8?B?bXZpZmpMQ1o3c3U1SnhFYzk4aG9NNzl2czIxeUh0QjRQRjEwcVdSLzR1VmJh?=
 =?utf-8?B?ak11OGUwUFhBMFE1bGcvTVdJVGkwbk5ZcGdMeEwwOUY2YS9IVm9qTjFncGRB?=
 =?utf-8?B?RVhSNFVYS2R5aW10TnpIRWNIbnAvVUw2dkZvdi93S0Z2bmJjNEVyZE44dlBx?=
 =?utf-8?B?bEVmbnh2cmZrQjhSVVM5TC85Mkd2RkpQQWYyY1lEazRHNjJvQVlSOE5lUEdM?=
 =?utf-8?B?aG0zSHhEemlJa3Z0MUN6QnFwblRJd2hCKzVWSHVuSEgyT1BoVG80RCswQmpn?=
 =?utf-8?B?YXUzTXpTOExWcDUvZmVSOEhoL0Qzc0QvUHBXcmZkT3RkOCtKT1JwVUZibytQ?=
 =?utf-8?B?RHNMdkdIakRDWTVlNzFvK3d0T1VGUjI0RlhZV1ZoVGd5VEppWHNIcEpiNE04?=
 =?utf-8?B?ODcvWmIrRVBDeHI1YjBSQStTUG8xd1Jub2phOEdyQVpUcWhCMjNuQmUzYU9q?=
 =?utf-8?B?ejBzZStEdGQyMVdkUWR6WVZ2dHhDY1QwTk5MSTJJRDRyWjBDRnlOUnB4dFNT?=
 =?utf-8?B?cHR4SDhVQVprVGF2MEVFRmdleVBIWDBWWDVvQkNsMXkwS0pkaHVVWVNKY05C?=
 =?utf-8?B?TXp4bmxYMVN6RUI3WG5XaFpPL2ZSQ1p1T0VFdVNhVUU3VjNralZZampMUzBn?=
 =?utf-8?B?WWZVUVJjWmRqblpwT0orU2ZuWmhiTEhsVTJJc01DQVlmRWQ5dzJ6Nm84QkU4?=
 =?utf-8?B?Yk8xYTFhOU1qZDBNNi90blZOTWU0aXU2NG4raGJTcW9JWDg0d0NwOHNqM0hz?=
 =?utf-8?B?WEtBOXFmY1dCUHN0bThZOVRWdmpBVy90VERoQVlaWFVFbUp0Y3NaY0J0dlM4?=
 =?utf-8?Q?1l1lBNbqvjRoIHZ6mrX80tOmG8qQ1d/wOnjeg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1NSanVWNWpDQmxKaGxEL2FiU1AxQzVINFFMVTlubGsvaVVYd3hxajhkbm53?=
 =?utf-8?B?WFIzT1A0ZXNTb2dZWEpqcnZKOWwycy9tSUpaTEpVRFRPSCtUT1FWQm43TmV5?=
 =?utf-8?B?TTBpcERCck0reHpJRFIydjdqUHdnUmlOQzBXY1A3MlZCN2Q4ZHFHckRTTlpt?=
 =?utf-8?B?WWtCUEpjLzlUeFhlN21Dazc1b0dlZ1pOb1RuS1VzaHFFTnQ5TlVMUUR2NE5t?=
 =?utf-8?B?dWxwWDJvK1RwdnpQQzk1eEo1ZEVxb2ZNa3dHTmNmVkJkODljUlkwc24vN3Vw?=
 =?utf-8?B?SVViaVNDa1U1NDQ0L1UzWDE1S3Bya0V4SG04WWZvaTNwcTJ3TGdZSkJtK0Vw?=
 =?utf-8?B?YnN0VEI2b0l3T25zc1N4QXkvRjRDVWVrdGNYeDNEZWFTaEI0SGU1bXQ3ZnpB?=
 =?utf-8?B?UlRDNE1naWNFSC9BYUhheEFYS1RtTDdJS3pXMXBTSjNYUi9YN1EwbE9lUE5P?=
 =?utf-8?B?Q01VOHcxR1hyay9LYjcwTFd4TmlmbXhvSEVyREcvV2Y0SVl1QVF4VmluVVVW?=
 =?utf-8?B?eUtoS0hTRTlKaWhHVkV4MDRDTGhXKzl2ZGRlSzk5ZzNDY3lGSWk1WGFlODlv?=
 =?utf-8?B?aDIvOW1NbVJ5RG5UVldPZVJxUHc1a05zaEgrQVEwZ3BwME9HUG9kS1ZhcmZ1?=
 =?utf-8?B?NXpMNGpOWi9RTE5RVXQ2YktiNngzckR5akZQWG5GYzNnOWx1Y1l0Wk1xS1Ar?=
 =?utf-8?B?MjNxNFl1cVBTNE0vQWJVa3JPQTBLQlB1UHY5K1BvTUF6ai9Tdi9kMGJoSGRw?=
 =?utf-8?B?K1FZVTBseGNPVDk5ek0weHJEbGg1azRvQnhwc1A4ZUVVNXRWeE9tbVRCcGRJ?=
 =?utf-8?B?aTNYR01LRS83RmE5czRMZGd6bHBsK24yUjExSzZKdmdlWXhTbkM0NDZ2VTRW?=
 =?utf-8?B?bW1YQkVaQjBqcDhjMGJkWWswM1NDRGV4U01LbWtiaDRyb1YwK1cvNExLOFYy?=
 =?utf-8?B?ZWhjWHI2aStlY0c4MlRTTGxDcnNyU1EwOFBETnA3THF5Y3NsbWd1NlRDc0Ew?=
 =?utf-8?B?WFErZ1J2NUVFWjQyVHh3dUg4ZlNvTHByQUtHQ1BNa21sbDFaVE0vVUIxaS9E?=
 =?utf-8?B?dWNGRUl3RVA4eXlMVHh6Z3piRXgwQ21mUXMweHZZbDlRbXM0R0wrOG9TazRY?=
 =?utf-8?B?RXorOGpLWGNLMHRianRYOWVkUjBPMUpVQXEwdnJrV2JtZmdhRStpVHRENDFW?=
 =?utf-8?B?S3lmWWRYM2NnV2oxaEVWOUlvZ2hWS2pLOGQ0L2l5Rko1VXNUTWZ5dVI5RWx5?=
 =?utf-8?B?VzVXMzNObE9PWDBBNFJVU2xaMS82VUNUU2dGL3h2ajN2eDFQQ2E3MmMyb3Z1?=
 =?utf-8?B?R3hOcWhmaENyR2d2TUlPN3dGUVlhaFR1MVBrdk5UaktzRnhnMmxwajJqU1lr?=
 =?utf-8?B?RXljOVAxeWx6My8xTGdkT0x6UXdBdkVKV3lmUUMxRVp0NmtMbVFxazV1REt6?=
 =?utf-8?B?UVgwbkZmYnJwZlE5MzFzNEtMRVZMUlNGQnVRZG1KdUg2bkx4SWVoc0lONUFw?=
 =?utf-8?B?YTVYNmh3cHF1bENJajdnQWpZdmdPalNGMEs0NVBGQWprb2g2aWNMZjFKWVla?=
 =?utf-8?B?S01CZmFvdnh2dW13SkdIcmxBVUFkUDBwd2xTMjJoRzdnVFVtRXlSRnNLMy9V?=
 =?utf-8?B?UTZGTkdHQTZ0TlJVV1Q5OWFIWitCOUhNM1kwUDI3cUk0U0xteDJDSC9RbCto?=
 =?utf-8?B?RGhwYSt0RVg4SGZBMmRJMit0VElOcXZaVFZneEI3Vlo2bVl6dEZ3TjQ3VTlu?=
 =?utf-8?B?Y0htbnhNNTd6M0tadDltcmVLVmtqT01EbmlTL2k2L0FlRng1L2w5SWpEbEV5?=
 =?utf-8?B?V0pkdW5jeXJzM24vWnNkNjh5M1JReTNvaTBLNHVRbFA5U01JNzVsSkpJMGU2?=
 =?utf-8?B?VkVlS2NwWGRCVVZQSkJ0cmo4dnpiWkVNT2ZZMHpIV3NKaDBjbHVEV2NHYVNl?=
 =?utf-8?B?ZVhYK3JiajFjWm1nMG0yVHUxREp3aWk2ekdNeERJN3g1ZldIZ3hlaFpkbEpR?=
 =?utf-8?B?aDYyWlYrTGM3eEVpSkYyZUdqc1AvZDJvSExrQU1pREhrekFSRGlYMGwzRngv?=
 =?utf-8?B?aS9BMUI1N28yeFNZYXA4UUFqOUorZEFaN25EUkdrelExd0hHVUVjdm9zUlp6?=
 =?utf-8?B?dU52S1c4NTFqMmg0c3JEYWpPUGxrK1ZQYXlacFA0aG45MDl4S0tzUkJHaUhw?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b0d360-8b06-4d3a-6d7a-08ddc2df991e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 14:06:16.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGleLvxqbI4HBAMT1Ru5aRzs4wuLwFqpBwtAa5t1vOQGRU7TGb17ts1P1wcds/DhcbqP/kW23l2XPf8X6ouiVano7jsMevBAaAYubCKuJbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Jul 2025 14:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7321

Hi Robert,

On 7/8/25 11:56 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Tue, 8 Jul 2025, Antonin Godard via lists.yoctoproject.org wrote:
> 
>> On Mon Jul 7, 2025 at 9:16 PM CEST, Robert P. J. Day wrote:
>>>
>>>    reading the bitbake manual (although this could just as well apply
>>> to YP docs in general), my first general nitpick is the number of
>>> awkwardly contrived examples that involve contrived variable names.
>>> consider this section on the ":remove" directive:
>>>
>>> https://docs.yoctoproject.org/bitbake/2.12/bitbake-user-manual/bitbake-user-manual-metadata.html#removal-override-style-syntax
>>>
>>> why use variables FOO and FOO2 and arbitrary numeric strings when
>>> there are so many meaningful examples in the OE code base that would
>>> make actual sense, such as:
>>>
>>>    meta/recipes-bsp/grub/grub2.inc:CFLAGS:remove = "-O2"
>>>    meta/recipes-bsp/grub/grub2.inc:TUNE_CCARGS:remove = "-mfpmath=sse"
>>>
>>> Examples like that actually suggest to the reader *why* one might want
>>> to remove strings from various variables related to various recipes.
>>>
>>>    Also, I don't see any mention in that section about override-related
>>> removal that would be useful to explain, stuff like:
>>>
>>> meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv32 = "libunwind"
>>> meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:DEPENDS:remove:riscv64 = "libunwind"
>>> meta-poky/conf/distro/poky-tiny.conf:PACKAGECONFIG:remove:pn-opkg-utils = "python"
>>>
>>> In short, we should be using actual examples from the OE code base as
>>> examples, and we should try to be complete.

FWIW, I did a 45min presentation a few years ago on BitBake operators, I 
barely could catch my breath and didn't manage to put everything I 
wanted in there. There are many possible examples, with corner cases and 
side effects. I do agree we should do better though but I haven't found 
the time (or the way) to make this presentation into actual patches for 
the docs :/ Also the ability to sum things up quickly and clearly isn't 
one of my strengths :)

So while I understand the desire to be complete, it may actually be 
quite tiresome to do it (but we definitely should!).

>>
>> Bitbake is not only used with OE-Core, and so the Bitbake
>> documentation should not make any references to it. Maybe more
>> meaningful examples could be taken but we need to keep that in mind.
> 
>    I think there is a fundamental flaw in this thinking in that there
> is a fair bit of BB-specific content that is *not* covered in the BB
> manual, but is covered only in the YP docs. Consider the
> previously-mentioned "bitbake-getvar" command -- that utility is
> defined by the bitbake layer, but it is currently documented only in
> the YP docs.
> 

It can be moved to BB docs and referred to or augmented in YP docs, 
that's not an issue.

>    If you really and truly want to think of BitBake as a standalone,
> independent-from-OE program, then *all* of its features should be
> documented in the BB manual. As it is, that's not what's happening at
> the moment. If BB should really be treated as standalone, then the BB
> docs should document stuff like bitbake-getvar, and bitbake-diffsigs,
> and bitbake-layers, and ... well, you get the idea.
> 

And I don't see an issue with that. It's just that the YP docs are more 
"public" than the BitBake one so people are just contributing/reading 
that one. YP docs should complement the BB docs with things that aren't 
in BitBake but OE-Core/YP, the rest should be in BB docs (and referring 
it from YP docs or augmenting it in the context of YP/OE-Core).

>    IMNSHO, you can't have it both ways -- you can't insist that BitBake
> is standalone, then leave much of its documentation to the YP docs.
> 

This is just the current situation. We may have made mistakes in the 
past or have now changed our minds, it doesn't mean we have to stick 
with what we have today. I think it's a good thing to not want newer BB 
doc to be in YP docs even if we currently have BB doc in YP docs. We 
really shouldn't be mentioning YP stuff in BB docs though!

However, it doesn't need to be that strict, I would say you could 
provide real life examples but they don't need to link to existing 
recipes in OE-Core or YP. What matters is that we explain why we need to 
do such a thing (e.g. :remove or :remove:some-override). Real life 
examples aren't necessarily easier to understand though, so we could 
have this FOO:remove = "bar" (or with different names, we just need to 
keep it simple and easily justifiable) example augmented with a real 
life example.

Cheers,
Quentin


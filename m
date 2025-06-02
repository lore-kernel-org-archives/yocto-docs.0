Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36955C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 11:36:16 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.71])
 by mx.groups.io with SMTP id smtpd.web11.47516.1748864167957999241
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 04:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YtzZYm6Z;
 spf=pass (domain: cherry.de, ip: 40.107.249.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlFAb1NbYmjcxqVOhp4vpXWyc5j12lRTAUi+duwF2ztRQy8bVGLa8M1HRa4tyhS+4WULmmabXWq0PMXPnRbqRmrZYMqEl6x7NyzP8aj/JsOKiUuRD9zPfGjdsxnDjXQ+zzeV5Z+ppEtf5mQ9C0M9bDgIDrlq03qfVGSKY8I+pU54YIpBjMQWA91tT89hpruAVloCMmoAhyIW0ynuJeXaO9qcYtcOQ8iSX9wMb6yAjP7I7Q+ybP0hLKQVzQnEjl14zBe6FAKPYyZPaB2jqbiE0J14XmmIddM/T2HfC84OAzp5EoTMLObQhC0VArZX6km01nkoForiqHfnMFSnle7BRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0anaUjMqD2t2uGtDtm3ITOgH5iixiAo5Oxo7DD002Rg=;
 b=Ptq7AW1nMrz9Y/Eo0gpgQsC/T6Vy7g29A9yBxH0nnVQiJvK0WwXWJrMD2YwjNh5G8shfvKKbgF27NHgEZqzXuPLHojJtPlxgzqwPXVW2ADmv18p897dfdYIi3aZbOHwVDeBVlqmFnFMQUUgBQhaFBHvaNO/JhEgM6sX37ldXOXc5ro0zePdcct02UeY/8pSj+abBtxdun5NwDHbPMaap7v3fDa6jlL5QGsasNcp1BuR6weMkfybBuz127VTAP819QqANvVTtZy40HjPU+p7jcgoWL0HiEG5NJxKovBXzBH8MFAArqVW39eWnqUb/VlwjR1dF8g5ADsSJ6wE1jt+Jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0anaUjMqD2t2uGtDtm3ITOgH5iixiAo5Oxo7DD002Rg=;
 b=YtzZYm6Zo0SEkKRxIwCexbCORYlUO2Vj+s1TNMAy170biqP7dgnh/2Vgf2egiZ031smfENcg3o2yqvic8sBGoZBIOVJbFw5CTWdLjB5kZQkw3SRIYlfqn8z5dG2ics6ZXVz0n6ba9LCOEtjvXDZaiYTO7aEeYO3vESAi2rmlGys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 11:36:04 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:36:04 +0000
Message-ID: <4f224337-e7c7-4ccb-a0cc-861fddcabc07@cherry.de>
Date: Mon, 2 Jun 2025 13:36:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 KERNEL_EXTRA_FEATURES
To: alperyasinak1@gmail.com, docs@lists.yoctoproject.org
References: <20250531154900.53941-1-alperyasinak1@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250531154900.53941-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dddf73e-660f-4b4c-9f1d-08dda1c9a873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVZ4UUh3aTFHNXhxYW92cklnanNNSEljVkdnSEgzQUNKdEpwQW5ndmNObmpO?=
 =?utf-8?B?b2grbVVWUXgrd083OU1UcnFVeHQvcmpCOUJqelhlWmgrcXdZWFJMb2d3NnJE?=
 =?utf-8?B?V1VFN2ZNbGdqNE9uRnh0ZUlsR0NCNi9LeXVGaUorYSs0T1NhdzkwaFVpWjk0?=
 =?utf-8?B?b28zc2dQOW5iZDl2MWtBalJaTzVFSmRZSmJ3QzkvNWxSNlhxV1pwVVJVS3p6?=
 =?utf-8?B?RzF3SHJvVFl5dkNpdkYxczMwdDc1WFhRL25aKzdYa1c4RUxCaDVkVFNWMjBn?=
 =?utf-8?B?MWFESktmMXBmSGJXS095RlpaZkNRbHBUNHQ2RS80VVRxMTNqeWZFZzd4NW9w?=
 =?utf-8?B?L1ZZQld5cHdCcnRscG9tSWg1RDlUcHhlT2pnNXlzZURGanBzRjZ5UzB6NE1Z?=
 =?utf-8?B?WWhRalo4bm5PRFY3VS9oaVZ5eU9PeTAyMDE5eXB0SnZRbGYxQjZXT2JTeDhK?=
 =?utf-8?B?WGJqK01nNUVNMDhUQVIwRmgyVTZVMEtDZjViSkVtNWRHUVUxb2pHVHBVQXZ2?=
 =?utf-8?B?SHpPL0NvaVVsak01SjdCRk5aTERPSHl0Z3RsWXNtU1g5bXBrZ05ETkZranl0?=
 =?utf-8?B?QXo5TnVWZjBOM0hUYkdPTEg5NWU1N3VVWDE0K2c1V1gzZk5LMXFkZTlQM1RU?=
 =?utf-8?B?SitkN25vUXIyditNdXBiZUE5VmxvaXd4QUQvMnRKZWZkYzFjZklVSFUvNWoy?=
 =?utf-8?B?aEdjendESDJtOEQxeVEvd05ibTZRZE9wbUZYUmxvOTBXQ05LOTloT3N3UGIr?=
 =?utf-8?B?a1MraUhQQVdaeU1wMEp5bFVJa1dGVnVNd01WNHozWGZkdHI1dytyYm9ENFZh?=
 =?utf-8?B?czBlSUx2dG5CaVRNZ1ZlQUNZemppUzhhbFZSa0ZpZ0t1WmtmcW9xMGhaSXR3?=
 =?utf-8?B?QmtqUWJ1c005UEpxUDM1bkFhNkMxeFVFMWlFckIreW4xeFZ6dmhmSDh2d1dT?=
 =?utf-8?B?Ly9oa1hYalVERCtFZkdOdmRHbEw5eDM4YTB5UjZTMzZCMTI2WThkdnJXQ0NT?=
 =?utf-8?B?MXBlTVRmMTdXMVRRbFVqMDVOYkNoNlhlUTVjSklrRjY3dEovT0g5dCs3ZDRL?=
 =?utf-8?B?OWlmS1FjdEd6d09DU3hobzNiU29tSTNtOUJyS09yUUdnOWVrYzJuOTcxL01z?=
 =?utf-8?B?cUUyWS9hMXVnWjF2bXZzSkJBWVdsL2JQanBDekpOczBvTjhVVEZmeG9iczB4?=
 =?utf-8?B?TWl4ejJBUENFU3Y3cit1b0JLdEoyWWdEUEJhTGVuSlIrODV1ZkpOc0NOZzBO?=
 =?utf-8?B?S0ExOFczTGdwSEFuTUJKMHJpanhjaEQ2cFBucDRvVDA5TzNiTXNnTEdrb3Fo?=
 =?utf-8?B?WnZXTVpEdWUyQUFheXVvd0pxazlZYy9NQldreUZRUUx1emk0TnFkVlBaYkF5?=
 =?utf-8?B?U3c3OS96Q2VSTk0wSDZIYzZFdzM3WUM3ZHN1NHNITzZRSzg2bWp1dDlZS0xo?=
 =?utf-8?B?ckRTTjRrYWJSbUFGWHNCQkRpQmNTcXpZU2NlWHY4amE5TVFpZnRkaGlHYUpT?=
 =?utf-8?B?K2dZdDAwc1NmMjhzVmprSUVsL3BTOFdCL0tYc3cyRmZwMmpVNWZGd0VVWjhL?=
 =?utf-8?B?dXN6T3hhdU1ka3Fkb0FkWE5ta1Noc1RGY1NUZmVCako3ODRIb1JWajJDM2lx?=
 =?utf-8?B?Um11akR6dWc1UnNUaDZ5TnZYOENyZWVkOW5GdU1UdkF6amJtV3NkTXNONEhY?=
 =?utf-8?B?d3RQNXphU1FxTC9pWGhlb0Q2ZFBzSTN6eWcvMWgzQjZka0l6czNKMSt5N0tC?=
 =?utf-8?B?cm5qcW9nM3hKWlVybkNERmsvVkd5cW00RE5CeDc1N0d5dFpRamZ6MVJUV1Rw?=
 =?utf-8?B?cnZKelNkVUN2WWNFaEFWNGdrSTU3ZTRPM1g1NUh6bUp3RGRVVVFlS3Y5c0pw?=
 =?utf-8?B?S0dHSE9iZms0anpNejJCRWpOOUV3RlErT1p5d01ocGJvb2kyMC9EeGpWTFNB?=
 =?utf-8?Q?k6uldOIRUAU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXNHY1ZWSGFGNzZYQXdoN3g1UmpTZnZKN1FEU3RBRlc4V2Z0YnFSRTJXRUZP?=
 =?utf-8?B?YjI3VS94V21XS01LWHgvSU43Unh4R1dGbENyZm5XSTdtclppeEo4cS95OWVa?=
 =?utf-8?B?WWdMTnhvdXY3ajFNMDk2elhVdEQ0OXJ2QjVhN29TRlVTYVQ0YUtaMGRHZ2FE?=
 =?utf-8?B?WWhyeFlTSzhFWE5qV2FqRVo2c0VkMnNEdXVLL1IvRC9DZWVGb3BMMFFSS1hu?=
 =?utf-8?B?REFVek8rR2d5OUZ0REtEOVdTZ0RuZytqbkc5OWUrOEtlUW83SVc3UFV2QnU0?=
 =?utf-8?B?aWtPcjE2YytVMXQ4b2V5OUNNQlpWUFVseXFKVHRMWUVTbWhmVXhvVHVKaW82?=
 =?utf-8?B?cFdHbno0WWIxM0ZlZ3pVTVE4Sm9rTjM0bzZkRHhsejhkbFRBYk53ZTJORjYx?=
 =?utf-8?B?ZlorUVlCZjlUbkVNa0pOc3M1OE1wVjRyZmkxcWk2TWxMVEZ3MzAyM3IyZVFC?=
 =?utf-8?B?QUh2ZjkzK2hXTFdFTTRDWlF1Z1YrVnFuV3U1eEx4MzFlelBEZUJNMjdiU3hy?=
 =?utf-8?B?VEFrR2FDMGIzZUJxWFN0Ri9ycXZwK0pHbE1FZURXcDFZdGF4OXBvelEyUys1?=
 =?utf-8?B?TlFycXlINHZTdmd1dW10TkFydER5QkFOQzZZcjk0UjhVcHBBNjErQ1p4RlVW?=
 =?utf-8?B?Z2dXbzZ2Q2tiK1VWRXZpR1ZRZjRLU2FIOXFCT29sdkFyREZJUnU0SngxdTl1?=
 =?utf-8?B?emVLOVBJUk9IK2x6bFRJN3NyM3NiSzQ4ZVdOTzJLVVZOUVRIY1dEVkRzbGtx?=
 =?utf-8?B?NkpaQ3FuZXBuNzdoRlVEYnViWjdtMk5ONE9WZ25VZXZmcG1uaWtVeUxRbHBE?=
 =?utf-8?B?eTJCeW9YM2szVXl0emtuSEFmWTAwajIvdTBGcnZNNVJvOCthL09sdHpqSHA2?=
 =?utf-8?B?RlJ1eWt2NTBjbjZYVzBpZHZUTFhaTFlYQm9qNERka0tNdVFpcHRwbm5PcHVN?=
 =?utf-8?B?SzMyTld2QjBXTnJuS1RlYWtHUDNGdVFoa1cwU3R6b3ZuRmxqazJmcWlHekxB?=
 =?utf-8?B?WVRvblpLNXhWVXhYa2x0UGdHaGprVGlBem5XSk80UlF6MVZyanlERXcvL0No?=
 =?utf-8?B?eDc3YnJKaE1KNG9NRU9oYS9IMEx5OGRIN2pVajg2ZEl4d1ZLZGg5UjkrUDYr?=
 =?utf-8?B?TGpIRW82NWt6TlBVclhOL04wSlRhaWxVSlhXcVBheVAyMXBETFkxTWF1L2NV?=
 =?utf-8?B?QnA0WnhSWVJVaWEwR092UDNEOGZ3emFpandZM2FuU1pNUzhPa2xLQU5MMW1W?=
 =?utf-8?B?TjhoZ2hrY1BQUUxwWUZlTTF2Zi83Q2hBZWFqcXhicUNIT1B5Z21ZYk9IUDJG?=
 =?utf-8?B?VmFsVjd5bjJwUUIxWXllRXZhL3lxMHNOSVNONkQ5MVIrQ0xIbzdLbnNkR2Zn?=
 =?utf-8?B?UHU4YU53aUZXMWRmbEdUb2E4dnI2UFRlNS9HZThVNlhqdDM0eTRlZDc0MERo?=
 =?utf-8?B?eEpmNjU0SlYya0hvSnk3QjJiaVVnYVQyQjk0VFB1WXFjZ09rYWVYYjVsdTVM?=
 =?utf-8?B?VXpDZ0EvZWZDQlhmZ012S3ppN01Ia3NCUzd3RjYxVFRSMTN2VmxlN1VnQkow?=
 =?utf-8?B?NDRnTncxQkQrTUJkdEowSFpFcWVtYVovY1psb2hFaWpoWlkyZGh5dUYxek9l?=
 =?utf-8?B?SzRJL2VwN29sVkNNcUxnTTk3N0FuZUExSDA2UElieFlCengvV2tPbTVJTWU5?=
 =?utf-8?B?REp6RFlSZVIxUjE4NzZDZjRpd2U0K0prSFN2QVdXWGhwTHJBRDZsbGQzcnZM?=
 =?utf-8?B?cTN1MS9VOFd2WUR1aU5EV2tQMkh3T0pWd05CeWc1OUFYT3dZNFQ0K2g0VVJL?=
 =?utf-8?B?c2RVVzd2VWc3WlZxSEVjcElTNFdlUWNUTkV1cHdlUVNMTElSWXlzNUJ6NjRs?=
 =?utf-8?B?cHlCRW9OMjlWYWsrVmZTTVRpYUY1YzI1MjVWMFlKeFIxVWJ6TDFOWTBLSlYw?=
 =?utf-8?B?VmxEUjRWbHoveEJoNm9HQllwVTJVbXF0bjZ2Zm12Zjk0YU5RWkVrNUpCQkJp?=
 =?utf-8?B?RGk3dUpZNGtSZGZMeHUxbTBjOS9uaTRKZWlxQkcvMTJ1SUswTDR4RzZwNkJo?=
 =?utf-8?B?eFc2RDVINGJiRmpCYm5BbSsva3dJR2o3K0J2aHJCTTd2QkZxM21HVUMycGlT?=
 =?utf-8?B?Z2lNNFNwM3dOMm5TdS9ubU5yR0tKNVZialVJVUdOQ2ExbXlEVlkyL0QyR0hB?=
 =?utf-8?B?SVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dddf73e-660f-4b4c-9f1d-08dda1c9a873
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:36:04.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eU94cIKN2LuKx+X48UFMPOXI7UwAMm3zLfql1rpcD7HBRIL0wet60qVSpYyh7+6zCMSskBQ6rQmzcaSYKHrgivG0YlsmhPBQAh4SduESc80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 11:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6967

Hi Alper,

On 5/31/25 5:49 PM, Alper Ak via lists.yoctoproject.org wrote:
> Fix [YOCTO #15751]
> 
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index c697bdbbb..2f0925b15 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5202,6 +5202,24 @@ system and gives an overview of their function and contents.
>         Specifies additional ``make`` command-line arguments the OpenEmbedded
>         build system passes on when compiling the kernel.
>   
> +   :term:`KERNEL_EXTRA_FEATURES`
> +      Specifies optional kernel features to be added on top of the base
> +      configuration in kernel recipes that inherit the :ref:`ref-classes-kernel-yocto` class.
> +

I'm not sure that is true?

git grep KERNEL_EXTRA_FEATURES meta/classes-recipe/kernel-yocto.bbclass

returns nothing.

Looking at the layer level, it seems KERNEL_EXTRA_FEATURES is never used 
as is, only as part of KERNEL_FEATURES, and always in final/leaf recipes 
and not .inc files or classes.

> +      This variable complements :term:`KERNEL_FEATURES` by allowing layers

It doesn't as far as I could tell? You need to make 
KERNEL_EXTRA_FEATURES part of the KERNEL_FEATURES variable for that to 
be true?

> +      to include or override additional features without requiring Python code or
> +      recipe finalize hooks.
> +
> +      Features are defined in ``.scc`` files, which serve as kernel :term:`Metadata` and usually include patches
> +      and configuration fragments to be used during the kernel build process to modify the Linux kernel.

Gut feeling is that those two lines are too long but haven't checked 
myself, compare to other long lines in this file to see when we wrap text.

> +      For example::
> +
> +         KERNEL_EXTRA_FEATURES = "features/netfilter/netfilter.scc"
> +         KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> +
> +      By default, :term:`KERNEL_EXTRA_FEATURES` is empty. But, some distributions

It's not, it simply doesn't exist that is all I believe?

> +      such as Poky may set a default value using a soft assignment (``?=``).

Does it? I don't see it, only an :append is used.

I'll let Antonin decide but I am not entirely sure it makes sense to 
document this variable, which is very recipe specific. A point could be 
made that since poky.conf modifies it, maybe it makes sense to document 
it :)

Cheers,
Quentin


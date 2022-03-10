Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F68C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:00:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web09.8034.1646910025743841630
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 03:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=d2aPRyqG;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.59,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGWKsmfZgmDa1E15oQ0v/gRsrKQLgsLDke3W1HihiGqnQNeJf/tSMuTPpccW38DAk5p3hKYRudvgslvGXYJ5MwdMg+Wad2lC6lmjMYfj+f1UMwIlMiFG5PMO+TcGC+Yv5PIy4BLL73+MjdOCn8KwXJ00ui2+7eKUksO+fl94FuGG0y2kg0OIsYyL9dFDTopVPS2PizbgNVmq8on/9KXp1QdeaPIJuWbS6YpTWXr1fm5HrYlxQJfBa1EtVBzZr39ku8KplzHiryOp52UQEwEX0T5ZRXROe6JttbEI9cqTG6014uRqQlII3530fMIoDWQ7EeOfyEKTbTHfQnyDL39LIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bE8lDpWktfxCnyU1LIHMhCxwTbNbomwHJfphlw4VL2s=;
 b=Zc6vze0Jb8vgors/O4CBnqD6+gE35FKstGBwwffxJi1Tt10haFfnSNW0CyAFNGwba5XHiMzOPFgW4rtXXGdUoTC5CI+iE8jIf62AdVP5B2bS4YBIW9PiOcES52P1Id/Pwizb0UOBo82PG7TAqddW6fU0q+eG5KxKA/nQG72jJ9wCGGTR2099HcecVaMAxLvstR/35NzGBHDODSTjyG+djv7Mm6g3qKIJJugn6vSQ/3BjU7vvmNUy+bnCcYb4Dyn8KNFDiYzCDX+fWqoSXVwHIMZ6VrCJXRcfgmCkRcRiyk83lla3QIiJZFH7HmJWY+GWeTYYTi974pArhpEEN+xIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bE8lDpWktfxCnyU1LIHMhCxwTbNbomwHJfphlw4VL2s=;
 b=d2aPRyqGOJf3G28gWniGo0nuKa1hlTxyS2KwFCHz58rGHKWhkK8hXhaDUfQikCbuqEEZX+uNAH38Cexc28dPURb5nftiaaMLvKxn2tia6zWmCacFc/yK4s76+wriipcqOS7hbpWqzhDsjVF8sbk6PjmmKyy9bHxK6YelMybYJcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB5771.eurprd04.prod.outlook.com (2603:10a6:10:af::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 11:00:22 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:00:22 +0000
Message-ID: <51c1934a-6ead-c938-ecb6-c40c8b2f0d45@theobroma-systems.com>
Date: Thu, 10 Mar 2022 12:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] docs: update examples to add branch info to git
 URIs
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220309141551.612610-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220309141551.612610-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0006.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::16) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aff7e7c1-9dc0-4070-2f82-08da02852c56
X-MS-TrafficTypeDiagnostic: DB8PR04MB5771:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB57719428BA7774244C3B2AC0C20B9@DB8PR04MB5771.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9NxLTaVN198WObKX4Zrl1KssPWxwJz7K0nDnTTH49CX/nEdl0YXoVoiCNGwRr716VN0l/RAPsj3OAJzaJ7o3d5Ftc216X96ql85pZ+acev6kY5rV8gt3RrfTj66gnT80NilDNQ3WUbOL2zXcAcdNaPg7FR7Fqkudbi6maJBjcI87mhKEuOS0P5dzci6/Dd+q5nQNLNgFcRcxakh9vnSM2moMUJwfCsrKf70r8EpyJg3jXPMHaJgXHdfLljx2+noX45+ToIVyPd9CzibLWE/aE3TmAuryhkWOPSc00vyjZtcmMgzoi8RtwrZnih62nsFJFs96O+LJo07JUQK1gqHU/N+gYowTh20d7DxiOfJGy3Qk3nLC+ep3u5KnGtY3GYAf2zTJuCTYJrOwq+KA49Gy2b9uC73ydnJRyqNFroSkXBl7s3byjHPo+lDmxOSpeVbwgOoNm4spIJvH5ZdgXm7y7/5kVVeInLVQ986fW6WqaiMhF+9CB0mI93GBPFfoH8TbnyBXaS6DddS2PUiT0t/wtYUPUM6VaoEl1473NtkkeigZT02Tqjd8ZgyhrmlXEkm6LMhOpagSV41ASo7x5DZ6NmZJAg/oUl4oJH4pFGq/dY/p5zQO5AMIwsjg2aZRZpz6w6JNj1PfHgItYzvGEpIya2E2bdbo2JzcvyFAUTUtT97Iu5BTncjh2Yf5uicJuFMveg0PdOyQAJUyrsphteUDhMCJDhGmZX1rfdjp5obFNGdGn0kiA36xnTr19ddkYfwRaEcOjJGL8w0OvYDVCgJhBeLcCrfRUtpgQhl7/3o3xUv4UP3jRdBzwlcdSQaj7v76
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(86362001)(8676002)(38100700002)(83380400001)(508600001)(26005)(186003)(2906002)(31686004)(44832011)(36756003)(53546011)(66476007)(66556008)(6506007)(66946007)(8936002)(31696002)(316002)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eU9MbDIzY2dtRTVTeUs4cmp1VU43cWoyNzRHZGZMUms4MmgwRktsdVZ0Y05p?=
 =?utf-8?B?V0lSYzc1RE9KYXJISlBMdGhXTHVuUEpzS1FtbXp3RFQ4RTRDdXdkUTI0a3pj?=
 =?utf-8?B?MlJBc2kvZnNXUE1Eby9NVGMxMEI2ODZZM25GM2llR2xKdERwRTZPOFdWYmtu?=
 =?utf-8?B?N1FhVW1Jak5UekgwODFhUTFHYW1XYVdrOWY4VU9yU0Y0aFFTNFAzbkEwZXdt?=
 =?utf-8?B?eUxvVUFkUDlmdENFRXhxeVp6SmlUT0hGMm4wL0tYdnNiVG81MlErSEtSZThn?=
 =?utf-8?B?SzhIM2R0VURHK1F1Z01pb1ZHODdCYnc0Q3p2b0t5dHdUeXk0NEhRUkFUM3M1?=
 =?utf-8?B?RjJrUXR2azdLR0RoVi9HSkNRdVhBT3o1RUFPclcwTHZHVUVJVUdJdVZ6N3ZP?=
 =?utf-8?B?a1NXMlZ1dnR6cXc1U05VcXI0TDVBKzlDZTdxVlZROFRSU05JZnJadTk3eFFa?=
 =?utf-8?B?RUR5UDZqMzFPRllualduRU4yR2c2aTU1L0tvTEQ4QzVRWUVZYzhxZzBRZS9K?=
 =?utf-8?B?SHR4K1Y1cjd5bDAyL2FiUVJwS3J6SFJ4QTEzUjdCWWErdXF5ekdWM1FsQTdQ?=
 =?utf-8?B?NVhGSERSb2tQVDZMdkk5ZkNJM0Fwd3NmMU5LUEpJR0czbTl1aDhLZFIvSEt6?=
 =?utf-8?B?SjhDZlZ3TlFDTWdPOE5Zc0hoSVBJN3VpdUdMb1phT3lQVHpLY3BBV2FidzhT?=
 =?utf-8?B?U3k3T2h4eDNyRFQyRFAvTmcwemlqd3pWWFZGTldJS0hDSStYeVRYMFJIZnE2?=
 =?utf-8?B?VXFqQ1QvNVYrNTkrTmZ6ODc3UjFJanVlS2prcWd1OVVidTI2ZjdYbDJ6K1I5?=
 =?utf-8?B?K2FMeHBrcEV4Vlp0NDhMUEVoNFQ3eFJ5bGVhNTZtaEljeVRST25tRERCVVgw?=
 =?utf-8?B?cW84eWpWR3NFOUVUKzRlSGpFNEdJTWc3WVJTYXVWWjZicWhVY1E1emEzcmV0?=
 =?utf-8?B?dGhieXhnSTNXVHNONjEvSDdCU1c4NlpEdE95bzhCem1HamcvSlB4Nk1ET0Mr?=
 =?utf-8?B?dm85SG5LYlZ5UXVkbWZRUTNzRXplQ2hYSk1mcDlNb25XQTVmbGhtU0Z0UmpD?=
 =?utf-8?B?Vzl1aUZrYWp2QlhmL2g2eTE0Ymk3ZTk5T3pSMEc2d0hZd1hwbFMrNlUydTJl?=
 =?utf-8?B?WVZRTTVkb2lQSjVWdWlyTzhrZjhGMFUvOU1IaVpwOXlxL3BsQ0pWUXR3dXZG?=
 =?utf-8?B?M3pONEVONHdyTUhwb3lPRy9WN1lkSDR4R3JJSG5xVkdTQitkSUxaazZQQ1pS?=
 =?utf-8?B?elVlZEV2bzdVa3ovUDVNQ0NTRmlaenNMS3lmVm5PV1YxUVdHVWhFdW83bWl4?=
 =?utf-8?B?MjE2VGEzZHptMVlsejN6UDVyeEM0VVBKc3FHN0FVK0JRTlRyOWFFdUV6WHU5?=
 =?utf-8?B?WGxZN2lKWVhLTUNqYlcrYkIrRHFWVXVpenhuYnZlUlZ4YW5hajhudHQySVdS?=
 =?utf-8?B?YUFuOTlRWWN1Q3gwRWpHd2hIUFVhYWFjRUw0NlN6ZTZDZC94RjM3Kzh3VGJk?=
 =?utf-8?B?VkxWcTRaZWRKWWJ2SmExeUpneVB3blpEeitNRW1vZ01wN09lQnR6dTM0M2NV?=
 =?utf-8?B?ZE14NVRnbzIwYkk0cWdGRmFCbEZnUDF6VENlbFJPK2t1dFEzV29PcUoyYXRl?=
 =?utf-8?B?RHN3aVRhRXlMbTVySlpKd3JQK25NQnpiek15Zk5CbWhESzBMOVdXZ0hLYll4?=
 =?utf-8?B?MWNVcWUvK0hDQWZiU25saTJHUDhPL05zYkJmVW5ocHBZY3hMSmg0ZmFxUjhO?=
 =?utf-8?B?WjV3d1BxTDJXeCtFcU9nL2tYQWNPcktjd0RndHZuV0JHOC9zVjJhZVhRa1dS?=
 =?utf-8?B?ci9WeU9qelBFNHhxa0N4MmZ1MmpaakNhdWREcDIrWVgyaEZndTBXZFNOdGQ1?=
 =?utf-8?B?eEV3K0hJajdYcHRjTThVcXVCcEc5TlF0QzJXbUhEdWVNRk1CSDJSbjhlTnJk?=
 =?utf-8?B?TkNhejBKNmk4V052ZGNnTjBBcjRseUxySU5KdDk3MFpqaWJLL2FOYTl2WUFB?=
 =?utf-8?B?NUtOQktzeEhFYU9nT1ZSR091YzhKcnhVVUxDRDdtNG9aMy91c3RiTWRSRjV2?=
 =?utf-8?B?a2FNL1NCbExsNFozZlV3TVJ1Z3h2VHZsQ0ZOWTR4bXNSYjU0aDQzYlVYalND?=
 =?utf-8?B?bUxOYi9QUGUxQ2g4L2FsTlJmZW1CUXFUUUxNNlNFRkxnclZLODdsOFJ4QlNG?=
 =?utf-8?B?STFEQ3RqdG45NXE2VmVZY2N1TWl2SlNKYmIxNDJndW9uTFFzd1lkNklybmRN?=
 =?utf-8?B?bUFzYy9KOG5uMkU5OVBTcnFDR3pRNmNNQUJsditncHpiMzNMU28xTG5XQjdL?=
 =?utf-8?B?Y3lpWXZqUk9CeTRicVBpZ3NGYTFWa3RWMkNtNUtUcTVTWU1DYmttQT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aff7e7c1-9dc0-4070-2f82-08da02852c56
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:00:22.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SHBfbZje1pN6PMp+o54EjQyJnvFf0uYwj3bZYGAFRMCuqbStqYsiORAJGjPX9Hp3m8gB6K0BFbp48cO18L2nTStEXbgd8mr5hl1Yep5N7ahW9xc07IwoyNzPRcxpS96o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5771
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Mar 2022 11:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2576

Hi Michael,

On 3/9/22 15:15, Michael Opdenacker via lists.yoctoproject.org wrote:
> Branch information is now mandatory for git:// and gitsm:// URIs
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/common-tasks.rst | 56 +++++++++++------------
>   documentation/ref-manual/classes.rst      |  5 +-
>   documentation/ref-manual/variables.rst    |  2 +-
>   3 files changed, 29 insertions(+), 34 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 1caf953901..34f086bf1f 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -1402,13 +1402,11 @@ the revision with :term:`SRCPV`. Here
>   is an example from the recipe
>   ``meta/recipes-kernel/blktrace/blktrace_git.bb``::
>   
> -   SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
> +   SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>   
> -   PR = "r6"
> -   PV = "1.0.5+git${SRCPV}"
> +   PV = "1.3.0+git${SRCPV}"
>   
> -   SRC_URI = "git://git.kernel.dk/blktrace.git \
> -              file://ldflags.patch"
> +   SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
>   

Would be better if we had an example with a non-master branch? I see you 
rplaced mtd-utils with lz4 below so maybe a similar change can be made here?

>   If your :term:`SRC_URI` statement includes URLs pointing to individual files
>   fetched from a remote server other than a version control system,
> @@ -2372,41 +2370,39 @@ following example shows this::
>   
>      CFLAGS:prepend = "-I ${S}/include "
>   
> -In the following example, ``mtd-utils`` is a makefile-based package::
> +In the following example, ``lz4`` is a makefile-based package::
>   
> -   SUMMARY = "Tools for managing memory technology devices"
> -   SECTION = "base"
> -   DEPENDS = "zlib lzo e2fsprogs util-linux"
> -   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.linux-2Dmtd.infradead.org_&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QMieOh9nbIBS9SSii-FPQIjYKRoWkrrMH0lHC0zUBQjeE5CyvQvLCW2AnhdDjkp6&s=IH9Cg3SGu1_z_nLHAc0T0gK1IVKNgx1qioonvcMd5DY&e= "
> -   LICENSE = "GPL-2.0-or-later"
> -   LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> -       file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> +   SUMMARY = "Extremely Fast Compression algorithm"
> +   DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
> +   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_lz4_lz4&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QMieOh9nbIBS9SSii-FPQIjYKRoWkrrMH0lHC0zUBQjeE5CyvQvLCW2AnhdDjkp6&s=cFqbOb6M8UnVlEYErAMywY0qGo0oMtoZndqi1ZeQwfQ&e= "
>   
> -   # Use the latest version at 26 Oct, 2013
> -   SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
> -   SRC_URI = "git://git.infradead.org/mtd-utils.git \
> -       file://add-exclusion-to-mkfs-jffs2-git-2.patch \
> -       "
> +   LICENSE = "BSD-2-Clause | GPL-2.0-only"
> +   LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
> +                       file://programs/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                       file://LICENSE;md5=d57c0d21cb917fb4e0af2454aa48b956 \
> +                       "
>   
> -   PV = "1.5.1+git${SRCPV}"
> +   PE = "1"
>   
> -   S = "${WORKDIR}/git"
> +   SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
>   
> -   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> +   SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
> +              file://CVE-2021-3520.patch \
> +              "
> +   UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>   
> -   do_install () {
> -       oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> -   }
> +   S = "${WORKDIR}/git"
>   
> -   PACKAGES =+ "mtd-utils-jffs2 mtd-utils-ubifs mtd-utils-misc"
> +   # Fixed in r118, which is larger than the current version.
> +   CVE_CHECK_IGNORE += "CVE-2014-4715"
>   
> -   FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
> -   FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
> -   FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> +   EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
>   
> -   PARALLEL_MAKE = ""
> +   do_install() {
> +           oe_runmake install
> +   }
>   
> -   BBCLASSEXTEND = "native"
> +   BBCLASSEXTEND = "native nativesdk"
>   
>   Splitting an Application into Multiple Packages
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index cba9793332..ffb2176e43 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -170,8 +170,7 @@ example use for this class.
>      are extracted into the subdirectory expected by the default value of
>      :term:`S`::
>   
> -           SRC_URI = "git://example.com/downloads/somepackage.rpm;subpath=${BP}"
> -
> +      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=master;subpath=${BP}"
>   

s/master/main/ (or devel)

>      See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
>      more information on supported BitBake Fetchers.
> @@ -477,7 +476,7 @@ recipe that fetches from an alternative URI (e.g. Git) instead of a
>   tarball. Following is an example::
>   
>      BBCLASSEXTEND = "devupstream:target"
> -   SRC_URI:class-devupstream = "git://git.example.com/example"
> +   SRC_URI:class-devupstream = "git://git.example.com/example;branch=master"

s/master/main/ (or devel)

>      SRCREV:class-devupstream = "abcd1234"
>   
>   Adding the above statements to your recipe creates a variant that has
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 005456f0c4..efc3fcf8d4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6455,7 +6455,7 @@ system and gives an overview of their function and contents.
>         from the default value of :term:`S`, you must set it specifically so the
>         source can be located::
>   
> -         SRC_URI = "git://path/to/repo.git"
> +         SRC_URI = "git://path/to/repo.git;branch=master"

s/master/main/ (or devel)

Cheers,
Quentin


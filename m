Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351DAC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:17:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.14525.1677233858823394589
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=ItbYD13J;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.69, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afcLTl9g4zWE/cReW04Juw24r4iTOKnNpIbUZB+qRPctYAvRArhvu5s/pp1iCzMgH8rTSV7BINl3X+doRgYbwL6ziE0VsIQhi/AIyuJJVPae2hW+ErijXoK7tFPiILE8xFc85Bf1bDIq/o2IShzdv7XBczii9i2gPq+Onqj9wEr4OZ3BD/sOTujEF6p6LURJnIGW4DzHkg38U1YhatD+SkT+NWcsm6MptLnIyHBs/vU/MFenWb0BB6ODUKGpyWo29wSjSdeUAFWaMKyMArg+XGxF+bCqnDCm/HFwLG3sJeyeEycyBLKc+EGUTJEWRPa/4TFWE62uL9lUiBSIPs265g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4gD9n5nrqF5RSp54ZPiHcOoZZFTLvDt+RBTu6YR4CA=;
 b=YoKAUjBoXKAg/RYzrFrzoOI0dy22QG35JNoJ6U41g6Rys0tGyGsnnTHufQ8A4gwauftMRl+vF65YIo1YCjQO1lEBz0RPXej48kNz0R6Ull3exPJk2nimewoUFzIXAZ7anX2jywkqKEYNs7rcX2mOFhQKvQRi9jo78KzFzpHwwJ+NEmhgkxt6S5FqMXwrtY4E2KxTCurEnRon/7NSyNqHL/X34rHaj1LsDUjDkEFAxNn2vXFsyy37eTi8DjW5VSdFj/67Z9GL7qwXJSudW1s9wSfHyUVFDg1/FkbHxLwmQ5cxMlhqahI6eNII1aDHIEkM7mCImgy/zbR9yHvymXkgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4gD9n5nrqF5RSp54ZPiHcOoZZFTLvDt+RBTu6YR4CA=;
 b=ItbYD13J7/DIEsOfpFRaM3+93JnggKXL2670S/sBWDP7gRU4EQZiVXkaa7KE5N3LKiFFG6tsSqCKIgkbhaOnelUODiZQqiIynI6UvpoxmXuz/u963cAW6qON4Qwda9OKP8/fLQ8JqUkVnovYmrLsK3BPPHfMQ/oO8iZ/VcL6HpnVndlPNqvgTtRAdm0EdopR1r4DBWfzQUN44lNoGF6zB3h7wUJegRiGIvvSLlv5tQgT2xmV1x5ZleiNwV2XKDtx/3MjL6YLFUJJ+uVfxCU04lThUxA6bKxk+nknu5BWrifOoFDdg8T4bo+xWRW+4+tp+nHa7sDqWa5v1UR4VZ5szQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8343.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 10:17:35 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%4]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 10:17:35 +0000
Message-ID: <8768bbd9-b871-b8ef-07fc-b52548533532@theobroma-systems.com>
Date: Fri, 24 Feb 2023 11:17:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH 1/2] dev-manual: new-recipe.rst: add Meson example
 recipe
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230223153729.2492175-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: b0070c94-6f0d-4e94-d70c-08db1650595b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wxIHPFoCmFN3BFRm9C9oFDeN+og7umCUBSN8sHRqKkvtOQvejDuQiz2XtAMxSz+fw84Jqo9T73dDRLCq4gfaYToSRyDhx6Q/6OJC10OY863TuG+06/zx3GXmsYpZLMrhhhHCShvmW7SU9oCBE86xCJk7SnRLRMTntMpZtA1JmGxwVA4fK4oemn91e2YuZ4UcAg52x0Bo0Wgh9f1kONpfmeBtNtAjg5OjAMOpX2wNC3nA30Rx6ESE0vHTZ5Fl774R1nr5q8yoTiDhdkSfqP+gPvpeZSZOjLz+I0Cld8Wj6zr7y8s9oX6ILX9jSi8b/xB9rlWTgI0kQSR30s3CcvqZ9uQNYAbg0mbVdrjXJ3TQrGMUI7K37WRbskxgucmE39W56oZkPAo00gre6OU1cOw/D3j5vPI+zU+1VrqcsSXLyYrNpsKbTq2ng4mKorkL6AP82iuUooViw2vH7YnjLU8BWGoufmLyBjOa8XhwaAqHhls315UW0E9wEO48NULzW/XyxYsAt7RIi/ajWuohAQnUeR/PiA7stfYhuCxvcllkj5DOX3yx4WUzfiaFsP3O3MmtTM4Xxuw8DrqX4RjmOKeqJdB7rMXzGFLKrfsr7joYZUcSqeJwtpu9C3zv2rtCXteDv12heNhOhtmQtnx9H8W7p5Ia3F2iu/AEwJlwf2pOioNvzr1q0ffEhYXmWlx8rc278GQPzKSf+GlKypd19DPuSChImDjS4Rsj+YKE3mETdhg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39850400004)(376002)(366004)(451199018)(31686004)(36756003)(6486002)(86362001)(31696002)(478600001)(2616005)(26005)(6506007)(186003)(6512007)(2906002)(8676002)(66946007)(66476007)(66556008)(316002)(41300700001)(44832011)(5660300002)(8936002)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGJzOW1NbFZMQ093dzhYc2lvSnZxc0NkMEVUbEV0clg0SlFXeGZUWmFmV1dQ?=
 =?utf-8?B?QXUvcTU3TkdtWWtvSTF2TGxCZXZzcjFkblRkeHkzblYvTlVQRlppcW9Ianl4?=
 =?utf-8?B?d0VTSTdlZzVPai9pTHprTGlEcERSQWI4TUtYamZ2Z0hHaUJUVDROK0JCSVpB?=
 =?utf-8?B?TWZYRkd2eGNxWklxcG5hcE96VmlIcitMYzBzYXBPMU9NUmRCaU43KzM1ZWFp?=
 =?utf-8?B?MWRrdkZOWVlKOTk1TlhvSEdiUitrdlBsV1RpdTl5ZUhBOVFzSUpBTmFPUE0w?=
 =?utf-8?B?RHZKaVJ0OWtYUUgxYlRDM1Y3UW9meE9JTGlxcjcvYXoyeTd1VDVicVVOb0w1?=
 =?utf-8?B?MWdObVdMbUtqN0F6VUJzYW1Td1A3QnlFR1hVOWljNjIzN3FaeHppZWpURC81?=
 =?utf-8?B?NGx1MDZnY0dZTVNyMGE0clN3T3JicXQ4bnplNGFhSjk3aWlXc00vNHhrKytC?=
 =?utf-8?B?b3Z2Ykl4dkF3L2Ruc1dYS1VrSVFUWlNidE8wNWpEb0poUDNRQjAyQ0xGR1Fm?=
 =?utf-8?B?MEpjS2VTNjlFQktCNFE0UjRqOHkrRnczdWNVQnVRVkh5WHRDNnFrVnR3LzRu?=
 =?utf-8?B?bHlOdmdjS3dEa1FBWVJNWlg0Rk1lSS92c1VOQnJoSGMyc29NNmFlL293dldT?=
 =?utf-8?B?bE1HN3VyZU8yZ1RyQ2IvRml4c0paNjhWVTJSV2RJQ2pwZk5ka1pNaWpzb1F5?=
 =?utf-8?B?WGsrNlQxWDVFWHdPcFhUMmV6cDhTVnRNdGRoRDFDTmhuY1RtZlRiSmVVelA2?=
 =?utf-8?B?Z0V1SVJoVVhvajlqRktSQ042NGxLVzZhdWhxT0xrKzR1TFZJL1o0MVVMTzAv?=
 =?utf-8?B?Szg4ZHRTSVRWcXFNNmg1RWtLM3pOWjVxV3psSEcxNkhBMGxiUnpyeUdyL0Ir?=
 =?utf-8?B?RUJUUVhDRVBINHp0V0tsUUQ1V3dPM1E5Yk12RWYzSGc0QjZqekUrM0NTZEhp?=
 =?utf-8?B?ZWxnMlF4N1lZS1lRdUorSE00bGpzaEZHWGVJVzJrc2ludTJocWRZYTd1NVVx?=
 =?utf-8?B?Lzg0K2tmT0hPeWFBYWRFQ2FwN0hSaWZsL3kwMHdxZ0J4UnRQT2lTd1J4OGZz?=
 =?utf-8?B?Sjd4TGpQL3I2ZURUaldLYXBwMnpjcVhmeFNoZEMzTVB4enU3b0NnUFhIYlFm?=
 =?utf-8?B?UWc1MWF0Smxua2I5TU02T2Uvb1BjZ2JEaEk2dXFzZ3o2WS90cUVZNnRBYzNN?=
 =?utf-8?B?Zi9xSWdXWXJUNkNRcWZIdTNzNDh0b1JtRDh5Q3FZNTJSSzBxNy90enJBa2s4?=
 =?utf-8?B?cFptUEM5OHpvcUZONnBrTmh3d0RSMDFTRmxhQTRyOXgvS3FGMFdKelg0a1RG?=
 =?utf-8?B?ZmYvQzdXc1d6WWZhZjh5S1M5UXhnVnhUY0tuUFUxZ0lCWVVZb21HaXFJSlhV?=
 =?utf-8?B?Z3RIbHNCQlJsVVVjckdaZWgrR3RhN2hhTXNwMTdaYng3OFN3RHFycDl4dWxD?=
 =?utf-8?B?Q3lUOHNrTnNSTWlCQlhyTzdsUFczVHBaeUJFeDhzR2ZPTEhTL0dMOFNRZUU5?=
 =?utf-8?B?NHdNdStvUGxVRlVJOHJUa2FMY0M0NDV1ako2Zld2SWhxeWR2UWI3VU9IYmwr?=
 =?utf-8?B?VXlXVzR3YjRHdTZQMDlQc3ViUlZHWEtKY0UweGFRUFlNaWlKUzExcjZtSmNu?=
 =?utf-8?B?WDJOS3laMk1FdnZ6NzRnMXIrWkY2MURTZ2xXVzRMbEdRdDI5S2JOQmRza2RU?=
 =?utf-8?B?T3ZWQitHNWZTdXRReUI0M0ZQbG8vdGJsZ1JMQ0wrSkZCdjE2RU5iZFVUTkMw?=
 =?utf-8?B?SjBzVHJkNjN4cXF0UGd2Yk53TklTU3BsQ0puNzg1Wjh0L1dqQjdkbzEwNkJt?=
 =?utf-8?B?SzlBZ3g0VEY4bjFnWHF0dUNDb2VsOFhoRjhEd3Y5NFU1aUg1amxLSWZqMjVC?=
 =?utf-8?B?TXZERi83S3VGYkRCNmR2bktvempROEJhNnVHRzNqaU1VRU04V0NLOVcvQ2hh?=
 =?utf-8?B?MWVDenhQRGs2aDdzY2taVWRiOEorKzVwR1hMQkg1eHZjMzhnc1hLNkV4QVpK?=
 =?utf-8?B?TEpOOWxxcFZaNzd0Z2tVdFo5QW5TNmxkZHVHZEhjRUxJMEtrb2UweDBuVUhh?=
 =?utf-8?B?dGVvaXRINkMyTnpsZ0tmVXRNK3RUM3BMd0lEWDFMVVJiOElWVmYvRVJDc0Nv?=
 =?utf-8?B?UVRmUTVibStldVNGYnBhTXBpUzJwVGQ3T0EwTlJKWE1sTmkyQjVtdHQ2MTJz?=
 =?utf-8?Q?usHLKNtBFMtl6K5b9wmthhU=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0070c94-6f0d-4e94-d70c-08db1650595b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 10:17:35.6849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maIJhCA5iZINoie682ZAoo50RTE7JehO+yJTCNdJiggP+PwUlgfadLpoa6/Kj6YKBQ1lltFtMjjI5yAm7Vt5XT2Ksap7IcEJlrBPCN5GsBeaKgpbSmtVkNjYQ+P3Q4W/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8343
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:17:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3735

Hi Michael,

On 2/23/23 16:37, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/dev-manual/new-recipe.rst | 31 +++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 143c8b9c3b..9f00ac198f 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -1173,6 +1173,8 @@ recipe examples given various scenarios:
>   
>   -  Building an Autotooled package
>   
> +-  Building a Meson package
> +
>   -  Splitting an application into multiple packages
>   
>   -  Adding binaries to an image
> @@ -1288,6 +1290,35 @@ as described in the ":ref:`dev-manual/licenses:tracking license changes`"
>   section in the Yocto Project Overview and Concepts Manual. You can quickly
>   create Autotool-based recipes in a manner similar to the previous example.
>   
> +Building a Meson Package
> +------------------------
> +
> +Applications built with the `Meson build system <https://urldefense.com/v3/__https://mesonbuild.com/__;!!OOPJP91ZZw!hLxKIQgq28T7YW2MJN7MXVRoRC3TFLq8G2weHzeanzmiYu9JQS0ZsNUDJUCUDpFE9WGcl43l7VZrhhYZGJEczHo866O_aElqIP4L9UTg9UqYB2ZrNqD_$ >`__
> +just need a recipe that has sources described in :term:`SRC_URI` and inherits
> +the :ref:`ref-classes-meson` class.
> +
> +The :oe_git:`ipcalc recipe </meta-openembedded/tree/meta-networking/recipes-support/ipcalc>`
> +is a simple example of an application without dependencies::
> +
> +   SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
> +   HOMEPAGE = "https://urldefense.com/v3/__https://gitlab.com/ipcalc/ipcalc__;!!OOPJP91ZZw!hLxKIQgq28T7YW2MJN7MXVRoRC3TFLq8G2weHzeanzmiYu9JQS0ZsNUDJUCUDpFE9WGcl43l7VZrhhYZGJEczHo866O_aElqIP4L9UTg9UqYB5zP6znR$ "
> +
> +   SECTION = "net"
> +
> +   LICENSE = "GPL-2.0-only"
> +   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +   SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
> +   SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
> +
> +   S = "${WORKDIR}/git"
> +
> +   inherit meson
> +
> +Applications with dependencies are likely to inherit the
> +:ref:`ref-classes-pkgconfig` class, as ``pkg-config`` it is the default method

s/it//

> +that Meson uses to find dependencies and compile applications against them.
> +

I would suggest:
s/that Meson uses to find/used by Meson to find/
but that's a matter of personal taste.

Otherwise,
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>

Cheers,
Quentin


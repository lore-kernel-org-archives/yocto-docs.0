Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC268C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 15:25:57 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.59])
 by mx.groups.io with SMTP id smtpd.web10.1246.1750778752612909908
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 08:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FXZSoxBq;
 spf=pass (domain: cherry.de, ip: 52.101.65.59, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYDK4XkufpZdHubrxlAThedqkLXBUqMeuUajizccp+G6XKfVpdWw6CfFHs4kAEO21mwwUw1NuXUwkn4JVvMJE7yhMQq9iPfeAaJJR+PQaRwiepCOzsiXCCD2BQq4pq8ztiuhm92VvYBzb1h9yCw0JlZw/khB3UqtOXNxXDCvCTGQhamtmBXTshUCjIGsh/nf4Pu+uPvFe6HgstBYyEijG32BH8nwJ/8YYjs19UIb31Equ7yB3sFKhH+BahNqieZspIlO12uxCGi7AUE0CuEEFDeoryJpUz2KMzFSx6G5gEiXoYdP/SOxdiD20X4nnBs9OyxFb0VJG9VlkbVFatAEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAJxG2ZRGS4x5LC4cWmZ+V3b+zQdDjMk5erozxBjQEA=;
 b=dWxDBxkK9Yn/K+wszvRxIW2lIgwr/GjCe+8PTpZr05eJmFuLWzjuU/fJpbERzzqDdCqPMx1sYVWCK3OD9EFkh9aTknsrfsbBL0ZYgl9rWL6bUqlg67Gt9fBu1T9H0e8PidMrJ159jaQj3ubwxjpP9T18B3HXpQHiO6aWS+TEisiiHYXAWDBRYINDv2JFu5o4GtQDO0y6/FbljD2QVQ7moE0MoJEtsl46+Gnz6e48UnFdkrO0n3cT4x0yyzqMf5CXuhYcfHCCM7mWJQbaVPZPW0oYRUVBRK1Da0TuftqrWEtynlttmBT7CJ40/KGrlaXHTwrrLXQ4aKJbrlx2LaV72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAJxG2ZRGS4x5LC4cWmZ+V3b+zQdDjMk5erozxBjQEA=;
 b=FXZSoxBqwITPkNSgeqlFNawAYLVPXKYtFcroQpTZxVgaFwPGVMFN2hGP5zomm6mmL0siEFxu/D9rKKZIAJN8CqGyNkXtgElPWH3MM+0bPFVt45OPrqK+jxGj6oCUoJ21PcK+Io2DgA56atU9DqApqSlAVAAV0HuB4Ma5q3YQ7D8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB9013.eurprd04.prod.outlook.com (2603:10a6:20b:409::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 15:25:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:25:47 +0000
Message-ID: <f1e26a85-18d6-4eb5-86d8-e94bec5e89fb@cherry.de>
Date: Tue, 24 Jun 2025 17:25:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Add a document on limiting host resources
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: b44061a8-b093-4b8d-a18b-08ddb33364bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDVZYVJ2UTFpUXppaUN3b3lEWGdxcXVYVWtpcE81eDF0bnFEVXkxOEJ4OWZk?=
 =?utf-8?B?OGUrcmN1ZzJlRW96R1M5ZndnT2VTeW1ZTjhyc3hKdTNYY3psZ244b2VmUWhB?=
 =?utf-8?B?dXJmVDBnMzYrSWpuYWFFcUJNK21QSmZVem1xQXF4emZjenZ4U0gxU2xVYm5G?=
 =?utf-8?B?cmxGR1E0SlZ0TjZLUEM1V05mREw5OWxoa295SlR5QjNVS0FjM3A5QkwrUDAz?=
 =?utf-8?B?cFJnUEswUHhzYkxuVVlHN2lDWnFvTmVhak9nN3lkMzI0UlB2RlpOaFV0bjJJ?=
 =?utf-8?B?U0w3TXlnTy8xcExKZ0t3aFgxNGlqUGl1K3hYS204eHVTMFkrT0RLZFZtWUZp?=
 =?utf-8?B?amVzaGdRdkdLakRLYjRCbDk1UlJHZTNKTWlUMTdKTTQvNytsV283RjZjcWxC?=
 =?utf-8?B?cXNKV08wRktSSlM3VG03bG1XYVBxMW1NbHZBTG9SbGpqZ3RXVGtISnlPSEp6?=
 =?utf-8?B?NWZhZ2FBYWZWclF6S3ZPdm91dUR3VVBKdHRSL3E0YkxwdVdiRER6MnJ5MGs4?=
 =?utf-8?B?MUp4VUJYYzh6cDJMcTg3REFQbG90T3VqZkJTa253MG1XTkRWaUI5VVpXc2RN?=
 =?utf-8?B?cjZJMHJkOUo2UE1MVUlXRVhZbk5Razd5eldsYkdTcVc0eENLVHJLc1hWY0gr?=
 =?utf-8?B?Y3NNQkljSmZaenlwd0N5ZkNxNU9kVlZZWjNqUStFNWtOaFpndnMxT0R0RDdC?=
 =?utf-8?B?M3ZCMS9GMHR3TFZwNUhPT3NIcmFLbTIzZVF0M1dHSG1jVWl1TXc2OVEwZUlL?=
 =?utf-8?B?Sm95eS9EZm83MXd0TW1wTEowUUMvWUZySkFKcmIzYzI4WFJEL09JenEyZ0Y0?=
 =?utf-8?B?VWRQd05IWm5kYWp0VjZtb1ZTcDhEdHdEekFLbllEL2F4bXVyOG5JUGxoSmxx?=
 =?utf-8?B?bjFNTXZaYUxXUUd6aHFGZ3drYitEVHhIK2hNcm1lNjM0ZVoyUkorTHY1Tnpn?=
 =?utf-8?B?NDQ2TUFWS2xDYmd0NDhYQUNIcmNqMExtajhxUDNCL3J3S1YxMEFlS2xCWkJm?=
 =?utf-8?B?b3hGL1IrZ243K3JxOW9sRExtRmtkU2V6YnVWWFhUeXBBdTRPdThhcDVqZlps?=
 =?utf-8?B?MlFFd1dxRldobkZvb20vQUpQWjhCcE5CZisycjFBOEZzeVY2bGZ2dGYwcFVX?=
 =?utf-8?B?Z0RUcjZ5UjdpZlJNSGs0aWZaNWtLV1lWL0FCNU5LT2ZCVERZVFdTMjMxTFAx?=
 =?utf-8?B?SEFKR3V5N1ZqdENQZFh4bkJnRkRVWUhucEJCenJBbGc4N1NqSVdyRk1JMW5k?=
 =?utf-8?B?bzRHM0tHZUxUVFhPUGYyV2ZWTVRiVk9jTUhLRW1IT0FnOG5iYXdqYU9YTUdi?=
 =?utf-8?B?bDhFOTJtZ1pnckJ3NVEvQXpobFJoVVFvd0E1aUdzNFhkck1JSlZiclFjbzlI?=
 =?utf-8?B?UnlaNGF3RVN6YmM2VWxwdkZ5Y1BqQUtJL3ZjTEllTjJ5L05ZM2tDOHcrbHJs?=
 =?utf-8?B?NFJvNUxLcUpZMHpXOWppVFZHdmxnREV2TnhLQjBKL1pYdExETzRrYjcxVVNR?=
 =?utf-8?B?MzQyakRJM0F3M0cyNXd3UGNraXhXOVFQVml1Rit4Q0gzV1J5ZzgyMk9icmJK?=
 =?utf-8?B?RGd5SkUzelpLWlhsTHhDWDhkTnR6VWZkVzVrZDJNNldOSlJtRU03bHlNbmFO?=
 =?utf-8?B?SER2bXFsQkNKckJLUVc1bHgyWEk1TmxkZUJSMDJZQmM5Tk9ad1d2eEY0WGwx?=
 =?utf-8?B?cTV3ek9zUzd4ckQyUlpOaHJwcjh5c2k3bjZtWVhYYndIUVJJMjM2L253aXBy?=
 =?utf-8?B?YmVOQ05uclI3NzhnTVBLU0I0NW9DNVNaZHZyZHFTYXZhc2RQc1c4cmVxUkhv?=
 =?utf-8?B?VW1kT21EOS8zRlpyNUg3UlN1R0lRUlJXazRBQ1BiTEZBcGhQY0sxcnpkQ2lD?=
 =?utf-8?B?UDQ2QUlQT3AyNkh1VGR0ZVNTUXlRMDBRMy9DUkVBREF5UzZFNFgrNEx4R2Y4?=
 =?utf-8?Q?bh7GxMPcHBM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y05TdTVQeVFTT0YwWjRVWGpKc0NRdkhKR0pkL2paSXEvek1uekFlY2E2Wnpz?=
 =?utf-8?B?QVREcXdYandYTUZlOG5qQWJJakhkWStJZ1Zqc3BnekZ0bEJvVi85SFFiWGFO?=
 =?utf-8?B?ZGI0bVVTVThNaWpWcmxVREpROXNMb1Ric0F4SHI0eFJZQ3hWODBDVkZma2E2?=
 =?utf-8?B?cndzZXdyNy9VZ3dRbEtGdHlQaW9IUFpiQWJjMzR4dkh2VUFkTlB1bFkrNkE5?=
 =?utf-8?B?ZEdqTnQyZ0ZpWXlmN3krckxMV2VKd1g5T04yb2s5Y0h6aDNZQWZucGdac3NZ?=
 =?utf-8?B?RTFYK3pWUWo5aFl5Ri80NVh4SWN1anhwSVMrN3Fxa3dKd3l4SXN6NnhVZmRt?=
 =?utf-8?B?elY0SnNIZTZXbkxyaFlweWM0SUQ2eUZXcXNRR3ZSc0cyZlM0UjRiMzFmN2Vu?=
 =?utf-8?B?T2ZzSHZRbDVzUDNVKy9IWTIrMEJzNmtlY0EyT285OXRHSXB4THR1YlFJMUhr?=
 =?utf-8?B?M2ZuMk9jNnE1WlgvQWtZV3I4VnRINmxsMWRmMnJrN3FnN3hBWDlYeC8xaXQ5?=
 =?utf-8?B?QkxrNk1NNWNsYVlvVEIrM0pXb3pLOEFuajBlVXdEWGdJTUhlZlU3Q01rak9p?=
 =?utf-8?B?S1o4MHZINUJDUERJaWhGeWhkNy9DcWJBRDhBRDRtL1A4aERYcXFvMHZOakty?=
 =?utf-8?B?dk1jVGcrQ3VwTHZqSzhqSlI3TGQzSEtwdW13Um5mQmJvWDA3d0g4MDArR1Br?=
 =?utf-8?B?cURkWGx3bW9mNHE1bWJiWllNZ3ZwUm1FVytISTBINTJvM3BDRmZTd2ZCQW5L?=
 =?utf-8?B?SFcxSWdlTDZ6REVlZHMwQXMrZ1I2WUEvcmRrOEFoVGZ0SEpSLytFMTN0U2tL?=
 =?utf-8?B?RURnY2hrNW9sbEJzUzl6TGFkL3IvMTNtR1dPemdoanlVTFNGYzNvTnY5QVZv?=
 =?utf-8?B?VGl4c0d2S3pDZm5YaHhCYm4vRXMyZ25pUTZiMzRYNGhkS0w5M0VCeFhCN1hz?=
 =?utf-8?B?VG9EVTlaN2EvVVFZZnROTlpoRCtZL3pkaWtjL3BTbEFZQWdmYXY1c1E2bnhW?=
 =?utf-8?B?NHVnOCtwcmRxd3RuMGhYZjJubFd5ZUx0OU1vTUpTU20yMkRHUk80V1NobDNE?=
 =?utf-8?B?bkZMNXBoVHBQZmNHRFBjVUt2T0diaU5BcWFwcmtIM3lIOHFWemRNOSt2L1FN?=
 =?utf-8?B?ejczUnBjNkZ0Nytzc095bjNsZ2FFRG16THBzTkw0eHJuZTBtd2t1QTcyUzlN?=
 =?utf-8?B?M3kvZ2tzbkRsZkVYekhOMWlJby80bVlXOHdPVDdrc0h4aURqNVYyQ2VWd3Zs?=
 =?utf-8?B?QVpBSnZrclJ2ZEFWVjJjbjFsZ0U4T2RFTjc4dmFlRm5KZC9ZVUJaZHZJMVAr?=
 =?utf-8?B?QWYwd3FlKzBNR1BTQ0VEK2hsY0pML0lrZzdwRFU4QS9jd2NzQ0ZSa0dNaEdJ?=
 =?utf-8?B?Q1NVWi9tRkg5Y0h2dWZoQUdueHB5d3V0cmxvWjlJbFZyZXFhaTZJTVBSdzd4?=
 =?utf-8?B?TjBObDBJSi9yVzd1MWxoamVIZEtScFpYbE5QMW1OT290dEJrRk82Y2g5WG92?=
 =?utf-8?B?cFIwc0RscHVaWE9RNUwzTG4zcktNd2U4V1JtQTJxNVZhcUgxakMreVVpWGE2?=
 =?utf-8?B?bGo3RkZIcEp5QWlYQ1hZYjlQMXhJT3VxT054ajZoTVhXWnlrUzhkWGo0Z3Yr?=
 =?utf-8?B?VHNoY05xMWNOUENvdDR5V1I2N3NLQWJ5c0hCZ0srVFFpT3lGcFJpbTB0NTlJ?=
 =?utf-8?B?SzJlaUJvV3IxY2wybnBnSzJkM1RzemZiNjlzT1V3eGp4MTFNVVNNOU8rY09x?=
 =?utf-8?B?Y05PcDUvNU5QdVkyMjNLcmlaOGJpSVc2K2NJbzJpSEZuMk9MbEJ5QVIrWnl3?=
 =?utf-8?B?akNLRnArTmFKWGJHM0dmYUR1K1AwNmhra2paaTlWOVFJdUdoZkloZ0FKNndC?=
 =?utf-8?B?cjNFaEVVU0JHaEd6SzNvN0hQS1RvR1RFdVNqYkp3MG85WW5mMm1nNzlPcHpu?=
 =?utf-8?B?VUJOV3cwZ3Q2VTdWeGhNcnV5KzZwVDF1SXBXVmFvcTRaV2ZMT3pVS0F1TVdP?=
 =?utf-8?B?RHRYOTV3L2tyRHJ0OHo4cDFzdUoxNzFzK1BCRmIyTDY3MWFrVnhkTThiUnJn?=
 =?utf-8?B?cThuWXFkMlJ1UVE2NGZvbjNRVURENWhLN2VGQUxaaGFZUVNhZ0FSd2xwSDZM?=
 =?utf-8?B?b3VuV3l4OUJTcW9TRTVWdmMzZDdhV3ZhZG53UzQ3dzc2U0NJOU5EVTBCOG4z?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b44061a8-b093-4b8d-a18b-08ddb33364bb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:25:47.2340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 559j7wtqz25qp3t2e4oIP/41/bb6YPxehtN8aksh2Gw66sccusetl03vfgeoVwR034EPNTtPHXIrwPs1r0j+nrT+V/ZRDNF/79WZPpScKu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9013
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 15:25:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7216

Hi Antonin,

On 6/24/25 4:42 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a "Limiting the Host Resources Usage" document to share the
> different techniques that can be used to limit the host resources usage.
> We do have a document to document how to speed up a build, so this
> document comes right after.
> 
> [YOCTO #15111]
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/index.rst              |  1 +
>   documentation/dev-manual/limiting-resources.rst | 85 +++++++++++++++++++++++++
>   2 files changed, 86 insertions(+)
> 
> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
> index 63736e0ab..4abfa59e9 100644
> --- a/documentation/dev-manual/index.rst
> +++ b/documentation/dev-manual/index.rst
> @@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
>      building
>      multiconfig
>      speeding-up-build
> +   limiting-resources
>      libraries
>      prebuilt-libraries
>      devtool
> diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
> new file mode 100644
> index 000000000..df8208bdc
> --- /dev/null
> +++ b/documentation/dev-manual/limiting-resources.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +Limiting the Host Resources Usage
> +*********************************
> +
> +While you sometimes need to :doc:`speed up a build
> +</dev-manual/speeding-up-build>`, you may also need to limit the resources used
> +by the :term:`OpenEmbedded Build System`, especially on shared infrastructures
> +where multiple users start heavy-load builds.
> +

We could also say "or building on low-power machines".

> +This document aims at giving the different configuration variables available to
> +limit the resources used by the build system. These variables should be set from
> +a :term:`configuration file` and thus take effect over the entire build environment.
> +For each variable, also see the variable description in the glossary for more
> +details.
> +
> +-  :term:`BB_NUMBER_THREADS`:
> +
> +   This sets a hard limit on the number of threads :term:`BitBake` can run at the
> +   same time. Lowering this value will set a limit to the number of> +   :term:`BitBake` threads, but will not prevent a single task from 
starting more

I was convinced this was the number of tasks BitBake can run in parallel 
(which is what we say here and there in different places in the doc as 
far as I could tell), but I also see that we have a bunch of calls to 
bb.compress.zstd.open in bbclasses that pass this variable as the number 
of threads to use. Sooo not sure what to trust anymore :)

> +   compilation threads (see :term:`PARALLEL_MAKE`).
> +
> +-  :term:`BB_NUMBER_PARSE_THREADS`:
> +
> +   Like :term:`BB_NUMBER_THREADS`, but this variable sets a limit to the number

s/to/on/ ?

> +   of threads using during parsing of the environment (before executing tasks).

s/using// ?

+the parsing?

> +
> +-  :term:`PARALLEL_MAKE`:
> +
> +   This variable should be set in the form of ``-jN``, where ``N`` is a positive
> +   integer. This integer controls the number of threads used when starting
> +   ``make``. Note that this variable is not limited to the usage of ``make``,
> +   but extends to the compilation commands defined by the
> +   :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such classes.
> +

I think it'd be better to say this applies to configure (?) and 
compilation steps, and typically for make, meson, cmake, you name it, 
build systems.

> +   If you have identified a recipe that you want to limit separately from the
> +   rest, it is also possible to achieve with the following syntax::

"""
you want to have a different limit from the rest of the build
"""

?

Please specify where to put this variable (in any configuration file, 
but most likely local.conf I assume).

> +
> +      PARALLEL_MAKE:pn-linux-yocto = "-j4"
> +
> +   The above example will limit the number of threads using by ``make`` for the

s/using/used/

> +   ``linux-yocto`` recipe to 4.
> +
> +-  :term:`PARALLEL_MAKEINST`:
> +
> +   Like :term:`PARALLEL_MAKE`, but this variable controls the number of threads
> +   used during the :ref:`ref-tasks-install` task.
> +
> +-  :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` and
> +   :term:`BB_PRESSURE_MAX_MEMORY`:
> +
> +   This variable controls the limit of pressure (as defined by

s/This variable controls/These variables control/

I think we need to state that this requires the host machine's kernel to 
support pressure reporting/handling. I vaguely remember this was 
discussed back when this was implemented.

> +   https://docs.kernel.org/accounting/psi.html) on the system, and will
> +   limit the number of :term:`BitBake` threads dynamically depending on the

Is it threads or tasks here? I also don't entirely remember if this can 
also impact already running tasks (e.g. dynamically reducing the number 
of threads in the available pool during a make call in a recipe which 
started with the limit not reached but is running while the limit is 
reached).

> +   current pressure of the system.
> +
> +   These variable take a positive integer between 1 (extremely low limit) and

s/variable/variables/

> +   1000000 (value unlikely ever reached). Setting an extremely low value, such
> +   as 2, is not desirable as it will result in :term:`BitBake` limiting the
> +   number of threads to 1 most of the time.
> +
> +   However, having a low value at the beginning makes sense to get a sense of a

beginning of what?

> +   reasonable value to set for your system. Indeed, :term:`BitBake` will print
> +   message on the console in the following format each time the current pressure

s/message/messages/ ?

> +   exceeds of the limit set by the above variables::

s/of// ? or s/of/that of/?

> +
> +      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
> +
> +   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,

s/value/values/

> +   Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO
> +   and memory respectively. Monitoring these values during a build should tell
> +   you what a reasonable value for your host system is.
> +

Mmmmm... I'm perplexed. If we set the value very low (e.g. 2) won't we 
simply limit the number of threads to something very low which actually 
could mean we're not necessarily nearing the maxing out of the 
CPU/IO/Memory?

It's like running your 4-stroke motor on only one piston: "I see I can 
reach 60kph so this is a safe limit for my motor when not choked up"... 
which yes is true, but now you're not going on the highway because 
you're limiting yourself to 60kph and taking the long way home. Safe 
yes, but not sure we can derive much from this test except a very low 
safe value?

> +-  :term:`BB_LOADFACTOR_MAX`:
> +
> +   This variable will limit the number of threads :term:`BitBake` will start
> +   by monitoring the current load of the host system. :term:`BitBake` will print

I assume we're talking about CPU load here?

> +   the following when the limit set by :term:`BB_LOADFACTOR_MAX` is reached::
> +
> +      Load average limiting set to True as load average: 0.7188262939453125 - using 37/64 bitbake threads
> +
> +   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
> +   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
> +   was designed for system that do not have pressure information available.

/system/systems/

Hopefully the glossary and this document stay in sync :)

Cheers,
Quentin


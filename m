Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8254DC0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:41:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.58148.1739209269637420076
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2025 09:41:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N2ds6Mt8;
 spf=pass (domain: cherry.de, ip: 40.107.20.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV3AgC90/Bg2RuoPg9BhBfwgAz/jrMWpcNUB38OY5XKOc6Grol1BgOO56eV653K+48LerGZyQCjFD3zKfpvfM7rQrs50U/8allkCu0Seuo4YGFuF06pRszRH8t3Eil0ikxHy8au9ICk345xyggexXdN6Zw/rfn1rBdtHEDsS2j8E4UuZgkYGMqCWUCE1qfgi4ZPSREOIsdD2J3l3utl0rSWjQ7fhBUASwJ9Zy2KANAI9mcYEsnSQ9A33GqUaJptY3hkwRl8c/WVq3qbeeJWF/Fz4fX/RnH7z1wmc3p/FwWIYuZfSiy3/GJUrUycoHaVv3J//Rvj7CVAJjmAuRue4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRhqe356HOb9Zbtc07Hp2EAZeSGapJ/CLqSRWPR2kkQ=;
 b=cja0OtnKbpxGZsypOAoZo8nU4verDhuDcP3wGwx+5e2PQTBCbyoE31ivhbN2+UTPjxZsT4ZbGzi4G0GUDSRS+6UtGU3zlI90F1Oaem0EEhoFTUfsxXMg5USwbaLekAWlN9v5FdIMQ/lvfCrHrTd3zeSMeG8Bk7AGUX0w3P156D/d4E+r8ZDXDDNMoAHLVm8DWFEB9dG5Pxq6Z/0/kTdYq4sbMSTQ5TFqnCercWjG55mnfYrtGQNKB10pyLXdBTPlFb7JXfcW1zerkGOL8wXQH4BTUcQ1/GWZE3Ikwjus6MKuXqe6Bkh2MkmR3C6W+tovHeZgOPT+++1y37BFRis7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRhqe356HOb9Zbtc07Hp2EAZeSGapJ/CLqSRWPR2kkQ=;
 b=N2ds6Mt8NV6O0UnABQVTw48JOQA4OKUOP8RYxwvdCgjjDdOWMrS3+7baYLu6bkDELxJ3J0gigiLCsPeMpLh1C6nz/JerI6VZxwcpwX5aDsM5kec/ChO2vcGwCHxrGqbmfynIEvddayX23Vr7W1kuwnnhBNGSIihfWELhZUgtRi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:41:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:41:07 +0000
Message-ID: <49873d69-a815-482d-915e-da629c44f00c@cherry.de>
Date: Mon, 10 Feb 2025 18:41:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 3/4] reproducible-builds: add a "How to" section
 with OEQA* variables
To: yoann.congal@smile.fr, docs@lists.yoctoproject.org
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
 <20250209233245.1397155-3-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250209233245.1397155-3-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b26f11-a9d9-4de0-1a7b-08dd49fa193e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjU2WmI4YkRaZytkUUkzWFpDNmNxN2VQSk9XTzV6VDJDUUNrTDk5eHZKa0k5?=
 =?utf-8?B?R3RyRGlVU3BTaytxUFQzdXZXZktSZ3FodFJTcU9uOHhyVmFHR0JHeGE5aWMw?=
 =?utf-8?B?WDg3dzJXdWg5S2duSlkvWlRXaS9RSmJyWlI3SHVybVhreEozSTh0eW1WN0NJ?=
 =?utf-8?B?VVkxekE1QjFpZTJ0ZUtiYzNyZFpkc3ZFY1A5M0hnWWcwOWVpMmg0ZkhEMjVG?=
 =?utf-8?B?Z1ZpQ20vZ0pNQkllbVpHTWFKcUFIbU4xa3FwUWRiSFljQkhORzZMbUt6WXdu?=
 =?utf-8?B?TjFDYW1RTmduaEN4eE5RMTFWNUpQVGxZV3pubjV4MVg4VzV3a0YyQURsTVN2?=
 =?utf-8?B?NVQ4djdELzQ2Q29CVW0vUnR5Y0Vhd0xocTkxMzVudTdkR3NWNFN1MmRLYWp4?=
 =?utf-8?B?cjdCVGhEbzJLYTBFYnNQK0U0bG56MkVnNTNqbWd2czkrUjhkMnI3SjNPTE52?=
 =?utf-8?B?M1c0R1h1LzJ3Y2E5Ung3V1JHZENSRFVyV3ZlUWhrY2g5b2tnNWxTbDAycG9G?=
 =?utf-8?B?aXFRamxESXJ1TUtwK210azZvMld3cE5wOEFVOVlzbDNuMU03a0tTUDU5WTVt?=
 =?utf-8?B?Zjhlb1p3MlFpeTA4by9ScGtaQTlZeUZaUHo5OGxDdkdScTBSY1pZc2RSQ3RJ?=
 =?utf-8?B?Q1gvZ0ZGUWVxdDhTY0NQVVNHNCt3MWVNYTk4QjhvbG5kd2dkelpxVzRLS1Rs?=
 =?utf-8?B?eFFSY1EvdDNTcVpkcVFwL1d5V3lGbXF1d0llMEZmM1BoMWN0bG14ZUNHbitO?=
 =?utf-8?B?VXVaTG9aV2FHUzZuU2Jad045THE0S3FMMWZXTTVKOUtVL1VGTjhHVDJoVzJo?=
 =?utf-8?B?TEZ0TDNGQm1GOG9OYnBSbW9qc0JUWkhlM0svL1Y5NWtVaWJxWmNwL0N0c0g1?=
 =?utf-8?B?bFozS0VDQ2NuNElMZlIrYUttcnlEdUtCUVkwTHJ1YkVRcFdKSTlNdWlOM0dk?=
 =?utf-8?B?YzNSOWF0b2IzVzZRNTlSb3BLKzBHem9MRVA0WkdQQlMyNUJNdStiNWFVbmZK?=
 =?utf-8?B?eVMwNkt3UmRsOHkvTGJ5YStJZnlSVk0zR3JJWmw2cFlKNmE2N2M2Z3k1V3kw?=
 =?utf-8?B?eFUvWDNjZm1uUWk4SE5wa0tCWkRYc1F4ZEVjTnVZbkZQOWNEWElTdHpqWDBx?=
 =?utf-8?B?dUpUd28xWkNCRjB1eXdwbXAxTmtoU21RZXU3bldMemw4emJhT1QxbWwvSUZI?=
 =?utf-8?B?Tk02Sm9hRTlnbDBmUTYzNEhZWTV0L3hOYWdsM25PRTdQanZ2NHNKQUE5aWNr?=
 =?utf-8?B?czJhaTVjVS9ndHpWMW41akU0OEorcnNhc3lYU01OQ1AvWThJbEtTSmd0M1o2?=
 =?utf-8?B?ZmE4R3locVR4NXo2ZlVtNVB5Q29UUWZ0ZlVZaTJEUFhIRFZ2SjdUS1lTTEk5?=
 =?utf-8?B?NE0yeE5PMW52NUZNQ25ETzBvNTVaOFo2ZWl1N1JTeTlXRTcwS1l3bGJEM21M?=
 =?utf-8?B?RitnSEZvV2d3bm1CdFBpRmpVaWo4VUJoUkxSSzZmMkVtWm5kYm14OFZWRmhr?=
 =?utf-8?B?MU52VEo5SHR5VTY4OHAvdmxmRlNVY3FGVWhneHErMDEwamRqaEhZeUVMSDRP?=
 =?utf-8?B?dkNyd0szMGVUR0FkQy9ueEE5RG84eEQ0QWNwcU5CMDlUdGUwK2kxOWtPNG9V?=
 =?utf-8?B?Rk44NUI4b2h5OGJZRFl5Mng0RjhHVVZDUUwvM0lxQjFTUVdid0JTUDJzZnpF?=
 =?utf-8?B?NEhmV2xGL1RPemZ3VGhqOWhaUEZGVVYwOUp3c095K0JPdjlNaEdXWWMrUUZp?=
 =?utf-8?B?TzBkWDRGUHU2eDg3aVE2aFVKZjliQWMzRGREMnllenlJSGUrOHc2THpEWkRP?=
 =?utf-8?B?UVVYTklRd1lhektsUk5SMEVXeWtvd3ZlS2ZDTktlZEVkbWhRMElHclo5ODFu?=
 =?utf-8?Q?99+HK6ZeLROvN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Lyt5S0pQTWtMOThFd3VMRy8yclJIKzRrbWhGZERhaWNTVTUrdVVKcnpjWGFN?=
 =?utf-8?B?dEd4bTJJZVRGbDRKVVNQeHZUdDRHZEgvaS9TbFVSSkdyZDlxWHpJYVIxeUFu?=
 =?utf-8?B?SmswRzZNcG9JOUNxVWIyVVk1MzZPSnRRWXlYanNWYkswT2Q2SktFWE9pOGJV?=
 =?utf-8?B?R2J1MXdnSk9HNHVGbVRaTG0zUHhEOExhUVdpQ01WQU9EWVcwTnBmMlpwZGpY?=
 =?utf-8?B?cjRMejJjeUY5NzNVYmljemRBdW5mT3QrdDhZYVplYUYrS2M1eDVZRGFJNE5m?=
 =?utf-8?B?VDFEOEV3QnQ4QW5yUUI1TmpIR1Q2SnFkMzVzK0huU0piVXZxSlBzelhnKzJa?=
 =?utf-8?B?QzZhVkE0MEhPZGZDOXlodVUyNlZmekFxVlQ1dXdQUDhjZDE1QmM2N1l6QnlL?=
 =?utf-8?B?MTZzYnR1YjhkRnVBRThZLzZkcm1UeC9xSy9KWkpVWHN1SllLMWdFSTNsd1p3?=
 =?utf-8?B?MFlENzdkQVpuSjR4NG1ZVkZkeTlxZXo5R2t4MEN1eTJRL2crRlFIQTdvQWhR?=
 =?utf-8?B?WVdTZmZzaWwxbEJtNjlrUTY0VmUvbE5iVGJiMGF1M1AzMUlhWmRIa2t2Y2xt?=
 =?utf-8?B?aG8ycmlaMlNpcnFLNEo0Rjc5M3JaTURQVitDVk9HblB4Mk0rcUNsZHo2VnNi?=
 =?utf-8?B?TzlveXNranAwS0JmaHEvV3NDRlZUdFR3ZktVc1BndGkvNVVFNmFLUXpqTzUw?=
 =?utf-8?B?eklxazVTS2w3TFQrRTFGYzFCWjQyYW5ld0doNHc3ZDhQa2N4SGRnZllEVWkr?=
 =?utf-8?B?T2hQejFMeDJQcjNjU1g1Um1GTWpQWUV0SHU3MHlsVHpzbnVvRGg5L0kzc0VY?=
 =?utf-8?B?QVQwUVBNVUk5M2JSNC9DUUJSVkpldTBwaXJPUkJxM0dXTmdZMDJWak5ZTHMy?=
 =?utf-8?B?Zng3QklIZCtISUlMdUJTVnJ0TG85Y1MvQ0ROYjR0MHZGL2NtNFJMbjQ2aFhy?=
 =?utf-8?B?dG9sb1k1aVFRc1pwZmdsbTc3bDB3RE92V0FsYVd0VkVRNVFtZHcyQzFvTTIx?=
 =?utf-8?B?Ky93cE44U2ZPOVZjaFZGMWZLYTd2QTZjcWl0ZlFjR0hoN3hSSlhHdkloU1Z1?=
 =?utf-8?B?NFdRVUFjVmExemVua1ZBamcraWtROWlENDVPQkdONG1EclpXWHU4dmR1Q09T?=
 =?utf-8?B?bmpLcm9NNGFyNDRoR1N3bmVLay95eGZtb0I3TE14Vk9jekZFcnREU1BMazZl?=
 =?utf-8?B?dFY0eitweWlKWGw5b0FXS242RzVQMDhucFZ6MENsM3BqaU5GZmMxWk5TdGxC?=
 =?utf-8?B?SHNycmFlQ3czT29PTGluS2tuN0M0SXFWSzZYWGs5QnZINEEydlNBVXptcHJz?=
 =?utf-8?B?dUF1ZGhML1JoNXN2cTU3RWdvVThvaWpNcUpoM2x3ZFF0UVRGQWVHUTNSWW9t?=
 =?utf-8?B?bEpKUE5xQzdqWTlSMC9rS29hcGVlYnZ2amhYUHA1Qko1enllTC9LUHFuTDJO?=
 =?utf-8?B?a085VDFLOHNqLzE5MjV6eThPYWRxWFE1YkRGRHh4UDlYTytyYTlRV0dHN2lV?=
 =?utf-8?B?M0hVdFZmMm4zaWVkeW9FNWNXTm5LNUx3WHpLOENsY2hMejdDb3greUI3dXVS?=
 =?utf-8?B?S0VkMDh6VUJHVkhnSENvUW16M08zVFhMVVJySDR5bm40YjU3ZURialRJWk12?=
 =?utf-8?B?VFpsTFl1U0RhL0hNbU1kMVBSWXBMbmtVRzVmVThMOERXMlFvTSs5NlJ4OG1l?=
 =?utf-8?B?VEhGc25ucS9xMTNsTWs2b2VJUEhxeDhScVhYUnJSZFVOclF3NkswNEZWU2Nh?=
 =?utf-8?B?U2l1dzF0bitzSTl0RTlVb1poUnVmSVNhdlQvcXNFY2JhbkZOV1ZFYjVkcm9L?=
 =?utf-8?B?MWx0SjRvdFNsSnc3NDhaeFNBSER1V0tpSGtKUkxGcnJjY1hMSHNyb3lHeVNT?=
 =?utf-8?B?K3IzWCtOaDVrRWtpUTMrdUtBa1JKSy9WaG1LdmdlRmx0SlNUdENhVFV0NHpQ?=
 =?utf-8?B?Mk0weW44dGdwMms3d29Bc0NEWDJpSm9RRG12ZWx1WFQ5U2hZa3B1VVluT1Rh?=
 =?utf-8?B?aGJyRStTeGd5eWtndVlNSU4yTkVMQVFPcW1XejNDbzJuQytVVUdHWkt6T0dv?=
 =?utf-8?B?UDNCWFpBaXh4cjdVYmo4SzBoME9uL011MTNCd2VqeVhLNS9jZjdTWlVZSVpM?=
 =?utf-8?B?R2Q2cmZqNHNzRVQzUGxjSURiT2FETW1SUnFBNklCWG9IaDdSUFY0bHhzNDR2?=
 =?utf-8?Q?yVKDI8ervYNte/Pj2UCzj2Q=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b26f11-a9d9-4de0-1a7b-08dd49fa193e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:41:07.3064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlVZ11rmZJ77HVnrmCKvb21KyDL0a/ZaL4SRlm+v6BEJY7kHhcxOf2OgMd1C1ruAnSn/L4tfluD3Vw8IP3Ao9MshAPNP1rtbzUi/SSz4Ges=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Feb 2025 17:41:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6324

Hi Yoann,

On 2/10/25 12:32 AM, Yoann Congal via lists.yoctoproject.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
> shown earlier.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> v2->v3: Quentin's review
> * Double tick quote variable in title
> * Removed Guillaume Reviewed-by (given privately)
> 
> v1->v2: Quentin's review
> * tick-quote variable in title
> * a set of recipeS
> * 3 spaces to align a code block (not 4)
> ---
>   .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
> index b9f671d68..95308330e 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
>   testing. As a practical example, you could set ``sstate_targets`` to
>   ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
>   run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
> +
> +Using ``OEQA_REPRODUCIBLE_TEST_*`` variables
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If you want to test the reproducibility of a set of recipes, you can define
> +:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
> +
> +   OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
> +
> +This will test the reproducibility of ``my-recipe`` but will use the
> +:ref:`Shared State <overview-manual/concepts:Shared State>` for most its
> +dependencies.
> +

Same as for Patch 1, what do you mean by "most"?

Cheers,
Quentin


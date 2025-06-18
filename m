Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5BBC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:37:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.web11.6112.1750250223131474322
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 05:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=OvAyswzY;
 spf=pass (domain: cherry.de, ip: 40.107.130.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyIOoq6q9EAKACjs1s8OrtkTu4ttmz2N7otxZ5TWIdZcHKz7i7fVJ/z6ImxDI+FrNkaJfEFnayWjQ/1ph9L2LRGakPefGsp0Iwloih0Bb5yB/ww4B9HV1+XMR7zC93AOzZ3KH0CQWWXqDvY+nQ54XfI7lFh4ytxvUntRGIiQ8RO8G/kSDFeqpRiU2QWhQRd3Ayr9WrQNp8Qy1/Mkwqa0ZH2qm6asw+zcgb4zI5C44vcYORPAga9pyCgUEEdVHX4AIlqGO1AkJse7HFXu8ydiA54hYMWJwueU1silEH1C5pu/H3NcOsmwAh3a/24X55Lujv2LbpNcnstUJX+iyqaO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI4+6Vjy7XDG0ZqsquZeYyVncXCR9KLC4MwpFtn2RLY=;
 b=TjpMyi6PNTg8P7YThO47utbdxqBfjEmzUHMeFcadJ5myCGFsahayGwRJphpNCiKvGtDNY2Kn0IwbSYXTUkllP0m1vEvhrSkVT6PfkGDjdfh4N/n9DDCsK/fKVelfOLP6HCw5do6DEpxJG3YvI3yeyipGUoG6lvqcJjZ/mYwqVQnS9koqnI5tgR0JsBuFQyv5k3qxqcusaQVzZaKJOKDucRPlrYhvcM79auxLTNxXHvVtq2rhH8M4/5TS6JL8ltF89S2E4XZ3RzMcKOI5X9TVuDc3bDaIaf/e8/tVpEGh+DPtYXwvA/QUFLkPSHmzFcaqKuXiiJgagBTD23Y2rYxcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI4+6Vjy7XDG0ZqsquZeYyVncXCR9KLC4MwpFtn2RLY=;
 b=OvAyswzY6EOkrOYTGV8yYPOOzifcKGgTD555CBetuBrzhab7/Up7tASN+ksACf+Gov2qm7jvkSvyw665UbiMdYF5MHtlU2WODp5fXSkDx4eptrGgqO1jgl13Nbu6pkImqwZZDSj5uwVKvrx+8rPn8BerJEUV6MvtuAyoIvkN+14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10992.eurprd04.prod.outlook.com (2603:10a6:150:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 12:36:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 12:36:56 +0000
Message-ID: <cc7489ef-fb04-4acc-8a38-4abe281e980d@cherry.de>
Date: Wed, 18 Jun 2025 14:36:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] bsp guide: correct number of reference BSPs in
 meta-yocto-bsp layer
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <1c686762-cb01-822b-2725-8dd0d8e80783@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <1c686762-cb01-822b-2725-8dd0d8e80783@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0106.eurprd05.prod.outlook.com
 (2603:10a6:20b:498::21) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10992:EE_
X-MS-Office365-Filtering-Correlation-Id: 293dd3cd-ed9c-4988-a60e-08ddae64cfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnlmZHQ3VzFld3hzeExZemIxbkNQUmlwNkV6VXQyVTViU2lGWmVwSnJ2Z0xp?=
 =?utf-8?B?ZVRlbUVnTFplbWhQbExQNy9RWXBhdk83c1d3ZUc4Q1VncHlSa2RNTlYzc2dH?=
 =?utf-8?B?K0gycXJNZENjSzlYS2V1OGNGblRkNUtXUWp3L0l5SG1yck5lWXNYNjN1eEYz?=
 =?utf-8?B?bVJaU2s5NVBUUnlMSFNVd0Z1Q2pDMU1QV1ErWGMwZjNYV1k5Rjk4L1FzQzIr?=
 =?utf-8?B?bEJURk5qUHo3NWNtUlQxSFVVajBjcGt1ekVqeVlmN3V4eHRuYmh1SmVraC9H?=
 =?utf-8?B?TW1LNXRIYllOemp6UEFIeXZpMXpJaUV2Yy9JVFRQdDlLb0EyMUlIL2VGRUR1?=
 =?utf-8?B?aVpTL29vY2NNUGVtNTJUTDFPRnZJT3N1S3BQZDJDSmNaRk9DZ1NUWjBvSkxl?=
 =?utf-8?B?OENoSzZlb01wb25leWo4K1pPNTcxQVNxZGRzb3BxL2l1ZVVCN0JuMzY2UlFz?=
 =?utf-8?B?bndVcFV2K0lDWHZUV25ycnJKTU43Y3RrTFNwREhIK2I3a2ZQUmQyY01STkho?=
 =?utf-8?B?aTZmTlM1NjZnTTdHQWE3LzhCZTRESjFDeUxDUEtlMFBtcnFiVlc2UU9IeTJr?=
 =?utf-8?B?cU45alh2SDRFbHk2VThVSXZLZGFLU0NudWNUVTR5dXltMVcveUtrajdUQW1X?=
 =?utf-8?B?bzQ2S093N0JzMXVaSm12Sm1meVRhS3lJUEtNNHg1eVhWQnMyS0VDeWdmUjRs?=
 =?utf-8?B?QmlDcHVwU1R3dnpCL256RkhtcTZsN21MUGxTcFlLVVNwN0trRU5uWlZXS3RU?=
 =?utf-8?B?RzZmNXFwVnF1RmJUZUtPdGloVkxURU1OVnNxaGFMOTF4dlNYeGNYNXl6NGV0?=
 =?utf-8?B?cklSOUtaeFhaTWdzRzdlUHQ2YjJaZTgzakE5TWJwT3o3c0I1dWZWVmlCeE5q?=
 =?utf-8?B?Q1I4RVZKV05zUkg2V29UT0x4bjVWdEZqd0JhWWNkK3RKV28ydXM0dE1CRE11?=
 =?utf-8?B?YU9OSmNtblYzVzhDeGVBRjZSUnJ1eG5tNWRFWFhpdmh0VU42SWhGQnVjemRy?=
 =?utf-8?B?dHhobENhVFdhRkpQM2QwUEFZalFQbnJ2QkNIZGNjVXgyRjVYbHRocGZNS3M1?=
 =?utf-8?B?TWozcWpHYVprT3NadjJCV2JKdDc4cGNxb1pNMUxqbXpYMWtkcTFMclV4UnpD?=
 =?utf-8?B?NGxOczMxcDRONGkydWlsV3ZWVENWL04zcmt3bUhXMXdzRC95ejNvaWRxL2JD?=
 =?utf-8?B?bGZDcW5ORzhaWTRGaWFMcWRQM1NUU3VCYlM5R05USUFpUDlzd1pGVFc2WUwy?=
 =?utf-8?B?YmwxcytjTWg4R2VFR2NDSWNMektBaVVsOWEyQkd4SVRDM0VOejZ6Vk1qQ00x?=
 =?utf-8?B?MExMSUpIbGFVbWprbzU4Qk9EVm82QS9kemQybHR3SXo0d2hwMVhsT2RFTjhK?=
 =?utf-8?B?RFlmdlNTSXNtUER0OVVORXBvbWR3ODlsRzliaTB0VThET3hHai9TbDFVK0Z1?=
 =?utf-8?B?czJsMlBGQzhYUkJRUzYrcG16YURUaUVnRTZBdzkwcG5wVFpRNVRtWUJjMko0?=
 =?utf-8?B?R05qN05xNUVYVmpJSWlodW4zSGxUUWdmelZiZjhPN2EwSnFGaVA2NUFjMS9w?=
 =?utf-8?B?c2FMeDdMSTJFUmp5KzNpSXJ4V0RSL3RBN2I2dnlHbFUvak5uZ2k3dW44UTkx?=
 =?utf-8?B?aTl2ZXVFeHkwMkhza0wzMk5zaXFja01meU9UbTlLWmIwbE5pNlNZSFhwRG85?=
 =?utf-8?B?WVNBa0wwK2t3QzFiMkdTaFJZSXhlS3B1UFZ0d2Uzdzhtb1BxM21nZTBTQms4?=
 =?utf-8?B?WGpna1RjU2lrRkNXQWhPRkF1Z1gvbldxRjhOL2JPM094NWlUKzV2WFJ3bnpt?=
 =?utf-8?B?cjNlWFYrdmVqcWZtRlJsWm1KaTNSNXd0NEZKTjladysvbXRZc0ljSHpLOXNL?=
 =?utf-8?B?TmFkdzc5MXVQZmlIRzFCaFIzcTVURCt5eEp6VzNyaW1IZzhTRTdYZGMveHQ2?=
 =?utf-8?Q?8Vwz7GEcmbY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXBsRWd0V0xKeVlNcHAyWXl6U3p4SFZqbitHWmhUNitTK1JlR1VXZElhcEc1?=
 =?utf-8?B?d2x0N0xPMkpWVUJxSnF2SU0zMWxjaHpNTS9kK0hCQXdVKy9DdnZyMWI3MGpu?=
 =?utf-8?B?RnM5QzRHY05LTDdaMCtYY2lFdkxyN2JqT29ld2NGSGFJejJlaDVEaTJVWmJI?=
 =?utf-8?B?Ymx6TU5oUE15YnpvVU1ZSDd2VENRVzl6eWVmZXpleEJyemhRNkpWMUNvaVlx?=
 =?utf-8?B?YTNyUWxhL0hDMUIrcXRMNDlFZVBkWEpWNGpXSDdPVWdmUjJDWUJQcDA0dS9M?=
 =?utf-8?B?WTBMUW02RDc3MVhnd1lrQ0UzNVNLaUJYeE9iN1U4S0twMHVTaDdUUUlLWUI4?=
 =?utf-8?B?b0gwWWxwS1Z3anpWcDkrZ3R0RU9zYVRBV2pBY0RkUzRhVmsrQXkwNmhJV09T?=
 =?utf-8?B?NWUzQVRCT3YwNFJhQjFvRVZNZklRaktLNll6UzFaS1NBb1RZbWpUN1BPdXlK?=
 =?utf-8?B?ZTR2d1NRWmxxcDF5eDJpQkVGWHgyclpYYVhaVEhwbGlBMUJkZXc2RHlhaGpP?=
 =?utf-8?B?dmhYZEk0U1pHWUtYV2VHWGxCSUZkY2hFNHF5SDNvT3FGK2tNWk1ZeFVra3kr?=
 =?utf-8?B?SDFwSkFjSDg1Rk9MZTA3S29HYkU3NkYwLytEOWYxZVptWWZNL3A5aXFaVVRB?=
 =?utf-8?B?dGZFWkdDT2VPWXJXOCtHOGo0UjkzOUMwVm9lSTE2QStJZnRzTkV1TTZRTTdu?=
 =?utf-8?B?eGVoWVJzWnJwYU1DN2k2YncvTzhjZ3o0dm9ZcFhZaDFEY3I1VHpOR0dnQWFt?=
 =?utf-8?B?a0pxTlVyaXkwS2kvTHFOcG9BS1h3UFRBR3c4dWNuSDkzb3ExL0Q5WFF3YXk1?=
 =?utf-8?B?YXg4Vm5FVWFBUXBLRGt0NTd5c3FvN0hXTDJKbEtoTy9UTDB4dzFhN2E2bDgx?=
 =?utf-8?B?RlJHdnFXNlA1UzJlcXFQOUhaUmVmY29RUFZZeG8vTDZpTE1JQ1dSOU9ZYi8z?=
 =?utf-8?B?NmRIdzV5MFJrL2J2QmYwNkt2Unh5Vlh6ZEp1OXJSMDJRNFFiNmxrNTVUQkFT?=
 =?utf-8?B?elRuNXNoY1l3KzBFOER3QWUveDlUZHN3bzB0K3hmT2lPSTVtVEhLckRrdmQ4?=
 =?utf-8?B?YzkwbHZlY3VwTDBXQUVWcFVEUGgxWittYjcxZ2FEQi9zNkRXcHpRYkhaVTZB?=
 =?utf-8?B?NUNrZG9SU2s1YlJibmg2cXdhenlJbjZwSUs0RTdOYkRKeDFheWF5dHlnTUxF?=
 =?utf-8?B?UnNnNGZrOVBpQ3hUa1R0eGlyVkRvRHUyeTZzNXBvSFFBRzJhS1ozRFpxbWF6?=
 =?utf-8?B?TThxa2gwekhQN2d4UmZmU1V0MWlLeFFXLytYcGZ0V1NVQ2lCZW5Ca1JJbGV5?=
 =?utf-8?B?WERDV0dtZjBkcGE4SG4zS1FhTTAveXo2SlpNWDRDZE9nU0o3T3J6SUZYa0dL?=
 =?utf-8?B?dXRxdEZBcmZseTdQbkdOQkhwVWRQZFdNS3dnM2RQaVBtREJHWCtEK1loUUFL?=
 =?utf-8?B?LzJIQjczNVplRTlqWVljVXI3NUtKSGgxNVFSSjhFNm9vaEZPekhSVlRsZVgy?=
 =?utf-8?B?THR6Nzl6Wk9LSU93TnpJUy9HeEtodWVodU9WV1M0VTY0UzZlTitrbDRQSUZa?=
 =?utf-8?B?RllLL0xYVm1BdlVCYm5zZVBhT2wrWXNNeUJDT0tTUUtyRUhBQkQ1UzBJUTln?=
 =?utf-8?B?cEQralZrdzhqbi9la3o2azdldWZDd0pPSjVtbHpXTThaYXFVNGx1UkF3VGY3?=
 =?utf-8?B?TFFtNTdnWTlnRFZ1bzdpeHd2UHVvTmU3TzJpRHRaR0pKZEhSQjRzSUpLdXNk?=
 =?utf-8?B?aHpMRWRJeWErL2NOR2dVbmwvUTYwMFFCWGJxa09NeHBIWWtDUE1ENjRibjMy?=
 =?utf-8?B?Zk00Ri96WlRib3c1YVg5M2dJU2JJTTUzSjVYazJkaUhNQVVwZXdQYnh6RHN1?=
 =?utf-8?B?MUxGMlNYR0JsZzc2dCtocnFHOEtTcmhqcGIyZDYxZXpxUDhheFB0aVZheTdn?=
 =?utf-8?B?S2sxbzFveWVuU3BiRTdDSEpuSzRzNXB0V2llYW9DSndzK0VRcXpaSW9CTEhT?=
 =?utf-8?B?OTN4dWJUMDhaRTlsa0dONXY5TGdTMVNJVGsydEVoZ2tCM2Q2eHRBczdrR1VZ?=
 =?utf-8?B?MnNYRUxBNGJGWnFxeDFGVGtxemhZTDdGeVJ0MnR6eDR0Lys4c3B5QzN3Q2Fz?=
 =?utf-8?B?Z3EwRHhnZ2VzOGxEUGJrQkttVkEvc2p5QlJCdVRjamY3aUVDTVhyL3NFLzlk?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 293dd3cd-ed9c-4988-a60e-08ddae64cfae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 12:36:56.4666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQKfejrOHpPOzhasdoyOZd5mMaEGjhChb1kI/5ySVXYTatt86fTKlvSN7TJPQkdFyaYIk2Xrf8pDtcuw25BpQXKruu2sMRYpygdCEbe4bpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10992
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 12:37:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7097

Hi Robert,

On 6/18/25 1:48 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Update BSP guide to reflect that there are four, not three hardware
> reference BSPs in meta-yocto-bsp.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
> index 35972f172..012dacce2 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -764,7 +764,7 @@ workflow.
> 
>      .. note::
> 
> -      -  There are three hardware reference BSPs in the Yocto
> +      -  There are four hardware reference BSPs in the Yocto
>            Project release, located in the ``poky/meta-yocto-bsp``
>            BSP layer:

What about rewording so there's no need to keep count?

Something like:

```
The Yocto Project has a couple of hardware reference BSPs, located in 
the ``poky/meta-yocto-bsp`` BSP layer:
```

We could also probably provide a link to the layer, because 
poky/meta-yocto-bsp doesn't actually exist in any repo, meta-yocto-bsp 
from poky git repo does though, so something like:

the :yocto_git:`meta-yocto-bsp</poky/meta-yocto-bsp>` BSP layer

?

Looks ok to me otherwise :)

Cheers,
Quentin


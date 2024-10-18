Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E7ED2FFF9
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 11:53:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.48])
 by mx.groups.io with SMTP id smtpd.web11.20479.1729252432232121766
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Oct 2024 04:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eBmqlDyc;
 spf=pass (domain: cherry.de, ip: 52.101.69.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om66cF3kOswmAt3Fcs6/tYkEktAk4Umur84FT7QrLmCkwtejcviAuC6uhVA7gA3kHbnsFh0cP+dcqofiYa2FaDS/h3vrR1h6MZEMYr8FIabH4xKu75ZSR+GHISLQai6ibj8P61ShD9g5TUyns/d6j5jyopOqS7Wiq+oyGdI8mirEhXQe5kNF60+nSAyWaXBjsm82TbroYSCJf2C7pDuz705qMyfK7pP31COW/yJFhPZu2Z8e14k+wCc6ToiRD5aC9QIiDuypZM/g+O6gMvB/vVe8F2KKWc/myJ5OkDpbk8/wk3ZJwz0v9mv9a87D/QP2NodYzuHrClk0juP4btp02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk37QYG0kKg4pjeqdxTdl/nxqBip7TkNKritGZqKvQY=;
 b=EXw2KvURuZf9E9G8eBBW5j9mORgKrbhG08zB2ZyWLGJSpgqUhxGjURutC5cIAXv5+GmDnCoO36T1b5mATViTY5h23OCmo0bMT8sQFJxcaGmC4CrBQbXuDPMvk61/YNJPkOnx2FFn6Ga5F0zjje0OFD+0g7YeNMMz1IPmelFh/4F9czMmBsvRGHt9XOiFc9I56loyaXkZ8Td32lT4Q1+uy1D/09xZr9l6ZBV2KUMNCr7kgY3D6sdTS+6Ha8MdzPiwMx0EKSj9pYAps2Qj8nSmDo6yjmnOu9pl6xkUV+BEs5kwXXEvaS7RkCz5GNJcr0z2Zc9PGRuaWfJXBhLZGyCmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk37QYG0kKg4pjeqdxTdl/nxqBip7TkNKritGZqKvQY=;
 b=eBmqlDycqFvQyo/tAy70SHyLFuMjos4TdA7iYl6H8xtOh6TZnv1mRihZIJCeEEC4u1f1aN8fa3MCYdHtt7y0CAp7ZS2DBlLyRcC+NKy5EKh+sUr3RbK1+OnqA3CH0mXdjGAd1E94plLCTu0KnFP/ScC+niqXoefZOdWCv8OLx28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8351.eurprd04.prod.outlook.com (2603:10a6:102:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 11:53:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 11:53:47 +0000
Message-ID: <82a4e314-cedc-4cb4-a8a9-bc3fd3e81c94@cherry.de>
Date: Fri, 18 Oct 2024 13:53:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: update releases.svg
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241018-update-releases-svg-v1-1-502899b5d780@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c4d539-9446-4ef8-35d5-08dcef6b8671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHpScFlTVWlRRDI2QnViaVc4STZES3FJWmcvbzVFMTg4T1NxZXIxd21IVkFN?=
 =?utf-8?B?MHNkWXlISTdFdWhvSHUvY2M0aTlRdGNGYmM5UzNJZGhFMU9UTTRDdC9kd2Vk?=
 =?utf-8?B?ZVpjSkJPMkc3ZEwvM1Nva0ZLOXZITXN1ZFRwYjVSbGVLTGZwS1BsWVllcTcr?=
 =?utf-8?B?blR2TDlTVHZwTGlwZ0JqYldybVFDVG5BcFNNQjZsV0xiVU9MelBMVWdsV3d2?=
 =?utf-8?B?MjlnNHdYOXZzb3pidEl0OTV2WkRQclZOUVc5VnpqS1pXeExSOWR6RE5TcG8z?=
 =?utf-8?B?ZCszM1RuYUxOU1FFVFNHcXVyYkdXQzkwWUl1clV3VWMyRlJsV2dXQkpSeVRw?=
 =?utf-8?B?elltY1hrY0hMcVZWeFhKKzc4MTJxSGk3M1doSzRlQUlZZDk2cmd6RWdLVnY2?=
 =?utf-8?B?YXg4N1JRMkpOTVZGSDF0UHUzWUF5VmFnc2tMblF3SGNPc1lFM3hIdC9EMW00?=
 =?utf-8?B?bzZYbTVGVngzUHVPZTNFSDBlU2lNd3VBOFFleWlWblhyaWVUamZ6VlFJL0Fn?=
 =?utf-8?B?V0twMlp3clZKdDQ1WGZiT2xhV05zN0RQYldjbzA3QXRidnRxK3hwUzl1U3ds?=
 =?utf-8?B?em1ReThnSERYbEtQOE5MZi9TV3RGTXNmN0NrNTNoRmlPOFNxbUVkdFFDNHhs?=
 =?utf-8?B?R1d5TzZ2NzBQcCttakc1TFpndENKN1l5WCtNcTZaa1BhUExjTEoweXRwb3RV?=
 =?utf-8?B?S3NqVVhzcUdyN3RqZklOT2EzTUR3bGl5T0hpNWpvbFhuaWhkRWhRb2RTUklR?=
 =?utf-8?B?bHNCZEh6THUyalFBWXBoQWY0NXpWV0p0Z1h2UjUvUEdCYllqei9rdmdyY3Aw?=
 =?utf-8?B?K1FGNndhYWh5ek5GUEZ6WXppZG8rejk0U1FCeERJdlhFSVJGL1ZvVmduMG50?=
 =?utf-8?B?eDhWNi9UWUx5Q2tUSHg4Rk9nMjhERXhxbmlaUnViVEdsSlZNQW5ydmRocTM0?=
 =?utf-8?B?RHpVRW5XMC9ROGx1Uitpc3BnVmpSYUVJNEY0OEdpK2szZmpMRHRoczFOYm1t?=
 =?utf-8?B?NE9QY2hSWkNmcTVYTGlia2puZEx3NW5KYUE2NmVXZFV1R0Q4UEFvZ1h5ZzJ2?=
 =?utf-8?B?QVZ1Q3pDN0NINHk4ZVhmamoxSnNDZmNxWU1GZHlJWUpyZ0NyczUzQ2ViZDJZ?=
 =?utf-8?B?QlA4SkpJT3ozTEtZLzZweFU1cVU0U0hxeWI5ZWhvQVBPejVlN0laakZBSTVn?=
 =?utf-8?B?T0ZIS3RRR2lyWCtZeG9sQ1RDOUtoQzF4SlIvSEJUSGpKQUpOWTBYQ2NOb3ZU?=
 =?utf-8?B?aUx5YXA5NXpsWVJmOW9hSWJMUnB5TkVCd2R1d1FTWkVQdnF6KzJEV3o2WTBD?=
 =?utf-8?B?a3hWcW8rci9pcHEvSlBST3lFWjhXNDdRbXFNSEhna05tZXpWZGZUVE1sVmdz?=
 =?utf-8?B?VUxaSHN3OU5xTFdubS8xMlpKcEpJR2IySmJWSXJRMWl5elM3Ulptb0JYNmxy?=
 =?utf-8?B?czI1NFZxeHhIcThoaDJabU53OGo1VjdXdk1LV3MxOHZYdC9PL1I4cFVZK2M0?=
 =?utf-8?B?R1FNZ1pCSVNuQWRPOXZ4eFdWRFpCUWh4MVY5NjZseEdFVWtjemxpLzZQcFF5?=
 =?utf-8?B?b3QrK3h1aFAxMURwT2I5QUloeEZmcmxqSkZTQjVBd3FqaEJwbWpUbGx4eU5j?=
 =?utf-8?B?QnFNcTRTSVNVQUFxV01uT2hvVGY5VEV1TEVPVDZmVTRlT0Y0NDBEMW9JSkcv?=
 =?utf-8?B?WWhNTUtTL2dMcVc3cEp6S3NINDQycWpUNkpSd2FMSE1EbFd0MGZEdVZTV1lN?=
 =?utf-8?Q?8OIKZA3sFgti4GOEFc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UnpWdHlDYW5HbTJ4eTV3dkFkWE5pTk1OT2duMG9kemdxaHp3TG1aUTM1blJH?=
 =?utf-8?B?bzBrZHIvbXlCZ2VGWXIrR01saTZ0alhpRVdBTlllQXNpeFdhdlEzK0hxQTQ4?=
 =?utf-8?B?aEpCS3hoYk5icXhNM2dsZFJUdzJNa3lIeW0ybFpzdDY3KzVHaHlpam1LUW5D?=
 =?utf-8?B?d2crN1JTaEdsOWlVVnErL1RhTEJsSmF4UE01QWo4N0JkUU80emNlZXZxSTQ0?=
 =?utf-8?B?UXZUY0pyaEZobktUeXhJQ1V6eVhRN1l6Q21SbGZmcWdiL3E4ZjdmSjRvTmpK?=
 =?utf-8?B?ZDV3dXl1aHc5TXVNcTRUcUJKN0ROUSs5ODZTSHFPQ3U4MU5zNTQrWGhnVXM3?=
 =?utf-8?B?SUVJQmU2UG9FZUo1ODgvcVNSVHVTYXl0eXkwaktaQ3pOZk1yaDRBRkdTZERs?=
 =?utf-8?B?RDhCT05CaG9yT2dwdWR1eDV2TUNPNDViVHhNYnJlUE5TZEZCamQ4QnNwZTY5?=
 =?utf-8?B?QTFId1ZPaXh2V3VTTVVIRytXLzJNczdKcGdFMkFNN0xaazZiMnoxcFJ6SEtq?=
 =?utf-8?B?WDZGeEttVDUwVm1scmdxSjcxR2pLN3M0azNZS3M4dVFEU3hvNUJqREp0dGF1?=
 =?utf-8?B?bzd3cG1QTmROOWV4ZTk4T1FDZmlReXFRWkRrNVYrM0pja1dXeEZHalRpSC9M?=
 =?utf-8?B?Nk0vMStVTnVwNHFiUzljMWpvNmNrZmRXenV6Rm0xb00vYzdORDIwNE5HcXgv?=
 =?utf-8?B?R1d5ZEM5YVFVSHJyeitmRzJsajNaZk9HVmtPUy8wdHN6NEJmQW44SWtTOXNm?=
 =?utf-8?B?YUtqSTVaQWtiN2x3dTN5TkZacTNHT1hHNGFjakFGY3BveSt1MVVYaWh5bU54?=
 =?utf-8?B?NXJGQUVzT3VIS3ZrUU1GNGVXTm9wck1FNnpWMHU5QytlbkcxT0c0V2lJeGJS?=
 =?utf-8?B?V3NuSTBIb3hzVXJKdTlFSytmanFZZFJnM1h2a1FOZEhOUDNzdG1IWUwvaFp2?=
 =?utf-8?B?MFR4Z2pneWVsN2tqNTBtOHZ5cmNxangzQmpVOUxVRnRSc0dweXpLZjNxTlBR?=
 =?utf-8?B?N3h6TExRV0RaS3lYcitTTFNVb2tIRlFKWEtyTzF6QzUxNG5RRjNEcVE1eCs1?=
 =?utf-8?B?YTFreHJiZ1h4azh4UTFuOWlMczlORU9pYUVIQVVsVzlTOHJKY3VPMUdDQUIx?=
 =?utf-8?B?WXpPZzVzdWQ0WTgxcVkzRDBpZ09zMHlCYXFtRTRsWkhsQnFlNlJ0WHRNZ0h2?=
 =?utf-8?B?SHo5WDJGaUtSdS9yQjl6dXplSG1kTnpBdTRvKzlDN1g5QUVVeFBKZ25QWDFH?=
 =?utf-8?B?bytYUDkvSG12WFJwQTBMcG9iVm9Yd2NNbzNwbUFLOWVHU2tUcE5YU2hHYzB0?=
 =?utf-8?B?eEczK29iVytNYlByTnZPNlV6VDYwWE1xWUdxTVIram00Ty9XbUZBNWpMbWhu?=
 =?utf-8?B?YldlYmhreUxyalJhS0txYTBNYzBPZ2I4ODJXYlB3TmkyU2RsM0tsbUozNWZ2?=
 =?utf-8?B?TjJMQktrZUp1S0lEVm1weGUwZnZkMHd4Uy9Sd1ZQdFpKT2xDZWdENWVIa0Fm?=
 =?utf-8?B?YkQzUk0xRVk4bFlDcVN2cktIUzNNMmVOWGllcXhOenZCZFJBZzRzZmxLdWlm?=
 =?utf-8?B?bElhSFZmaFUyOXlPU0RHVHRSMVNTVkYvUnJhQk0yTVZkMUdZRGxKVVlUeHRF?=
 =?utf-8?B?eFV4T2R0OC8rTXZNVzB6MmxOSzFCRUcyTXEvWHlYY3VaaHN1VnI0ZS82TlZi?=
 =?utf-8?B?UmlEZmlEeVpMQUJCeTZKK09naG5EN2RQTVd6TTVzZ2NkVFhKUnVvS0w4N2Jo?=
 =?utf-8?B?RENZaEhJU1VycWVMOS9qaHBtMzFFbUFkczRKQm5XeGxLVERuSjg0MkRiZXVH?=
 =?utf-8?B?NzZHbWNSck1DcElzekVRM1NYZ0l0WWNQUGZJSklTZlNJWlVDRGt6OFRDNmFB?=
 =?utf-8?B?V05wT3l3VERRdWNkSlV0ZjNpS0RWMXJGNU9wN1Q1VUdQVXh1OWdnR2czYk4y?=
 =?utf-8?B?MmxpTlJMNi92ZDhvaE1wMXZwcDlaWlVQVUlHeGY5eGFwNm90bzI5WUYxaTY1?=
 =?utf-8?B?cWsxQnlsVXhrenpTMHZJb0RtWGUrNlRMMk81L2RTSDlEWFM4cGtIeS91SzRa?=
 =?utf-8?B?UWRIT1dwcmUrYlJIays2STc5a3FselROcmk4UGpIVlpidW5Sa0d2MGF1Z2JK?=
 =?utf-8?B?b2FCK1FoalJpUE5PK2Q0NzA1Z0pEWE8xaHJvSnordHdLYS9oOWpNMXBabmFD?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c4d539-9446-4ef8-35d5-08dcef6b8671
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 11:53:47.6737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8q1e25QvHcP/3MvIz3B+wQuAPlm9md15tVyqJhx4m5TTFedHDbmEgXWmcvbKgLO4oJpMLVw7At3zybSOr06+RhmuoxyKlKRxpYoFyo/mRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8351
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Oct 2024 11:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5536

Hi Antonin,

On 10/18/24 1:38 PM, Antonin Godard via lists.yoctoproject.org wrote:
> * Add Walnascar release.
> * Remove dunfell, gatesgarth, hardknott, honister: these release are not
>    supported anymore. Start from kirkstone, which is still supported.
> 

I think we also need to update the paragraph where this appears.

Indeed, we're missing the information that Scarthgap is the latest LTS 
and is supported until 2028 (it's in the SVG though, so maybe that's 
enough?).

I would keep the releases that are unmaintained but newer than the last 
LTS. The issue is that Styhead (and Walnascar) is going to be EoL before 
Scarthgap, so are we going to update the SVG in Scarthgap when Styhead 
is EoL? If not, then we'd be inconsistent with what we've done for 
Kirkstone for example.

Just trying to figure out what's the plan here so we can stick to it :)

It'd be nice if you have the SVG published somewhere so we can see it 
without applying the patch locally, is this something you could do to 
make reviewing easier?

Cheers,
Quentin


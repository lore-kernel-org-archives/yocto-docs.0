Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40170D42BB5
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 17:18:59 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.76])
 by mx.groups.io with SMTP id smtpd.web10.91934.1731431932444631097
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 09:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZHgT9GKL;
 spf=pass (domain: cherry.de, ip: 40.107.103.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edSmdXDb0vNanXAJzwqRnFeQuL8qeGNae2N0OdFFGDGxDFcMHHi6FbeCB2hFDJGORfyzGYtJs/aoYoeLn4i0YSS7LchWXpUTs3hcBex1kYrARWkWeC5iiUU6N+AxeL+6tdudjFHue+tCG3CxkAXFGNda7Fw0UEEf+W5Ut9FKdGSOuVKY8FRECTRGUcGXe2jp1NbPF6kc7g/Ve1EuoLescomi8OUgS2D1HCprMoR4I1hXQw0o+E9eLiumMbgPIC1tvrVjcLZ8nPkuGm7qqlELqInlF6CgZPaR2ym+zE6QJg/pezBO9I5pFfaDG7Gy5vfTCORM3Kv9LEKkEGHm23X7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYqdv2OuSEzrFKmt8lgTKn12+tkcwzUsOocIQXoEGrg=;
 b=zCKe+4KW55xnJHo2RVfwT+eTYMRoQgKNyzqR58y1uqe2xQ3aQvROhBWKAQpn9+Duz8OSueo/ps/CSncQ5/snKwovjLfeIch/WpJxFEm0v1c7ONAoKmKHsxNZv6onUP4IcJJ7bJ6fplxnFasUtsT3Mul1vD6gg2eZ5IogzelsK1Xn8pzd5MEaYGIXFIHWNCln1nuOWdhbl+IUNdfgg2tThiuQjgc5lMeO+uqR8QuVlL1lOFxugpwngi2KWFA9VyYfNt04F2ShimfmL50HhPwGPoCYYRYf5cGHLQ0YeAYhk6FuXjcOcVVaIKq4B9ubrqSOvowmbrgA7tvZjK0aOqAL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYqdv2OuSEzrFKmt8lgTKn12+tkcwzUsOocIQXoEGrg=;
 b=ZHgT9GKL2v8h5mUIO5EEnaKurb88SsQYxhJIGgAWbCtC1JW3WRFpHh5BoYnu6V0NHjIrwt/3ZDKaYntkt8TtfwOe/anQCdUYKUNmcUStjsTig0nxlMjHH4fYtbUJpWy+TeJpkvE4Bk+smwkPo5+xxL29pY2PDJgznL+XVbaGRtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 17:18:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 17:18:46 +0000
Message-ID: <fb9965bd-d904-4052-8286-329195bd5bfa@cherry.de>
Date: Tue, 12 Nov 2024 18:18:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: 5.1: fix titles
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112-release-note-5-1-fixes-v1-1-6f4eac19810c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241112-release-note-5-1-fixes-v1-1-6f4eac19810c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: d54e2408-b831-4fab-ac3e-08dd033e10fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjdTbWxWLzl0UWc1UE4zZkhVdU9OYkJJT285VTEyU21RdGUvbmdyVloxSVIx?=
 =?utf-8?B?bk5namZlY2dRb3Q0OWRGaXYway9keWVnMDViaEgrbE5wb3JTT21hek95SWFm?=
 =?utf-8?B?TXZFeXExcHdlQ1hRNWpYNSsxWVBGU0RZZ084UlNlbFBmQS9XV251ZFdkNGZB?=
 =?utf-8?B?SmNJWU53am5YS0J0TFA4WmVzRUFhNTJFSzlWTE5tYS9mdm1haHd3WmtYSUxk?=
 =?utf-8?B?MHhscTJVV2FISTJqdGhyTS9ldE1DUDFxQzJOYnJsSEZ2YlVYUjJQTWZJbVZP?=
 =?utf-8?B?aWlQYkZaeEJSUTIwRm8rRXF3bEx3OGdpSGZkLzJ3dmxBOXVLekppNHdKeHU3?=
 =?utf-8?B?ck52cm83Y2Q1L2VHNVRuUWIwQitZRmpZNTJNMFFOWXFiSExsc05rVGt4Q3pE?=
 =?utf-8?B?clR2ZHlablRCZG9FSnJFSmRrbDhwNkY3bGJacVZ1VHNKOXM5ZmxvK09CZFYz?=
 =?utf-8?B?a2tHZlBPVmREcm5wUkFoVG9FR3A0NEhDZlE0SldZTjFVTkJXbWxEdGdGdldU?=
 =?utf-8?B?Q3ZHa2VIME1FMDlUODY5ZUVPSE1wWGJ3aGg4N29IQVVwUzByQXNHMzFTSmtJ?=
 =?utf-8?B?MTN0RzVQak5KSS9PcUpRdVBwYmxhY05QYytpRGxORG9YM0d3bjQxeWZobXJT?=
 =?utf-8?B?dmRZQWZGbktpOXlpaUxmY3UrKzVzVXk4Y0E0Y2c4WlMyaEdFY0k0WW83Z3Rq?=
 =?utf-8?B?eDZYS0hPTEkxSWxwWFYwQkttck1jM3BTaXFIMkFSUGpiRWJ1RmNKTlh0dTJF?=
 =?utf-8?B?NXk2c291NVpMbjJ3eGplRzBvKzdpWUd0WVBGS01vcGhwdS9OWW9YV1RLQ0ts?=
 =?utf-8?B?Qmt0bzhNWkwySXdXUWNYRjhwTktGa2lGRVlsVUZzMjRHNXlYOVZuVFlKTHZV?=
 =?utf-8?B?VzJmUHkxbXNnOGYxYTlraGhOVjA3SzNwMVBrbUJWN3dwZlovSm9ldnJGSzU0?=
 =?utf-8?B?aUtWcU5WL1o4YTYybkp6cWswSGN3eFA4aVlDZTUvZnNIb0tnbnNwVXhEWnVN?=
 =?utf-8?B?anZ6OG1iclZhSTJsUEIvYjlrb2FuRUUxNU8xZDNTKzc0eHhwT1MzcWNSYmVS?=
 =?utf-8?B?MXg4R041K3BEMGNsVm4vN2RMZm94WWZqbk41NHBVc1hBQW9nSk1RQkUyQkVS?=
 =?utf-8?B?UnpvVTg5dmFyMmEzK0UxSThIY1NMYVgvUzVROTQwREN0a0hkelhJQlUyZUQ2?=
 =?utf-8?B?VFA2N0xpNytBRDA2QnBUVVZEakh4WVo0N0cxS0t2TGhhbGJKWkNzNnF6S05V?=
 =?utf-8?B?K04yN3gySWlSTVJBWWpyTW42NUZpRFUydXErYVlCTmZSMlNhQ1ZSQzJDbTdl?=
 =?utf-8?B?WnROOHppZS9QcmtEaWExQ2NmajRXak84OWwrWHQxMjljWWhRcUw4RVRVY0N4?=
 =?utf-8?B?UUhMWVRVRjF2YmEwQmhXSnMrVlFtWlMweHoyZ1hJTU1WSmZZZHVMNDh1WDBz?=
 =?utf-8?B?a3ZuSFVTK3pnUzVmMlVxUXh5K2ZYektvM2NFRTNiQmVBNDh0NUFoT1JNZ0JG?=
 =?utf-8?B?TFBnNndraTk3dTlxYWE5blIycStic2xWM2xqZDdVYmZSakd6YkxhNWFqKy9t?=
 =?utf-8?B?S1BUSHJYTTZBTm5JYmFOcTEybzNJbWg1NlZibnl1QTBwODFVelZHeWpoUHJF?=
 =?utf-8?B?RUpqYUNaa2RxV0hqcmhsTkhEeHVzcFNMWUhDUTR3Uis3eTI5K2Vid3BrdmIv?=
 =?utf-8?B?cW9udGpKMGZnZHB5cXBTNWtlTDNqRElydng0RXVmZ1hQaSt4TXpNbWJCQzFv?=
 =?utf-8?Q?hAcOyUlCQlWBhrYbws=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nms5QyswWkFkWERYdFUzYUcwZWpORTdYaHVnUTZ5akNPODk0eEY1YnNQbWxV?=
 =?utf-8?B?bTFxejhja2pSZnJZT1JhNE5GU0Z2RWxKcGlrMnZzcnZURkZ5MUQ1MkRLenBq?=
 =?utf-8?B?S0Y1Q0hxU1VsMjhOUlRWT2FFczZrK1Y2anRUeDVhMW9nT0pqM1F3RDIvbGpp?=
 =?utf-8?B?b3RTV1VLTVVzNWhvc1JjQkpRY2w4YXBVaURKdkRLTzh6QlV5eEwvODZMTEZ2?=
 =?utf-8?B?R2RkallOWHJaOXlpSEhjV2J4TWRFMTlNbXE1UWEwR1EwU3NKcXRHaXNBYWhY?=
 =?utf-8?B?YitYWkZQdFQ2UGxJTzRiTThmMHBTMTMyZ1I0RjJKZis1QnBvak81NlR1YlNV?=
 =?utf-8?B?MEZjUUQwOS9OT25kL0JlM2JVY2lreUNyQ1B6TzhsM2pLM3JnQ1BUUDdDY01C?=
 =?utf-8?B?V1JDYVFWL21sc1Jxdm12bHRPQXFiNlNZK0E4dGx6b3Z2YVV0TnhsOVpwMWh0?=
 =?utf-8?B?c1BXaDI4QzN1N3dhSTF0N201alJ1MlRlQTFnZWMzeW41akhEbjBpRm96bjFU?=
 =?utf-8?B?ZGZuQU16TFZXSWsxV1FOZXFubk9XRVRyWHNLTnJuWkxKM2s5enUwQ2M1TE0w?=
 =?utf-8?B?b2w3NVp3S0xPeTB6RkVhZ1VsTWQ1RHFvSjhoS25XRVFVeWxvaFBZUEFGREU1?=
 =?utf-8?B?c2pFa0Q0b0xxRE9ScWY1cGZ4V1ZaSUpOSDA1bVlFTFAzZHEyR3RiSTYxMkdD?=
 =?utf-8?B?NS9WdE1aNDIweDVVV0RhSkNqUCtTV0d1MmlhOVU5Z2d4R3ZHbEJxUXlPRzFV?=
 =?utf-8?B?WEc0SjByKzJCaC9LdlNSaXUwUlllaFEwaUdSUHE5dkJ1dmlNRTZadkNmSFk2?=
 =?utf-8?B?RUFodWxFVG5aQlRib1N3TTl1SEliL1lPUjJBcUEvRFVtNEV1ZEZHeTBUVyt0?=
 =?utf-8?B?K016dmtJR0JEc3g4MkVtQ0hyRDZyWHBBK2M0RXozZXZ4dEVXaDdXZCsvZkNK?=
 =?utf-8?B?TWRRUG9NN2gySVkzNEJUSEpvVTVJR0xiZTBlSE5ld3lrdHBPQXNUTlhFMlJN?=
 =?utf-8?B?NkZhN1FQYmRLTC9jM1RSVStLTGRNWmxSa29BRWkzcFVjM0tha2piSnR2ZDlZ?=
 =?utf-8?B?K3kzSDdpblVFRkNHTlpEbzh3L3VTQ1R3d2pYNEI3L0tQcVBVcS9ncVcxaDF2?=
 =?utf-8?B?clEvaFBUWmI4Q0hwOE5XeTlmT2Q5dSt0QlNDbE1HM0ZzaTV0eE9nOXdwL3Zu?=
 =?utf-8?B?Z2FnS3RiditoaXQ3UHpDOXExbTl2N05XaDJ0TUxQV214bm1idkU0eDY5MTRP?=
 =?utf-8?B?elRHcXQ5VGI4UzdlV3FrUFlGdTJRUnZsYytsV1kybDB4QWRPSnFuT3FKNVRj?=
 =?utf-8?B?Y1hPcVp5Wm5jVEtETHVreXNnVGJ3OWFZaEhlaDFVT3k1a2NNeGVrc3dDdWJi?=
 =?utf-8?B?YWMwK1lUUWU5MVhjRlRNVE9ETFpLNXNKUWFhL3hPVXhKelVWSnI0bzRibCtK?=
 =?utf-8?B?NmZYT2kzZGNGNDV3VytIb0pKYlhzWkJva1lScGRpRW04dmpIaVV2WkdjTk9Q?=
 =?utf-8?B?OG4wa0lmZFp4NzQ0WDU3VTkwaURtRzVVZVNqMzBCcmgydEF4S2txb2U2bjFE?=
 =?utf-8?B?MTY0TmdIN1g1MEk5NUQ4WUNycUVjV2UzZTBiTzgvWnYySlNra0xYZ0lJR0RZ?=
 =?utf-8?B?cVpmdjJJQXBueVMxdWlMb0RzZDJHODlySC8vY3NoV1RMdDBibU9rR0JQeG9Z?=
 =?utf-8?B?c2hoMm1QMlc1cmJtcFMvblJoQkdGa1pBVm1adSt3UXZaMnBJbnR0YTBOSUtS?=
 =?utf-8?B?ZC8zWU5JLzd3bXJxVkpjS3R3UzRlK2Q1WmdMdkE0ZGgxVk54TjJVa2JmSlpM?=
 =?utf-8?B?VGhOelhDT0JHZlltbnc3MXdPOW9uUmQ2WmRwS1BmdVZUZXY1SFNKcS9ET2tM?=
 =?utf-8?B?NEZRUENPaWg1UlVmSjlIS0ZnVXk3eWhDMjlXUHFhNW81VjB4Nis3SkhlVEll?=
 =?utf-8?B?K05RTG1sV1hoeU9UV3VyWk01V001azdUa0VxZERHK3MzQVJpL3Zhc2d6aXp3?=
 =?utf-8?B?b1B0RytiZ3VDckQvUGtndVZtNlNxck93ZGdUL1duRGZ1bEhWaS9HcHZQSGxp?=
 =?utf-8?B?Y0lkRHQ4L1NvT2U5TDhXT2J3MFpvOHZJYWQvS2g4Q3VZYTNpUG1wRjhQNkl1?=
 =?utf-8?B?ekhBZGIrdHp6b3FIQ2owQzM2VWt5N1VBMkJET3lSN1dMR2RQV20vNDFKRlVn?=
 =?utf-8?Q?apBe7PHq9k7g0jSyDxZA4wo=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d54e2408-b831-4fab-ac3e-08dd033e10fc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:18:46.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ustLa0j9grAyJ7t0BZ8fUjfjpTNce4pRySizXiqQdLP3MzXz3boKCqhPt2d3tYOVG+n1GNIF9ZkeboQHwm7RbuFw1aEac6iW5+tymcAcuu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 17:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5720

Hi Antonin,

On 11/12/24 5:48 PM, Antonin Godard via lists.yoctoproject.org wrote:
> - fix title underline
> - add anchor for workdir changes
> - supported-kernel-versions was misplaced, move it
> - "Miscellaneous changes" anchor was wrong
> 

The old refs aren't used yet so fine to only modify where they are defined.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


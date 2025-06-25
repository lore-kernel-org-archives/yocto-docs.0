Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D3AC7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 09:34:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.web11.11605.1750844062384169747
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 02:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mcF5T1MB;
 spf=pass (domain: cherry.de, ip: 52.101.84.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUXx/0EienvuXh9/4VCa1OwqKEiCZSopkzIQlqTNUAujFuDx8L0CN8esHzWcdMc8l2VbajqwBb/GmYaExGHbMg1ImgG/Z/SbjE8x50a20gW9NVg0QW8OvNTKXKUPSJiagkyUnT+akFnyhbb8KjEFW2Mh7H6Jcp8cRghMnvLs8BUEwfp57enP0LEY/q40+2YB93gDb5Awcqn/mYdnQzze56HzzSUQ6FuRsxaPlebrlpnrf43Kl9v2L9lNZcyQpAeUiDhM3nx1dns0clCiB2m+ypuuFD6JDB/6SMLYE+Iv3vhcZg5JtnDnGQG8vKtCg0kvYaJ9h3ql08Rll08U2HDSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw8rMRvYjh/B01b9nEmuYfWjNdUD/7KEiNUGYrMFHco=;
 b=eSFVL/GxVXPkFIa67gfkKACQWhiZ4b8Uyp4MsThtEF7B2/TndJtLWm2nVhA6HOKWNQbPba21LRb7mklAkR8WU4YseltnnyWs9YUXq5n3nswBe5xdJo9T1Sy4iECqCUR0gam65QChyEOaKL4ZgoL27bQgoyuN6pZPFd7rBBJBwugZaEfewfKmQneFv7qk7bf+ZhPTQ505nMYDjbfNR3pR4ii6bKFVo1cQjrTtVEkfdPWTStnCYlHjh1nBJRqsv5nLYwevwDlMxH9e+eKHOosyk1sASijyRg143bBBAKLieAkYcgys7FkHEbhkXxriPZDGQhGHOSQwnFk2UuH/TdnS/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw8rMRvYjh/B01b9nEmuYfWjNdUD/7KEiNUGYrMFHco=;
 b=mcF5T1MBfWvpnM6VvtvKmd1fp3ZZy6/XjIXHevR/cQ5AhUlButeEh+mq0e61kR39rCHCoTNIm1moSZ/wXiRRg7ANx0ZVmZ4nQN0BmmRB4ZGFPclkttT3Xw99eDx0EO933YXOd2AKd0Jei7Aie/2QBK5qWmAta2/aOnVK44difg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 09:34:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 09:34:18 +0000
Message-ID: <3616726e-5fd1-4ed2-b867-9d1388185ca4@cherry.de>
Date: Wed, 25 Jun 2025 11:34:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Add a document on limiting host resources
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
 <f1e26a85-18d6-4eb5-86d8-e94bec5e89fb@cherry.de>
 <DAVFN3QK4XD4.161B45BALGWA3@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DAVFN3QK4XD4.161B45BALGWA3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: e57a56b6-bba4-435c-f5b6-08ddb3cb754f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enA0ai9NcW8xQk96WUUzcTZJNlJrNldjbVBGSXVSYTRWeTBkY1ZndXpnenVT?=
 =?utf-8?B?c0F3Z2hnZDloczJEQlpubnJ4SnpPcWhvVkNNaFFqTVE4ZU1Tdi9zK1Azek9p?=
 =?utf-8?B?TmJaRjdnWFFETkpVdENzSHA3QlJBUnQ0b0tUcDE3ZDFTK2RQTVNFOUMxSFBz?=
 =?utf-8?B?NWRZc3FubXVnTGRpNGFCS2gyUm5BajJPNWVTL2xKaHplNERGMlZaQlNqS1gw?=
 =?utf-8?B?azd3V21YbFhiSUZVMkpITjBwTm1YM2RsUXNobkZYQ0ZwbGtyL3p6R0pOdzBn?=
 =?utf-8?B?V1grOEYzeW43cWlzaXdZejlUcEpkdDRybmhNU3IyUjVlQnp3SHFMcTNIM2tH?=
 =?utf-8?B?Y3pubEpsdEhaZlhyZFAxV3lIVE1QdDg4QXprNy92Zzk2YjRzTVgxVzBHcUlF?=
 =?utf-8?B?TEVTcVBkWGFEbDNQeEtxY3NXaElpQmFObGVyYi85T05PaXRqaDFvL0pWczQr?=
 =?utf-8?B?UDZMZnNqRmpiYkNOMzhuRjdaeEdjWWpUR0JONklLVWpRV2Z6UFBRN3ZHM2hs?=
 =?utf-8?B?SURwWnlFWEdhd3VrZWpBVGlGZk55N0dpZzZhRjRpV0RxOUM0cHhTNjhkYXFo?=
 =?utf-8?B?anBtbkFjNHY4Sit3aUZ5bENVVEl4RmVxeXFiU1RySjVhTTR2dUsvcmhaRDNs?=
 =?utf-8?B?TW9vY1I0MUl1eitzS3FEY2xaT2k0aW1vWHNuYlMvamROREZCd21NalA5RlBI?=
 =?utf-8?B?TnpPaUhwRTJBeCtmMFQ0TlBLRlFaS3MxcGlSOGRabWNFMDRpMFFxUDF3R2pm?=
 =?utf-8?B?THBDeXZTaUs0REdOK1lHOXZsWkd6VGxwVFF1RDQ4QXptMU9YUG1WWXJQTEV3?=
 =?utf-8?B?V2RPYTlRVWhjUGRVREU2TVpuWUdhL1dKREY0dU5BaXFWbG82UFhIN001eXYy?=
 =?utf-8?B?T3I2aEpCejY3ait1VnJKU1JJTXV6elljVllXRXM2Rkd2cjYxSUlKT1hQRjhS?=
 =?utf-8?B?VlFRdmo2ZHZ5WWY3SHFKaEZtUllVM0x4NFo5VXY1TmEzOTdwc3d0ejRKd21F?=
 =?utf-8?B?aFhhZGdWSk1rbWtYMFFXQlZYWksrSXUwTVN0WS9mVC82b3NzUFdlOW4vMjU3?=
 =?utf-8?B?YlBLemtLZ3czeXlSRW16YWg0MHlLaUpHbWtlVFJFa0lmdUFWTWFNR1NEUnln?=
 =?utf-8?B?Mm5XZmR4Wkp5UmtwUmEvSGk0a3g3blRRUEVCUFB2UHIyZzJnSEhISFhJWmpC?=
 =?utf-8?B?dCsydHJBZy9qbXFtNGdJZ2ZQSkw0dFdITDZDZlArclBHdW1XK005NUlXa2tO?=
 =?utf-8?B?bitrMEhaNExRdWc5eGpjVnR3NW92QjErTDgxeitzYWNIay92WURlZFVSVHZr?=
 =?utf-8?B?NUh5RGhMMHMzUFRtdlVCRVl6TzJiREFmUmdIamZlQ3FwVElLTEU3eVhEek1p?=
 =?utf-8?B?SWgvcllJS3hrckNzQ2oxOU54QmdiK0hNejdLUE9KTHVZUGtLQlZTWDdYVHhk?=
 =?utf-8?B?OW03ZjIyVWpDTFhjb2NZdmJkZCtURjF0cmhBY2tpZUZ3RCtEaVR5bElOam92?=
 =?utf-8?B?ZXJOdjRXblBXbnBkYlNmSDVKRWh4VS9sS1hmNnYybEF2Tklud3I3NXlpZkVl?=
 =?utf-8?B?cnZEdUpvcVhsZVdaOThoQ21WYSt2VWl6UEFuNU40d1lpbGtSZjhrN2pwSXFS?=
 =?utf-8?B?WFRyS0pDTjlNZ1ZBbFlLM0RIem9uL1FBdGJ6UWhxN0FJOCtmUmlzWGhkVWlX?=
 =?utf-8?B?S0d3UHppMFZpVHBvS2F3bitQb2VmRVMwQmlpdk1ZWnZlaHBTSnNaNGtDcWxU?=
 =?utf-8?B?WDc4RTZrNzAzSlVJV3JKTmcyMWQ0cnZVeHJRTWlMNEEvSCs4OE1pdHpyeXJH?=
 =?utf-8?Q?a37UZl+7SmjcJmZ0msuRU9y4b+AhudPULHF/Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUd4Vk9UTTJMTWF5cDNMUGZlbkVwWVVUUXAvQUF6cjRJZFZHaGw5Uy83dFVj?=
 =?utf-8?B?ZS9lVnZVZm9mOThFNkZMdHI2QkVrUXpwVXA4OVFheHQ0ZmU4K1NPb2htVi93?=
 =?utf-8?B?azVtSkJjaXlxSXgvNGtjOUR3UzRZeEkzZnBMdGhkblFzWUJ3SWlSaUxnRzNR?=
 =?utf-8?B?UWZha2ZmZzlTNUhJTStkdG1CMm1FdlZKQUNvNDBBYi9MeERHNHBUWFNUSVpp?=
 =?utf-8?B?dnRLcGhwU1JXZHNpdkE2NGdTWlBVWUFrUUxWZWZVa05JeHc1YVcwTnJ4c2J3?=
 =?utf-8?B?ZVowdEJ6eWQydTRUOGwzMnppRHBFT011YVBHbENNQmtXTGo3Q0EvQWtsOVNt?=
 =?utf-8?B?dm9xUCsybkN3Yjl3QjI1cFlaVEpTZEJ0cjVsajVvUGhnSUNCZVNWaW5saHhm?=
 =?utf-8?B?UC9KeS9JU1dJSTF2RFhpcEJ2K2VjOHdjV1NLeG53MWpyZllXSG5nUWEzQ0NH?=
 =?utf-8?B?emdoYUNzT0RlbTRwZDlweVFYVnM1R213Z2pGZkRyRHR5dlpRWDRDQmdUTUtL?=
 =?utf-8?B?ODNCTE1TZmhlRzljdFhtRG93c2lyNitqSUFqL2V3WnpuZnhMYmdFSDdjS2hr?=
 =?utf-8?B?bVFLcjRVUFh2Zk8yeFpOUm4vc01PSmxTK3VJZ1dkaFdZVURlV1Y1c1hDNVpz?=
 =?utf-8?B?TjRNTm5jZHl6RU1TQmdHVk1GdzZyZGs5czl5OE95WVlxWUtGNVppNnVHL0ta?=
 =?utf-8?B?TDYrREJQMExBVXFrNXpIVFJXZERGWmhrdTYxU0hRRU5mdjA3a0dwcG1YQlVZ?=
 =?utf-8?B?anBXNFhuRmsyOS9OUHkxcDVQOFFVUFRjcFpxM0IxWFQ4YmVqUlJTNEd1ZjVS?=
 =?utf-8?B?WW5Dd2g1MXVLRmdaWHBWTWgvSkpUNXVmNzd5Ym1mVTlNQk5Dck5LYm9NZzNZ?=
 =?utf-8?B?Mi9YSVdDWko5SDVpZTR6K2l4eUM1cUVWVGFFbXNDZHlHMDhPenBHZVA4RXYw?=
 =?utf-8?B?Witab2p5SE4xNEUwbFVEY0ZxZ1V0bmsva25jaVZVNmlGZHcvWXJsNW1XWlJQ?=
 =?utf-8?B?RjBEc1BlSTdLY09pVkhDbDhXQitlRmM5RzBTMnpDczJYeTUzM3Y0Z2NyN01w?=
 =?utf-8?B?TjhDMGdidlIxa2Y5VzViVVV1Tmd2VmVEZm1ZVTdaenJ6YnJIdXNpd0VSOFNp?=
 =?utf-8?B?MUZoMS9hK204cDB3MGFFUlJBejd2d00wc0dQa0k4cVAwOXVYWTFLa3N0elNy?=
 =?utf-8?B?OXphV2hvRmRpRllpazM3czcxb0dPSENzeWp1QmRGKzA1djNSc0xjKzlOMGw5?=
 =?utf-8?B?d3k3SjNPSFdKRXRvN2FwRmRadkowMU4vaXJ1djhCUEcxL1ByYTNQeStaWmh3?=
 =?utf-8?B?VnN0NVB4dlQ4TUZJamVlLzhFTG1aNlNWeTAwcTF6MDZra0NMdDlycVB4VUk1?=
 =?utf-8?B?VlUxWjh1OVV3aytFaEhEVUp1c0JiYjNlZ0lHRWR2ZG5raUVvMG9vVEltc01J?=
 =?utf-8?B?Vml6bE56NnlWTUJQbERuWUp3cnFaSExOdWUwVXlQaTB0aTdYTGcybm44YUh0?=
 =?utf-8?B?eDlRS1dvcHVkaE4zN0poVjdDZnpoeDJIRThPeFRtMzhocENHU2NQbTBvSG9D?=
 =?utf-8?B?OFZrR3VsUC81WjhGY3R6NkZLbHpWNk9WZWUwa1dFTlVLUU1JU25VT1V4TFcz?=
 =?utf-8?B?cmRoVnBldVQ5VjF1TUVuYklRREYrbW5nRE1CNGNEYlkwUnZzaEN0RnFJVSsx?=
 =?utf-8?B?UUU4a2lyY0JNSnFlbjNtMDVZRXMrUHcxZzArbkZ4WG9rNkhwQjh6N2FqOWJj?=
 =?utf-8?B?ekN1Vm4rYytoeEFHc2pXamNLdzI2WEhWbmhpdC9vV0ozT3FnT3lXY2NCSnJ4?=
 =?utf-8?B?NlR1KzJkRDRScURjcXUvNFF6ZUFUZ01RNlJKY2tGVDlsQW15UlFDbEVIK2JB?=
 =?utf-8?B?VlZOMHgwWXlhUDNXakR2K01ERnhoSVNvY25hck1MR2w1TzRxMlNBRlNsVU45?=
 =?utf-8?B?MElMYmdWdFZqRDYzbWc4WjltOERFdTFwdGVsVERnbUo2RTQzcEIySVBDcWpY?=
 =?utf-8?B?WkJKcHQxWXhpUzVIc016cW5KQk4xYzFyTTNYYVkyVW1MUElaUllCUjZtdEVu?=
 =?utf-8?B?dzNCMDlqbEYxMEl2STBhNXdYYmgzY1c3OEVwYk80d2NMdXVPa3ZjQ0F1U3Br?=
 =?utf-8?B?ZXM0dlh6UjdGc3BzUUtxaHFiVDRYNTRJenlYb0pKeGNkU0tvalNjTE43MFN5?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e57a56b6-bba4-435c-f5b6-08ddb3cb754f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 09:34:18.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82wdFVcoRF4h0+oL9q1zhF8MIM+5du/aUaUVGGVk4tWT58OJ6hyWgip1kSjO1zAKBQqhz0e3T7QLr7P4yXxDJKsThGxE1avC/8RrBzaNPkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7779
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 09:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7224

Hi Antonin,

On 6/25/25 9:23 AM, Antonin Godard wrote:
> On Tue Jun 24, 2025 at 5:25 PM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 6/24/25 4:42 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Add a "Limiting the Host Resources Usage" document to share the
>>> different techniques that can be used to limit the host resources usage.
>>> We do have a document to document how to speed up a build, so this
>>> document comes right after.
>>>
>>> [YOCTO #15111]
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/dev-manual/index.rst              |  1 +
>>>    documentation/dev-manual/limiting-resources.rst | 85 +++++++++++++++++++++++++
>>>    2 files changed, 86 insertions(+)
>>>
>>> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
>>> index 63736e0ab..4abfa59e9 100644
>>> --- a/documentation/dev-manual/index.rst
>>> +++ b/documentation/dev-manual/index.rst
>>> @@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
>>>       building
>>>       multiconfig
>>>       speeding-up-build
>>> +   limiting-resources
>>>       libraries
>>>       prebuilt-libraries
>>>       devtool
>>> diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
>>> new file mode 100644
>>> index 000000000..df8208bdc
>>> --- /dev/null
>>> +++ b/documentation/dev-manual/limiting-resources.rst
>>> @@ -0,0 +1,85 @@
>>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>>> +
>>> +Limiting the Host Resources Usage
>>> +*********************************
>>> +
>>> +While you sometimes need to :doc:`speed up a build
>>> +</dev-manual/speeding-up-build>`, you may also need to limit the resources used
>>> +by the :term:`OpenEmbedded Build System`, especially on shared infrastructures
>>> +where multiple users start heavy-load builds.
>>> +
>>
>> We could also say "or building on low-power machines".
>>
>>> +This document aims at giving the different configuration variables available to
>>> +limit the resources used by the build system. These variables should be set from
>>> +a :term:`configuration file` and thus take effect over the entire build environment.
>>> +For each variable, also see the variable description in the glossary for more
>>> +details.
>>> +
>>> +-  :term:`BB_NUMBER_THREADS`:
>>> +
>>> +   This sets a hard limit on the number of threads :term:`BitBake` can run at the
>>> +   same time. Lowering this value will set a limit to the number of> +   :term:`BitBake` threads, but will not prevent a single task from
>> starting more
>>
>> I was convinced this was the number of tasks BitBake can run in parallel
>> (which is what we say here and there in different places in the doc as
>> far as I could tell), but I also see that we have a bunch of calls to
>> bb.compress.zstd.open in bbclasses that pass this variable as the number
>> of threads to use. Sooo not sure what to trust anymore :)
> 
> Shouldn't they use oe.utils.parallel_make() instead? I also assumed
> BB_NUMBER_THREADS was limited to Bitbake tasks.
> 

I assume they could?

But maybe it should be ZSTD_THREADS instead?

[...]

>>> +   https://docs.kernel.org/accounting/psi.html) on the system, and will
>>> +   limit the number of :term:`BitBake` threads dynamically depending on the
>>
>> Is it threads or tasks here? I also don't entirely remember if this can
>> also impact already running tasks (e.g. dynamically reducing the number
>> of threads in the available pool during a make call in a recipe which
>> started with the limit not reached but is running while the limit is
>> reached).
> 
> It is only tasks as I understand it. I'm just getting confused by
> BB_NUMBER_THREADS which controls the number of tasks, so mixing up words a bit
> here.
> 

Naming things really is hard :)

>>> +   current pressure of the system.
>>> +
>>> +   These variable take a positive integer between 1 (extremely low limit) and
>>
>> s/variable/variables/
>>
>>> +   1000000 (value unlikely ever reached). Setting an extremely low value, such
>>> +   as 2, is not desirable as it will result in :term:`BitBake` limiting the
>>> +   number of threads to 1 most of the time.
>>> +
>>> +   However, having a low value at the beginning makes sense to get a sense of a
>>
>> beginning of what?
> 
> An "initial low value" would be better maybe, but I wanted to convey that this
> variable can/should be adjusted over time.
> 

I glanced at the BitBake code handling that and some other articles 
(https://unixism.net/2019/08/linux-pressure-stall-information-psi-by-example/ 
and https://lwn.net/Articles/763629/) and this is all still very 
confusing to me. How would I know what to put there? My understanding is 
that total= in "some" line represents the time a thread was starved. In 
BitBake it seems the values in BB_PRESSURE_* variables is about the 
**diff** between the previous total and the current total. We 
essentially allow a given increase in pressure over a specific amount of 
time. My understanding is that this doesn't prevent being OOM killed as 
if the limit is 500 and we keep having increases of 499, we'll increase 
the actual pressure by 499 every second and not trip the pressure 
threshold. I am not entirely sure I understood this correctly or if this 
is actually doing things properly.

Regardless of the above, how should I know what pressure is allowed? It 
very much seems like an experimental value since we essentially want the 
CPU/IO/memory to be under constant load (no cycle wasted) but not too 
much as to trip OOM or do context switches so often it's hurting the 
performance. If the threshold is too low, we'll likely end up not using 
the full CPU/IO/Memory because the load in threads isn't constant and 
could prevent us from scheduling more threads that would make use of 
100% of the resources all the time.

>>> +   reasonable value to set for your system. Indeed, :term:`BitBake` will print
>>> +   message on the console in the following format each time the current pressure
>>
>> s/message/messages/ ?
>>
>>> +   exceeds of the limit set by the above variables::
>>
>> s/of// ? or s/of/that of/?
>>
>>> +
>>> +      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
>>> +
>>> +   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,
>>
>> s/value/values/
>>
>>> +   Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO
>>> +   and memory respectively. Monitoring these values during a build should tell
>>> +   you what a reasonable value for your host system is.
>>> +
>>
>> Mmmmm... I'm perplexed. If we set the value very low (e.g. 2) won't we
>> simply limit the number of threads to something very low which actually
>> could mean we're not necessarily nearing the maxing out of the
>> CPU/IO/Memory?
>>
>> It's like running your 4-stroke motor on only one piston: "I see I can
>> reach 60kph so this is a safe limit for my motor when not choked up"...
>> which yes is true, but now you're not going on the highway because
>> you're limiting yourself to 60kph and taking the long way home. Safe
>> yes, but not sure we can derive much from this test except a very low
>> safe value?
> 
> Hmm.. true, so maybe the best option would just to monitor /proc/pressure
> without any setting, and then set the value.
> 

That would work if the build finishes successfully indeed, you would 
know that most likely limiting to this pressure would result in a 
successful build later on as well. If it doesn't though, I guess you 
just need to check this pressure and lower it until the build passes? 
Like bisecting which value actually work.

>>> +-  :term:`BB_LOADFACTOR_MAX`:
>>> +
>>> +   This variable will limit the number of threads :term:`BitBake` will start
>>> +   by monitoring the current load of the host system. :term:`BitBake` will print
>>
>> I assume we're talking about CPU load here?
> 
> Yes, I'll add that.
> 
>>> +   the following when the limit set by :term:`BB_LOADFACTOR_MAX` is reached::
>>> +
>>> +      Load average limiting set to True as load average: 0.7188262939453125 - using 37/64 bitbake threads
>>> +
>>> +   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
>>> +   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
>>> +   was designed for system that do not have pressure information available.
>>
>> /system/systems/
>>
>> Hopefully the glossary and this document stay in sync :)
> 
> What I can do is revise the current glossary definitions to be minimal and
> redirect to this document which would act as a better overall guide on how to
> achieve resource limiting. What do you think?
> 

They are defined in the BB glossary and not YP and this patch here is 
for YP and not BB docs (maybe it should be in BB docs? or also in BB 
docs?). But could be an idea yes.

Cheers,
Quentin


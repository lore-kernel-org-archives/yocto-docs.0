Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D165C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 14:00:38 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.77])
 by mx.groups.io with SMTP id smtpd.web09.28957.1664200830877055574
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 07:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=AMFWfIS3;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.77,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtKeQEUadLNr9apLUl1187teIOAyttvna7Wx69h5TUALwiWGNDtiqhU53+BbDJnL46nCs4PrYZxFgkYWfB0oDsDYYqfl6nqljKUZXxThteYC3wfR2yPnPhGMd+ZDxSXDB3GDRBLuVHzAXFIEUADBQgIeTzg9KeqStz2c1S6vzvXnQFf9fdolD3XLjNbBLvPU0EoqvBa8veo0dCzdCwDt/ItdN6rbCkGIsGxIXbkIzjvxnibwisWbZSEYIptk8zKSNrGAM7cjPvi5LPMK5hWZejenZWgTvaTg8cPsyB2Tw3ZWCLe0b9Vn8pQEbiKfNQnIFZ1hKgfZ0Uv6b9NQSpdHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCodKcGWRbFHKYjHgVW/TEhXZnXm1WZQ6/d80AFRAsY=;
 b=ORD40mxVPzzkXlfNZg6AvbyPtOQ/g437AFaCUBW8lmeiXNSam0q8bBejtMj029se+lRSHUjPwKAODiduI2ndZ+qy8QuE05oFWTfPwGYWJilf405e4iE6jI/asBOcKllGTiWCKGkeinrp/maV5Rx0+WUmJrNeXVqA7pINaZhXuKIZ4H5UNWXc1ugwLBZu1S4Yg7VeuPLew7W8GGm5fHN03ILP2ib4YI7Yf4aLe4LymyjP5Y+a3/B1Jy367/p6jTGnwI2ye8ME5W4/f90y4NqdtYqekUMLQjWRuvcDKyu4qFcNQFxbX0c4DupriEheU2sKsbD4wR33fhhBjfNrHc4uWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCodKcGWRbFHKYjHgVW/TEhXZnXm1WZQ6/d80AFRAsY=;
 b=AMFWfIS35EUgDH4DX0T52ISLMpvGYtyvUkHz7hvOQhUgXg1nf1jwYj80XdtL6OE0hFjThBK7GYzkndx3XfFoHoMm3cxXJGQSJcHVom9BWc8Qr6jHJjJHqcb3tfmz0vV//7wPRliUR4bgtnCWowzwpux2HEwRHCxkA27lajJjf9NEtDJISLKfiMNDwqWnhkm8ZHIp3Ar4SmuBGqoHk/JW6AOpAUbwY1WbbBpKplOxXZNmSAYa+4qv5wBXkx4n+XEZVHl2WR8Gnlw6dfmHmoI84BzUrAn407PbvIguqfiMu2VS5KeyinLLzlPSuxl3snv1FNig5Pxf4hPhCokQbztzSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBBPR04MB7996.eurprd04.prod.outlook.com (2603:10a6:10:1e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:00:27 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:00:26 +0000
Message-ID: <774d421e-0ee0-dbb8-8d7d-254cbc9b9fa0@theobroma-systems.com>
Date: Mon, 26 Sep 2022 16:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 00/30] manuals: add missing references to tasks
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBBPR04MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b3db69-990a-4823-a7be-08da9fc776e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZUbFgZB9WppdJA3SgqzwzPrmTo6A97PkxxS4pPO7U8dVo7fcSmKxxkKh8pZ7WBmciHWAL3tgjxDRfS1ZOsyG7w+s6trOW9dwC7rhDnso6LavEjqPaGh248A4K4xTl8LN3443dkZlsKVpTxRQ0A1D/BHK7QC1TxFOrydL+VI1wRakY2inwTj+F58X3K16CZOjDJCyxhbfE37x4nqP3SB7YBC9pssSfP0rPBCalGwU6Ln2fyFU5AdVH3OMC1DxRq+E82+V4kEaBCFMHXinLY2xVG7JY2bDxCBBvhcf6LPr601/o4m2cwHvB+BxJ0vyKaiYpmKvZVkyeyMXeRoAEEhI2ih8Rrfd8WzmpLYUk2eM9GMjSWXg3ODdIokAydaGL/wt7vUXXO2FBaqBmz8w99biH40R9gikoPK0zBSeEBhj2GKlopFdej+QBIy8E3RkbK+r4WOjUQ9wlzb5X/1sHQe/gjWLUnE/qmB2gHPYta17HKz/s63nxNa+1BRUvTQk7HxY20u6e9Du2zOlTSDhpR9Pw6EVLZ8b1eO5vXJ08kw5VJT3UPFrNDVZyG7wo5RBi1S0tEHcNhTiwXkyBZrZlKAfkO3pe9YU6YMy9lxqlNu/329u1/47GRQ/h0HB4BH7AAeeLTUrVwAqW1QvTEVq0tGRXcLFgan64LyhYaY2IQtwkHI09l2pdICpqzFYr1r1MzQT8lJ4fL59JPFO5n4Ou+QlL26XAF83Fv6D6uEvoosdMeRnjNWn4xg/apfJJenxPY5tf3b97FoklguyNmQBF7fKQf1j1tSoN4oo2n2mFc1F38GL86Jxd/c2OIk9aR+ZLHlW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39850400004)(376002)(346002)(136003)(366004)(451199015)(31696002)(86362001)(38100700002)(36756003)(31686004)(2616005)(2906002)(186003)(26005)(5660300002)(44832011)(6512007)(478600001)(41300700001)(6506007)(966005)(53546011)(6486002)(83380400001)(316002)(8676002)(8936002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTdISHNFSWFIRUdtb1JaY2YzRGJFbHNpMzdlQVJLVFRkQzBMTE1TVjMwci9W?=
 =?utf-8?B?SllwL05nTERWejVzcVc4UmlqT3VzZFIvZWwxT0gyaGswV0NmdnJ3WStaZlVL?=
 =?utf-8?B?dW1HZVI1OFpmSHZEWnQ5YlRNLzI2UWo1SUh1VG85QWhjSURiUURaeDRIUnMz?=
 =?utf-8?B?V2Z3aTg4eEk0YXFwb21ZN2NzWi9nWEVZOEZQdTBLQ0c3VWhkSG02Ly9MLzRM?=
 =?utf-8?B?L1Z4ME5sOW1JcFU0aEptbUs5ZXhXUmhhMU5JSnlsQk5GTDJ3ejEwbUUwVGcr?=
 =?utf-8?B?ZXlLdk1aMU4reXFpVDNoSG9PWDM3aW9IUThDYlp4UG80YjM2dGpMWkJHK2JQ?=
 =?utf-8?B?SS8yRU1LL0VkSHBoUmVuME9YTWszN3hsakZPYzBtS2RWZjJGNWUydktOM29h?=
 =?utf-8?B?eGljSUppSHJkam5vYk02eXN6dzF3Q0NCRHJmajlYQWhQcFZ5cUpEK2NxdUtX?=
 =?utf-8?B?cHZGcGFDT0E1bkgzemlaSkdXNURWUnFxdTdEUHFDRnRLUFF3QS9QL0JxU1Fq?=
 =?utf-8?B?TFlCWVBpYnMyTThNQUNqbXdSaEJIYXowb0VJMnpJcTRIUU9ndW1Rc09hMW4r?=
 =?utf-8?B?TlFDL0oxekMvM3NuK2kweEJOVXowWWRGeVFkd2hOV212eTNWekF4QytnZEJy?=
 =?utf-8?B?RnVwOTVyMUEwWEhpdkRhS3QzRTlYV3FiUEEvTUJqSUFOQ1VUSUtMTTBjaTBp?=
 =?utf-8?B?bHduSFBvL0lveFZBeHZzZFhlRWpPclZaSzVTdlhDS0VWTU1NeWd2eGZKcVZL?=
 =?utf-8?B?Nkcrc0VoU1RVcThtRnpvUi94M2FGQzBUNUdJN1A3dTFNc0I2RVF6b0xGUjd1?=
 =?utf-8?B?Znp4TUhiUVJtbEwxZUdKYnFFd0lJOHFPWHlOb05icHIyM2lWSDJHWnhqZ1dx?=
 =?utf-8?B?UW80R21XdExtMHlqQ0lwMEtuK092YVQxS1RaUU9oRWxZdU9iQVFhUW1McDhh?=
 =?utf-8?B?UnJ3OERyNTIvbVhzY0lWZW5mYnNWa2h2bGgwYllPckU3NEE1dnpoZnJPQkQ2?=
 =?utf-8?B?ZWJRekRncGpvU3NDVE9UaGFQOFkxVmt0V3NDZXB0OUUrdmR6TUd1QWlNWUZS?=
 =?utf-8?B?VXM1eU5UUUN5RXNmOEdPQy9IV0tkVW9tZzRGQWZCN2FmeGNUaXg4czJycHRW?=
 =?utf-8?B?NzJRR3VQQ0ZUQXJSQXRDd00vcnVqbS9zbldJd1RDNG1yWlQzK2NzM0R2SUNX?=
 =?utf-8?B?bWhsL1Q5MnYyeXc3eUtXNm9UN2RKY3FrTjNnb1VJZEM3RkJmYU1jT0hHdkY3?=
 =?utf-8?B?OXlsemp4WnZ4ZzZYQStTMGU4Z2RwNTdwc2RGdGx2NTZwenh5Y1NrcFdMRFZ5?=
 =?utf-8?B?WlJiYTRPRFd1M2dod3hjMlR6bTZOMkdVd2I3cU5iSkhsL3ExcmMwV3lkelBT?=
 =?utf-8?B?ZkI3NEh6YkJXQUJsbko1TnlZVzBNTllBdThUYTluTENVdmZHRythRFRwVWxS?=
 =?utf-8?B?K2pGMVNEVGVCbEsrcFNqRlgzNW85RzR5Q1hDUGFXN0RWMDJjL0JYeTBWaFB6?=
 =?utf-8?B?OXlJbmlPZlZNSTBBTWVOVmhiMTlwbkFuSjNJSHBXZW9OK09Bb3N4cG43YUdS?=
 =?utf-8?B?TEVBMjlnU1ZXZG84NnFyeFgyMjBhbjBLVjFtY2ZXR0tmc1ZsZHhxRVZmOVYz?=
 =?utf-8?B?NzNpeUl0bWlGelNZRjlFSlpSQXhLN3lLb1p3VVArdEN3dVZ5T1ZJcFZFQW4w?=
 =?utf-8?B?QlFrbzdFZjNhQ2hZdzU3M3h1dFpuMXpnZURETFZDZHdOSTFPM0c3eWVhTCtj?=
 =?utf-8?B?RlNwTDMvaXhUcHVBdGtEMDNnNFdUVURXNHoyTTZTRkNoSmQzcCtVTWVWTjNF?=
 =?utf-8?B?VFFMQVRoQStvR1NxMnNQNmphSEphZzVnY0J4M1RGSklLb2R1UHkwQU1FSUti?=
 =?utf-8?B?U2MwT1I4QnhiNlZvajV3SlYrN0IzNGxZWEJtRVVvaDhQcTltRGFYd0ZCQndV?=
 =?utf-8?B?R0tzQ0ZnSUk5VHZ6Y2FYT2EvcjB6clc3RTh2ci96RlYzWDlmMUt2dlBRWUJ2?=
 =?utf-8?B?QjQ1Rk52NW9IODB1TERjcTdIaGZ2blo0YWEyYmswRTcrbGc5TlNucVZvNUNz?=
 =?utf-8?B?Q2llRU1oRE5RMTdaaTc4WkNaWjY2ZmZoV0Z1akNRTTBvSkxtbE1MV3VneXZz?=
 =?utf-8?B?Rzh3U00xRGc1MjdZVzNpakxlU1BlMFJKYlcrNVV5a0t1R0xBZGhmVVJkUkR0?=
 =?utf-8?Q?7xXh8L/7+5VNmfinTfmRQvM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c2b3db69-990a-4823-a7be-08da9fc776e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:00:26.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2OSdwCaCfFLyl4X53WJGgOCmaM1HZ+ERS5wbsIHmZeCs5PbNOGErBGwII9GDOkSYvNfTJ989OQ43pYFsZmYVdpgQdswC0wxy0NeuKY1iE/1pQvpELOEb7llHkwA9QHkW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7996
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Sep 2022 14:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3248

Hi Michael,

On 9/23/22 19:51, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> manuals: add missing references to tasks
> 
> As suggested by Quentin Schulz on https://urldefense.proofpoint.com/v2/url?u=https-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D14508&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=HuSyEeTT-KxIT3uX-8IenyuDr00g1CP3df1fW1p3wdbCHI96kWRHSCTRw9BLNyWR&s=UWoJbMECYt0997xRv7yfZIXOJ4HiCK0Kk57CApO1lwc&e=
> 

There are a few rogue do_image_complete we can convert still.

Cheers,
Quentin

> Michael Opdenacker (30):
>    manuals: add references to the "do_fetch" task
>    manuals: add reference to the "do_install" task
>    manuals: add references to the "do_build" task
>    manuals: add reference to "do_configure" task
>    manuals: add reference to the "do_compile" task
>    manuals: add references to the "do_deploy" task
>    manuals: add references to the "do_image" task
>    manuals: add references to the "do_package" task
>    manuals: add references to the "do_package_qa" task
>    overview-manual: concepts.rst: add reference to "do_packagedata" task
>    manuals: add references to the "do_patch" task
>    manuals: add references to "do_package_write_*" tasks
>    ref-manual: variables.rst: add reference to "do_populate_lic" task
>    manuals: add reference to the "do_populate_sdk" task
>    overview-manual: concepts.rst: add reference to "do_populate_sdk_ext"
>      task
>    manuals: add references to "do_populate_sysroot" task
>    manuals: add references to the "do_unpack" task
>    dev-manual: common-tasks.rst: add reference to "do_clean" task
>    manuals: add references to the "do_cleanall" task
>    ref-manual: tasks.rst: add references to the "do_cleansstate" task
>    manuals: add references to the "do_devshell" task
>    dev-manual: common-tasks.rst: add reference to "do_listtasks" task
>    manuals: add references to the "do_bundle_initramfs" task
>    manuals: add references to the "do_rootfs" task
>    ref-manual: tasks.rst: add reference to the "do_kernel_checkout" task
>    manuals: add reference to the "do_kernel_configcheck" task
>    manuals: add references to the "do_kernel_configme" task
>    ref-manual: tasks.rst: add reference to the "do_kernel_metadata" task
>    migration-guides: add reference to the "do_shared_workdir" task
>    ref-manual: tasks.rst: add reference to the "do_validate_branches"
>      task
> 
>   documentation/dev-manual/common-tasks.rst     | 68 +++++++++----------
>   documentation/kernel-dev/common.rst           | 10 +--
>   .../migration-guides/migration-1.3.rst        |  2 +-
>   .../migration-guides/migration-1.7.rst        |  2 +-
>   .../migration-guides/migration-1.8.rst        |  4 +-
>   .../migration-guides/migration-2.1.rst        | 12 ++--
>   .../migration-guides/migration-2.5.rst        |  2 +-
>   .../migration-guides/migration-2.6.rst        |  2 +-
>   .../migration-guides/migration-3.1.rst        |  2 +-
>   .../migration-guides/migration-3.2.rst        |  8 +--
>   .../migration-guides/migration-3.4.rst        |  2 +-
>   .../migration-guides/migration-4.0.rst        |  6 +-
>   .../migration-guides/release-notes-3.4.rst    |  2 +-
>   documentation/overview-manual/concepts.rst    | 56 +++++++--------
>   documentation/ref-manual/classes.rst          | 16 ++---
>   documentation/ref-manual/faq.rst              |  2 +-
>   documentation/ref-manual/qa-checks.rst        | 14 ++--
>   documentation/ref-manual/structure.rst        |  2 +-
>   documentation/ref-manual/tasks.rst            | 52 +++++++-------
>   documentation/ref-manual/variables.rst        | 22 +++---
>   documentation/sdk-manual/extensible.rst       |  2 +-
>   21 files changed, 144 insertions(+), 144 deletions(-)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3215): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_3215&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=HuSyEeTT-KxIT3uX-8IenyuDr00g1CP3df1fW1p3wdbCHI96kWRHSCTRw9BLNyWR&s=g6dvrTKb9AKxCL0ykjdTc3FxSeg3LrEj1lRSqOe61aQ&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_mt_93876086_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=HuSyEeTT-KxIT3uX-8IenyuDr00g1CP3df1fW1p3wdbCHI96kWRHSCTRw9BLNyWR&s=NPpca8CWiuQKcTD6hAQUq4WVKxUukscUDxFhf5smWeg&e=
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=HuSyEeTT-KxIT3uX-8IenyuDr00g1CP3df1fW1p3wdbCHI96kWRHSCTRw9BLNyWR&s=xbTF8ktdsUNCHgckcmF9w5wCW5gfLivzfvPSfFvfSl8&e=  [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


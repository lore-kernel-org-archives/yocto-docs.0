Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15022CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:24:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16250.1781083450952946092
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 02:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fS2USrUt;
 spf=pass (domain: cherry.de, ip: 52.101.70.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZubRb2F3ZaB+XALkEGJoPE+o/TnfrnGhDwmnqpEPKqpF6L45zTQd4IpNKxr/RyaiSbwUtwEFH9n01dn5rm2V011/fP5dtzoxUcTg0R9xuL7TMewNEJ8jLOUPuhokgjHZZo9yHFPg3oiSYv0agRPkSSWYJmeQvDGQtbHB3yBdOTzQzmIYPoeSLKZm+dPlxrCujSlUZPB8sG0ikl7KzNY2T0W/uDipZsUN28eepxD5MqG9sjBD58k7mrkWqj6EYr0n9Eubeq0spxs5Wtie5C4SWlaDOMRLnDNekC5//jqpSnzyQ3AYErNTYQ4d1nwQ+U8H6VcHjBegGB0I18ImOkTupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05jYP1KuGLDunxmFoYLreJ6ACFByw7eReECqrhiGcqo=;
 b=Z8mFWeAlpJ+pXEVfN8qafYIQ98w2FxPBs+GzUNiFgek0Eb7W1E5RkHccCiAfdRSVJopKcQYU9Si3mBfzeTh4XTwkU4opJytxRzn3GOiYIkdlp0aBtyTjkRTAvu+uR7Jl2ymPEhApf4QWYAJLQ3hlNUYd5ECTBZ/McgPWFrJ+lU236V+kpbudKM9OF+jlRg/f31quCdPNOKJqfk/Q2obhumTE6oP4bruIQSVyKeBlzKLpJ22hK2UCd8ouaC83a7S9DCUeLKmamJAuYvyhPJqAg5nXHd8x2zOI/VtCTbvp11xbsCkvhMv93s4yC5Ow7N1OTN7tR3/FOB1i/QPzXTzhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05jYP1KuGLDunxmFoYLreJ6ACFByw7eReECqrhiGcqo=;
 b=fS2USrUt5I9WhsgvcZ+sgnzzSpCJftR2NiuhzxgKjjnGgLgAMZNKK3NPUeZfUQDC8haGLNO3Wzg/N8e3bVN+X2KuvH0xo4oUfTfF30HQu5MyF7Waiwe9H++087rozPuML7bd6FUcrMqgMbyrMk4m55iIZXqvRcKCk3KvCHysAqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB11654.eurprd04.prod.outlook.com (2603:10a6:150:2c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:24:04 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Wed, 10 Jun 2026
 09:24:03 +0000
Message-ID: <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
Date: Wed, 10 Jun 2026 11:24:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe
 re-compile
To: rpjday@crashcourse.ca, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
 <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
 <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:803:64::19) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8960a4d9-0463-45e3-e799-08dec6d2037f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	IG+/xLXDf+b0LGVt8CoLZAnWZWpzoqcChCF8nXru7AkRpHSv68DThV0FoqJHGQug9H9PffVUeB9Eba39un15DfdMsgJPCe3Z2LHUSoZmNiazNxYYuK27KwODlRom/w5bnckq0blGxEmXzHyxmjsPWt4cUmyXzZkxdZ30+iQQG4UiQ+kWq5tD0deSD1OgqGr9+C8UKTIUnNg9ZtzEQBXK3F0Wtp9Zl7Fvh9TOG56LX/NBf3F39xk0GBYRiOeLn0ttEKl0zAJYPefr8G9sPkdU0FxnLNBC8XPknBHSapTe7cEYmUeG6wblg7neezL2VlAjYoxI0S0GOUeFjnCRMlppStThWAxiOKuUWg/egn2Tm+4KIW7tQkssM4D77K1yO7Krq+3TFpYrrIYfd9ayGYHNgT1MZidLX0V5rR/1RA+4j+wZ8HtLT8AyBKYzcYJbPFApuXP2F9V1a20VFuHTFS3uGwxysTOnp2+B2yCHZo2jl187UOLivIYKlmiMJwXgVc42hj56CGT3pmfqBMxktpYstA+PBdWXhk4j2Vjh56DVPqE5UPwJeJzNUM6PXPIbLhfNKRduFy5PkEAjjiGzZtXFtQvsMZkg1+3V1XeVDhcd67iDwr32Arqu+jk09Sp6z+7lYbQYNnJIFChkHsGejD2RMPcxUfEe+MFLGqM0v6v20rsE22Dvkiti5iAHQyuD/JOp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVBhNThmRitXQVNQQnlFcXRNTjhjdFhxQTRBbXRQWmN1LzhrQzJMZFdPelkx?=
 =?utf-8?B?c3VLZm5KQThNdm9hRmhTQXJKUGduL0l5VVhTZTRoMmlNMkJCV01adkorS3Rz?=
 =?utf-8?B?YkhobUFIaStkSXVVcjdPT0VUTjZEWTZ1UHdsalFSZXJISG14YzlMQUkvcUow?=
 =?utf-8?B?bkFsYjRDTU9mZGV2RXpjNUpqekpaTEVwMVdhL2pLZHJmeGluRzhaQVNlNXYz?=
 =?utf-8?B?SXNsb3FFL2c0d25FYkxFR09XOTdlbUdaODd5dnJjd1h3VE10YXlOL29ZK2Nz?=
 =?utf-8?B?eHVTMWYyaHMvRVpRWTZ3My9WdTVkaVJlNlFra1B1MmFURnprbmw5Y1FSRjlq?=
 =?utf-8?B?cUpCV0RHQlk3aUdENmhnQ0pMamdzV3J5MUdjaENLb05PbzBzcVVubnAxbkpN?=
 =?utf-8?B?SytyTkkweFRiSG1tNmduL3hWNWkxZnFRS3hPbjQzTVFoNU5ieXJmSTU5dnRz?=
 =?utf-8?B?dHJpL1FtZk1DeUJZcDZlVStISTh6MU5PMHlrSVFoNGVJRlJYMUJJUXdmanhm?=
 =?utf-8?B?NDhZSzBQd2x4TlczY0RvT1FscVlaYWdUK01Fd2QvWHRrQWVCbldja2UvVVo1?=
 =?utf-8?B?enJFM29BeFZHZnFtd3hJM1pNeFdZS3IwaFN3eUc4d0daR3QrdHhTSW0zYk1k?=
 =?utf-8?B?MG44Y2tCcmkrSVV6RXRwQ2p2SFovSnVhZU9hYk5mOElnTjl0ei9WUXdBQXBQ?=
 =?utf-8?B?UkcyQ3ozWlJnVVl5VURzWjNPRnh1MFJ4S3lid1ZqanVZOUxFY09TM2lDTWRj?=
 =?utf-8?B?L0ZOVUdyd3MvdnNUQTJ1MFBxWGFvTHNnd1JCVDdpZ1hZUE5lZkRYbW1CMDc3?=
 =?utf-8?B?Z1NJblFwVDBaUTcyOXBTQkUrODZaVHBMd0RjdDJTZkxpdXRvb3NhVGh2NDhB?=
 =?utf-8?B?a3B6SXAzMmUvd29ON0hkdlp3WnpjWWQrVGZQeUI1dTd6MmJnMzVzdGw2VGJi?=
 =?utf-8?B?TGFUTFh3ZUp2N1NDUUlqZWhNOGZ2aUxvSTNQbFdoMjNyV1lDMTZFZWl2bmRV?=
 =?utf-8?B?NzVYMnBtNHl6cUljV0tjRXFid1hpR2NISEdzZUhrbEtEQW5Ob0xHdmg2S21o?=
 =?utf-8?B?N0ZkK0luWU5tMjdVVndnZXBMcU5xUlg3cDJwcnM3cjRjMjlseFNmUTR2T3Q4?=
 =?utf-8?B?b1RFQy9sMHg5T2gzWWFndWM2WDFDWXpLNGZRMUtGUEJ0em5MdS9HYTg1NSts?=
 =?utf-8?B?dUpCWlJ5VzljMGRwUUxyTjk1NDBMQXo5Nkc4Yk8xMW5BckFHODAwbUVlTXVr?=
 =?utf-8?B?UG8rS0xYWlhucm5rTnlLbFdsanVDMVNhaTViT0E0UWpRMFdoanZBMkR5YUxo?=
 =?utf-8?B?R2VKUWp1MG9tQ1I5QkRBb1Zuaml2T1l3S1ZGWkRzZHZIRzhnZ0RZTFJKVDJH?=
 =?utf-8?B?SEg0dE5WSlJqcmdpMUU3aGk1dlgwbXJ6WHd5WnVyeG05YjVHVG5ycDc4bytX?=
 =?utf-8?B?TVR2dmVBeWcwN2tyUkpvOHZmUHdoY2dQU3Q3OEdKWkFmQ2xHZXV2U1k1SFpa?=
 =?utf-8?B?L3R4RzAzZ0ZORUhiWDdwem1pMDgzd1VUejdOV0dTWXVpRDRBNDZtUUZGbGhG?=
 =?utf-8?B?Z0J6OTVMaitwWkUyMXdxdTduQ0RqY00vdHBTVkpQeTUrR1g2MzM1eVd3aDlr?=
 =?utf-8?B?L3RIRUl5d3BhNnpJaW9ZaFA4d1k2NXdRMUhZUDJGcUU4aFhoR3EvNG4wczI2?=
 =?utf-8?B?UjdVVW9CZ01zakNoN1FlSURtR1N5cEZwUFhoTzBqR0NlK0QyMWYrNlFKN3pj?=
 =?utf-8?B?U2lFMXpuRSswUndyK0JzTEc2Q0tOLy9nV0syTkNRNGtweTB5dlA0WEgwbXd1?=
 =?utf-8?B?b2RRNGZiK3g1UlI1NVFGOVovWUV0REU0YVBQMmtTYVpUakhKQzZXbENRRlc3?=
 =?utf-8?B?UEc4bktpRSs4VmdoTGRwK1JVQ0hmYkZyZ1c0Vm1uUXZMbStUVWdRajR2NzYv?=
 =?utf-8?B?cThGL3ROWDRmM2RsSmdQZDIyNFc0bm1oWjA2QWE5bERGK1kvUGdiMVdiREZU?=
 =?utf-8?B?RkhvcVFua0hXQjZWMDZCL2JBSlpQRk1hczhhN1RFSGkwV3ZXbGgzWWRPUi82?=
 =?utf-8?B?cERBNGR1N3g2MTA2eW5TdC80Qk9CZ2pMZDBWT3RUclkwLzduK1pSN0pPUCto?=
 =?utf-8?B?ZHlhWjE4bHRraStBTWd0eXMwVG9HSHVFUmZ1WE4zRHB4bGZqaTh5cnI4MGZ0?=
 =?utf-8?B?b2s1U05lbEZmVWNoNUwrckNrZ21FdGtVanNIQnlIRHl5L01oV2MwdjhVaTVQ?=
 =?utf-8?B?YzZESzEyaHg5Mlpabk5jVG9sQ3lqYTNmSG0rRnh5RlFlNkorb0UxeFZvM2Rp?=
 =?utf-8?B?UXdyTTV1MGVnbVk4djFSZWtaTzFhYmwrL0VnRzZjRUZZTFR5aDY0dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8960a4d9-0463-45e3-e799-08dec6d2037f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:24:03.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpqU7M6tAkTweUDcHOd5PXe2dJxB5DQ/i/qJ8YMGVp3kFBBkMiAyxE7bL00lhaNgUWWmXhzXOCYjGb5A7pc0mHo4B4+PajmS1MU/IsQmDRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11654
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 09:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9673



On 6/10/26 10:36 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Wed, 10 Jun 2026, Alexander Kanavin wrote:
> 
>> On Tue, 9 Jun 2026 at 21:20, Robert P. J. Day via
>> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
>> wrote:
>>> --- a/documentation/dev-manual/temporary-source-code.rst
>>> +++ b/documentation/dev-manual/temporary-source-code.rst
>>> @@ -65,3 +65,11 @@ build system uses to build the package would be as follows::
>>>
>>>      project/build/tmp/work/qemux86-poky-linux/foo/1.3.0
>>>
>>> +Finally, if you make some changes to a recipe's unpacked source code,
>>> +you can force a re-compile of that recipe with the command::
>>> +
>>> +   $ bitbake -c compile -f recipe-name
>>> +
>>> +The ``-f`` option in the above forces that task to be re-run
>>> +(invalidating any existing stamp file).
>>> +
>>
>> While explaining where to find the unpacked source is okay, taking it
>> further and providing a way to force-build it is not a good advice. If
>> someone needs to modify and build source like this, they should be
>> using 'devtool modify'.
> 
>    i actually thought about adding a link to devtool, along the lines
> of "while this technique works, devtool modify is now the recommended
> way" or something like that, at least as a historical reference for
> people who have been doing it the bitbake way all this time to let
> them know there's a better way.
> 

Do not modify a recipe's unpacked source code, it's the best way to have 
your changes lost. There are non-negligible chances that it'll end up 
being deleted and unpacked again (e.g. because the cache is outdated via 
its dependencies or the recipe parsing resulted in a rebuild of the recipe).

Using -f also taints the build and you need to clean the sstate-cache 
for this recipe to recover from it last time I checked, which is 
something we don't like recommending to people (if you need to clean the 
sstate-cache, either something's wrong with your recipe or there's a bug 
we need to fix), so I don't think documenting this enormous footgun is a 
good thing.

Cheers,
Quentin


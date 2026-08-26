Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B2EC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 14:34:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13942.1787754870613211913
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 07:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Tz/vL2H6;
 spf=pass (domain: cherry.de, ip: 40.107.159.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgKcOdxnLrt/FJFijHjL72krwDNpwbDaMRxPtJT0tmmh+UMpw7zggCBjx8GjobqbxtK1EFj/LShnK5uEtdYmZXYCTfZwBeowXzo2oLSuRRig54sHDXJvphfbRu3gRCfRYuSm53+udStq90oz6kpKyYIUcEOfP6NLCGdNxpKSm9QJCSjPfpxDyXHTcH+T3eOo3xMDfCa+bCj6+RMDaYwuO71eH6ijsUE4VGqJrZVygobdsB9DZVheYLnybkdaNqCel/DIMQIIKH1b2CUdxz7wk+X7p+TO5Jerby8ajg09XAJYuXsPiWgskFMzTmjCSjUBMKCazZ2AEMzFYeBzxfbbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRYLxxu3Yuql9yURBlcEkrhhQxLk9wvhySODK2fJVk0=;
 b=eQc9cDBeWvFg1Iq/DjovSYx/QtDEVC7wrS9gNo8S2hLb6D74HpBYuE6Mt0gJ2pPZPOFJ6u6WzDKBAnRQMKrdd5ZOxTpoAswF/hYgpTPxBOOpZqJ4hqh2k87m8WJbYV6O+l3SdRuDpmkCpGD9Xz29fwbHsUUruOrhyXVnBL8oRwyCdRk/AN1kBlvZ443oE3Q9aB/0ZIhKphSi3nLsGzmFOZYxY15jyt1rf7NR5M80atCObMbY0kyVceHzZb7MRIKDwYPRM9DwyaR8QlpDJuqZnBhY+rU2awTb3953cdfDC/QHGZhuBliaxW5AgVw+t2X4PX1einSlTW0nGaQfqUKczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRYLxxu3Yuql9yURBlcEkrhhQxLk9wvhySODK2fJVk0=;
 b=Tz/vL2H6EBaeha9XzrDppbv9JbQDJJ/ULVjf7cKuTjkzmaTPNitFSqXPSfAAhhy0BOQynNbqerS3AlkDRTaS8LYV4qMuZX3Lyfi6VzAX4nwLBdv2RjU33yNSwSfoFXvZeP/XJXINgKJuj73sHgZtJnVNUpqU3/oTgKfDIEc3nrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS1PR04MB9631.eurprd04.prod.outlook.com (2603:10a6:20b:476::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 14:34:23 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 14:34:22 +0000
Message-ID: <78a29634-d64c-48ed-a012-71fff5efcb75@cherry.de>
Date: Wed, 26 Aug 2026 16:34:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: Antonin Godard <antonin.godard@bootlin.com>, twoerner@gmail.com,
 docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::30) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS1PR04MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: a69dbff8-d2bc-40cb-bf24-08df037f1e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|5023799004|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	B0LHXNHEC9+zgwMqxrgaPbbd8bJ0VP9OEO6PsC/J3mBh0uEvP7kkPdOyKJlIkbYkTF/2LKTl8LsXik+q/rvi2pyMpFe1w9SB8Zpg2i+MbrblOSN2IgktxLRPV+292LRNaOw+R/PiBp6dLk3A8gK9voTegASIHka3gJCmXsF6ROdsT9eEUCBp9oP6BReAFWH0+q2y7a8VRWmQTJtzIuV5bhG7W8UCNGqB5whn/CXj31d957R7Le4nh22KMTCcLmyO4u5Uv4HY8ExnjshE4F3KAtu26cDaOZ8PWiG/hoUk8cCHONjpXfaw55juPK98DfvtEaSF9UZp2GduXCm/J/OKYaIWrlzvuyKB3ywe3yBzbN/eo3gYrtJzzv8mSIouJwRq8PCD2ztq2W12frJI5UFoH22uDICO9KJ75Y5jZF82vNqwXyobY2ds6cx0Zla09syyAZ9sdsTxDtugGb/mIEuLm9H2hOwzkV27wVKZIkqaHQGF5ohn/t9r0Rbye3UZK1tsttsPJ31bzOt5cE8tH8/AG2CV/oi1oVLASfZ89cnaLfhbyPMzS1BvF7m/fCfCRJMeQbJoPa0ycrOmNxzPjv6t80UNk/wylGnwEIErJuCVVrvxDuij1NE2Ju/SnQptEGQ2a8G42L9BTc2LsBUvIQiZUF0u+FVDrr0finot/l/F9HM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzhrZEJ2RXhIVVNXd3FFeGF0aEwrUnNpUTVzbkVLSkhJQjRja01ZR2FKWVZB?=
 =?utf-8?B?ejFJcXJ5UkpuVnYxUC90MDdlNUpucjVyQnlZZ0xwWXlSNmpQOFdJN29Oa2dw?=
 =?utf-8?B?YmttU1lTYjQyOUkvQWdMVzFwRFdHT3NJcVlZTkx5L1FaaGUzazV5T3BuaUVP?=
 =?utf-8?B?d3ovMEZvWlBpTXU4aUhaTXQrcVhBbDV1T2E5Z1Q0UlljVVBwQ1VVczNQTzkw?=
 =?utf-8?B?MlQ3UUNpU1k3WVJXejE2TUVpdzZqZEk4RTcvNDZ4V0VIV0ppVlpqNzZDUVB3?=
 =?utf-8?B?R3Q5ZUVJdDB2K1QvQ2ZzVVlPVVFmNGdja3A3RmZIenZla0tpV2R6b244U1RS?=
 =?utf-8?B?RExmTUVXdzExTS93R0RxUy9RbjVRdmg3V1dHclduMC9qQm5rc2R1UXRMZ0VI?=
 =?utf-8?B?S3R2TFZRcjBaL0lvcExWTHo0WkZ5VFI4aVNQbjdVOGxRK3dseHEzOWtsWnd2?=
 =?utf-8?B?bk84eHdrcGRpTnRtRHJha2VoUHc5WFoxRlJhTWRjVDFVSzlualM2L0xvUXRo?=
 =?utf-8?B?TlFWb0ZzSEpPWXhVeGd3NFVBNkZlVmJ1K053UzNuT0NOVE0vMllraGFwQmM5?=
 =?utf-8?B?SndWN1hVVHVMVzN6NStXSHpXb1R6VjM5ci9PbGVaaS9tS3BZb2YxN1dIWEVy?=
 =?utf-8?B?YmdnbTdtcVEyMG15WS90QmJMUkNpZzVQNmZzSjJ1MDVvUU9qQW94VVc2YUZi?=
 =?utf-8?B?aHlDQkNNRmhkMTNBQTBHb2l3UlpGZ1BBMHpJTWtsN3VLekw4K1BtRlVmVVdx?=
 =?utf-8?B?Q05kK2JYaUZtcU52K3M0d2JHbjhFYU1LdXZwSENDZ3FIS2lSQjd3ZnlJYm9m?=
 =?utf-8?B?ZURmaW85VHVZdkQwdFRjaXFHZWVQeFpGWi9HL3NSNTRKTDJWTGFsdjJkR1Vu?=
 =?utf-8?B?bjlZeWp5RFQ1VnFLNk90SVZHMkorTE5COXRuVnQ5MjNIK0RKc3pQVmNnZENJ?=
 =?utf-8?B?c2VZRkNKVHFTYnBMMlBPdGppUnY0NHR0Y2plamNzNmM3TlJPcHorbmlmbGY4?=
 =?utf-8?B?cDU5TUxsbG9qcDJqRjJ4aU5ETUZQb0hlT2djRFRoSWthUVJFU3NNT2RrbFRQ?=
 =?utf-8?B?QmdPaWlzakFQa3NHeHpzZnZ6QW5wRS9DOVhPL3RsNUIxK1hYbFNzL2RYQnVE?=
 =?utf-8?B?eWFCaEQ1ZjNXbkEwTnBWd25GUGlFSWtjRFl1SG56VUZTTkw5YmNzWU1GalFz?=
 =?utf-8?B?MHBXU3YrQlFyd04yUlVqbFpxRVpWUWhZZHpDb21rWUlpL3JHQXdUbDcvTHFs?=
 =?utf-8?B?OG8vb1JyM1FDTUM5RWJmL3lMdktIcFlNS1ZtZzRPUlpPTVplRjNRbC82L0h4?=
 =?utf-8?B?OGRFbFJlUWlTeVVKUkgvbzNJcFRuU0Jkby93NkszV2JSaWphUHNhSWpGdHpq?=
 =?utf-8?B?bFVvWW5OdTJURk0wamNqajhkNkF1dkcwNDZOYlNxM09KQkF6ckdlQlMxL1Jy?=
 =?utf-8?B?YlhSSkd3dktMWHNuY3hLenZwNFZaZGVKK051VW9laEh3d1pzZ2FxeG1UcWxK?=
 =?utf-8?B?MlRDMVVtNThCWW1uY2p0TDNSbjJzbUtMMndEZlNRYmdiRGZoWitXYmUydmVl?=
 =?utf-8?B?cVFyZ0d5VzY2Nkx1a2dBWmErSlhham14OUhORGtyNmFTbkFkK2NIN0JIajVL?=
 =?utf-8?B?VmcwVkRVODJ0VFB4RTFIUCtsaWtvdmVQcjQ0Tm9uZk9OcnNDaWVnR3pBWDJG?=
 =?utf-8?B?SVMxc2NTVG9jR2V4aVRZdTBkVmRqSGlRcnJuNmF5YjZORWx4WGh6WG5HZU80?=
 =?utf-8?B?UjdkeXBtNXVWK1JSbWdQM1ZXV0NTSHcvRlE0d0VYY3lBN2txUEo4VG9YbEo4?=
 =?utf-8?B?UEhyWmprcTVqNXMwNUo5Y2NCUjRPUTB6ckdxcERXRGJrM0k3YlRDazZFTXpm?=
 =?utf-8?B?ZXVROW5mRCtvS3ZMN2tXU0Z3eTRuRUs5KzMwUGFMdDFlcmNsMVNvd0VxbnBG?=
 =?utf-8?B?MXF6WUl2K0YrS2QzNmFEbnA2bDZSMi8vR2U1T09kajBSWUc0b0xoeFlRaXNp?=
 =?utf-8?B?aFF4bnNZZDhIUDByZkZycndlY1czZzd2cUlYTkhTWmZYTnBlRE9Id0k4Q2pQ?=
 =?utf-8?B?dzgyRFFGMU9jQVFlSHNRNUdGclloOE94V05TNGE0Z1BDMDdpNjJqTk9jRXdS?=
 =?utf-8?B?dWZpR0JQZDBlc1cwejZ5T0dOQ3gyZEVOQUVNbnB5ZllmUzlSbHRaUCtYYWJY?=
 =?utf-8?B?MVRsL0laeUErcVEzSGdUQnl2NU5tSXRQem9LMGJwZVI5a3VEaHN4VjFRYytI?=
 =?utf-8?B?SHpoM2s1WVZLbDhHV3ZLWUlnQUhLWHBRUkoyUnVRN3pRMjdSS3YvakljMUlt?=
 =?utf-8?B?SEZsdWxLN0o2V1JMZGJGR2p4QnJKbm1VSXhNZnNuMXlUQjVlZjAvSnJ3TWZH?=
 =?utf-8?Q?RyZP+0tHiWfYYjzu0Tf0JdZJiw5NW/P/ze5sSL4gwfBww?=
X-MS-Exchange-AntiSpam-MessageData-1: DO+r0+uZmW1Xe9RYRBSk1SQlWMRSWzzvJfY=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a69dbff8-d2bc-40cb-bf24-08df037f1e47
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:34:21.8415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNMVLa7/+FGschxLH4FtBrjcz/GNc0A/tklrmmy7TYbHO6n6yi9YBkH/an/XKqMLP5OD6qpbDs7CZXv3PN8bC+cI7vZCD6irLPpRC7vKHvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9631
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 14:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10367



On 8/26/26 3:09 PM, Antonin Godard wrote:
> Hi,
> 
> On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Trevor,
>>
>> On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:
>>> Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
>>> what they are instead of rendering as plain literal blocks. This tags
>>> the ones in yocto-docs.
>>>
>>> One patch per manual, which is also roughly one reviewable unit per
>>> patch. No prose changes, no reflowing, no reindenting - every hunk turns
>>> a literal-block introducer into a code-block directive and nothing else.
>>>
>>> Which blocks were converted was decided by reading, not by pattern
>>
>> "by reading" following a paragraph definitely not written by you and
>> with all commits being AI-Generated is quite the stretch ;)
>>
>> [...]
>>
>>> Depends on
>>> ----------
>>>
>>> "docs: state the language of nine literal blocks explicitly", sent
>>
>> Link to the ML please to make maintainers and reviewers job easier.
>>
>> [...]
>>
>> I think this is going the wrong direction. We should actually make
>> explicit the language of every :: that is NOT to be understood as
>> BitBake code and then make the default highlight language be BitBake.
> 
> But then this might get forgotten? How about having the default highlighted as
> "none", and make _everything_ use explicit code-blocks?
> 

"""
The direct benefit is the ability to still backport whatever needs to be 
backported without having to care about the highlight language being 
explicitly bitbake (which won't be available in every branch but master).
"""

*exactly* the sentence after what you quoted.

It's bound to happen someone will want to backport a patch with

.. code-block:: bitbake

Either we'll forget during review and it'll break the docs build, or we 
need to adapt each and every patch/commit for stable branches.

I'm usually the one trying to add friction to processes, but I don't 
think the above is a good idea.

I'm trying to avoid having code-blocks set to use the bitbake lexer so 
we can easily backport without having to care.

> Sure, this is more efforts and review time, but also this is how other markup
> languages work - like markdown, where by default (when using ```...```) no
> syntax highlighting is done.
> > This is maybe a more conservative approach but at least it doesn't 
leave room
> for code blocks mistakenly highlighted with the bitbake lexer.
> 

It's currently mistakenly highlighted in Python if it looks like Python 
to pygments (the default).

It's the Yocto/Bitbake documentation, I'm assuming the overwhelming 
majority of code-blocks should be BitBake code.

If you really want to require explicit lexers, then set

highlight_language = "please_specify_the_highlight_language_for_this_block"

in conf.py and then everybody will have to set one.

Again, if you explicitly use the bitbake lexer in master, you won't be 
able to backport those patches to stable branches easily. Or you'll need 
your users to update their build environments to use the new release of 
pygments. Or maybe you want to write a custom bitbake lexer for stable 
branches that is an alias to the "default" (the default value of 
highlight_language) lexer, but only have it if the version of pygments 
doesn't contain a bitbake lexer already.

Cheers,
Quentin


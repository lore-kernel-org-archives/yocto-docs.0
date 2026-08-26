Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BFAC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 14:45:49 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14283.1787755541041288578
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 07:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ld0FdZ9y;
 spf=pass (domain: cherry.de, ip: 52.101.69.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itumw03lr24f+Spp9GA4mw2oSRuIIQXIpy2gj64mCCMdgG4syYOTQ4YgAoXJwCWn8jNLcMLeVeOcigGPhIe71A97EBuq083ikDUMH18NSNyljRSOBulr700kXg1Z/n5j//CcsuCdgVielvbAvpYbhinnHqEBjMOEK5CkJ5U9V6yxxjRwSFWIsAUJb0SFBKjN8s94gCzokNOFUBAoEcSDWVbyk476dtLMe/GwjQ70ItmsBfptpH8rjED5YkO6a76oYf6C+LKp7yhkHEgqHrWXMfGmmDaN2bioqLj4joN5UNEFLIhwOAJsMQ3a6whBZGlcCTsL2mHukMqsqneVXKNYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9M8+DAF/Bm0EKrV/yJCMH+zO+HddUC6zMAepPCV6g8=;
 b=ExRH1I2cmDyrL2ch65n+8xnye7tyymPuGK3UMf4jkIg9wQWyyA1BiUIH4rFLfKlAlPGUEyJhDzN0kJb5N9zXchWTTTC0Mp7e2LcA4U6ykxjFbbukzJ4I+/lcPs/FCFeUey95Tx4vvuOm4+kXo35T20X/krgD6jdapPrTT9JbdxFOmrctAki+sA5TnkdyS1Ey4UH0Eu73Y/Z03SjcsNfcMcKrlybCpDc+3h6OzQshpesY3+rKrKUwYjoPH/KhssNlWs2/pAOOf6SZkj4nt8WBxQlZP9WxWfWgvHH2KZwvYLkyX+ECHevWjzwS7RDuN6sahLLnZJUt4xO+6DYwHBc5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9M8+DAF/Bm0EKrV/yJCMH+zO+HddUC6zMAepPCV6g8=;
 b=ld0FdZ9yUve/Dkn62nw69fOtt/8i2MEjjTuLWyl1vRPyVFUf6sK74iO6pyeQr2SMvwOwggHRyXw49bhtQG4Ns9tcdIABPJl56/ry45d4/3VokHkn6e0W1AN2iZgat+1PPxQrabhobbWt7fX+EmCLKLWlcO2Cozej/bA3au6PvqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS5PR04MB9944.eurprd04.prod.outlook.com (2603:10a6:20b:682::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 14:45:35 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 14:45:35 +0000
Message-ID: <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
Date: Wed, 26 Aug 2026 16:45:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: twoerner@gmail.com, Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ao7pU4NN4uuZDzS1@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0090.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35b::12) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS5PR04MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b9bc0f-bd7f-45c2-4b23-08df0380afda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	p3H9nHp797poM53Jm92eebVlUPfI0vfux3K/obX0iuhxQpLvUr2uiWoq3oyvxB1c5Kh4TnePko2hi3xPGf8uVV+TtOLbzM0YKRYedAJBWCy/x2Q7IkkpOZmzmot+baS7+2Qq+rvNYOsX7Mf9DxzdiiPU0QwDqagrDYme9hPLg3S/0cIkLqTuEtgBrRMbkhg0rbUxqfg7ekZuxX2eOwo2p4UA3uImR5kRL9dEx+OTycqkG66qdEKQ79Ia1IXPs6u3IbyVjiYjVeNXyEHn1s3v9BCUoT/utX5QBQ3yE0K/AK5xqYorCJH+lgkJfAA7PlCLFQ+ZFAMcFuro+6CTJLjZLK9DP4qL7EJl0n9bFatVD0qbhfPC9IDZZhw3GYICp6lBTI5iPWi0NCsdw7DlOrrV/PXhY4A29UDFDnlO3ns/KeWLFxuzAQo02P1MG9DXTBjCby203KCbS7YmXhVeBxr9cuIr+mBj/o5i5yEhd8ScowhWxmmOd8cvy3Z72qzumoAhBBxh6p3bYB85/j2b4KqOIV6yawgmLaH47etPs+RpMk6BFK955SEMpU8gyjNdyMTHv06J6w7qtACrEwS/VuxLryx8jo/CUlc4Am0gCCV3/InpyisJXSmwcNMMoh5iFE6h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3pWZUQ4b3BnWkxpYzZzSXpVYkZwMmRNZkwzYlhaVExBMnRwT09EVnFXZktD?=
 =?utf-8?B?aHhjVHhHVmdzczhDTUVuWGlMMWtDNlpENkdrSjFFOFNhR3p5d1BFRXpQa2lR?=
 =?utf-8?B?UDliWmVSNitpbkZmMzIvekhzWGpnT25uZ1NQM0FBZ2RIVE1idFFiWVRVL1Zt?=
 =?utf-8?B?bW1JZk0ra3lyQTNVL1BlMlQyeUpUdGw0RU0wWWoxaWZlZDlyYkQxVWZ6SGNE?=
 =?utf-8?B?TXBIMEo4S0lHN29XQkp6V1pSdytBL21yeVU0bzB3MnhtcVoyQnYwMlM2MjYz?=
 =?utf-8?B?RjlxbXJIUE9Zd1ArTnlXaWlsejhwUzNWVEdYMmpsNCtSdHE5a3g3KzBPOUx5?=
 =?utf-8?B?V1JJamJXT05KL1kxUDJ3YmR6TVBZOVhxL1N1ODF0V0NyVXRUSFhZU08weUVm?=
 =?utf-8?B?SXdQaGR2d1lSSGdQeUZyT1RSd2RZUHErYzFKRVZraFhpRmNUNGZ4M25UU3Zh?=
 =?utf-8?B?UGJvUGs2WERqdm44MWEyOGtUN1ZZZm85SEE5S3NxT3BzTmk0Yi9EaUFlbXdG?=
 =?utf-8?B?cTBQeTBKQzhrNGREMFJ5dDEvTS9ESUd4UjhGRmR2Vk9Ua3UzWjUyaGhjWnh3?=
 =?utf-8?B?QlVtd2xxMWt1T1dtQlY4VjZYN3o1Y0JJQWpaVThUSUVFc0NQNm50U0UzTnll?=
 =?utf-8?B?K09DVzUzZ3h4WldrK3NrM0R4alJ6blAybWFheG5OMFh3aHVvRnlTaDQwN1kz?=
 =?utf-8?B?UHF4Mm80TCtQQWFhUHgvVFRSZDNYL1hNRUtNWURONkhLdW5NZ0YzZk9RUUtX?=
 =?utf-8?B?Z2hKQldtQ0ZuUW15RWhwdG9WbHhrOTVmWS9zRHRySldXcnhaRnZUaGhDdmpO?=
 =?utf-8?B?bk81aFZzQ2FaOEVRY0hrcWF0ZFQwSTdNc2hkOW44a0dMMWErSnRudnRvRUxl?=
 =?utf-8?B?UlpBeEhRZENIMkJYVkNlQm5QV0h1ZWNGcmdLQ0VXb1lPcWVUVHRUSkg2d09I?=
 =?utf-8?B?akt6RFFlOEJlck5SdjdSd0tqNHdwZzZoblFlTDBySlhWUk56eUhIT2pZWEdR?=
 =?utf-8?B?ZWlwVHpXZGNwOE1KQTdHL0ZZcW9NcWxxWkZDakMrVFB3ek5xQXUxeWpEVW85?=
 =?utf-8?B?dnVwS1JlUEh6amFtSGpFTmNjbG1PT1U3dnV5MDBSNmlSSXUwcC94eUZ3NXJS?=
 =?utf-8?B?bmxDMjFNUnMxNWppa2NWQ2FTWHZVSng5c055NE92czNrekloQllyN1FqVGc3?=
 =?utf-8?B?bWxKTUJVRkJUVUc2WllsRWpNQWhHcnhWUUJaOG9XWFRwbE9TTGNYYWpVYlMx?=
 =?utf-8?B?MXJjS3VBdUV6Q0l2Z2R2L1I1VStVejlwbVoyblQwOUdnZ2VBL1g2d0krdGo4?=
 =?utf-8?B?elFadVRPMWU2VVdQazdzcTBWeXhDVlJWWC9QUEhDNXVhQ0VWZ0s1d2g0OHFS?=
 =?utf-8?B?M0xKM2V1ejBhMTFtVDliOHhkbUZ2LzlPOG1yMnBJZFJzUUVYUnM3dXhMSnVi?=
 =?utf-8?B?dFpiN3RsdklYdTY3N0k1WlZDR3ZWL3ZYakdEZm9oNlRVMVR1RkZNNHRrYmhG?=
 =?utf-8?B?NmxPNllBZEVJMlJmRjZLQndJK2ZPRkg4MHBZVm80SVh3VjdaYkM3RW1Hcnkw?=
 =?utf-8?B?R1pSSXhDaXQyak4zVnErd3ZzRzNYUGpVdjFlOHoyYlVDb2IrbUFCclQxbi9w?=
 =?utf-8?B?eW53eXlBa2dKL1NraGhjcG9jVmtSRXRWUUY0TjRuVzJMYis1Uy8ycVUwcVNu?=
 =?utf-8?B?MzFNTnVJYTdsdFJtemFYSE1QdDNqK2ZOblpFc1VieEhrUzVKOW9zcXF6Ym55?=
 =?utf-8?B?U2dyV3BQa0w5MksxMjNTNXUxcWFVYVJmN3ZFdzBnNUkrakhWT1pqb1hIUFZ1?=
 =?utf-8?B?ZkxpVE1IQ3k3NGJhcXVWdXNtZmdZM3lZYjV6YWhZSml5azlQRjR4WEd0c2VX?=
 =?utf-8?B?ZXNQRTRVUkowQXl6eVVGdEVVdDRJOFFiWWFEYVJ1NHBWbUx0QjQvSmJUQnRB?=
 =?utf-8?B?eTB6WHRNNWJxL1FXbnVtMzZ3dG5IZ0l4eGJyS2VjSE1MUG9EeTNOQ0pSbS8x?=
 =?utf-8?B?N0h3SVp2RjFkV3RoYVVRU24wdm1NOXhBdXFJWnNmMnBoVUVZNFM2UGp3eWVG?=
 =?utf-8?B?YXpFbG80YkYrMkd3Q2Nvd2tHM0pvMjhLcEZLR1l1dkEzRzJUZURaQ0hmM3FU?=
 =?utf-8?B?ejNLdnE3bENEaWRDaGU3Q0dLRFdnMzdZelpVcXVPcndjWjJMa1I0dGhPTXFo?=
 =?utf-8?B?blIvK0UzU3dCMFAzL3RVYkFDL2VzMlkweHp0QXFVdWlSelIrcHp1SWMzV25D?=
 =?utf-8?B?UkowdUM0NWhDMWw2ZXZnczJUUmxXQjY1MnNxbkNhWnhMODVGOHBzRXMyZ3pq?=
 =?utf-8?B?NGNrays0cGFGS2tpQnZNTCtObERhZFd4QkRnVVJIcXRITUdpbkREZGY1K3d0?=
 =?utf-8?Q?TqUdIcSgLh2cv3+hctiTK/z/iKGfzNUZou2i5S46/nRpu?=
X-MS-Exchange-AntiSpam-MessageData-1: uhd1QWGtdUA3RlZfSX802pwYG7KxnUMk0OU=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b9bc0f-bd7f-45c2-4b23-08df0380afda
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:45:35.2945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuVPbANia/8Ny+H1K3IT3taosuudFDFUtNf3LnHfX5SM4rgDQXj43VxqiindZJPPLen8q4gIkTOnRTbcui3GdKfytq+a2SlsaT0uw1NJ0i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9944
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 14:45:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10368



On 8/26/26 3:25 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> On Wed 2026-08-26 @ 03:09:23 PM, Antonin Godard wrote:
>> Hi,
>>
>> On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>> Hi Trevor,
>>>
>>> On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:[...]>>>
>>> [...]
>>>
>>>> Depends on
>>>> ----------
>>>>
>>>> "docs: state the language of nine literal blocks explicitly", sent
>>>
>>> Link to the ML please to make maintainers and reviewers job easier.
>>>
>>> [...]
>>>
>>> I think this is going the wrong direction. We should actually make
>>> explicit the language of every :: that is NOT to be understood as
>>> BitBake code and then make the default highlight language be BitBake.
>>
>> But then this might get forgotten? How about having the default highlighted as
>> "none", and make _everything_ use explicit code-blocks?
>>
>> Sure, this is more efforts and review time, but also this is how other markup
>> languages work - like markdown, where by default (when using ```...```) no
>> syntax highlighting is done.
>>
>> This is maybe a more conservative approach but at least it doesn't leave room
>> for code blocks mistakenly highlighted with the bitbake lexer.
> 
> Yes, I agree too.  Personally I'm not fond of "hidden defaults".
> 

There's already one.

> By default a non-specified block will cause pygments to guess. So if I'm

Sphinx explicitly states that Python will be tried and if there are 
highlights warnings, none will be used. c.f. 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#showing-code-examples

> looking at a lot of reST and seeing no tags, I'm going to assume the
> authors have left pygments to guess. I would have to go looking in other
> places to see if there's a default in place for non-specified code-block
> tags, which I'm probably not going to think of doing, which will
> sometimes probably cause more confusion before it becomes clear.
> 

This is the Yocto/BitBake docs, we're documenting that project, which 
uses BitBake syntax. Would you want to write

.. code-block:: rust

for every code-block in the Rust documentation?

> Maybe it's just me, but I prefer to see every example block using an
> explicit code-block tag and specifying a language. That way the author's
> intentions are unambiguous, and we have an expected output.
> 

You won't be able to backport patches with

.. code-block:: bitbake

which is what I would like to avoid. But I'm not the one sending patches 
to the stable branches nor the maintainer(s) handling stable, so maybe I 
shouldn't care.

> That's what I've enforced for our reST at work, and I've also
> differentiated between "bash" (for actual shell programs) versus
> "console" (for interactive work at a shell prompt, a shell most likely
> to be bash).
> 

We differentiate console and shell in these docs here too. If you're 
seeing one that is using the wrong lexer, please fix it.

Cheers,
Quentin


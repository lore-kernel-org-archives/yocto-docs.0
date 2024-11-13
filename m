Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5170AD41C22
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 09:22:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.web10.8011.1731489760756888711
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 01:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fZ5AibrH;
 spf=pass (domain: cherry.de, ip: 52.101.69.27, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+3CNm2yF/cyC/hzYRA7pk1gjDePdNHQr70now44Zilt1T1nA3gWkiZNUCafZI4ZDSbomfh6ECLydtlpCq/xXLNZlYyL7LYapnAQ/JAs+o8715JXXAn/OS2qCT2XmskMhpljiiNitEWsCuW2e3/WSE3yAxronnN+MM0i8HtNoR/nrc99tEGYgKuYtxpNxYZ1w/ZuuRNLRigEwdydHoOX91oQ+6ahLDSBKyIAg64f9use/kbKfforHXm+i/5A7SMzhlNKWq/Gh2/fME3OYerIBWHq1+KtfWsuBJdhqVZOeYk13VaY6P5XxjQK7aMDqjxAi5e0uY9zW79/IOLN6Zo95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXSPOYPPWKabE2NLeXeB9fdW2q2xFcekOOKlf/ytLCU=;
 b=dRRCXMvnjSzIHwE4hqRs2Nk5bg+WVpJh7Jh6v7JH1M6Z80XJT7Dh7atDr5H0m4FcFxRB01j8ypi8dHlYEhBfE5ig0bezVVExepZ4PCHG4hbhjp9d3ucSsEAGgr8mpPeRqkeoNNIHz1BVIfqQJvFJEi9zh7IVlNo1ueNNPhdIX84dNCEIgUu+DwGulxnw3lPagfbHmzXqT3+pi+yLfDFNLaPw3+xu3v7hLxXloq+Vckwp2B8fN9vXVdC0dHVktDqwSrZWNYgfRhqmtlm60QlghmijnDxkuFfjifi5oG+mm+fNlPJj0KHAyaX0LX0vUTWdP16ACYzy+JkuPX/ppOp+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXSPOYPPWKabE2NLeXeB9fdW2q2xFcekOOKlf/ytLCU=;
 b=fZ5AibrHYyrtHI39lcjuGyC7dNdqiy0NIvqrgD8L7dB/VPbfYMzyOK2aS3an5IJDvgSqyUIyVrArr9SofgltQbttdJncicoanmxokstz4R7atvhw783lBN6r50SpJd/arSNHlOhbXNG3pBtH9tGONsLiSDd5bmsEDtjg3SbWVBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8704.eurprd04.prod.outlook.com (2603:10a6:102:21f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 09:22:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 09:22:36 +0000
Message-ID: <261f85b3-e045-4d2f-8771-dc400b893843@cherry.de>
Date: Wed, 13 Nov 2024 10:22:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] migration-guides: add placeholder files
 next release
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112-release-note-5-2-placeholders-v1-1-a15b66eae472@bootlin.com>
 <7dbc6473-1bca-4bc2-b998-f924fc580137@cherry.de>
 <D5KWT4QLUYI6.1YPGOC8KJJRDR@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5KWT4QLUYI6.1YPGOC8KJJRDR@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b293a4-3a4a-4923-104c-08dd03c4b635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bDZZcG1NZm1aVnVheU91SGxReVNrSy9neU1zR3VkaXFoQ1c3TWs1SlJQNkNy?=
 =?utf-8?B?Tnl1eitERnl1RFRVM1lDQ05kSjlPQnZVcjBJcTRtOHZFa1VGaXF6WmdxalVV?=
 =?utf-8?B?RWxQWkxnekJlbUZKbnJjWnFiaFd4YTFWUlhIbnZWcEFOaHQxa1BOQzJmSnFI?=
 =?utf-8?B?eUVXR3JSMjVzN2k2M3QyNTZLZkRQdFJwZTBZZStFeFk3ZGpZY09GSDVTYUN0?=
 =?utf-8?B?WjEvcDF2bUpkSU9UaHlMTVJHOVY5RS9HbFQwZFlpeTJhblFENUNKM25aNFBK?=
 =?utf-8?B?OHg4czRCKytBQ0hyS09maHZKM1ZqeGR5MHRZRFVpbGdTY21qY01XZ1Z0STBs?=
 =?utf-8?B?OHpyZ0pBMVRhdWk3REZkelRGUHpsNXZSeEVBQ3NmVHA0MjdVZlJ6d3BQbHdY?=
 =?utf-8?B?QmU5MXhzWFAvUnZyaEdrZEpNQklFWS82ZVNrZFowTmZzckt6Y09meC80MjFR?=
 =?utf-8?B?ZGdNSGJGRWt6d0lHT016bGdBMk5NeUc2SEw5c2NHdXRvczR2NDhTQkN6REQz?=
 =?utf-8?B?UmJtTzI2ZXdwSFBtaVZmaTlheC9zb1lqMlZlMmhSeSsyWDhIMW1vRWJTdkFO?=
 =?utf-8?B?cVB4aVhqSFdOUEFmZmt3U2tmTy80T0Fwd3dtVlAvY1dmVDVyM3dsRDdiSUw1?=
 =?utf-8?B?WFJhQUpCc0R3YXhrMXgvK0U0ZEwvUnhVZ2lEYmpVSnA1cWxvRXlRdElJQ2Np?=
 =?utf-8?B?SXZNODVHcThlWVFWQllrR0sxRk9WaXJQWW5tR0haRXBXUGVWaG8rNlNXSXV2?=
 =?utf-8?B?TUtNWHhiMWNGcEV3UUYweTZ1WTZEd252YXpCVEQ2cWtzaXRBTENEcHljMjVO?=
 =?utf-8?B?Z0pzR3V5dVNlemVXVVU0WGd5RHFQdG9ocXdlK0c0R1U4NHdsc3hHV1pDSzg2?=
 =?utf-8?B?MVRkS2ZHZ2kzNURKcDVNK1NCd2JrUkYwNEUyU2dINzdERHY1OG5HS1JpdnVy?=
 =?utf-8?B?UGtxaXpLMEpyLzd0aDlDSjB4WVlmekIySDRkY2RlWGxJK3d2eDAvNWlHYVU2?=
 =?utf-8?B?UnZSQmxJRTZJTnRieHpVVTgyUTB0cm9aSzA3V2dadWdWV0d0U0dYaVA0a3FF?=
 =?utf-8?B?dldrS21ZZmZVdy9KV01JaU5mUS94UWN5RlJhSFg2SG5tUW1BN1JXa3JyRktE?=
 =?utf-8?B?M3FTWWhoalg0b0o5ZHVlYmpEa0d5eHFLME0xc1VlajhnNE9sejVaeU43dE5S?=
 =?utf-8?B?alRmVmZHTkk4UjE4ZnFOOUVBbk1KNXFmVmFKYnBoanU4MWtnMFhMUmRKV3Ny?=
 =?utf-8?B?NGliTFU3SEkyaVY2WHg1NVR1ZURJRVorNU15bUozSTVIdWEyL0ZVb3dObmgx?=
 =?utf-8?B?L3NuOUwzQjVyMUVMZ1FpRW1jWUhWTWtLMlpTMmh5ZjQ5bVRBb3MrQ20zdU5J?=
 =?utf-8?B?M0lnOWZyS0R0QzNaaEdGVlZFVTIzeGI2OGh4MmpzOEdud2FjZlRJeVMvVlRj?=
 =?utf-8?B?SkRMQm14WC9zdjVLelU4QkNsRjJNdlFLWExReS8rQjJmMFB6bE94UEFyRi9x?=
 =?utf-8?B?b3A2WmY2bXFxalNtNHhTdkxWQjBwMy9mc0IzUUo0Mm5HcjF2RjRaMXY3S2dk?=
 =?utf-8?B?cDh4a04yZ1NCVmEySmpIN2djNVNoNlJGRFNneExIQXVEQVZWUURZY1NxWkFw?=
 =?utf-8?B?bm9nRU0zSHB2RG1OQTZTaHQ1eVVRY1NibmlRWnlkUWhWWnFGYndKME1CRC81?=
 =?utf-8?Q?Lky2Jr4jCQtUWNQfxJMr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDJ1MHMzcXJNajZmcmptODFUTVJsYURVYzZSa0cySVAyRWdDVGlaQ1dLWEMx?=
 =?utf-8?B?V0ZsdFRSSTJjRUJOMDdzMjk3RlFzTFV3bmdMNDlQNzBjN3NwVTdHbHlmK0hR?=
 =?utf-8?B?aHRLRFZ1MTJjUzFuTzVZSHdvNnkvYjRadytxbTQ1dHBxSUdXby93UTFYOTFP?=
 =?utf-8?B?ZHU3UnZwZU16SURtTmphNEsxU2tnV2xUMzA1cnlKV0JOdkhsQ0hUalRwaXFo?=
 =?utf-8?B?d3lNS3hDZmJhYlJUSGtDMm1yc2ZYajRtVXErekhXZnVDZ2pYTVlwU2NZUWxq?=
 =?utf-8?B?dHROZklxQnRobTE4enNEeWQ2a0R0cXJpaDhCTVpJR2dxMTBZS3BLZlM1TkFm?=
 =?utf-8?B?L2NyVFpZWngvT3NGTE0vOGlUWE9QSzl2UTc3SldKUktyc0J5SjZxSDgzQXBo?=
 =?utf-8?B?S3EzdUVmYjhWOHA2RmNQWVR2NVFNdm8raVpsNkFmQmlIVVhGTFA0aGppMy9l?=
 =?utf-8?B?MHBOVkJSM1BoMUoxazMyQ2JDTldsdXlVVm5MaGNSc1VGQWNuL09QdllBZ25k?=
 =?utf-8?B?dFFOZU1NWVJDbWFPMWFmS3RadDI4MjExSUhWU0psNHlRbTdjQ2pZSGxCWjdB?=
 =?utf-8?B?bDZiUk9WTW5QdjNXVXNXQTVFYnhhb0lXbi90RzE1YU9BUjkzekFkakVEVjd3?=
 =?utf-8?B?QUQ3Z1hRc2dwR1pjN0d4bWFoV1N2WFhCMU5WdkV1dUd3NkMrdG5UK0w3TjhU?=
 =?utf-8?B?UFJYMmIxYkJUOEg1b1RSRkhKZ00xRW8weTc3bTN5UTNRWU1maGxlQStkWEho?=
 =?utf-8?B?VkhCaXhyWUE1S0tEQ2pHVHU4d2V5NFVUakxxSVBNMnh5V3psY2pMZTQ4aTVj?=
 =?utf-8?B?SjBqWU1BM3RCZ1dNY1lJWm4wQ3RCZzJFNGFGOXJqNUE3d1BZK21zQ0JKSXhr?=
 =?utf-8?B?ejVCNVdlZXdxK21mNE1Kb2dyZmVET01RVTR5cWo2SERjbFZiSUVER09oQ21u?=
 =?utf-8?B?REtZQ0FzbnQzRTNoUEZlL3RvK1Bzblo0RWx5aGRZNzJyNlNQNUJON3o3dEdZ?=
 =?utf-8?B?V1V6Z1BnU3BVaWI4SEd6K3JxTEhmb2Yyeko3am9Eb2RDaWRGU3J5MFlkbDk2?=
 =?utf-8?B?d050aEhCbER3dEIvU1BUMFAyc0RPN0poQzBvSUQ4T3N3WDhuQ1pPdXBHQmNr?=
 =?utf-8?B?b0VQU1BCUGNjSUFSRmdpNWFtd3FuVlFtb3NRdTVCSC95aDBNbXJyTlVpdkZ0?=
 =?utf-8?B?TzU3RFUzQWluclJiaFFobk5Rbm5JUW5PYlYrN3A1aDBsUnFuanh0bzVDRkhr?=
 =?utf-8?B?bkRjcEJmU2pxQzhrcHEybUlYeGg0cVBRckwyUUREdEdHMVdRM1ZOU2QyY3NQ?=
 =?utf-8?B?Rk80VmdISlhiV1NMdkgyazBua2FOVXhucFRXRUxUWE8zNG1lZFE5bzJZWkVp?=
 =?utf-8?B?T0hhMit0U2orOFV1dWNWSVN2SU1hRGw2R21oOFVXU3RjTW9GWVEzZkpLL0Fy?=
 =?utf-8?B?ajZnVURWYTJxcXB5Tm4xdEFGT3d3VXIxQUF3VkJJUUxHYXB2NG5SeTRodVY3?=
 =?utf-8?B?RXNrNGFLT0FWZko3S2hZM1UvcWVyZkxuRTYxN0xvbk9mUGlWbi91UHZPR0RP?=
 =?utf-8?B?NzBaWTExOEV0Q0NlOHIrQU0wM2tNLzhickh5ZHZRamE4UzRmbGtnUVd1V2xB?=
 =?utf-8?B?Qnk2QURNUE1vTEllRWtKbENRczJnL281TjJiNlllQXNYY0RQdVVEaWVyZG1I?=
 =?utf-8?B?dkxQWG9MWlVpdG5KVmJyY0JBT1JveDNYQ25QbXE2L2Uzc05Zc0NHTXFreGV5?=
 =?utf-8?B?K0ljTVZXMEo4UWw5bUpMQ2o0dUF0UzV4cERQb2J5NXBIZGFaRzVIRVl3cFlv?=
 =?utf-8?B?emVyMFZ5M2NXUDZ3RkZvV1RhSk5nM0QwcmhFU1dadm9UMlhkRWpYdlpyeEpG?=
 =?utf-8?B?cnZlRDM3MmZ2a1gyeC9aeVlxNlZaK1JQZjRXOEJNbHZPYU5rcXNYU29HYzJ4?=
 =?utf-8?B?Q3Q5MTc1clJmcXJzN3k3ditnLzdsdXJEeFRSdERsSDlIUkNwZ0hQUHRiRVk2?=
 =?utf-8?B?K1lZd3FUUFBiaThTbmY5VHkzdjhIM3V4WHBGVVlpTXhrQS84RWpVMWpLbEVt?=
 =?utf-8?B?cWYrdXFOUTRnUWZtTnhqdjFJMnZENzlDcEZCK0tQU1lobDA0Yk8wZysxQ2lr?=
 =?utf-8?B?VDVTNllOUnBDZTNrSUJqakM2ZUNZM3hoTHZLYld2U0psNW1JZjlFTlpLaDdn?=
 =?utf-8?Q?sDMszaWzYd2GFrn9p9V2GnE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b293a4-3a4a-4923-104c-08dd03c4b635
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 09:22:36.4315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdB3qwczNnTveDke2h5jsbPp4R92APshlC33itxM3iKid/a0febsaxe/thjNkgiOiycIcEd6p4uMGJDcofG1lIbyTOvUOIN1Wm3BhR73pm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8704
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 09:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5723

Hi Antonin,

On 11/13/24 9:31 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Nov 12, 2024 at 6:15 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
> [...]
>>> +Migration notes for 5.2 (walnascar)
>>> +-----------------------------------
>>> +
>>> +This section provides migration information for moving to the Yocto
>>> +Project 5.2 Release (codename "walnascar") from the prior release.
>>> +
>>
>> thought: By updating set_versions.py to include a DISTRO_NAME_MINUS_ONE
>> in poky.yaml, we could replace "from the prior release" with the name of
>> the release.
>>
>> Nothing for this patch though :)
> 
> But this would only be valid while Walnascar is the current, after that if
> DISTRO_NAME_MINUS_ONE gets updated to Walnascar, this document would get the
> wrong values, right?
> 

That's correct, I had forgotten we generate all migration notes from the 
latest release, so using DISTRO_NAME_MINUS_ONE would make all migration 
notes point to the minus one of the latest release, not good.

>>> diff --git a/documentation/migration-guides/release-5.2.rst b/documentation/migration-guides/release-5.2.rst
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d22ec4fb4dc2bf96ea
>>> --- /dev/null
>>> +++ b/documentation/migration-guides/release-5.2.rst
>>> @@ -0,0 +1,9 @@
>>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>>> +
>>> +Release 5.2 (walnascar)
>>> +=======================
>>> +
>>> +.. toctree::
>>> +
>>> +   migration-5.2
>>> +   release-notes-5.2
>>
>> If this file is always the same, we can make set_versions.py or
>> something similar generate it.
> 
> It evolves when minor updates are published (5.0.1, 5.0.2, etc.), so we would
> need to count the number of releases based on existing tags for a branch. We
> would also need to exclude some of those for older releases (for instance the
> kirkstone branch does not contain release-5.1.rst).
> 
> I'm not sure that the complexity is worth it?
> 

We already autogenerate releases.rst which does list all major and minor 
releases based on existing tags.

We know from which tag(s) we started to have release-notes and migration 
files.

We could stop the generation of those files depending on the current tag 
we're building for, to prevent trying to include files that don't exist 
in older releases.

We could also do the same trick we do for Supported Release Manuals and 
Outdated Release Manuals and just link to the newer 
docs.yoctoproject.org/X.Y.Z/migration-guides/release-X.Y.html

Just ideas though :)

Cheers,
Quentin


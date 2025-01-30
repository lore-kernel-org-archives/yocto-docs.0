Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28800C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:05:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.62])
 by mx.groups.io with SMTP id smtpd.web11.18904.1738253147155259531
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 08:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WYG/XyDE;
 spf=pass (domain: cherry.de, ip: 52.101.70.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEIQoOmP/OY8GfjNB67GnspzItWGkcLjBIqPv+tarad158AzWzzq4pC37pEIGuOU0og2Jaa+5v8LKFjMrfz44lzOZBSg7MhnGXzhuYUmNsxn7HgthlVdABWBUy5YbnBpA8ozco16a1RXsUv802WgR+eeAh7PCuhJxaDNnmw5kBnatTeF4ReoA5ztFlXk6OCozvK0VYDNxqJmudiNfc/8PGeNWCCwynJZT4YTVcoVOUqp5KaAnRMvsyUwUUPDSx+Td7iFr9Jv42HSYr+TnpWJNGh/PPncuckSAXgmI4uaE2Hu3Hmhy3h1BUvGxz9eUPFCtRSavYv1/M2CLWIsgD6QRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHqhX8OFzm2Ribg7wP3G0E2C81MjMTFDyNnHmjevx6o=;
 b=DH19LF4Hbyh+atuJEkRB9qpDwrBYwJQF2xMLUNDkzNIaYXmAKlHevMXsizPdnodj71HT6wXcZWelED/Nqs3QEpVdFtWMuOgGYhwo78XGi+rWP+tIVpfzSlaCz1+SaDJVDsI8/QQUd1YqjXKb5yQQ4rmh0FYr4Hi5NseamXsOYt9sCgi/0mVGAx3EuYD98buLetu3qtv658361xSkDPKlN48MJo2wRgGjpI5iZmdP0pOmvrSzu6zpZIbIVjwXUyeehoiyv7vDj6JyQeArG32TZvlkmv5Zo2tm7FRt8ImWW6GqV5iUqKsen+SFdVAMhOGxSCfPReXEeIepk+bZeoar8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHqhX8OFzm2Ribg7wP3G0E2C81MjMTFDyNnHmjevx6o=;
 b=WYG/XyDEhpZFngu/8Umy4r0wYgtkj0TwY6V/CNEZABZl78HcHpxl8VUgBR+bkrKqPh60/aUFgDW4b9dTMmR5EGEo1Vnew4QgAN482WhgINlb9neQqNLoC9bFHcXzL+xrSwr+gjfjI6clGdnL41eS7g+8Kp87/jyzLzaCcKIUPP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB8035.eurprd04.prod.outlook.com (2603:10a6:20b:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 16:05:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:05:43 +0000
Message-ID: <e7ba99fe-b117-47b8-a298-29e88f240504@cherry.de>
Date: Thu, 30 Jan 2025 17:05:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH] migration-5.2: Add entries for virtual
 provider and multiconfig changes
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: b9463efb-119d-4430-b7d9-08dd4147f349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UTkwRTYwSGFTbFhOaS9JZXk2MnZUenJ6UWE2ZlZFOWFJNHIwejFTeTN1cGpN?=
 =?utf-8?B?UEtCSElMUXNUemErdHdJd2hEQ25EcXA0c21zL3cyYTlScHhZMjY2bVRmZkl5?=
 =?utf-8?B?OC9RdTVXRTZTQjUvRHdTYWtWM1FEbTJscWE5SDIreVdiRzkwbU43L1g5dnhK?=
 =?utf-8?B?SXZqb1l6dXVPL2hmMDR6cHpMRHNQelM1RXQrdTlnckVwd0NQWitaczZYL3dn?=
 =?utf-8?B?ODRJNk56bzB6bWhaYWtZTUJDZC9UdmFsdzlJUXlicmMvSEtTQm5TTXhrc2t2?=
 =?utf-8?B?NFppMzE4RDVDNkJFQ2VHQ1A4WVlaM25pL0FOT3V5R2RkaHNRckpSbGFhbTJs?=
 =?utf-8?B?cTgzVExDMjlvb0IveS8rUjdTbUFUTWcxYWtDak9KU3ZXNHk3cGRVUVU1U0lv?=
 =?utf-8?B?cjhQd1hJZkVrdnJKeXY2QjBjUjZSWnlFZkQvMUkvWm1LVkZVQ0xsU0VVWnlF?=
 =?utf-8?B?UGxzRnQ5SHlQRUtNZFVPNWI4OHhzR2pvMFVBZ0dSZVU2ZSs0Z2J0MXY2U0VJ?=
 =?utf-8?B?Q3FUdi9uSUtsbGNOVG4vSkNhamwrTFducjl3QUN2SUpJMWx0bEtnZllIemNY?=
 =?utf-8?B?ZUh6VnpwQjlPREd0eXB1L1BaelJtektQMWtrVzkrYjRmRnBvYytGNWV2NWhI?=
 =?utf-8?B?ZndIQ2ttemxTOWlWYTNBWi81aHhNTzV5YXArMmNsK2gzV3ljWTBhSjAyOC9P?=
 =?utf-8?B?emhnQ2c1YWNiWE14U2orSllZM0J2a3RIWVM4d2FzUEcxRUJRejZ1MFhmVDhj?=
 =?utf-8?B?VE8wRFI4MXQzQ21zZkFiWDFCUGxlUWRuOFBqR1EyZmVnQnhNNkhTcG9TWG5U?=
 =?utf-8?B?RHRKcDhGZHRuMlVlYi96ai9vT09tRTF2TWIzVzU0NjlTRG1ReCtNemZrUllS?=
 =?utf-8?B?NmZFZkpPRTNub3Z0bXlZWVZyZlgwMVpqak03SXViNXpwa0F5WmsrcDY0M0FP?=
 =?utf-8?B?VVRmT1k0OVBVQkJLOFpEK25DVGdRZ1JIWUlUajZNOU1IOGQ2YStaMGkwQ2wx?=
 =?utf-8?B?bk84TmNkeFRwUWZ6QlZoSlg1cFVDRXR5N1NxMW93SVdQcEZjWElOQUdUdmRN?=
 =?utf-8?B?bmVMMFRmK09meG9qMWw1V1RTMWZ1SmZZczBYa2dhWUhaUTNXcVNYR0l5MUw2?=
 =?utf-8?B?d3RQV3lqdzlMNFJUZXlzTHowOTI4b1AvMGs3VTJoZG5HQnBrSjJCWjhYb0JZ?=
 =?utf-8?B?bnpRNnFDMXpDMm5MaUppMXhjWHdpMTRIZHpaV1RkVmtMYktSWGdYWEVtdi9x?=
 =?utf-8?B?RnpiMHFsS2oyQVA1aWlQTno2UjZpeWhnbGtOUXluUU9Ldjh5aG1mY1hkRHBn?=
 =?utf-8?B?dHpuRTNHOUVqMGM1MUdJZEJHTnczS1U0OHZJangvQURoaFp3Vk95b0podktM?=
 =?utf-8?B?YjJ2bkxtUFIvQ2h5dWJpWXh6Tk1sOUVpWTZqWU1XeW9mMC9rdnVmcUxlekwy?=
 =?utf-8?B?ZDgrS3VKcXdrUS85WDdZUVNZdG14NmpmclZRZlhqWEg0ellKVWxCaGpVYjhG?=
 =?utf-8?B?OG1lWWJCa29lY1pPd0VvdGJzcnR3Nk0rSGxpMnlOYm5ZNGdWTTNrVXJxdEVI?=
 =?utf-8?B?SmtITWExcFVabFIvZVNxdStJbzNaWlZhTGI4SXIwMUh6NGlpQ0VVVXNVbmdF?=
 =?utf-8?B?UU9EL0FwQlNzNXVxcnJxZXBPdEV4c21Cc3FkRXlCaTR1akRZVUNVT08xNjJw?=
 =?utf-8?B?WU83dFJyWUNqd2NIeSt0ZEo5a1dXQmxLWWRTOXdYMDR3Z1UxemRpMjJpeUQw?=
 =?utf-8?B?UzdNRnJmYmp3UGJabzNldTZrZzRKTWs0K0RzNERKWXVCQzVIdEV3NFFnUnJC?=
 =?utf-8?B?QTNDWW5sZjIvR1piVUNJdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzhaaTFTUzVNT0wvemhWOXdrRGJLelNCMU5ybFhWNDZCU3A5TXhwZW5ucUk0?=
 =?utf-8?B?cEU0OHV5M2txL3hCMmdCeUF5Z2JUakVtdTN3YXR0UTI4TXZpMExPL2RHVXRF?=
 =?utf-8?B?b3ZkSGdrelB6SVRENG14aDRjUFlrd2l3NmdwTkJicERIQ0pqMU41ellIRmFZ?=
 =?utf-8?B?Y0JtbWJLOFhJNFJEeGdkaWJoN2k2a1hVNW04RDdvOVYvVXZxeXN2aElDemZm?=
 =?utf-8?B?Nm5Ra3BZVFpmYUp6U3BtNHg5ZXNiUXVXYWR2aGtOeU4xbThnRTVMT1RXTTBv?=
 =?utf-8?B?QVp4Y0VXZ1RWRGx5Tzl3Z2JXYzl1NzFYNlBCS2dpRFNLaC9ZelQwaHh0bjAw?=
 =?utf-8?B?WVpTZHpVcCtSRHZ1OEQzY2ovRkIvL3pycXFHWVJzNkJjOENwbUlpZjJlZ2E5?=
 =?utf-8?B?SStwTFFhTDFaTTJzeGdza3ZoWlgwaXJ5V0djai9GeVV1cHBkUVFMN1dRZFJL?=
 =?utf-8?B?bVprVGNtaEZBd09aV1kxdXFIYW9oM29WcXVxMDNwTjNFREhqdnRWekRyc2Js?=
 =?utf-8?B?cWVaNnFJS0N4c042eGlKTGVJc0JKZUQ2bEpULzFhcXV4SEhkN0haTjJUZnpT?=
 =?utf-8?B?VDJpa1BGUjBWRzZlSUpxdStBMzFqRFdCMEgvZnpZTGF6dVZGZENSSTZPVXdp?=
 =?utf-8?B?Y3J6LzJudTZwWmw1dmRmd0psK0h3aXplSytQUXovV3BLMlhaNkFrM0Z0dzhB?=
 =?utf-8?B?aFhER0pwRVdUUXpuaDFPdEovVDZtMSs0UGNUU2NtYk5mQTEvcFlaZy9pU2tC?=
 =?utf-8?B?UFQwN0I3bEhjYXFseXRJMmJFNm5ub1lId21hMW43NTMwdENENmh4V3ArTU9R?=
 =?utf-8?B?ZGdwbzJsNElEakR6MXE4WWF3UnBIRGJVbitIVnNWeDNvRkxRQ05mSmJLRHIv?=
 =?utf-8?B?dExxYVpta3JQblZvdVNHeTY3Uzk1ZDRjMWpMZGgweVhGWEpIVEh5WFk3ZXdC?=
 =?utf-8?B?MXVEZEszTWt3elFLSXpPcjM4RjIvSjFYVnh4dTJkeTNWK2RNc2ZrcW8yZjVX?=
 =?utf-8?B?ZGZvLzVlQUpYeHZvTmtkdExtaDhKNnRhMy9YNmZGVS9TZXVScUZFbjdhR2hL?=
 =?utf-8?B?KzViQk9BQWsyRC92R2duNFd3Ly85dTBEbEVqY0xhcjRJeS82OWJRQzNpNVhB?=
 =?utf-8?B?VmpxeTc1M1liMkh1K0JidEpJdWZSamp2cHVVN04wdlhYRTdLUE85NThCcFcw?=
 =?utf-8?B?WnQ1NEdTWVlSVlc0M3JUQ2Q5WWs3d3RLNXo3M3oySkgyS1NsUGxPb2VxK2xm?=
 =?utf-8?B?cFBHb0ltMEE3ZFlKdnNBSmR4UGlZOGFaK3ByNk1YV3d2TG1HRzJwWGpHQ2xx?=
 =?utf-8?B?TTBha1NCdVo0MVRHWFNBWXE0QnZpREU3QmFGMVZycDdtSHpaZGVQRDR3TXgz?=
 =?utf-8?B?WnRMeXh5VGlFNEQ4WVh5eS9WVm1XRVQ5R0ZuQ3d0d1FwK3o2bXB2U3ZBZXBr?=
 =?utf-8?B?ZmRBZ2xaOEZQSU9vamdBQ0tEb0U1VS9la3N2am5ZMXRsQjlLNnJRbldtZ2FN?=
 =?utf-8?B?QWlidW8rT0kxVSs5YkM4VDkrdnVabVFDL2QrMFBxb0dWMnZkMGw3MmR4WnNW?=
 =?utf-8?B?aGp3cW9rMG16S1I1MDVsSTh1UjJMWjl0RmZLa3ByNGJhYlJkR0wrT21zZEcw?=
 =?utf-8?B?VFduVWN0MXBZZnNsVmkvWDd2YldvbDNwaG50S1FmTS9iNUJrNVpFUmgwUVBN?=
 =?utf-8?B?cTZLNjd5N0hYaE1aaGxOU2pHdHVmS1Vhdmx3clpOZEhSQytyM0NRSXA0NVNw?=
 =?utf-8?B?dFRtYi9IYlJhV20raDgvZzVJclljN3dsaDhCaS9mNlR2VnFwcG5oMDB4ekpY?=
 =?utf-8?B?WVBIWUN6N3hnUjQ3eFAwK3M4OGpQUXFRTzdsaUk1RTRudzl3K2FxOWQyV1lQ?=
 =?utf-8?B?c2ZLQmJ1bGZBL09kSnNuaWRDYldzUjZWclJtR2JWU2lnQVhZck9XZTJUaUJN?=
 =?utf-8?B?dWllMERYMUVKOGZhWldETjNKZ2Y3ZTFSR2FiL2ZDTE5ZUitneFo1SE9NT1NM?=
 =?utf-8?B?M0tjOHlqZDBteWFtWTlJcUZWMWV6T3BXWHJVUytXeTFSSHNxNHM4UGpwOTF6?=
 =?utf-8?B?U3ZQSENYMU5DUUV6RTA4Y1o1d1grbTZEVmQwd05Hc0ZzTVFhcUl2ZU40NkZU?=
 =?utf-8?B?MGR5MzF5NmMrQmRDWTdSWFpDMXNGYWVoMEx0cFUrbjlqMUR6STFFUE93Q2V3?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b9463efb-119d-4430-b7d9-08dd4147f349
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:05:43.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8H45yb79wlZ6kw3LKzUmM54VoMdpY2BSAi+Yad6HHwlBJ0tRT6YreYp/p9yOaB5rG+cDK5TZyDQGzhcu499z/nMsRnOhkSHoRPaom9XzxsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8035
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Jan 2025 16:05:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6217

Hi Antonin,

On 1/29/25 11:25 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add some information to the migration guide about two important potentially
> breaking changes in 5.2.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Notes:
> * original patch by Richard Purdie:
>    https://lore.kernel.org/r/20250126111850.2609298-1-richard.purdie@linuxfoundation.org
>    This patch is just reformatting/typo fixes.
> * The BB_CURRENT_MC should ideally be documented, but that will come at
>    a later point with
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.
> ---
>   documentation/migration-guides/migration-5.2.rst | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index e9de6910e..245c22f28 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -94,6 +94,29 @@ systemd changes
>      not for socket files).
>      Now all service files must be explicitly added to :term:`FILES`.
>   
> +Multiconfig changes
> +~~~~~~~~~~~~~~~~~~~
> +
> +-  The value of ``BB_CURRENT_MC`` was changed from ``default`` to an empty string
> +   for the default multiconfig configuration to avoid needing to map the values
> +   within BitBake. This was already not happening in some cases so this fixes
> +   some obscure bugs.
> +
> +Virtual toolchain provider changes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  Support was added for virtual providers on a per-recipe basis for specific
> +   key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. As part of
> +   that support, the ``cross`` providers were simplified to remove the triplet
> +   prefix and generalise the naming, so for example::
> +
> +      virtual/${TARGET_PREFIX}-binutils -> virtual/cross-bintuils
> +      virtual/${TARGET_PREFIX}-gcc -> virtual/cross-cc
> +      virtual/${TARGET_PREFIX}-g++ -> virtual/cross-c++
> +      virtual/${TARGET_PREFIX}-compilerlibs -> virtual/compilerlibs
> +      virtual/${SDK_PREFIX}-binutils -> virtual/nativesdk-cross-binutils
> +      virtual/${SDK_PREFIX}-gcc -> virtual/nativesdk-cross-cc
> +

This is in the migration manual so we need to explicit what the user 
needs to do.

What needs to be done wrt BB_CURRENT_MC change?

For the removal of TARGET_PREFIX/SDK_PREFIX, I assume a simple tree-wide:

sed 's;virtual/\${TARGET_PREFIX}binutils;virtual/cross-bintuils;'

should do the trick?

Also, all of the above didn't have a dash after ${SDK_PREFIX} or 
${TARGET_PREFIX}.

Cheers,
Quentin


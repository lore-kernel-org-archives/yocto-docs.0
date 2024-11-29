Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE75D6EC15
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:29:05 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.42])
 by mx.groups.io with SMTP id smtpd.web10.116145.1732890535700447936
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=D0+Deg8V;
 spf=pass (domain: cherry.de, ip: 40.107.249.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiHfLmVdvAQ492F9q5vfq6/r7yRtuc72ntvYE+dT6NhsUEYt1UKWMcGpeCNc+HNA6EZAKp5yO0L2x76sMPAa1F7QszPmm7AHOpA002KjKxyxLYivt70bza0UTP0Ec1lWEUGQu47pN1Wsf/E9upk6w6KWXzXLH/hQKKqsmuBlSbbM59432Q5HuQepLmlvgG7Jz/Pg5bso79yOIyGDdk0eRHq6HNXChNsCwewzwYHCPVQcparq6rN1rk2Taw/IPTSL1GBfB8dXn6XZHMxf7F3C+KZe8UUfwQI9+nvwYdeG0RRmgHn1RPe+A4Rv8MUyWu+7/M3d1DHMt996gqwiwMNAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrCkDvhgg3GWzELLOW8S1cLpOskUo0KlOCBvXCxGNgQ=;
 b=PyzfsiTJWM4aVHXS80QefATnmK0wpRSQibj6pD3BqU5TL2BZ9+9Ieg7bA5CsG59sY9DPFzgXuOTOoI3BbJJk9gSxWBFhnHwgUqtKfGQs5y/e0lgXJkgzRO+Cp9DzIJjLg07TczWD5f9ZYrhzJeg1w/XKChD3QlPpn3XOmDPXT3E5gftqWyrxVMICh3KOSj16uUMKBYK33HgVt7VOsgoRXe5luiBxw5G8i22xEQiNetocI4X91siQhySAP/r/yrp/FgB2n3o8YDFYUqM/b8RvZQuJ5qtiUOy5GH1CWamVa+QhuZFDp7KZT27psPL4qbbkYq++mPCsBtA5vZ0wNGvEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrCkDvhgg3GWzELLOW8S1cLpOskUo0KlOCBvXCxGNgQ=;
 b=D0+Deg8V2C4iCJ+YUfXy0ZAysjBzIUoV3rmJu8iLDT0TrZzEQuiGRABIGB0bgoDNaeUUk+GQx7ofdwkVmfVoI5sIuKWVqkVQOLmPpcuUhRypUUPKrHgIVobNNyurovK9VhAdTo+phHaH+M7DVB1G5FdvDIMqLk44am4hzhcKXWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 14:28:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 14:28:50 +0000
Message-ID: <77cb6f09-e059-4ee1-9139-cb55ef618520@cherry.de>
Date: Fri, 29 Nov 2024 15:28:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH 4/5] system-requirements.rst: add
 dependencies for pdf builds
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
 <fd1c29ef-20f8-49d1-8c72-92359a16b894@cherry.de>
 <D5YPY67J862H.XCE8HJIWX48N@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5YPY67J862H.XCE8HJIWX48N@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: b65b1669-e9e4-44eb-0893-08dd108224c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGVhRzNBQnBsbXlCVEFkeGN6M0FjSXJCTWU4YmVHQ1BwS3gyQ1k5RlN2b2pX?=
 =?utf-8?B?dWJvamk0aVhZMWNjSEpYZjVOb2RBVnpXNlVuQVJXdFhvUUNCcEFtR0tmRVNZ?=
 =?utf-8?B?eHplcFZCeE1vcGYvKzZEU2pzTHNtQ1lKNGVQaXd3YlZKSko5eDB3bkQyYjZK?=
 =?utf-8?B?V0svUUxVb1BGdVpESkJBQVVURS9wNjQ3LzRHSEs3OUxHbGE3VFVNR2RTMGZP?=
 =?utf-8?B?emF3MTdmQjVNYW0zNzlQcnA2TjlTN1MweUFKakN6UXgvOHVCYmZpSEdHamxq?=
 =?utf-8?B?VER6aUZBcWhFclo4QlY1Qm1MTXhIZkNGeFp3RmpQcGpJdE93dm9FQTFhZmVo?=
 =?utf-8?B?V1BGWDV2QSs1ajJ1dGlvYmpkZUZrZmVuV0xzSDVzbDlpT29saVhiRDlLeFFX?=
 =?utf-8?B?MHhCUE1RS21jR2pDOHBpdkM0Q2VGNUNQa0NqV3R3TlVxb015dlV1Y0J2TTE3?=
 =?utf-8?B?NmhYdEtTYm1hOGZSNTdySzJ3ejhvaWg2bVNJSCs4Z1F3R2g4N1ZhbFY1M1hz?=
 =?utf-8?B?QkE2OVBLTk9vdHhFMFZadkMxM2c2U0htckQyNnVCWktVS2xUR3lFU3czbW1n?=
 =?utf-8?B?N0piajJxZzZZdTZRM2YzWXdKQ3psNHRLTzBld0pITEJmQlRZWk8vSlhyOE9n?=
 =?utf-8?B?QXYxTlpIR2VteS9GSWJoNkVmVUlFYmJFT3VUN2dLUDExN2VZOWJzQSsybzh4?=
 =?utf-8?B?Qnd2Tk9HR3pEcUxnTDVXM0Q2bU9jWGNxRjBZQjhBVFZpOGQ3MnZRMC9teldu?=
 =?utf-8?B?NHZwdno2L3dNL2NUakFRdFZHUjNyWlByL0F6NFJDSG92RGJCWTlYc1BhTW5P?=
 =?utf-8?B?WGI3aisrUDhsRmdDSlhLL0wxKysrRXZjQ2dDS0szK2ZhcHhzdy8zMXA5UUw3?=
 =?utf-8?B?UlU0ZzloVk9XektGNXhsSExBQlkrTjV5ZU9URW1WM29xaFFnajB4U1dTNVds?=
 =?utf-8?B?UGd2dVpYSE52Z3I5TFM2YmpvTm1MTEpuVFIxY0ZvcXlqaTFhU0gzSFhwNnVE?=
 =?utf-8?B?c3pOam42Mlovc3hnMm1jVVF2ZmdrZVdmSC85SXpHUkdvVUlnMy9ibHl2dHlY?=
 =?utf-8?B?UHNtM1h2dmpjRDJmaXFwenZxelZCQkp2VTNDaHpna25iNkZ6aUhSVHhJSmt2?=
 =?utf-8?B?VGVadzZNcXB1UHUzWEpDclpDeWxYQVowUG1BNUpKMlY1emphbjYwWEN0UmNH?=
 =?utf-8?B?a0l0MU5BR2xpbUtQcUVMY2tvYlJXZWNxaDVaQmZHbVFJd1JrTHpSU1F0Mlpq?=
 =?utf-8?B?Wno2b2U5cGg0MU1oYnV4RThFLzNvUG9FQjQweHpNem5rUWtOYzRtYjFjTWox?=
 =?utf-8?B?K1dTeDBGSTYvTTNEMTJSRWE1UmNkZWQzQWVDcFdFb0tWNU16bTFEdWx4UHBP?=
 =?utf-8?B?UG5janRtWi9rSno3ZnlPZHdpUU9GRjdGWUY3bjF2Q3hQQ2tLdVQxd2J6d3dN?=
 =?utf-8?B?dXdLQjM0UjBSc3hUVGptU0kzTVVIc1ZWdWpZM0oxWGp0ZHpUY0U4S2pXUDNo?=
 =?utf-8?B?cXRBMmY3QXd6UVl3RXl1Zk9IWnYzWnJYOGw0L0o4aTlpK3RQZWpFTi9xcGNE?=
 =?utf-8?B?ZVhnWWxzZmZURHlpT0NXSFNZamlIVGV3ckNMTHJDdlVBYTQ1MnpSVDF0b2Vo?=
 =?utf-8?B?RHZjanoxM2ZSRmdtUTJiMmszWldzRFkzVnFQdmQvWnlTZC9zN1MrNUEvZmw1?=
 =?utf-8?B?cFZ3VEx0RHR6ZjRnYjhKMzdTaEZmWmxkY3JYdmdkbkdMVjJob3AzR05JZUgv?=
 =?utf-8?B?OGxHa2FjWWtJOGFRRGFYMHBsakc0M0JzTkNaSzRXNmU1K0pUaGJOMy9UTjAx?=
 =?utf-8?B?b0ZEMmVMTUdvaXV3alptQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTFpRnVkZ2FiZVhYOFNiNXQ0bjlUYWttOGxMcnJNaElMT042WFMxOEF4R3F1?=
 =?utf-8?B?bFFodkJkZHlYZEpqaDJFVG1kdUJCOXd3RzN1YWNPME53Slk2NnVuZ3o4c2cx?=
 =?utf-8?B?aXRDSWlLdWNORHhNb2g5UTFZMDhaUk8rcUJEV2NQWnExRGVaR0ViQjNZcmhD?=
 =?utf-8?B?WlZOUkJ4Q0xwWnp5N3VVdkxmUTgyOTYwWitVUUVFMzFiSWNhNnFiOHZhQjE3?=
 =?utf-8?B?L29zYXRLMEEybDJrWDAxK2dGdzRRTkZGVk1IVm0vRVdOSDhqL2V6MkdJTlBB?=
 =?utf-8?B?cjNac2UrbHVBMjlkQmIrZjNDTnpqNmdoWmxkQ0RCK0F4M29qcWlhUllvalJL?=
 =?utf-8?B?dFp2VXAwRUppbnFRdE44Z1dVc2NxaUg4Rmw1d0hhNm1VdTYvSnRhNmM0M3Fj?=
 =?utf-8?B?Z0VqV3pBRXRLci9yNzJVSk4wY2R5YUlCV3hRQWNVR0c3S3I1TFpOWjJMdjNW?=
 =?utf-8?B?bDdjNEdvSkxlTUxvNWp2eCtVUlVTQSs0UnJveHF5bm0ybFVWWWdDSjdsdWV2?=
 =?utf-8?B?b21kOGtWUFZINlc5YkphZTk2dEVETjNublFkMFEzRHBtRDhXU3dYSGptK1Zx?=
 =?utf-8?B?SFlPME9CSC9hVXlsSkU2cmMwR1JycGNPaXVqdEQxWGEzblg4eUkxd2NiOVNv?=
 =?utf-8?B?N0NGVnVGZXgxSndUcTV0QmppL3h3Vjlsd2dDQ04zZ0t1UWJQNGdVSm4xWkt4?=
 =?utf-8?B?c2dwU2d2cGZleDJsRGZMeHQ0MjN1d3BUOHdrdEhab2lhbnJSRm1aYXBKc1BL?=
 =?utf-8?B?RFVPaGJILzBTT29BMS9YalY3eTJEc3gxc0ZWeXpRdjhQOXpuWUpSWE9nRmwx?=
 =?utf-8?B?Y2pYa2hCVlg0VlcxNkNuVnFNalFLU1A3SEIyMjBhaUFEMWFXZUJ4M2s2aGhV?=
 =?utf-8?B?UGdsRHdLaVppRHdNRzhCaGQwSG9uSmtCWWk4RkdzRmVBZXdLaXZUZWJWZThW?=
 =?utf-8?B?Y2JqdThZZ2p0ZDdoVnZCcVptWGkrc24xNVBXcXZqRjNuYUVxcVExQlJQa2tq?=
 =?utf-8?B?RlZTM2gyNDhaYlROSE9HZ1VFM2JlOU5GeHpkeDEvRkhFeDEwZ0VqU25yaE1w?=
 =?utf-8?B?Z1h0b295Z3F6QTcvbFYvNWRqS2c1WHBEL1k5dkpTR3psVXVMaXRKcyt4clVz?=
 =?utf-8?B?Qm4xcHN2a1h0K2lNY1h6K2kxZktUMzZieWdZSXN4NXhpS2RyU1ZNQ2tYY2gr?=
 =?utf-8?B?SDk1UTdpbm9LZ0pNVjRyK1hXYnVxS0ZWcGFyZjJOMGxaU0ZSQXVsU3NJeFI3?=
 =?utf-8?B?dWtoMkxaWTBpeXIwc1dDU1lDbVcxb0FGTHpRblhXeHFFeWFWWkhxeFdyb1JV?=
 =?utf-8?B?TUhhdy85UkdrclJES2p2TE9UZGtpVXhla0ZIOUkzcXVMSERxQXo2K1laa0c2?=
 =?utf-8?B?Vm13bW1nTW5FUzltTUkwOGlUZVFrdk8xcit3Rk9lVy80cU03ZmIxU0lWTjhU?=
 =?utf-8?B?UFpERXVNNTE3YXRrNWh2Vk1Wd1AwTE9hK2tSSWN2Wnh3R1RKWHdmNEVNQStU?=
 =?utf-8?B?MDlzTTZqcE5VOEVNK2IvTGFUN3FUWld6THpFNUtpOWVjbVdKQVRWem5lWUVv?=
 =?utf-8?B?MDZCSnYwTFZRRVBUNDltb1Z2NmpWRlNyZW5XS0Q0cHh4SDBVdVJzVzJOVnVi?=
 =?utf-8?B?dDhPalJ0blRwNXE5QXpEWDNDeXJLVU9EcmZXZVJWb0E4RHI2Zlllb1RYNnJN?=
 =?utf-8?B?aExiSTUvMTZ2Tk1XeFc0V2xFcStiWHJIUndnR25aWExBZHFyN2JPSE55RU02?=
 =?utf-8?B?WUJPVnFDazRMT25tNUdaVHBlUGwxMm9vUEtEVU50QlZZRnlDbVpIYVRlbUlP?=
 =?utf-8?B?M1k3M1NCVUVWTFVkcCsvVlpyUEcrTWtRdlBESXdTYm9wY2RpNXpaSEV1bTMv?=
 =?utf-8?B?bjdBZ2JqOFpHUFpWRzRQbzN5ek5HcGw5WnUxL3B5MXlTRzZwaE1ZM09RTHB6?=
 =?utf-8?B?RXFuSlhRVHRnMm5NT2YyeVQzMU93QlBvODJrZUhQZ2paOUQ0NmV2RkZQR1Yr?=
 =?utf-8?B?OVVIQ1hMamI4UFNHc2VCdFYxNDFOMDIrcG1sZEdQemw1TkVxZm9kNVpKYjUw?=
 =?utf-8?B?ZnFwa3U5UDFBYVlPaFVQdlZsc0Y0ZHUwbGYxMFdLMHA0TEhTaGNQblJvN0ZT?=
 =?utf-8?B?TXV1ZGhpOTFFT2QxWEk0MWE1Y2ZaVE5NYWhWTlJVVE5Fb2ZKYVJJMUxyNzAw?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b65b1669-e9e4-44eb-0893-08dd108224c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 14:28:50.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfD4j+eniTBAoINEkeorbG/U1FqLZEfcKM7CKFoTauQjpW9/D0JGkCBK3+3FrkCY1foVArnFd6uQvkUKCnJ1/Knrb967lag5zzgGkJzrJAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:29:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5855

Hi Antonin,

On 11/29/24 3:06 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Quentin,
> 
> On Mon Nov 25, 2024 at 7:11 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> With the recent changes from commit
>>> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
>>> for xelatex"), the list of dependencies needs to be updated.
>>>
>>> The initial list of dependencies was made for Ubuntu/Debian, and the
>>> packages were translated for the other distros using pkgs.org.
>>>
>>> Add them separately from the rest of the dependencies as they pull a
>>> _lot_ of additional dependencies (for latex).
>>>
>>> Notes:
>>> - Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
>>>     install all available languages.
>>> - AlmaLinux does not seem to provide texlive-collection-fontsextra,
>>>     texlive-collection-lang*, and texlive-collection-latexextra, so add a
>>>     warning about that.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/poky.yaml.in                       | 79 +++++++++++++++++++++++-
>>>    documentation/ref-manual/system-requirements.rst | 27 ++++++++
>>>    2 files changed, 105 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>>> index d0c8973db27340838f78f560c01d44fb67771b25..d95b73c74ad7979609c6e7f4e1be5343968da743 100644
>>> --- a/documentation/poky.yaml.in
>>> +++ b/documentation/poky.yaml.in
>>> @@ -67,8 +67,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>>>      python3-saneyaml
>>>      python3-sphinx-rtd-theme
>>>      sphinx
>>> -  texlive-latex-extra
>>>    
>>> +UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
>>> +  fonts-freefont-otf
>>> +  latexmk
>>> +  tex-gyre
>>> +  texlive-fonts-extra
>>> +  texlive-fonts-recommended
>>> +  texlive-lang-all
>>> +  texlive-latex-extra
>>> +  texlive-latex-recommended
>>> +  texlive-xetex
>>>    
>>>    FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>>>      bzip2
>>> @@ -131,6 +140,35 @@ FEDORA_HOST_PACKAGES_DOC: >-
>>>      which
>>>      texlive-fncychap
>>>    
>>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>>> +  latexmk
>>> +  texlive-collection-fontsextra
>>> +  texlive-collection-fontsrecommended
>>> +  texlive-collection-langarabic
>>> +  texlive-collection-langchinese
>>> +  texlive-collection-langcjk
>>> +  texlive-collection-langcyrillic
>>> +  texlive-collection-langczechslovak
>>> +  texlive-collection-langenglish
>>> +  texlive-collection-langeuropean
>>> +  texlive-collection-langfrench
>>> +  texlive-collection-langgerman
>>> +  texlive-collection-langgreek
>>> +  texlive-collection-langitalian
>>> +  texlive-collection-langjapanese
>>> +  texlive-collection-langkorean
>>> +  texlive-collection-langother
>>> +  texlive-collection-langpolish
>>> +  texlive-collection-langportuguese
>>> +  texlive-collection-langspanish
>>
>> I'm wondering if we really need all languages or if we were too lazy to
>> figure out which ones we actually need.
> 
> Actually, I'd go with all of them... the initial reason for including those is
> because contributors in the release notes may have names with international
> characters. I'd include them all "to be safe" and avoid wondering about LaTeX
> errors later.
> 

Ah true, that was the reason, I had forgotten already with my name with 
boring letters :)

>> Also, you should be able to avoid listing them all by using
>> 'texlive-collection-lang*', dnf should be able to handle that just fine.
> 
> Thanks for the tip. I should be able to test that with my container scripts soon :)
> 
>>> +  texlive-collection-latex
>>> +  texlive-collection-latexextra
>>> +  texlive-collection-latexrecommended
>>
>> latex-extra already requires latex-recommended which already requires
>> latex so only the former is necessary.
> 
> +1
> 

Actually I think this is potentially a bad recommendation. It depends 
exactly what we need. But if we need stuff from latex-recommended or 
latex, we should explicitly list either or both, because it would 
prevent issues when the distro decides latexextra doesn't require 
latexrecommended which doesn't require latex anymore. This has happened 
to me (in a different context) when upgrading from Debian Bullseye to 
Bookworm.

Cheers,
Quentin


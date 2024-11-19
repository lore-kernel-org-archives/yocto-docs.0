Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE0BD62067
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 09:50:29 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.54])
 by mx.groups.io with SMTP id smtpd.web10.17146.1732009824991535649
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Nov 2024 01:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NDrPXEIP;
 spf=pass (domain: cherry.de, ip: 40.107.103.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn7MorjOhz0OsW1oHlXp+ebtd/YLUXq+myZfvHUvaw3ctHeOlEQ6MEHAhPLYwh92QewMMFJIOFDU0ZeBa7AyLCo72sFpopZKyIxSCv2+NsaFd7wqzV9xVM9UCkoHV1JLxo7Scre8RkjMWHTnHRVppLdUPJwadt0xuq5TzQ6pS+o+f/mLeP9Y/AGFwKCj2R7x0kUdFEa5E5hOsWxToVX8bCA5kUrsCLPWEePZUMiqUhIHhGp2JMvCcZR1Q4cgiQuZc5FI9P9zPjIN5CaGJDpH9jlVAAzNeQpa1npa8ebX4Di567PTYG3N7l+PpZZARERBR9DZPlmiYCx67VE2P0mB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqQ72qNcWPvTIUuLyohVTpOTcvRMIku4s7CPYXMbROI=;
 b=JdLSbBbk2Jo5iu9JJUU8btekZWBFtSDo8Oer//swNpIQ55aeZHJdOjEkShlB2zwuOBNSXQR+YQ5gCXSjJ7V3JN2b+MfiM3cDMClr1LfT6qtSMWVakgmkjSqx2ezWXQhtSvv+UTMg25cKwVnFHxCbAFgiBNS3OYIYbqEgCP7bd/5HLlbJelOPqeRpNZy1MbGNzvbfENQ2sPl9uGUV+tnyrsWoM1CW0tVfXbX8UhEwUY9ZpXc8S1Qp35hw3uD7xzQJYaEqa2WuE8REsDypm7azdBegHHau0P48eWMpRBr0/2fMKRNH8DnJFWI2yZ+0DrTdP9APFm5SNxXhAuTsu651Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqQ72qNcWPvTIUuLyohVTpOTcvRMIku4s7CPYXMbROI=;
 b=NDrPXEIPw6BGjni9F7+EDyQaaNp/82yMmCxW8gn0YzDeV4HtRQ/RvO+XtT4o3g6jmFKjnuSb/guFR1P69KqnxG8/AP/iY30VPrcc0nF4Pgj8meM3FVubEb5pUtxCf5U34taneF3j0Pqnkx0dyBIvfmxUMdbln2wKATBpnADBiCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7453.eurprd04.prod.outlook.com (2603:10a6:800:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 09:50:20 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:50:20 +0000
Message-ID: <ecb9d274-2380-4f83-880d-629b64e279b9@cherry.de>
Date: Tue, 19 Nov 2024 10:50:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] Update the documentation for SRCPV
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241118-deprecated-srcpv-v1-1-bdab9da44267@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241118-deprecated-srcpv-v1-1-bdab9da44267@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e50ccd1-79fc-47a8-2d57-08dd087f9452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejdpU2pCc0VWaVRkdUhRWktKSVlvVDdUMWc4aTJnNHpMVUdpdlJ5S1orRTN3?=
 =?utf-8?B?bjBybVo0L0RhWE9NOXhLUWhsaFh6cGt1UGdXWmlBVHNHb21GRnBBNFdzMnhP?=
 =?utf-8?B?SHNmdHMzU0pBaEFQSzlGcCtaS0dUNUU2anhPQ2MybXVhejFISkVETTFVY1lK?=
 =?utf-8?B?QTI2SlVqT0VabjhNYTlta1NNWTUza1lxZkpwd2l1UE4xY0pJck0vd1Y0Rnhx?=
 =?utf-8?B?dlB2NkcyYk9UM01Obmw3czBabldDU0pGcnZ3UGFITzJBZ2M5YVZCRWYwUTlP?=
 =?utf-8?B?NGlmZGR2Z1hPUER4anFodm5kdjJjbFZSS3lMeGRxRXQ5YlpTSTVBZWR2SVAr?=
 =?utf-8?B?TTc4aFNSM3dMWFg5UUtNRDErWVplWWllWTlYV3JERXQ1eTVkTU4waTg4UnJt?=
 =?utf-8?B?UEE5RVhxK0NDTUJNbE5kM2JRenZlNTdja0xWZGMzNUF2RkRoOStvY0JrN1pn?=
 =?utf-8?B?cXdvYVVMTUNpNEwvMGM5TU9lVTB5T0IzTFB6MjIxTUIyQTFBTGl0R2x3K1Ns?=
 =?utf-8?B?NlNmN1lHKzZTVUhtUEl1MG1BbGI4bEI4NE5WTlpIR2I2RE40cVpINndmUW9Q?=
 =?utf-8?B?Y1VQOGQ0MVY0c1FSaFl0a0FVRGZoMElDZWRseE8wRHF5VFEzVmlENWhCRlBT?=
 =?utf-8?B?ZlNXVXpFS0J2bHUzREVMdUIvWTF2c1ZZN2dhVzZQTm9CQkppcGR4ZWNERXFO?=
 =?utf-8?B?cXdqNkFOSnZMMnFraHc5WUo0WjRjU01KbDVhZm1tZ3NxbFZUTkFraG9sYzhk?=
 =?utf-8?B?QlNzQmNub3d5RHVnSUQySEV3YnN3TFJha3kyWmRZR1E3eXBoME5ZazZuU21t?=
 =?utf-8?B?YUNWeEJUT1VmVU0wcHJPaitvcW9jQW8wMzlGb2ltMDAydytpenovRFNlSWlm?=
 =?utf-8?B?cU8vRzdJbjQ1NzVtTThkUGFSUEJQWXlpSUhlMHFOdEZNQzhDVmlGbG9yUjJy?=
 =?utf-8?B?UTdnVkJYK3RYeExBZlRwUlYrMTdJcHoxSXZ5Ui9HYVdKNHNPNWxqUnpqaWRP?=
 =?utf-8?B?ZjVjVnZ4Q2NNN01ObHZhcFNGZHFuazc4VzNIa0ZBTnNydEl0NmRFWHkvNTJl?=
 =?utf-8?B?ZW1IZlJ4TU5XTDgxWGFNZEZtNlpEbDFNcGVaRGF1Z1ArOW1SK3VncGNWeXIx?=
 =?utf-8?B?ZWNKODZ6WmdsYUJaZTNKY204eXNmK1pwWkd3cE5pZkNGQUlJUXJaZmpycTUx?=
 =?utf-8?B?U0JKZUpOM0FJZ25tZ21vK2tNY0xDRHIyUlZ1UU5yNHR3NHYrZ0o0VS8zQ2Mr?=
 =?utf-8?B?RlFjbXNZNm1XMlpHMnlXeGhZZG5ZMWxEWUlMNTFTSUpVZ0tkQW9yTEhlRG9E?=
 =?utf-8?B?azExaFIrNFBzV3JmcnpwRkV0aC9ZR0UvNXl6NGhHWUFwWGlYdDVPSVIwNnhB?=
 =?utf-8?B?YWdYcDJ1a3NNR0N6STNJVUtkMDZxU0QvNktuREZDelVUaUhLcEw2eHRobVBK?=
 =?utf-8?B?dHd4RUxwNzhNVm9kQTE3MDd3ZmtsdkxyTmVPUllMYnl5OUtUYWRkMjhHY2kx?=
 =?utf-8?B?NkVnRHhrTHJ5akcyZmRYRFFEOFFRR3crUHZMS3g2bndjRURxZGhvaFNjdFdW?=
 =?utf-8?B?U1pWOCt2QmtHMFJOQm50RUh3bVFtSnVWWXV5K1dYSGRMT3NZTS80eXlvTE1Q?=
 =?utf-8?B?TDhld2JGTkpFK3VIZXBSR3JYMElWV2pTeVQ0MUticFdoaGRDN1JvZENoQUsr?=
 =?utf-8?B?b2JLRUVHeHY2cFcyYkZpaVhKc2RETTJxRk15Sk81a2c0RCtrWHMxa3pSY1RG?=
 =?utf-8?Q?si3Hn9rCwVt9h21Sf2KSc9xdU1fm86MwMvYR/Ks?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3ZpYXQrek1iTXBCN204YTF1KzAyRjB4MlVnbEJpMDV2T1dBSy9QT3ZmUVdO?=
 =?utf-8?B?S0tUZGNoc3ZUclU3SDFvdlo4VDVwdDRUOTZJcm9jNmpWWVkxMTVuMmZkaCtZ?=
 =?utf-8?B?MzYzQVc4OUhPaWhFWjY2TGFiNkdSazUyWDdEWFhmd0dJV1NmY2NSRGl4V2ZR?=
 =?utf-8?B?R3RnWUxuUEY2eTRSUVNhcmdkRm0wdlZTSFB5VVQyQjd4aURaaGlmZTFqSjE5?=
 =?utf-8?B?L3RndHJFNmhtMWd4Q2ZmL3ZxMWc0bHovd1BYbFRTRFkvWHJqOE9ESkhwc3Ey?=
 =?utf-8?B?UG02dEpEc1Zpa2Z0dlk5bXlkV3ZZbXd4UHBLZ0ZhZ3hNY3Vod0lMb1M0TVJI?=
 =?utf-8?B?NUFjVU1xOXZUeEUxZDY1Umo2V1BveVd5SVFYd1p0TkpjeXVuRjhpUVFqZFZ4?=
 =?utf-8?B?alBuY3d0MWd5U04yODArdU1oVmsxUS8rZEd2ZzJnQ0pzZEVwY1JoRWdlYk9Y?=
 =?utf-8?B?b3JSQ3FVM2oyMEZaVklvNDhkZFo2Y041dlkyUVlaYWE3bUtoemNCMnV5WTJz?=
 =?utf-8?B?WUdUQVJwVXMxQjlDbmJYZ2tHK1ZmdWxDc2laT3FJL1ZMdzE0bHBXZTVDTDVh?=
 =?utf-8?B?WU9ENDlYWjJtWVpJQzF6c1BNdUNFKzh2TDQzcWZNUFBPMnZTbzBlMzk3M215?=
 =?utf-8?B?R0Uxb1R5Ry9YVUNuZm91cTJxbUE4MGloamI2Y3N5ejJkTFA0bERYRHhSZkV3?=
 =?utf-8?B?Q3hZSUUrb1N5SVpvUGQ1UVJpSDNIcHJkelh5ZExJZzh2R2dkdWJxbzZPSS9K?=
 =?utf-8?B?RkNYRHNmOW8wdzFNa0VYYU9SWFcwUk9lUFpESWs0a1kyWms2WXQ3YXM5UUhp?=
 =?utf-8?B?a1crUGFjUzJOV0RZNUcrOUZhWnZPTXljKzhNSWhBRkQreFpOby9HM0FJVmgx?=
 =?utf-8?B?ejE4eTBKOXpKTDRuL3FEK0YvY1BzbndmZmhVeDdKTXlRd2wvczhLdjVsci9s?=
 =?utf-8?B?bVRodkNic0x5a09YL1g3cldsTDVGK05Wb3M1cTJ1UW16K3hrbUsvSzZjbmMr?=
 =?utf-8?B?NGdMbTFXK3l0bVVtb3RyUU1DUlpITDd6Q2hEVmFrQVRISEhUNXJJREhSdDFK?=
 =?utf-8?B?K0pzSjI3OG5ROTBnblNHR203YWExNk11ZDR0VkhOSit2b2lBRDE4THBRZUpw?=
 =?utf-8?B?QmRxQ0VlQmt4MWg5WWxqc1RyWlNVRmhIU25tdU1jdGZzWXA4SjFSTjdlVGtF?=
 =?utf-8?B?dk9uTi9KWU1xdm4wM2d5Q1JSRUNkWU5oZ0RoODcvbjBGVjJ2d25USThKZmw0?=
 =?utf-8?B?N1MxWWlIQkdqMUpqZFVZOE53dVBmemtvc0RKUzZ3S2pmaGVjeXhmZ0hmVkFi?=
 =?utf-8?B?WnhDYzRXcUxDeTJKZUdXWU9Bd0tDRmkxcFdHREM2VTJ2dlFFSkFFMUpGUkFz?=
 =?utf-8?B?b0RtbkhxKzdCZG9NbUhvemx0dDZGRWJSZkprL01sQnZsbHhRZ0x4bmNuczRE?=
 =?utf-8?B?L3lJYlVVUXpYK1FQcnZJencxR251MXh5bW1UazgxRGpsc2NObEV4OU54NExS?=
 =?utf-8?B?REFTRytVTnBnODVlWVY1TzVmSFdCVFN6ZEJLUERoM0NmWUNwZXg3dDErcUdW?=
 =?utf-8?B?OGhIbndWcExzd2h5Y3dzTXZMcGRjRm9mSENna3hqNTZvZVhKVk41MENtM05i?=
 =?utf-8?B?WGxZWTBIZktoL2ZjemtzS29kamIrU0tRcjJXK0sybHRrbkZSMVlONDV3OTdo?=
 =?utf-8?B?R1pRMEdkbndJbUEvS2JObi91MXdJbXA3VjNYVVYySlZqSThEZkltdHNucmpR?=
 =?utf-8?B?eWV3L1FsRWljc3VKbk9JYVBLMVptbjRYNUpadWVrN3dIRmVkZGdIcFRrN0RH?=
 =?utf-8?B?cHo5d0ZvWUlrSXZrWElaeGVuR28zOEU0ZEdYR0V0K0U3eEJ6Q0JIQ1JSb25J?=
 =?utf-8?B?VVp1U25WS3lIa255aElkZ2RTNCtVVXlSVGxjUFZMb1ovQ3BuYSt0VkxrbHVX?=
 =?utf-8?B?N1FhdWhIK3pIc1FrNWpPd1VVSStJc2o3UXVRYWk5b3JmR0hPcG5NMFFHSmdB?=
 =?utf-8?B?TU03MmxNQjVpd29YVmpOaTNCVHJJOVdQZ21VaDVhZ0lQYk1SYmR0NHJoT1pN?=
 =?utf-8?B?ZmNMMTVLVXRKbmFvc1NaVzNFVERvbVdGbHl0L1VCV2IrSG1SZFVabHAwQU1j?=
 =?utf-8?B?cFp4MGhpNUlON0tLbnpJemUrYXErUG1Jc3dsai83dWk2V2NpSUEzMFlnditq?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e50ccd1-79fc-47a8-2d57-08dd087f9452
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:50:20.1669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqpqwkCiHrxlaA0OuxZ3456W1sNMP90QZgOuxlTGhJ07ADEnDcMMBuGk+CdoclZHGUFK/wJkyXjwD8aKYPnqABLzktkcgRQULOVkiVPswio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7453
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Nov 2024 09:50:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5767

Hi Antonin,

On 11/18/24 11:56 AM, Antonin Godard via lists.yoctoproject.org wrote:
> The variable SRCPV is deprecated since 4.3. Instead of including SRCPV
> in PV, including the sign "+" is enough for bitbake to add the source
> control information to PKGV during the packaging phase.
> 
> Update the documentation for SRCPV and the places where it was used.
> When instructions previously referred to SRCPV, replace by mentioning to
> include "+" in the assignment.
> 
> In most examples, "+git" is added to PV as it is the most popular SCM.
> Simply adding "+" is also possible, although it is better practice to
> include the SCM name, so give that example.
> 
> Update the gcompat example with l3afpad as it didn't include "+git" in
> its PV definition anymore.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../contributor-guide/recipe-style-guide.rst       |  6 ++--
>   documentation/dev-manual/external-scm.rst          |  9 +++--
>   documentation/dev-manual/new-recipe.rst            | 10 +++---
>   documentation/dev-manual/packages.rst              | 13 +++----
>   documentation/kernel-dev/common.rst                | 12 ++-----
>   documentation/ref-manual/variables.rst             | 42 +++++++++++-----------
>   6 files changed, 42 insertions(+), 50 deletions(-)
> 
> diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
> index 6a3eec3a0e3d3d6148d3ecf1738721d7dd5079a1..806bf23848114304192dadc3efcb9288f8dbb504 100644
> --- a/documentation/contributor-guide/recipe-style-guide.rst
> +++ b/documentation/contributor-guide/recipe-style-guide.rst
> @@ -47,10 +47,10 @@ Debian policy closely.
>   
>   When a recipe references a git revision that does not correspond to a released
>   version of software (e.g. is not a tagged version), the :term:`PV` variable
> -should include the Git revision using the following to make the
> -version clear::
> +should include the sign ``+``, so :term:`bitbake` automatically includes package
> +version information during the packaging phase::
>   
> -    PV = "<version>+git${SRCPV}"
> +    PV = "<version>+git"
>   
>   In this case, ``<version>`` should be the most recently released version of the
>   software from the current source revision (``git describe`` can be useful for
> diff --git a/documentation/dev-manual/external-scm.rst b/documentation/dev-manual/external-scm.rst
> index 97a7e63e366a5f510762e4e62742ef3df5fceda6..92cbadd08e6ab70a984dae3138a1f34e7d41e1d2 100644
> --- a/documentation/dev-manual/external-scm.rst
> +++ b/documentation/dev-manual/external-scm.rst
> @@ -12,10 +12,13 @@ revision number for changes. Currently, you can do this with Apache
>   Subversion (SVN), Git, and Bazaar (BZR) repositories.
>   
>   To enable this behavior, the :term:`PV` of
> -the recipe needs to reference
> -:term:`SRCPV`. Here is an example::
> +the recipe needs to include a ``+`` sign in its assignment.
> +Here is an example::
>   
> -   PV = "1.2.3+git${SRCPV}"
> +   PV = "1.2.3+git"
> +
> +:term:`Bitbake` later include the source control information in :term:`PKGV` in
> +the packaging phase.
>   

s/include/includes/

s/in the packaging phase/during the package phase/ ?

>   Then, you can add the following to your
>   ``local.conf``::
> diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
> index 61fc2eb1222d38fd9dfb575523688460622f2e0f..944b9627f93fd7a6aafd69482efbb76e90249d8c 100644
> --- a/documentation/dev-manual/new-recipe.rst
> +++ b/documentation/dev-manual/new-recipe.rst
> @@ -291,13 +291,13 @@ another example that specifies these types of files, see the
>   
>   Another way of specifying source is from an SCM. For Git repositories,
>   you must specify :term:`SRCREV` and you should specify :term:`PV` to include
> -the revision with :term:`SRCPV`. Here is an example from the recipe
> -``meta/recipes-core/musl/gcompat_git.bb``::
> +a ``+`` sign in its definition. Here is an example from the recipe
> +:oe_git:`meta/recipes-sato/l3afpad/l3afpad_git.bb </openembedded-core/tree/meta/recipes-sato/l3afpad/l3afpad_git.bb>`::
>   
> -   SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
> +   SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git;branch=master;protocol=https"
>   
> -   PV = "1.0.0+1.1+git${SRCPV}"
> -   SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
> +   PV = "0.8.18.1.11+git"
> +   SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
>   
>   If your :term:`SRC_URI` statement includes URLs pointing to individual files
>   fetched from a remote server other than a version control system,
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index e5028fffdc825aeeec00e3ef256e1583211d5b02..33cf78747d1bc62268811321ad7a40397268e13f 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -84,10 +84,6 @@ the following:
>   
>   -  :term:`PR`: The recipe revision.
>   
> --  :term:`SRCPV`: The OpenEmbedded
> -   build system uses this string to help define the value of :term:`PV` when
> -   the source code revision needs to be included in it.
> -
>   -  :yocto_wiki:`PR Service </PR_Service>`: A
>      network-based service that helps automate keeping package feeds
>      compatible with existing package manager applications such as RPM,
> @@ -256,15 +252,14 @@ the software::
>   
>      SRCREV = "${AUTOREV}"
>   
> -Furthermore, you need to reference :term:`SRCPV` in :term:`PV` in order to
> +Furthermore, you need to include a ``+`` sign in :term:`PV` in order to
>   automatically update the version whenever the revision of the source
>   code changes. Here is an example::
>   
> -   PV = "1.0+git${SRCPV}"
> -
> -The OpenEmbedded build system substitutes :term:`SRCPV` with the following:
> +   PV = "1.0+git"
>   
> -.. code-block:: none
> +The OpenEmbedded build system will automatically add the source control
> +information to the end of the variable :term:`PKGV`, in this format::
>   
>      AUTOINC+source_code_revision
>   
> diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> index fda41694dc60fa738262a2cce33523708c7ce4ab..44c3e32b2a0e74213b1ff1ea3522fd1f59d19ffb 100644
> --- a/documentation/kernel-dev/common.rst
> +++ b/documentation/kernel-dev/common.rst
> @@ -1562,16 +1562,8 @@ Here are some basic steps you can use to work with your own sources:
>         changed.
>   
>      -  :term:`PV`: The default :term:`PV`
> -      assignment is typically adequate. It combines the
> -      :term:`LINUX_VERSION` with the Source Control Manager (SCM) revision
> -      as derived from the :term:`SRCPV`
> -      variable. The combined results are a string with the following
> -      form::
> -
> -         3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
> -
> -      While lengthy, the extra verbosity in :term:`PV` helps ensure you are
> -      using the exact sources from which you intend to build.
> +      assignment is typically adequate. It uses the value of
> +      :term:`LINUX_VERSION`.
>   

We can take this opportunity to reindent properly here?

Also, linux-yocto still appends +git to it, so I guess we should mention 
to add the +git here too.

>      -  :term:`COMPATIBLE_MACHINE`:
>         A list of the machines supported by your new recipe. This variable
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 43f4d79663bb118f56c2e1b69fb9782357074e65..ef0d0a3c34c2985c587cbbd41ac7df8c24b2a4c4 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -209,12 +209,11 @@ system and gives an overview of their function and contents.
>            SRCREV = "${AUTOREV}"
>   
>         If you use the previous statement to retrieve the latest version of
> -      software, you need to be sure :term:`PV` contains
> -      ``${``\ :term:`SRCPV`\ ``}``. For example, suppose you have a kernel
> -      recipe that inherits the :ref:`ref-classes-kernel` class and you
> -      use the previous statement. In this example, ``${SRCPV}`` does not
> -      automatically get into :term:`PV`. Consequently, you need to change
> -      :term:`PV` in your recipe so that it does contain ``${SRCPV}``.
> +      software, you need to be sure :term:`PV` contains the ``+`` sign so

I know we already have this, but maybe s/be/make/?

> +      :term:`bitbake` includes source control information to :term:`PKGV` when
> +      packaging the recipe. For example::
> +
> +        PV = "6.10.y+git"
>   
>         For more information see the
>         ":ref:`dev-manual/packages:automatically incrementing a package version number`"
> @@ -5152,7 +5151,7 @@ system and gives an overview of their function and contents.
>         The :term:`LINUX_VERSION` variable is used to define :term:`PV`
>         for the recipe::
>   
> -         PV = "${LINUX_VERSION}+git${SRCPV}"
> +         PV = "${LINUX_VERSION}+git"
>   
>      :term:`LINUX_VERSION_EXTENSION`
>         A string extension compiled into the version string of the Linux
> @@ -6720,9 +6719,10 @@ system and gives an overview of their function and contents.
>         For example, consider two recipes ``foo_1.2.bb`` and ``foo_git.bb``
>         where ``foo_git.bb`` contains the following assignment::
>   
> -         PV = "1.1+git${SRCPV}"
> +         PV = "1.1+git${@bb.fetch2.get_srcrev(d)}"
>   

Not sure why we suddenly add this inline python here instead of just 
adding "+git" ?

Cheers,
Quentin


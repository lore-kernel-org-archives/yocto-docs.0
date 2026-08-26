Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5C2C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 12:10:48 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11156.1787746240306573323
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 05:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kd2L8ZCO;
 spf=pass (domain: cherry.de, ip: 52.101.70.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQvBoi1pl69KkZNNxx8tDQFbuj8PsqdrbgOyzU5a6+GKPajzFdu6S7euM91zTczQT3xmuCyZRswPgNNMZDvSox/vC5qZ4fauJLH3quGzlZV7pKBKHhy2SspzVTR7bk1d+O5M5MFrEPnpdJMkCJbdCG2YrWMoaopXJXGeSMVO5QIXCeABasFJEIQQl47z+BifQ8JJMsHlpqRqkwNMjOrmo71KN1nT6IbD6emiO2GJ2ul/Rkkv6O+6tUgqYS0y8CqIaoNT0QC8+jd61TQJnRRG/gFY5tXzsWhckahkxZrgsB8t+zso0Cg0dI504QTdPiBmQZrKPBAusKUAAoRFBMlyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0j2LEAc+p03mVwOe0yhRvWlwek3cSmIE6JWsgKvX0s=;
 b=FgwZvQqsfpizk1pG8tzoy6HU1d2UcEkRUs+5u1nh640BuQFbBlfZhSgXBxKyvJ8zhyaMiRwjoslaEVBK48iWHeteuZ/6o+qkQwAPNFnI4mpYXRbMHQ7U5p5dEBnVL/yBaDi+AbnQ9GKefUebovDej6Ju7RG1C0cF96lxoJsUz68hPa4n7+YJ9cdmwTZrr3mceuK1q79Va09+Cg8QqHMr6KRht3kOg8tza3+A4NoLyRGNtt0CoG+XDQpwyIcwBoWjoJsDaAyt/sygFdXd2NaDIm1/dd5f232oceP3hVztcpASB13NQd8WSUsWf1UGhP2kU58d4rgClkxTCGS+aymPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0j2LEAc+p03mVwOe0yhRvWlwek3cSmIE6JWsgKvX0s=;
 b=kd2L8ZCOQ5ZkzTQ2d4XiPH4BJzw9T/6sCGLKN+k6dqECaq4WpTKj15s6ebKqhmPEjzG0Vvgre/pxrdbPdJ62b5/pPmi99yyWGZy30Xl3yKEg3TDEmRY8bO8RRGfa1OVKJXeXRb17nOot8FYNe6bSzgMVRF75GzihBtBPQhQ4b9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU4PR04MB11756.eurprd04.prod.outlook.com (2603:10a6:10:627::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 12:10:35 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 12:10:33 +0000
Message-ID: <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
Date: Wed, 26 Aug 2026 14:10:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260826013502.2674000-1-twoerner@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0131.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::15) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU4PR04MB11756:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b28c4b-8df4-44f0-b98f-08df036b07ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|376014|1800799024|366016|6133799003|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	WBsjoY8uHEstGBrySmeg7vLjZ6Cv1fJy2aOA5q82gzRz1Gk91Th0WKDURdBE2ber4lFSt1i/RNcDccE5qTUDSBNkx+AWvnCo+T4PK92rcCfHtnxAEKk2QLO8qaoZBNT3maHp/qBP1jCNL/cltu+YxNp6ipJh+Zvb/c8UCm0uvc+VwvlEClXxw9mp4ajsEa+MshGSFRAWErOxbH00DzCEdy5vgzEX0uSVs/JEnoiDfo9kBe44yMuB+2kHXifZ7hj2/In15758ZXDOs4eRpFgEqGrjPE27Asmt9aQyOn9WZK4xLTg0lcP8p82GcacvzMr5WOiqQuDMO/mAYahwDogpw0SMnat/Whh1PQT/5vp8aewCaDpTpdFhJxn0ne1riZxJn1lPCYAa0Bot3uckTe0CAwXbQ1AzQw3e5YJ8swJrwuB1uwFzoNF2R5skoBhAwJmnZ9rkFZ4bosWEzwhGxtU3vXxvP1f7mCG5yFilEF7p92jSB99Agl7F2NXioO38KGDdUDT55tjb+xu9NG2uHZ83m2LiFGHCZswpbNKAPil1lDE1Qg+xwjXjbof93EDIt+kXej3XHv49aM29lFarOG00V1BdxgNA60IYL8aeBkRYUeY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkhXL1V5N2NabVdZVFlIMDRVR0RZcUNucXR1NzdXZGFDeUdaVG8xNnBXNHB6?=
 =?utf-8?B?OVJmOVBIM01ucStOTDFrZHZ4bzRDaEZTM1FTY2pOQWlENUljTE9tdUxKd1ZI?=
 =?utf-8?B?UUc4WEJ4L2xSanhXcjg0clI2UU54NTFjc3ArV3dyUE02NU1FWHE0UGV5MGNB?=
 =?utf-8?B?UWxtQ3JCNTYwR0ZDK0xNU1VObUl6ci9WcXBja1RjUlBvNUs0REpjb1M2ODVO?=
 =?utf-8?B?YldrdkR0NmVaSEllN20yNS9pNXIwejFuNWFiUXBRemYxWVQ1bEthTjUzalFY?=
 =?utf-8?B?SXN3dzdhVjVDYkIzOEdVaDlBR3dtV21LUkVxMEcva1pNTWxNYkZDRnRRRGtk?=
 =?utf-8?B?OEljSW9KNDNFd3EyMnU2TEZTdFhJS0gxaGVjWks3TW5LU3JVWTlJbGpqVzU2?=
 =?utf-8?B?U293aVc0dmx6T21DbHptalYzYW5KeTBHa0dxZlkvMm9aZkVEUDZJWkl0L2VZ?=
 =?utf-8?B?SVdhZTNkeEZYMGczOVd5a2RjQnpwY3NYQ0R2Q3U2bFhpZnVYRk5MeGUyRkZJ?=
 =?utf-8?B?bnhJWG9IQm1tek5FMU9zSGt1RCsrZUlJQ3VCM3JMOE1XbUZiUkdpanVKT25Y?=
 =?utf-8?B?Ull1djlyR3dFdWtTb1Eza3VxeDJQeGtuektUT1lDVGdWSE9KNHBRY0tnQTRM?=
 =?utf-8?B?SWt2bDFyTE9jMjloblY3VnY5UlBxUGJ4d1JwWFVHYjZIUGRnQzFXOGZOM0xs?=
 =?utf-8?B?UlUrRkMrekFUOGFPUElwZE1TWmloOU9sZUIwMm5tcC9KRUkxQkdZQzh0KzBs?=
 =?utf-8?B?UnRMSFdPK3NKUlFOdlJZVGpVVDZiaFM5KzlSa3g4WnRtY1luNThQWklmQVNw?=
 =?utf-8?B?RWIvektVdjBqZ1BtSUViRnVRRVFRMUpySlRVNXp3dkk4cHBLU3pMSmdhbTVO?=
 =?utf-8?B?a2JSZWx5bU80QjFITGM4NlF2UEZ5S0FrMUROQ1lGbFFzMzJVQzQ2NldlVHRo?=
 =?utf-8?B?RGp3eEI3VkZpd3N3OUFKb1dxWXZITEk0MFk2cTVGL0VOMGVtclNxZVZLZjlj?=
 =?utf-8?B?LzEzU2I3TTZaMzVNWk5XWVdpM1F3c2xaeFpweDQ0R2ZVK0xzK3dHLzlzNXJj?=
 =?utf-8?B?QmFaZEFKTkIwTFRXZ1NOUWJKc3RZVUJhTDF4OEhZZ0c0MldzeEpyNkNSdFVj?=
 =?utf-8?B?N3lrL0NqYlJxM3RDQ3p2YXRBYVpuZnlzOThtbWtoc3pkNmtJcUtkSE9CZXFk?=
 =?utf-8?B?WEN2WmlmS3QwT25oWktVNU94TUo1d2U3Ym4vVlFoSnBiNHZmNUJ4MDVBSzJr?=
 =?utf-8?B?dEc2M0dOektyckZFTTdROFdHelVvaG9xWmZaTHVPMDMzSG5MSnJPRUU5b0Fr?=
 =?utf-8?B?V0x2YzdmNFBPWnJnSUJZQ0h5MFNQZEhEUHMrVUczVFd4Q2VPTHQxeHdsZmR5?=
 =?utf-8?B?NEhkZnJZWnFMdkF0MFF4a3dJblRjOGdZdURDaFhqT3k1cEFwb2I1RnNBampO?=
 =?utf-8?B?YjVRaktOOTJmZEkzQXpXMERNZ1N3T2RneVlFKy90dUVueXVuQVJqQWpkRmhk?=
 =?utf-8?B?NW9zeWE5blRZUEJpbnVsazlxVzBoUmpTaEVXcDdXWmtsNW9kM0FpOWN5eDJU?=
 =?utf-8?B?cmx6ek03M0RZV3ZjNndsSGhRaFNHQXpKSlRXOXNULythbFExSTcxSVRvTXBZ?=
 =?utf-8?B?RXJ4azgvMVJhTldoZU0rdUlJWnBwR1N3Q3pYUGViZHhGcVA4dG1XSEpucW9M?=
 =?utf-8?B?OFBKalcxWmRFakl6Tmw3N2s0Lzc1ZktjL0lQeGxFRE1QNTFYSDBPNE9QNDZa?=
 =?utf-8?B?UFVzbG1Sb0FQVU5YMlh2SnF6SWtMMGVxNi9KZmxxUm1EMmtrTEJ1WnJYVFgw?=
 =?utf-8?B?SVJKZy9UTTcyODhWaEVzNUtGVHVOK08wTVZIREgyM1hydzBOa3EwbVdGNDFn?=
 =?utf-8?B?UTA4alk3NVdCbkFyK1dXdzRVMmlrQnJGNWZpYk9KZUo3WUdrVk5wTzRTRXVU?=
 =?utf-8?B?c3ZSWTJ5VDRtQkE3K3FRRmdJeFRiT05PcEhkTWdQMGdOMnRrYXVuS1NZTWZZ?=
 =?utf-8?B?MEJtbWZvclM1T1dzWUhiUUVtSTFNcVZzbVdvdFV4Mm54bWZoT3ljYU0vN0VO?=
 =?utf-8?B?dmtsOTB2V2VaTmI2R2hzeUFFUWRHaFNrclE2Umhtcm5sUjM5Z3NEcmt2MEhS?=
 =?utf-8?B?Sy9Pd1FWRTdNRWM1TVdSTkwvV0Q0RUFWdGlmT05zdSs3NjZIbklWNGRWdi9M?=
 =?utf-8?B?ZlZ3b1lncTlSQ2JVSXRLVVVMQk5KRmh6SmdTUGI0MDZtQW4vamkxbVdIZ0p5?=
 =?utf-8?B?Q3l5ZVd6N2tVbVZvU3Naa080UlkzMSt2d01TeWhud1dDYkZHWWw5S0dGRG1x?=
 =?utf-8?B?WE1HYk1OYXhLcVNOaEtyVWFieE41TmxrNHQ4M0U2TlFTd1VZejRRV0I0UGNs?=
 =?utf-8?Q?5UOZTnsQtbKDn87ZQRACUFfs1TGSlyM2FrW/BVtq3K3ye?=
X-MS-Exchange-AntiSpam-MessageData-1: EuVhAmc/R4l9deYAvIzHnTPF4BFW9Tq2pn0=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b28c4b-8df4-44f0-b98f-08df036b07ac
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:10:33.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5qe/q4lA5W4/OMrmzaWc0jOxJtj12OaQSgxprcB5fwextVNVjvdQjIlI5YPCB+S8jS7SfOkB/o1jH1I9+cvPSfP8Y0vy7l0nIsQR5TLOfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11756
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 12:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10362

Hi Trevor,

On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
> what they are instead of rendering as plain literal blocks. This tags
> the ones in yocto-docs.
> 
> One patch per manual, which is also roughly one reviewable unit per
> patch. No prose changes, no reflowing, no reindenting - every hunk turns
> a literal-block introducer into a code-block directive and nothing else.
> 
> Which blocks were converted was decided by reading, not by pattern

"by reading" following a paragraph definitely not written by you and 
with all commits being AI-Generated is quite the stretch ;)

[...]

> Depends on
> ----------
> 
> "docs: state the language of nine literal blocks explicitly", sent

Link to the ML please to make maintainers and reviewers job easier.

[...]

I think this is going the wrong direction. We should actually make 
explicit the language of every :: that is NOT to be understood as 
BitBake code and then make the default highlight language be BitBake. 
The direct benefit is the ability to still backport whatever needs to be 
backported without having to care about the highlight language being 
explicitly bitbake (which won't be available in every branch but 
master). The other benefit is that by default every new code snippet 
will be understood as BitBake syntax, which is very likely what most of 
the snippet should be, and if they aren't, then their language should be 
made explicit. I'm thinking this could also maybe reduce the diff as I'm 
hoping we have more BitBake syntax than shell/python/whatever else so 
maybe easier to review as well. I believe 
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-highlight_language 
should be the way to do change the default highlight language (according 
to 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks 
and 
https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#directive-code-block)?

Cheers,
Quentin


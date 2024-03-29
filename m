Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE91CD11DD
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:16:56 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.98])
 by mx.groups.io with SMTP id smtpd.web10.14539.1711711009747604718
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Mar 2024 04:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=R9ZsxkIl;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.98, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab3vETgPaT2r++2PVSpucKrRhnsv1FVski/U/jF1v/zC977pTEDUiSNB+X3xHjdBIxaqKkkOwXhdS/5SRM4cS7B+eK1EyWO5FBoAvv+eEYpH+Zq8tUmchNuhuYYoizXpqAGelPHuLcd8WPURcLREO96sytUFtQfPUFOjpdIGOVr5uGeUtR70Z4NJuOIpohVsw93poetav/35n0nIfYAXUZPhta/Dmsubhf/bCGlpEEkzaq7qBS0KfIg07YA+y//iGHTcIkRUyN5N5Df2unhCWL9836nlgIxCORnAQXS/F106nq4piGHgXY6w8mthCV5NfCLRIjbOgpjFjoOTdKmoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io74DQkXLIlB3VtCHoZFOi+o5w+QrLx5uYhQfR2hoxE=;
 b=XCsbEqA5REPe6cSJPSVT0CVx9TvBHc7Ru9v+gvRXHscbSUVM2Hx3rNV9hrqglBq+yVfsmpYObqOMRMIJSLK4BcgXBv3Mnsf4qkFMUF4zBd8DqjuXz1qYYCW/si69SyLAPvdBx3Z5BUGN17rRguwzw/AIdgZrjrzDopO7adsLDwqxo2CTZ95XwRLnWzUBO3QvslEidOLqIhNY1vaba8ByP36zJAR5CCVllPqeWmsVdU4wxwfofAOTmmXBKdvqhNYHNUqamhFhwlX1Vr66rcmvZZVq6lJj2+28WLjWRShJKTOBJJo0maWkoc5wqdbgarHzEysdH2+yH7PKu/bVR7jhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=io74DQkXLIlB3VtCHoZFOi+o5w+QrLx5uYhQfR2hoxE=;
 b=R9ZsxkIl3BZg/P4F7EdOtbeHQZWPXIUBaDAMIWdCrJJtTgrHazigaD0r2ZqZI23kw1wYIfQ09u8daCTZ2oucy9idOlTrxUVxi3gn+EW3EKeV3eXaCH35WKhQ1D8LOW3ZrXRqGcbS4uI8kBeWq/amdjIEH14NA0YI6RAjZfFje0SnEr/bl8WAMMVXU1xZ38PKs7wSkV85SyboDroujltfvXKpeOOGhrRseuwNwk9Y8kLB+3sxZoC7GoTGHifWr1t3kbXI03WCbdfR0hLSb3uNWUQ8hmO1cjGTrsz91DCheIsF34AN+/Ys1pD00eMN0npI6mZjc0Gi4q8rOS6w2oUyBg==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Fri, 29 Mar
 2024 11:16:45 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.038; Fri, 29 Mar 2024
 11:16:45 +0000
Message-ID: <fecd20b0-8e34-4055-84cf-673885e7d163@theobroma-systems.com>
Date: Fri, 29 Mar 2024 12:16:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] conf.py: properly escape backslashes for
 latex_elements
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: docs@lists.yoctoproject.org
References: <20240328-yocto-patches-v1-0-1124fa0bc532@theobroma-systems.com>
 <20240328-yocto-patches-v1-1-1124fa0bc532@theobroma-systems.com>
 <85b79cd0-2f49-4217-815f-ba23c653ee14@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <85b79cd0-2f49-4217-815f-ba23c653ee14@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8256:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y1w24p2BVUmrdDxqPIm/VKDmDD6IXsxGAUcH0u4O7wQFX0vQM+Z6nHxkK89PVF37t3dIpqPtQHWEW8SQR48YuYfbf/P+cuRGPW1syBhL01DuF8eIo+TFxVgMgRnqJZ7/3dvpGR2b/U2BbtSboxLMBzxkmLUwoJUXSI3jHJ+o0/qjZ+erHteEVXQvqvcEXCa8l8Q2YciWPsO3eergJMrg1UMOjh9b8ia3jxQP87xktZy+ckvd+vT/e2eAiGK3AFprDG5kYYdzVCWtKSJTZ2xTZsucen67x/BeCjydptixTGvaYrziSY3MJ7u+A9h97G5snD1LmWDKBz8YPDtGURxSGvEH2vd4awpE0udnBk3Q62LyWlbqbAiKJ9wSWQ/svX2ZzScXikgEiMBJhTnpM5n820CIEfS6V3B62XaSZlbnz6mvTv4FCW3mdD1d4wNkRJUSUfy3+igiFkKLXD/kwDoVCFExTbnBWFC3ibvx2bl3VRqCZ9tf85PqRYiUsICCkjYWhU/XGN/+hIWlR6N2OsYGzTL958UqKFF8sFb9YCrltH7PImtnD6OMotKC0zOmEr1mQKgXMrWvg6xo/xJjmbjuI8XFjsFUgK7G/CDD0jqoYy8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ud1yP50BOdw+RptzpGrFwid6R9vVTPB4CuckICwfzIsMkmSSj3OqRuYRDL3i?=
 =?us-ascii?Q?C8bgTeHoxUfcj+CjV5eIWRJu5R6UEMhgYGfTtlTHlJN6sFYiemCs0pmSOyBL?=
 =?us-ascii?Q?TljNcNOpHGb3Ug6GXByKLp/ZxaQJg7U+X3X0l8fIJq2teE9brfRuCmvQdbaf?=
 =?us-ascii?Q?/E+AKYPpP5TF47kFzVdhUMR8dxMlM9GytjiUtT1uCgVNK5ClVgUorU5jcsY8?=
 =?us-ascii?Q?DmxBbiIhGKIXB9ZJFt/ucNK7MI2cnMEjxxAdAQOugJdZqFtBEIy5qfObXTjl?=
 =?us-ascii?Q?muIlbIl4VvFKZXgpNxb+1jBKSLToqnjQ4MYx05pxWsMj5WNcVHCN+tf5hgTo?=
 =?us-ascii?Q?CQ73Kqwmr/iBS/+WMUf4cSAcnkAmTAZl71640QbMN/ILWQDNwwGIribmiO0w?=
 =?us-ascii?Q?fCPKPf08XvdVXiTG1HYRyfq2QQfc7ePMIw+2/Q1vraw0JqRrGSVhDG4K3ISp?=
 =?us-ascii?Q?r/PfY2/pm+5gLWccfakn2vgpbWGDZi+HngF2GFulQlAfkSWFLd9vpkw2b6bz?=
 =?us-ascii?Q?UtbS2DLYA3E8fqw+PmSaTIQrqp5lJdySry1So/CyU9MBmX7OatYvF0FZ62PM?=
 =?us-ascii?Q?cma0Oo0PCr3aFHQf5cl8oD3fQaDL3sC3FoFJRElY18xlTtxx/PwYHehZItGq?=
 =?us-ascii?Q?Ir3bisDmk3yhxkfpDV8jZD06Rk31rBydaF2R4tyE4EirWV1lHGRyHXQWOUy7?=
 =?us-ascii?Q?GOejnEz+IAUooiWybao2YNtrtku9gN54/rsaojmz2W07ufuTzSvlLh2Q7ZYz?=
 =?us-ascii?Q?UDWFpsrJ9kBLMfr2GDIyRL7/ARCZEP6/K8TeL+if8dWtf0ZxTQOdUbRGA4jL?=
 =?us-ascii?Q?fOIPbk6JtnBqzinWbIesWb4wv+koawio2+nwaVhY4pBNWIV+uIDX1pyfOiwM?=
 =?us-ascii?Q?DUDSebWJbJqTjtL/4z/Y6wmhi7WgE6JvVf0tL7eC1rA4+rLUOQN6UVQjaFhs?=
 =?us-ascii?Q?n08VEyM93SIqRlBXKVx+miECR8hffgqt6rE0/MitFgUfmQw5KNvYVf8dXiMl?=
 =?us-ascii?Q?o+NndwmHFeGFFL+TstGgDfSgTXUrj29502RQIkRXNU26OSVkN7hx16bHcw6o?=
 =?us-ascii?Q?8ZhFRs3TXRNoSngpJ+H6JdeHnGARWRIH85WcrFcp1cxJLSTSeMWgeCx4OtCX?=
 =?us-ascii?Q?EdOta25Ucc3idYI9YOiYOTBsmhceEcGp4PnTxB/HbMhrHbG13/In48g06h+g?=
 =?us-ascii?Q?R8S65xm2rjGdf7muDttDBWmfEPloDDcZ3Pw8i0WqkNwZe4/0fhRa1o9vJjSr?=
 =?us-ascii?Q?5MIhT76SqZAGtDGN5d/YYEngrdT4ltvwaJcYcsZfUlW41UiQI2qt3O8Erzcg?=
 =?us-ascii?Q?Fhzl/kF9uAcZJTThwIlA3lYDN4/iz0rYy12SzdQkt/QBRTUywCalIRG/Y9b6?=
 =?us-ascii?Q?mcn3nu6x9Nun7xqXaJPUQK+WD2LWEh1EtkE2WNV740XUFUpseO/HZ7A8Oz/i?=
 =?us-ascii?Q?RVBesotPayMIiC7uzD6MNY/rJbXXuElasjhhSYSa4HFrsV9Jm48q2dVCmW4m?=
 =?us-ascii?Q?kUA3EtBalVerEOjatC9XQSGo5dUbsAbglmy2s3AOA1BLZ0z8KhcLQvfyfCEo?=
 =?us-ascii?Q?0AibkGJ8xaFcX4x/Y+9FlhRWvpRWkIZ3Oggo4h56qjEmqZJ5vBLr4uw+q2te?=
 =?us-ascii?Q?wucO9mgM/RCLZvt7BAAcTlDu5fjVCB4lnDx3EkDtqGhoMQ8e9IBlu6NAKx3t?=
 =?us-ascii?Q?qqg8NQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f06f5f3-dff8-4ed7-2451-08dc4fe1b82d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 11:16:45.7703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeBvGZF6aroqLb+JOXjVeuapdMt21McAAsABlXyG8VMAbAZQILBQDbSsIZeLfx6iNcMoGTYRDOa13m10DEC17+Mvmwyy48mdTjB5wuLABJjVfyXvra+ynjK4UdykaXT9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Mar 2024 11:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5028

Hi Michael,

On 3/29/24 12:12, Michael Opdenacker wrote:
> Hi Quentin
>=20
> Thanks for the patch!
>=20
> On 3/28/24 at 16:07, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> There are some syntax warnings returned by Python:
>> """
>> yocto-docs/documentation/conf.py:162: SyntaxWarning: invalid escape=20
>> sequence '\P'
>> =C2=A0=C2=A0 'passoptionstopackages':=20
>> '\PassOptionsToPackage{bookmarksdepth=3D5}{hyperref}',
>> yocto-docs/documentation/conf.py:163: SyntaxWarning: invalid escape=20
>> sequence '\s'
>> =C2=A0=C2=A0 'preamble': '\setcounter{tocdepth}{2}',
>> """
>>
>> Backslashes must be doubled in Python string literals to avoid
>> interpretation as escape sequence, c.f.
>> https://www.sphinx-doc.org/en/master/latex.html#module-latex.
>=20
> What command(s) were you running to get the error? I didn't see it.

Normal build instructions, just using Python 3.12.2 on Fedora 39.

https://docs.python.org/3/whatsnew/3.12.html#other-language-changes

"""
A backslash-character pair that is not a valid escape sequence now=20
generates a SyntaxWarning, instead of DeprecationWarning. For example,=20
re.compile("\d+\.\d+") now emits a SyntaxWarning ("\d" is an invalid=20
escape sequence, use raw strings for regular expression:=20
re.compile(r"\d+\.\d+")). In a future Python version, SyntaxError will=20
eventually be raised, instead of SyntaxWarning. (Contributed by Victor=20
Stinner in gh-98401.)
"""

Cheers,
Quentin


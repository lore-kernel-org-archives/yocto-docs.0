Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12155C36013
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:32:10 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.54])
 by mx.groups.io with SMTP id smtpd.web10.47334.1743409926941098925
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 01:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=aD26J/tk;
 spf=pass (domain: cherry.de, ip: 40.107.103.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTzOlfzC7EcTqT3PeaGMPf1EAxu9jfaPSKaArlGIuyINeUxY1Mx8cC23ne6sjt5QwO2PxZr/A4npSN0ehGmkAGvVvloSb5lSWTwiOD1JbEeuY4chZVCN/6NwWuXqZ2+WrF9Yt+pDpI6oUPAwby6RZzBbmGVuNk8ENcwTbjGL5H5i84KloPKxyhf4H0EKHYn6pF8V6qYn2csoqmV4X7WpHu80afgjEjK5TnuV33KPY8XBAzYx+20Zi4atpa9Ck61l220zIm1C0fHBnSUHsaClStejfVusslGR6OPHaEAnFfAJgmdCG/4Me7k7Yv3WZWFg1R9Lj4026avY0njk3ODgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUOJja9sqSHhMOE/aVDgqfV3us2WWgzlIZgOjwNZIz4=;
 b=mACM+GeOp/96hU3efzOrk04r3qj4r3UFUtQ+w9t9pJe7KWxJGo5qBJ6SJI55r+RisTJ/TamGxKtjBY0E8kymqBd0jGIBef9nkZRKrj9bEaUPhZ/7WILiUYQXPXwo6Yubn8stL8ADkFZ/jZAXivbtvN31t4nBjq8xFx1xIAE/Oy//5igzz7css17gOSzmjbhhuMGlJtBVGiXWaOm3pieKDjgMReThyNw6kPjFESye/kIOcTXFPIFH9EO4/65Fdert2cj1pmHIcSSiLDcWjKk/oo5o5bvnKT0M3oZvnB82LZ4n+nfUanE+1tVN1UT0LE45ptE47wX6jV+ZXA91fgoGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUOJja9sqSHhMOE/aVDgqfV3us2WWgzlIZgOjwNZIz4=;
 b=aD26J/tk5DpunaJ3jbqFvBvukPz3hRhuOpqaNdOubzFUer8kMRT8G0SvEJtOi94z5obtNycDmcKJuRqbzYJQqfG3XZ7XuFcWyHmd/RLeCH4Uwyw9K8OxJqjlMnCFHjYb0zA5isOihX/4ZWJ43cu/JagC9JFuWvkfP63b2p72az4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7566.eurprd04.prod.outlook.com (2603:10a6:102:f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 08:32:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 08:32:03 +0000
Message-ID: <37d9c34b-2932-4f1b-b7bb-33a5c5b9d585@cherry.de>
Date: Mon, 31 Mar 2025 10:32:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 11/11]
 migration-guides/{migration,release-note}-5.2: update for 5.2 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
 <20250328-release-note-5-2-updates-2-v1-11-c913513e9140@bootlin.com>
 <83f27b97-7352-469b-a6d2-975a32f59335@cherry.de>
 <69ce733f89c726b7e673d399f215b8b6020deb15.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <69ce733f89c726b7e673d399f215b8b6020deb15.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0373.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 3882a296-88b9-4b04-c458-08dd702e8356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HwZ+9FeTnsEOeWscduHBfs1DsJUrtHEflsqzdRrO7MfN1jaD2Peftb61qIMF?=
 =?us-ascii?Q?eqzo754C0Nt8Pe3R/C9Gszn3AWj2P5670UEkoppG3d9RTND3xUsW+7Slw4Tn?=
 =?us-ascii?Q?m0YJAcIhAyESviahmcWkoqSz4tbw9ekok0YNmpEOXyptZTRRAuKkpsVSd4X8?=
 =?us-ascii?Q?ioABWiDLygMq01YA6eNlHTx9Y2dYoyxme1KcizIMGZDh2pVAuJX03HzGCGYm?=
 =?us-ascii?Q?fgvP907Rw4arU+7z686JAsLt6pnwiMn0Frnpkf0e9XQvfaiuQqptWc8IqMV+?=
 =?us-ascii?Q?4EGhQFvwfr1wpU+FJYEUlrqp6mL9ALf9oiXt4YrF3LeUdOyqiyv5IcdBIhis?=
 =?us-ascii?Q?/Qj10KiulZDvV8kofoNPx1vlmm3c1Uu2XXMZIKsdSu9OiapRz60nu46sErtI?=
 =?us-ascii?Q?fBjU9v3IqXetLQVFIEMV0btfakE10wbuGwu7/USLKEae+zzDRAnsppFMRrZc?=
 =?us-ascii?Q?aYMRFI8TMfIoOC/qi8jCeSDZy/+J3TMBarQCppcJtzlS2QDVHp3Rn/VAspFb?=
 =?us-ascii?Q?O0oSSxWkgNdcJC6bd5WVHhFYIrFjTCFL6/PIGVcOfnjJQdqg1vtJcvB1NqY2?=
 =?us-ascii?Q?AXqe1silzJcriZQYwsHyqBV6RjBAaPSDQd4WAy5oQ0f12BLqGLOfbPdm4EOJ?=
 =?us-ascii?Q?b5vb4p2bQEQBEsVwHyy0Ra3ybqhCs+91RAg3QPQ6C2B7xOsWYYtBQC0obk5P?=
 =?us-ascii?Q?/U2xESMQAPvMPzGIpYu//T4iOpPF4ZHFFOgih1WlU6KIq0p2e8r6ocuUF0zj?=
 =?us-ascii?Q?n6DesaAMYZJ7MJreDAeaEQbT5xlrxZ5qN/IziyOWX5iDLxP+XLHM9c5DBX7C?=
 =?us-ascii?Q?3u5//Ll1RwhP877QQLwqA2NWw5+U78LuqCz6ZnmMd4T6GWcVx0/qMNyXUG+M?=
 =?us-ascii?Q?pxgNW46abVoRLirq9AdJPaYOPXsZaIIqvTO/BwjwDcELIfln7Ln2j99EMPlw?=
 =?us-ascii?Q?5OJfSAtKPW2bHdgdMM54RGhhjpaygaM4MhzCYMAFE0/nvK/8EurAzI1Nmboy?=
 =?us-ascii?Q?mNzRhz1SQUQJ6tpB2+h0HtIeaBRjrOwsh1ht4agdXvciAnlSZrz8hO9jRTI0?=
 =?us-ascii?Q?nYJM8vyGXsyj9QwwOFM1QA5mV7u8aNkYPxOy6kjx+AkWtqj+3dje5J2cCdTq?=
 =?us-ascii?Q?i08WCXMoI4uk/J+xfefNn0leAv6DHi7u/9pNEakgXLxD8pTsjHl5CaSGOvfq?=
 =?us-ascii?Q?9mr9QjuvIJdNLAKTweypQvGSqCTFMYDaD71VlfjhHgp1dbuGHwPf7+PacnsQ?=
 =?us-ascii?Q?VAshH34m5/cd01NUVuZE3LbY/xUskW4BEUxGl/5dbJ7q3vpFT5OgRL9+hS5s?=
 =?us-ascii?Q?bqgr1PuRArG5Hr+ypLm3aRqfwsJzHHkX4tdDWMaejQs7HFSX3A+T94bPzmAI?=
 =?us-ascii?Q?m8KLTE0wQRziYPg9Q41sPcs/j8E8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sjunOMG29EiU9Q/DjGDFJSClrVmKjGUGdHj9vUbqAMnm6VC3ep8aMMsjIICy?=
 =?us-ascii?Q?cbjGw+NIZbTJ1SXl25PLcY9QzT9jXGIUvQAxK3YZ2jTMKmrS0KTxH1j6Yg6q?=
 =?us-ascii?Q?FiumXHuPET6+S4UuCzahML2fZt3gqYZowDuETGrvzuSXvi2iDw8fNlQfj69g?=
 =?us-ascii?Q?1J8Qha5+84pWT8sMRjjrP2cA8ojmXPCmk3Mn8eHtl9CC3UOCdtt7Lmj2TqjZ?=
 =?us-ascii?Q?GqayNoBOPzH4jS4q2uWPy0SezYcICb8EnivbW3radEa3y4qKT6E/dHV+lmTh?=
 =?us-ascii?Q?RsZFpdF1+0vdpv3Awzk+BMLkoAPrP7NoEEpT1BcNyRP3iUUMD8MLWPKuFLUL?=
 =?us-ascii?Q?RkJNcqj6vK6rj/zIR92g2zVrpVA1kWNx18LutCMjbRchVyKh3akZOlVoLnzA?=
 =?us-ascii?Q?Kl0s+rkV4BN4xLKFS9WjVpPUtokhhylTM4W0OcX+7avyeTwjSEbpZNY8wjlx?=
 =?us-ascii?Q?IZYQVomTWJGi1Wt1EmMs29qVZLMDk770E8y/4LNaxvv0aPKuY1T1NksG0t6C?=
 =?us-ascii?Q?e9Bi5qoPbxmNmpz4151hacEOr+KYdGASLuz6mMxEzQ21lsxrSteAB4/u2oMd?=
 =?us-ascii?Q?uJG92qScz83nsfDzHTXwTg3smks3R0ymrxvymvzBNBlguB3zHbt8u0GHFj2b?=
 =?us-ascii?Q?yHF1KfYH0Be4yEKzpk3ipOP3UWUNZLRHliWrDZXpQXFSCeGztOUeDLUe1xoT?=
 =?us-ascii?Q?s366AXHLRE4+2vDtp3iaak/6BBSZpwjdRonnW0I6r0Ei6QwTXffbsjdWphed?=
 =?us-ascii?Q?LAtFC1kibK5ty3d+Td/iCGYP8yViUoidObSUSDw+a0ymsHFU3wPpyyP7cj0X?=
 =?us-ascii?Q?idvdshtbDYm2SJLf2+5rPOqVtV8XQVBfr+Pmhn9S3B3M7WWjlnZfyW1d11FP?=
 =?us-ascii?Q?lGFaq8r7ybLqyAs3H5UD252v0pkfccBbNGDPbHluWc3ZJowE6jqixX0RMJpb?=
 =?us-ascii?Q?Xc93JPDSpJNnVXd0YxfGFREdq9GPxF7cZuPdwpEAcw9hxFgSRpuWS+y52YcR?=
 =?us-ascii?Q?IG0/VWPo+yTRdA94D3Cj0xKzVLug876JNsQ7Uu4lJpwRBm/8qpZ/Nc+vJEvp?=
 =?us-ascii?Q?s3H4CC8nEt3NFgTvZ1Ocbrk/xX4/tdBOwTb17CCrjDcYKYG+8agk27x/fVHy?=
 =?us-ascii?Q?RKRI4zKgycgl/AzQWPbvcFxEw96gKWvcRgRY2LUKCUjU15loOCtF2Tx1pZ+M?=
 =?us-ascii?Q?Hj0xDoKvT9g4hXFEWqTcGszwA6BrMz8kg0YOycsyoxHLfbabSrqsV4XTPq0s?=
 =?us-ascii?Q?fJKojq+DkcOCsdklNWkRfXOmxKQu+gRKfDKj8f2JH0HPlbcNbUH6t7POZrWr?=
 =?us-ascii?Q?9jQTDkoeXpROSnQ4SbW8YUsHsi9PSEHf0kkF973J7XWf7n6mWmnBEOxslnWo?=
 =?us-ascii?Q?Q/PZ0WswVVo2kwt1eq0S/A3hVlNGafqXuAuo7pA6eUr9LwZpUugufCxcyTnm?=
 =?us-ascii?Q?jTZGFCn88oHLTaD7cfo2ZrdlHzMUQgwEg4jv9s+Zfl7sK9n8SKZdxMWuTP8p?=
 =?us-ascii?Q?ksUuzQz8co7j8dTyrltemEohM7VMbN005LtzfMURq6a/u+gihWHx0746GOd8?=
 =?us-ascii?Q?i6M/FU1m7B0RnpHAhzVTWR3gT3sC+b2LJfnE8HFoW/8woJSamUYoS62Yg6LT?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3882a296-88b9-4b04-c458-08dd702e8356
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 08:32:03.2411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ph6HjTgUDUdiTWkVlnUavIqrUBY5IEpkkI2oW+FbqrRmxOfhaevKWbpWKwa59ooIgjbzvkauHY4rU3wG6EmvA04DcDa4Kchn1MEBH1AJkw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7566
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 08:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6682

Hi Richard,

On 3/28/25 5:47 PM, Richard Purdie wrote:
> On Fri, 2025-03-28 at 17:03 +0100, Quentin Schulz via lists.yoctoproject.=
org wrote:
>> Hi Antonin,
>>
>> On 3/28/25 2:07 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Document changes between 0e91a1dabf27 ("adwaita-icon-theme: upgrade 47.=
0
>>> -> 48.0") up to b3c21a23ad3a ("migration-guides/release-notes-5.2:
>>> update for upcoming 5.2 release") in Poky.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>  =C2=A0 documentation/migration-guides/migration-5.2.rst=C2=A0=C2=A0 | =
26 ++++++++++++++++++++++
>>>  =C2=A0 .../migration-guides/release-notes-5.2.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++++++++++++++
>>>  =C2=A0 2 files changed, 48 insertions(+)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.2.rst b/documen=
tation/migration-guides/migration-5.2.rst
>>> index 59a2782f2..c54f054c7 100644
>>> --- a/documentation/migration-guides/migration-5.2.rst
>>> +++ b/documentation/migration-guides/migration-5.2.rst
>>> @@ -178,6 +178,32 @@ This should now be replaced by::
>>>   =20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 UBOOT_ENTRYPOINT ?=3D "0x20008000"
>>>   =20
>>> +
>>> +Git fetcher: support for multiple revisions per URL removed
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +The support for having multiple Git revisions per URL in :term:`SRC_UR=
I` was
>>> +removed from BitBake, which means the following syntax is not supporte=
d
>>> +anymore::
>>> +
>>> +=C2=A0=C2=A0 SRC_URI =3D "git://some.host/somepath;branch=3DbranchX,br=
anchY;name=3DnameX,nameY"
>>> +=C2=A0=C2=A0 SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
>>> +=C2=A0=C2=A0 SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
>>> +
>>> +This was rarely used in the core repositories, and this removal simpli=
fies the
>>> +code logic in several places.
>>> +
>>
>> Can we suggest the user how to transition away from that? What was this
>> even supposed to do?
>=20
> It would only have ever been useful with bare clones where there wasn't
> a checkout. The only user I know of used to be the kernel recipe but
> that no longer does this.
>=20

Ah yes, was doing my grep in git history from bitbake repo instead of=20
poky :)

It seems like what we did was split the code into a separate git=20
repository but I assume we can do the same by having the same git repo,=20
simply in a second SRC_URI entry.

git log -p -G ";branch=3D.*,.*\""

followed by a search for \.bb, \.inc in the pager returned=20
c29aac6a8b5b417ad46f3cdf9c1a2d61c4f6cdd5 in poky.

So I guess we can say:

"""
If one of your recipes is still using this mechanism, you can split the=20
code source fetching into two separate entries::

    SRC_URI =3D "git://some.host/somepath;branch=3DbranchX;name=3DnameX"
    SRC_URI +=3D "git://some.host/somepath;branch=3DbranchY;name=3DnameY"
    SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
    SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"

"""

(NOT tested).

Cheers,
Quentin


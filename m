Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77848C25B7D
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:08:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web10.16515.1716473323506941097
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 07:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=DOaaaQF6;
 spf=pass (domain: cherry.de, ip: 40.107.104.100, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNjGJ7gyiZoI8BCW3cTvjVKO4H9Lg1FvvTFggwwe3JJEtwg/C++T0a+scKQSU1IoX/k+vU84IaiVEZpkpxjPY2sAUdIqgkfRFQuvwCOec3xtgRqibzFyXmoKROs+OGwuIA0CMF+YxH375869rNdzLHdpTHbKD1Oi5bVE1ZrfthNgd56iwHqzrLzmlf+VzAxjhtSuA+4gXA3hvosGoBqxpmQoZotr3t6hqhttay5rBpiCfbekshNfR2/FGwC7kk7qLfPrZXf8BBS4TdTvkJr4tlDnSgcmx62jHXxOm6RbOmPofC7zJ24GnefoW8fNLbZIusZI7vJ7VNjpCH7Hmz/fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvnSE8t5PcmtlWXTAGOmuGdsTMSjkUK6M44TBKktfDs=;
 b=KDX+JbVlN0TGz7cCx0YmoPgdHTtHZxDb458LEOFzvG3JHeXfhz1OBwFFHTFi+kDELX6NXCgC7xu6VU6hZgWXX9LMkgTMUnftR+C+s0wl3dFwWizQWPok93wz07q3jxT5XXDORJ5U3EzYoDkgeiMo68bNDXuEgV/6aVf5pK0BEgzz39zIsAIUjsRSSR0hndcnGjOTmGxq4iWapdX12s6vv6FZ7MrauDK0ITD5TEbSieFnAgp41BVMue2B/yCBnt6JTjdTIqcTmqHJrxG5PCwP6o0FuxMDL8Y/nlDvoblUd0YIo4OoAMO7bmtTgFinKRJrEV822GPZTfvwHRVzr5AviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvnSE8t5PcmtlWXTAGOmuGdsTMSjkUK6M44TBKktfDs=;
 b=DOaaaQF6XlLUglxJxkiCJNTl+JOkO5PUKbdfFp5bb5089zypEQ3vwT6OIpRManbYrvtNkCmNhmzXxH7LHDmt0kyFeByuUdK2p8uM/egnkyqQDtMrGV2Avl7zMwpOxoMfyXswN3CGJcmO4izCADsIYA80K4amLJ1Llx11dPc+2k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 14:08:39 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 14:08:39 +0000
Message-ID: <b927fe24-0d38-4fa6-869f-aae66036a5bb@cherry.de>
Date: Thu, 23 May 2024 16:08:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto] Workaround for uid_map error on Ubuntu 24.04
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, ecordonnier@snap.com
CC: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
References: <CAHUKmYbx81srtVGCh1iyts893T7d7Sf44fgq+MTaxDSwMsXzZg@mail.gmail.com>
 <c21a8c13-98e1-41fd-8c05-d6f25023ed45@cherry.de>
 <CAHUKmYbp8K0J0UkVToq=6Aiw-mB9hzotO1_Xd05V7QB=v2Ev8w@mail.gmail.com>
 <670bf859-e9ac-43c9-a566-482f26c1b27b@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <670bf859-e9ac-43c9-a566-482f26c1b27b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|PAXPR04MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fd15cc-188b-4dd6-b0f2-08dc7b31d846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tdgKQbz2WPujxrs55UVJ/OgRJd0pvNn/eGoE932dMLWCC/hUOdfF/hlZqjf4?=
 =?us-ascii?Q?wjPTojdDbbNPYIphmnKaBWY7zRAvFCrdCJCQ+aYyCWz8oMd7ZXe+YLVQC5V1?=
 =?us-ascii?Q?wP14MKgpuILjEuAsoLgpAzQbN4SjBprtLysQDlTrzd8eXGyPnsIuR6/G8O6v?=
 =?us-ascii?Q?zTLvYijEhWalv4wTJIPMQUIUKJ0r0jNtLjG6/zZtFy0Na0sk+D61FO7BrlmL?=
 =?us-ascii?Q?xlaUUCCQyAKCcfqXy0K4ra2gFIK/Glb5RDuIGRYDjgbE1Mt2rRgLXgY97tWf?=
 =?us-ascii?Q?S2fG2paB1UNGARlQpc5APjhhmEfZJjd2adp3vMhZmuIE6VRBN8SZnydc3m9F?=
 =?us-ascii?Q?9gvYt+o/uKW2ZoW24+Qs6H45b9lTMIRxtSmB6SqXcRpfsxeorwsCtV8j85Rq?=
 =?us-ascii?Q?L+xdNhcy2FEjmwUmaSyfwxdjGGfK0xcvM368gZXl3RSCY91+RPni7pnr2wqR?=
 =?us-ascii?Q?oNg6H27HFX+VHYscvM9bmh0xBGzvJ2rUf+1jYk2rH1b5nObrRLMkAuN2tQHC?=
 =?us-ascii?Q?eWPlVaIdv8+4lZKZWen6uofdvC9xATeoeQ+w+PA8WNFytHj9mJbU92yKrGku?=
 =?us-ascii?Q?yeyvt/NU5y732Bn+4zQtLbm4oZeN/jbVVG0rpL1pzfPMthNgvIFzS3ZZlNT2?=
 =?us-ascii?Q?mjks5+MvGAx6tIgJ4AXDkL/yWJXLD2XiLGSrNN4XKv04A3yzSlagHOyL2mih?=
 =?us-ascii?Q?x9Le4MjHP2Zkvs2tI5NdtvgrEX3scecBtf+h3L4RWAelVYgxU9JxPQH/M7cz?=
 =?us-ascii?Q?yF1LmEdPpmIfpAg70wbbmkS44GJHY7V+cmpGrr2/i3HQmaCKQOmjGfZzdHyy?=
 =?us-ascii?Q?rR2HWUo6Qtgc18NXcAEWn3p5yy5ggkzrRzyGD8X2/nDZhbCzeQ00dCGU3uXT?=
 =?us-ascii?Q?rm/QQab+aYNMDAhDCQOKvFU70jvMQ6ynAmBMmoiYVOjSm4+v2fkWSvR8D6gu?=
 =?us-ascii?Q?5WaJAYHzuEhV6e40mrvFffzjg1MJq2OCtdH7B3jD/pGTkB5RIDZquOPwLA90?=
 =?us-ascii?Q?tWqm+yp4MlxjlbspDeUABhD2lbLeYOzaqoL74td+veH84lueYKbQz6VdzCGw?=
 =?us-ascii?Q?nI1cMxIvsAgoIq+ZXKbsdXCZUsUWNOfRjAZ4jZMHIVOZQbc58Mrm8g9Ktv7I?=
 =?us-ascii?Q?WLMkY9VNguWngvu5YXZE66SoTg1dvfbrAxceG4Cuw0ke6KFXHz4FU2zQiWXj?=
 =?us-ascii?Q?g0iqAo3odp6TYql2SJTkTP8Yly5Q9G3TT5m6C/DY2eyPz4hQjwyZNsqVbwL8?=
 =?us-ascii?Q?fKznNKZp2FiJlVQNpjcP6OkT/ogNeTuuYnCaD2Ml7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rxDREOPPWfFG3tjOVHoDLljrKImjXOkm/WE697873hmOQjNSybbv1dF2ozc6?=
 =?us-ascii?Q?gflvD1xsbf3M/lh909JHo0R9sZcChYvrI/tPFpnRjRQKwT1OKkTAnJcp4ke7?=
 =?us-ascii?Q?PDkMJoRBr+C4O93Q4VwXGbNWaWBCbqnvz07LaPF/Dk3na//ptiWLXXl/Pe0O?=
 =?us-ascii?Q?Mnwx5sT8alaaKDZrDPeiSDSRavX+pBHkMFQycngHxGGxJ2F8pU1/eDOtjlGo?=
 =?us-ascii?Q?KEZjkM8w7AYrrz/zH5giNXiG9LnGF9P/3W6c4CLne5OsIJdOnQThc8nyMhas?=
 =?us-ascii?Q?MWBhBCu5rO2+ohry2lwobqtJBcc48bEQaNHxSqJDTyhjt3XoJzbsCeuQl3/R?=
 =?us-ascii?Q?nktXSE+L6aRl8BHLyYtRfyRJs3xBILiKw+9KuoqzvjJCZKD1zscFy+qwfM/r?=
 =?us-ascii?Q?NkNQYIOHOhA33m/vCVOjCruCH+1Ic7/uldzUDYqHUX77y9Niu6JrUg3Szv2c?=
 =?us-ascii?Q?6h60yNDDMuhgqrWcEdrredkHLLqxnZ86NXhivKyzJe9WMJba+NI1kFNi6+Pj?=
 =?us-ascii?Q?XRMiTgjmeaVHIm/fC6yeHJWvsgHvpiSVijLXJSfcdNZbaBlWxxcwzPW59q3t?=
 =?us-ascii?Q?bzwjUuoneH/BvHsvqC8GVXNHGtkm/djId9GTmUkbuQRoLtdhFkbe6DIJ77VK?=
 =?us-ascii?Q?kbE2x1S5M5d0Hd/BGlZh+f8evGXgfUuz+6in7BOSJppce29J2c10i8UfEStf?=
 =?us-ascii?Q?X0VlcRkdkp9TA+2iTe49qCXkt4yjC+gx9JeVoE1s2v1pYVpWSAy/xvs+Gin1?=
 =?us-ascii?Q?1ti/mQESTxpgA7JvMKSWIjULnwdVnSj4Zac5GHHfq3zFooWbF0UDPwAHFLhA?=
 =?us-ascii?Q?YvzwRTHoEoQ6xIKLowZ5zQP2g/C+yu5TNEmKKJFRI9WvNTvxaF2c+iLp8Ge9?=
 =?us-ascii?Q?vvfF2MMvev5sA2TEJEHQo7GkaaBfD+aZg3afFqTKGYxVmJYhuvZFrwDVtd03?=
 =?us-ascii?Q?WMQFFwsJnM7n1ZHSWncbqfdsJUcll4NbRg/LPnCln/PRA0aAbqQvkGMACqDJ?=
 =?us-ascii?Q?WvAkQtBJhynOUgBd7cdZ09v7rUu22bwbm/0Qt/OSd7OrURVyMPMgL/kmEDQS?=
 =?us-ascii?Q?FnYDsuxSX8XxQ/7iDzfPdKsb89kt0msb7lmcavenRGt1XFSVasNRfBxPWUTm?=
 =?us-ascii?Q?+03LfjdnkB5SoVLVLnRZyMD6iKEWncS1qOvl9HaRToQs7AwtOcyhDQ073PY8?=
 =?us-ascii?Q?QLvsyaeQtx+ozbIUkZ+hkLqX0cjPeN4zZVBs1KQshio06EvxLqxiuc09K0vA?=
 =?us-ascii?Q?vUuPDIJMf5R4t8fDw6mYcCh0b9ZUDq+Apc3Es4EpHFgANXf/g1UyXzWGyYno?=
 =?us-ascii?Q?mpFKYAC1MZZLBlbyuPShHi1uLDKS+aOOpUpN6seFj8+wsTyT9h0kh6OJX+6b?=
 =?us-ascii?Q?w/6a8bzDOco/ALTKtd+/ngyni7ZN4xQeAILMlzPL5D7hxBA1GO2DR6cV/M1X?=
 =?us-ascii?Q?hboh4zD3apQv8flkdbY1Vga7DY26PNBi/iqB1Ps8ffq0Ud3i4IYI7Uv3hvGw?=
 =?us-ascii?Q?I/IQeQMgYCMlku+CBNKkrbD0p4qHaHH/bW9mPp7iV+4g5mw25pu+mb+Zvd4a?=
 =?us-ascii?Q?YTIAWUyqwoyfUB/AlsjcsK3QNWBh5WoZag1O7+zbNhvAf2PBaPxFAczppyyd?=
 =?us-ascii?Q?MB2t8t2eEiprn2yQ1wlV4DI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fd15cc-188b-4dd6-b0f2-08dc7b31d846
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 14:08:39.2993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQQVaLTxEOOmD8rTay8QlAX2WenxXNrTL0xfOZAhvjpbUPz0F6q0gHrDCgdP7l7yYv4qpWpkY7bob1WhlLG5SAnnbxv/2s6/mjo3XKPnxCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 14:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5246

Hi Michael,

On 5/23/24 10:45 AM, Michael Opdenacker wrote:
>=20
> On 5/21/24 at 16:31, Etienne Cordonnier via lists.yoctoproject.org wrote:
>> The way I see to patch this at the=C2=A0moment is to print instructions =
for=20
>> the users to run this command manually when this specific error=20
>> happens (we can't run it automatically as part of bitbake since it=20
>> needs=C2=A0sudo, and also it decreases the security on the machine=20
>> so=C2=A0end-users should be aware of it). I can send a patch if you want=
,=20
>> but this isn't really a clean solution.
>>
>> Ubuntu 24.04 is not yet supported by yocto officially, and I hope the=20
>> Ubuntu bug will be fixed before yocto officially supports 24.04. What=20
>> people could do to help at this point is add themselves to the Ubuntu=20
>> launchpad bug as "affected user". This would raise the "Bug heat"=20
>> score and hopefully will increase the bug priority as well.
>=20
>=20
> Right, I don't know how to document a workaround for a version that we=20
> don=C2=B4t support yet.

True, I was being overly optimistic :) I assume we'll support 24.04 at=20
some point. The issue I foresee is that some people have a tendency of=20
not upgrading their systems, so... even if Canonical fixes their own=20
stuff in upgrades, we may still need to document it?

> What about a wiki page for work-arounds on not-supported-yet versions?=20
> That's something we could refer to in the documentation.
>=20

I'd be very happy if we don't mention the wiki page, nobody maintains=20
that sadly (or let's say, not as much as yocto-docs :) ), and we=20
had/have heavily outdated information there. For the time being, we=20
could have it in the wiki yes, hopefully web search engine would return=20
it when looking up for the error message/keywords, but I would try not=20
to add a link to the docs. Once we support 24.04, then we could document=20
it somehow in a note/warning/info pane?

Cheers,
Quentin


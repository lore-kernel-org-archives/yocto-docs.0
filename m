Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298E5C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 12:13:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.web11.48187.1748866411800597866
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 05:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Izr7Thwr;
 spf=pass (domain: cherry.de, ip: 52.101.70.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNCzHLvuEfFvVGoQOEFsDp6szgsCxqX61BbVlch2padIJv9oijYFUs02WrCnLkPfR8K6xytzmB+f6b0Bpc+zKeYnYKXVPLKTjHcY+NfQZ2ZS9hZ0DO/12eZ0GVc4R6lm4imqBH32J5pLtdykt0lqMooWU7j6KPLXbM3ZqRVuMAReNPkU+8AUEDfqpqd/Jlzq52E3j49Q/WNxIvWRbkDnIgw/IUe6UYkMGOLAGjYnD8zd88XTmusX2iTA2pQLhF2TEFjuHQEBB6LcDBVcSV4XqYp+T9jHhvjOwokqM+z/oWpG+UvJUwR+En/xNWedT6rrhn02wJDmMfYQ+d7D39+EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PpYmId7QJf+7OsrEy2CZdIWkmj/cKEgJTZn84yjTX0=;
 b=JiRp6yLjVgCjVG2e8tKIGQq/jASmLl6ubtSdp4/45F49MCBAtx/xzy5X3odcrJnJGhX5RAnIqSEvKdmB0z+eXIen+g0I4vqVnL/WuA2Ryzd/A7jgZnMJjhh9bWypGW8YPkTWtNJyhgO0APEh/bYfUr6ZVr63dYXHAGjSsy6rs9TRRiS4153ZqHvu9BDDYDfpxTUx+mv/JIAYZKV2aNTugUcMjfGGIWOHOR3Ky2b712+tEncuNp3Bg9FhCNjh4O3IqFUZvHRV6SjXr2/+KgOrjsUBRCS8hW8rP2PprDtwvCjWEG0vpMl3nt4J6E/lCUuH0OadJM/y+VjPAVHE/CBZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PpYmId7QJf+7OsrEy2CZdIWkmj/cKEgJTZn84yjTX0=;
 b=Izr7ThwrgtA74SjAKhgQ3LNoc2FqTibsnMkdywjJ6Ibv5dIEFx0JVceb13fSpAgNEkiwJaaUSwNl7f4SjeoNkPNgsgWGugvBKGAZMpvs65tljj2BdnxP+r4DlVFPm+oRCmEHYgLqLAQZGTw+777tBG+RaO1+5+sxlM1WmF5HyB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 12:13:27 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 12:13:27 +0000
Message-ID: <f1f36310-6338-4ab7-8754-47a59158d04b@cherry.de>
Date: Mon, 2 Jun 2025 14:13:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] I think BB_NUMBER_THREADS explanation in bitbake manual is
 "backwards"
To: rpjday@crashcourse.ca, richard.purdie@linuxfoundation.org
CC: YP docs mailing list <docs@lists.yoctoproject.org>
References: <c7121488-35ba-93c9-7734-d7e80165eba4@crashcourse.ca>
 <0f71b6fcdff6c9a7d4d56ba525ac116e552bb753.camel@linuxfoundation.org>
 <12dfe18d-cfe3-eab9-701b-fbac4047a8a0@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <12dfe18d-cfe3-eab9-701b-fbac4047a8a0@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ea04bd-968a-45a3-48f2-08dda1cee11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lqy5Fg1NN1QCQYRl7w8GXP8zdaLo7rALVOiSgaGKi6mxRVD6tdhENGPrtMeT?=
 =?us-ascii?Q?wPo5vc6DRR2ppTrrazVo8D6GL9trXoICTF+W47Ow/0RMPhpl3o7yHJZ+2pJG?=
 =?us-ascii?Q?F2fSzG1AQK0KFjfvSnt0S9QK8fuzJUXQbhx8VI9vkoqFFg65i2fS7FQyukyZ?=
 =?us-ascii?Q?j+OeMZx/71ghW0oTEd0nakN8yu26E1PKKfDRiPRzUb3y5yssQ2X0dmUbdI3q?=
 =?us-ascii?Q?8BwlrBjWavpNPQmQ96fKM8D9w3p0SFY+cN8hhfqr2mJQsKpURph1HdL002Go?=
 =?us-ascii?Q?5/AS9mnG4fcY8FD5SogB1hpABkbGiFxgBFAS9X1/V8U/F16OUBZoVr2CP/lb?=
 =?us-ascii?Q?2uCjqSbBBxWI29QvtoMvUJaYXe4HKhKAYEvBsq4bZX0Njgeaail5fJAPemL6?=
 =?us-ascii?Q?9pnzMRTUC8geLxd4ympSLFTibk8pd8w+C6GsQQh/W8YqSxsGQK5aMONvEjNU?=
 =?us-ascii?Q?80q/rOLU4CpyGKC5SzRksTwY2QULnB21f6ZXmGbjsVCDcY8KiXluFGD1ln+T?=
 =?us-ascii?Q?q/w4+HDzufSmCoBZ7k+yisWe0+sRcRgMVaZgXZHS8hLZQaHU0rfphK9gyHW5?=
 =?us-ascii?Q?WjEPqPUaNLuZeWb+SiXL0qiF+cO3+rqea0pYr8jMma/W92riO+UTKVAFqhcK?=
 =?us-ascii?Q?hkFetUva5HeaJE/DNWaBHO56zZDsmF00sAr/N5pi6vRHF76IQydoeshvAF3+?=
 =?us-ascii?Q?vTm+c8zo8Nyjjgi0iastvAHswQFWLrhlvCmp/dFIaTIv8fLtVOJh/uH8RfRI?=
 =?us-ascii?Q?yVJ6KNbda7HWdpl49nQoKK29xK8gsaO8rN9TcArauF5vdm0wiqu5Df7e8Azg?=
 =?us-ascii?Q?4KR1mVaoEslxES1UQD+L4u8wWzt4U6OarUrqPrlnO/i9n16RrZ6yta8ClS08?=
 =?us-ascii?Q?ptrkofHFx1hg/zDtSO9YWyYtI0DECu2VzupWJV4m3FkUqC+lDSt88v130+56?=
 =?us-ascii?Q?vWwPIbDkWBrLZkPp1AifNc35SGHUOItxKPh1FmcPC1PqpiLfLnStJ9wZkv+j?=
 =?us-ascii?Q?M0XGmPs72FINpxTmJWJjpv9wQKpJSkMKXzeI7ULp6i1IPBL3eRvOoumX2jVy?=
 =?us-ascii?Q?XsiyhCc1sgQM1LAEC6golF8VonpANZ6gdg5vnxFyp5HkMrD8LRiypAhaiuQ1?=
 =?us-ascii?Q?yyWsqClZAyMs7pGn5Ryp7syGu92iGn4oktVKCSk8ZOd9CKb3/Er1RDwdUDvk?=
 =?us-ascii?Q?d26x41miMqMHDVmVBS0LvCM/cChHaju8CUELS4ZIfh0Qf1hzkB6G86OI56U9?=
 =?us-ascii?Q?x6eZx8CNaseUgDc1SNMusa+avVik840nc1mQU1luc4huDHv/di10DeTWAcZV?=
 =?us-ascii?Q?zKg30halmtdIZ1cxXQUaPq7vTcqA83PjfHkQjK/PW68kASzB0hUmTgpBh0xi?=
 =?us-ascii?Q?00W+EGM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/UV93sV9WM9i7sU3jaI+VHDLHHVtuv5+U0P2rT3AMhW9nf52VzGEVOvNOS9H?=
 =?us-ascii?Q?gzlCanZYb2bBHAtFdVqHQ131+dM7oy1v0R1+g/V5Qz1dwHCP309hMa7AAm6Z?=
 =?us-ascii?Q?WzpwxKM2VTxxZ58x7cQ+WdYjfopmebEV63LO/LGButqXPGoR6re5T8BugYxX?=
 =?us-ascii?Q?6z3kkBGu9RTXEvSN+jZuHJ9fi3VeWIx3/O1n9DwGyKUqyzHzDzr7h0L0h3cB?=
 =?us-ascii?Q?DZYGurBTotBN7T59/7J7tSN9b33LDmiRgmISxG6DMPzGGmT+hC5Ht6u82Is7?=
 =?us-ascii?Q?nnPGR5uxz7I395+IkJphLUtKgUOJj8dXbqq9qfLV7vVU0mbMAIwfH6yretaB?=
 =?us-ascii?Q?lgly/Ry0ifeI84KCZ4GY+5cRhrPU8mjLmWqr+p4uCShrXJmRh9wgWfCG+S/x?=
 =?us-ascii?Q?5xnQ/L8xPkMIHkqZBJuHyLdmTSQ8gBLrZ5iNKUEZN0tvnlsFXHTgEi8jpdJB?=
 =?us-ascii?Q?LoBZh+FvtGno1iFBez7ZZIIwwFMQNX0IPcyUuwnIZRYLhBRLnNhDQFu8xKmQ?=
 =?us-ascii?Q?I4BPzDVcHSnNqRvu5zg4mn1ias9pKnYtbfQilQHb0bK+QdEnvEN+6WXc2nY0?=
 =?us-ascii?Q?35hqvZbUPmeEbfL8GgwCfWe5KOkHGGsc56Gz7IQc2Zn1FqarVRSQDZz7txFv?=
 =?us-ascii?Q?Rl8whJLk66Ki63XzNMYYM6Zpkn6Y0yKWEZzYjoVx2hkNJiHW4IQvYyw1SWPY?=
 =?us-ascii?Q?kpmTzT+GL1XeREiYKmDl4+p2mxrplQsHEnInywh1f910WyCo+kqxtnEcOp/u?=
 =?us-ascii?Q?jVeoAJssq8BiPB8sszoofs6rX2YX9Mo5F1SvX00kTGw5orgKUKjAI9DpGUUs?=
 =?us-ascii?Q?CF/H2rBJlTxN6h4Zr5f/sO2/HcWlaYugimKafy9FMII/vV6NLjCS0t7e2HCA?=
 =?us-ascii?Q?4HEiEmDxISF8p3kyCTrT1L5nmFI0WOjBRhEiaRk6a0mELaTk3o5XTz3P5OYL?=
 =?us-ascii?Q?F9y6Dhi0AwKfAFhzaNv1bO5Zc49nFIcPO05/nPp9XtxaI6+e8ZcN67ykBHWG?=
 =?us-ascii?Q?7U6C68zePJDUjV6To4Xw+hOpkcLI7w/lyqeOXNdpFzxjG2CdOqxDHB55vBqb?=
 =?us-ascii?Q?r2OwGPbD7dM9rvsQe3nNDIkTdVVell2OQYkiEfXvmUKlMjmpB7OPF5k8Zf40?=
 =?us-ascii?Q?nMaV3Tz3v4iODrlesZKlhFHc4JU0er8cz/jTeI6OACn28xRjyZVBr+4vrt+n?=
 =?us-ascii?Q?I8jfAXGTFj47gW60D21brJgsSX+mU6b4xnhZBbWdaqqmwwT1UMM05pQeeEnt?=
 =?us-ascii?Q?ueEAb+HnX8AeqyKSkLTV24Kangy9Q3jDzVvdLurpGRcz36/n8lTZPX3aEUxq?=
 =?us-ascii?Q?D1p4TwNTUgFkN7UEnkblQ5D5DfpRNvWQZHcuGur6uGTrFzuzhMR736gGkxe+?=
 =?us-ascii?Q?cEY+YwO4kL4LJGl8EY46CUJ9PtYBJdAynuJUXLOVmSabQZlFB3SdRg9PTsE9?=
 =?us-ascii?Q?HFVlBv+Sjd6pmhv1Jc/vJ8gFSwUsEg8WUzK03Lf75hQIQoZXz/MEkoVKkWxe?=
 =?us-ascii?Q?Bn4KXHu+RwqgAqGgBXuERqFctPOAZXDsFZWU0SJoKPRmj7J1OgoeqHXqiDnv?=
 =?us-ascii?Q?/nqCE9HM5xzxQw/3RzhMxLKTSNHHuOZzP2JKI5tm74xTzqWQcWAnPzsQ8Lto?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ea04bd-968a-45a3-48f2-08dda1cee11e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 12:13:26.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96ARtLxPfZ8pE0NbkHJvDhj26yUmclMhqp/ArPcD18FSKd765zLeFXuS6psPCN+DqRizJ+R78WZoN3qvyd+7UpApbIgK3hDxI2frgdvwDNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 12:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6971

Hi Robert,

On 6/2/25 10:37 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Mon, 2 Jun 2025, Richard Purdie via lists.yoctoproject.org wrote:
>=20
>> On Mon, 2025-06-02 at 03:57 -0400, Robert P. J. Day via
>> lists.yoctoproject.org wrote:
>>>
>>> If you read the early note about BB_NUMBER_THREADS here:
>>>
>>> https://docs.yoctoproject.org/bitbake/dev/bitbake-user-manual/bitbake-u=
ser-manual-execution.html
>>>
>>> it advises the reader how to *maximize" execution parallelization by
>>> cranking up that variable to match the number of processors. Except
>>> that in the OE and poky layers, that's *already* maximized with the
>>> use of (from bitbake.conf):
>>>
>>>  =C2=A0 # Default to setting automatically based on cpu count
>>>  =C2=A0 BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
>>>
>>> So that note is advising the reader to do what is already the
>>> default.
>>> What is missing is the rationale for *decreasing* the value of
>>> BB_NUMBER_THREADS, to dial back the load on the build system, which
>>> is
>>> pretty much the only reason I ever use it.
>>>
>>> In short, I think that note would be more useful if it simply
>>> explained the purpose of BB_NUMBER_THREADS, that it is already
>>> maximized by default, and suggest why you might want to *decrease*
>>> it.
>>>
>>> Thoughts?
>>
>> This bitbake manual has no insight into what default value OE gives it.
>=20
>    Fair enough, but I still think that advising the reader to try to
> maximize parallelism by increasing that variable should be accompanied
> by a suggestion as to why the reader might want to conversely decrease
> it; otherwise, I think that explanation is incomplete.
>=20

I would suggest to look at the glossary we have in the Yocto docs and=20
take most of it (and/or adapt it if not appropriate).

I would even recommend rewording the Yocto docs section once the BitBake=20
part is merged to specify the default value set by OE-Core (+- some=20
specifics, haven't read the whole description) and to suggest the reader=20
to go check the BitBake's documentation for the whole explanation. This=20
avoids duplication :)

Cheers,
Quentin


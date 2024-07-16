Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DBFC3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:23:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.123])
 by mx.groups.io with SMTP id smtpd.web10.5287.1721114599999085217
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 00:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ZOivg1n6;
 spf=pass (domain: cherry.de, ip: 52.101.70.123, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMe20Te1vw+2zwTNtp+Hgyt0cad6md1iIDOfz8aJf3LaNWNC3JuAGMoVhTVZWWue0y9VkAdB1iSZY34a+ma7eQRHGmhee8x/y7h8IgXHiUK0yvbc2s6dr3Odj/3S26K0v6HZJ+3/w1lKpAesg46+7ig6j5sKu86q3tykjVBg1JNSFvWqBP68AAgToQ9iKiSvbNS40ij3Owvc++EURY3FQZ2uLE9nLym8774VmR8EKWBqdxsWf56ZjY8WaNBZvshoZVaNILM/Tq/fHZ2CZKm3RdqNesJh0IpFTUKjRXFHvmRy3cnZLlXIOmMiDLkxMiaSBB6X0OJF+CGHETRtMaM0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jorYXSoYKDoQCcDltiEXM4K8hIiwh/5y0WMB4FneAEw=;
 b=wOPwZDXO1KnYXjhRT9LzY4ZGoAZv7ZdS6OvYh0mkhD3ctjxmFG5e8bRVJx4MvA6FPsBg6fcER3SYfwJZaIuc125417iY/p1gkPQxNspzxaqZat2uAOTO3mI90+nqXgbcCdv0MJyUmGrK+jmPiy5LAkej5IAAJaoi+S9ywsHyeXJtsZxwBeJdQixxVnKCpc9oZwX63xtoX64c82QAM+RwoU6SjQM2yx9V6rCcAIdAxyyD1FpyGfcF2IZE6A3FMIBun4nujV4BJ8O/VVnQ4C9W+ZmaryuaptvLGlFw4DtrxQCTysUR4NKgwH97ndBAJXVU0h5ejngquWFHJEg0mX1oWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jorYXSoYKDoQCcDltiEXM4K8hIiwh/5y0WMB4FneAEw=;
 b=ZOivg1n6uqUkE3hMvN5TNUrDJaQCfJ5qEgvS6i93s3JnLoqlm8d+SKWNfMNYPr8CywHknF/rTOrYFI2i1qKUCAEDOHevVt3wZZ79MFvQn/XCuv//YOGMXdVGyEXGsztLJaLz01aZzaY9a24qvwT+orzQtSbnrElr3abtb7zxOHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 16 Jul
 2024 07:23:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 07:23:13 +0000
Message-ID: <0b7fe969-ced3-478b-9443-2d8a77e0b111@cherry.de>
Date: Tue, 16 Jul 2024 09:23:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix typo
To: Matthias Pritschet <matthias@pritschet.eu>, docs@lists.yoctoproject.org
References: <20240714210908.3964010-1-matthias@pritschet.eu>
 <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
 <a83d7875-9faf-47ff-b786-698df9d3dd28@pritschet.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a83d7875-9faf-47ff-b786-698df9d3dd28@pritschet.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: e29c8359-827b-462c-09e0-08dca5682719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ioFWEhZcAabje9aM521BSmmViNKJAFwBpDC3oYyi33au0ybkn6TJWx4WmoQv?=
 =?us-ascii?Q?OyioFT0MSb2PwgmczpTzHwjCoMdL0DJwMJ7QCDZIvI/VbLViqiMlXwlsppb4?=
 =?us-ascii?Q?fJp74ALJdeZfPZsW+wLZMYSf6YLeLr4D2JxxkKfHMTJ0++lP6HM7zTe+0Gj1?=
 =?us-ascii?Q?fe/Bl8QJLTKdzRt9F6pjmZ/4yp8Ql07FsVwT8edSFadpNP3o8Acwxv2nqG5P?=
 =?us-ascii?Q?R7EhNq7W+hxXtPRwamrrRPgTWe3Y+oegHIyQpz5kbphBiKpq+XFPw6KYIVjw?=
 =?us-ascii?Q?0m1ZxnrVYsm9bnFCwLmCOl1DVZnNdod3L+TIL+Qs00OvVrfgsaFNwTP5YWsE?=
 =?us-ascii?Q?1TkpnN58GBPuAfEYQYvU8XRHHIReZHZs80voLPXBY/zUhHMZ2lh7kol2KGBW?=
 =?us-ascii?Q?QYpn8/pmc16qohnTYsXHjnlE6Aqb4gUaEoNQdoCaJNZR1/xgQxACWJA4Rfad?=
 =?us-ascii?Q?+K2InULRO780U/YTkyt5cG5hzf8Nke5q3Pnf8DXzetUKfqzR8n3Q7jwrOizY?=
 =?us-ascii?Q?TgA6YFOXpkblcGQVbf86747tnRMLpl/Ce6BpPGaQPcweYLoZxB+JGUNqreH0?=
 =?us-ascii?Q?4hvRNIInVQAmjPNjKPKoFD9oPaR2Quo6hvcoBAe7SVpzTOc5m7g4vGmruauB?=
 =?us-ascii?Q?2IJXt9oZZPFWfaCdyqj2e+MGthU13lSMZLA9lmgoYAE+tktg2nJjGktkOxEw?=
 =?us-ascii?Q?DnfW+WRGj1/isk9Wn35VlUQB0TpKtPuOHoqTjK0pb3xOYylkUAxK7hS8/vm2?=
 =?us-ascii?Q?Q94GO5SKiktbe15NZBDc1tNTZtukBfWJ6p+jDrfvTMhPQoYfpJNHVK64s+uo?=
 =?us-ascii?Q?tII8pgxRoynzvsjvuvG7PNm11Nrinx8NJ/PL2QUI9hqVr7N3mXBR1HTml0Jg?=
 =?us-ascii?Q?+htBOHyhYr8ETMYpFuZtBKOHRRWxw7vPiShLeOMLkDhWNdZn3gdNTWAztyyq?=
 =?us-ascii?Q?iZ3FfkqlHaZudBNptmM2XCLGnMA+9jFQyb9KWEmxOBdwW5Df2SeajUdF5BTY?=
 =?us-ascii?Q?PHU9AYBw6tkwCnf5UhxasDpUyQ5/IfsjTpH7V2PKAYDictIzsA+XjFkmp0i1?=
 =?us-ascii?Q?dh/TEA4MVHh3FA7juvI9KbUcVf5UaI4lmz83hb3NKlRrjx4hXHKdiuvIuBJ4?=
 =?us-ascii?Q?uBXflPvbVbi2Ra1/g0hFN291IxJGfOPfKcp0d6mlgLsUzEbKb8EamZXh8QdV?=
 =?us-ascii?Q?TAkJSLl1aPapLfiHebg15LfpCXwKyB5SnJaBr40B6QzBj0k7iYj8Lkc7ZELY?=
 =?us-ascii?Q?pm7w2S2EOvVlWyzOL7DDa4mNT2QbpmBdSZeJ3HySI5D8rzXTXuB9pGoWCdG6?=
 =?us-ascii?Q?jV0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0GTm+v1hk6Dn+4dtbIywVTsyY/ZRDkP6MsRdCG7pP22P5MdQl5/1bfaPUth/?=
 =?us-ascii?Q?DP91w/QPELQAuquRqdngdG4xXzlpgf15l3ifyqZIRqwlTSDtIYGxlfbrYl/6?=
 =?us-ascii?Q?JD0TowMIlIPgbslfbl5rOfShE0MKUcFw2g2/K584BHssiO9x+EaYfPsZySk3?=
 =?us-ascii?Q?7GNbwUtsIXS71/2tsRcaNxNyWxL1SeiKjWv4b1QX++ZsizwelajjgcbX78Hy?=
 =?us-ascii?Q?ggaXJzadza/ppRy1RWdZ5FCqBFMQGAzSEaOM1pPXtysd0NBkQ8QfoWve+CUB?=
 =?us-ascii?Q?e9/TzQHTOv0k77M457suzNrFT8xL7bCbY2W0V5AaFC8HqOOGgPZHR+UOxbQz?=
 =?us-ascii?Q?OnI0weds8+Q2sc8XhaQ1cB2KB3KHq59bFZ/T/3iciKb24xoemUOQ5EAy4emp?=
 =?us-ascii?Q?SRcMD5CZAo3NOScYrG1ACWp5Ifz3N/Ix/knlaBEJK/LmtwlRQiofzIEAqDPg?=
 =?us-ascii?Q?JE+WvHE+cgbIKcyfYfcxLDMiLNJIG2c4iQALOx8KkN64T6rAA9hV9se0zG7S?=
 =?us-ascii?Q?jft4/K2BdnibLXshllzhNt9lpbzzeIyeE3uRyWb0mFvHC9qDC5I7XaBQrUDe?=
 =?us-ascii?Q?XHZnEhb9+arB2y8n6//nzmzcIaASRw12JUrod++wputDN7l/gcDeH+mVM+cE?=
 =?us-ascii?Q?h7bsc2VKd1XmIxiImWCYQ1FKkTG99x9UGNtJ0lRK5LHQ49WI4VbyVSfIBq4T?=
 =?us-ascii?Q?LtAxaudqjzUF0pqLXYczPEzjyyz2oTPzfQKNVzPQgLg5HscStni1uKbnCk4R?=
 =?us-ascii?Q?33gM+aTZIqrSz6ImfANHdIpXbxc4SFuLigqPGunHYj34iM2p0o26I0Pqc0yF?=
 =?us-ascii?Q?bmnp/UvFjYLjjE0XzuvUvkf1EP4Sthw9LfYhl7537UihrhxOLENNrUQ4GPWq?=
 =?us-ascii?Q?VX9p/0Jbh07znHy2LpmExljvvha6pcOQ4vrpvXIpheo7MtlQ7lhsQl5ZKBSq?=
 =?us-ascii?Q?cpi8kHa2TugO6tT9DwSB1G2isnSBPTiJGBCw1NfXlX69dVAFMpoA7mt8ikGG?=
 =?us-ascii?Q?zhC0apHqL2AgqlmU9ydw2M5CRuSKGylu8Sb7gNgO4a9Y7u/Rw8s3siEWDVjq?=
 =?us-ascii?Q?AmjHAqCwODh9rVkuCnhe5EtwgAjW8EeYoRtnMqnpsVzMnt6PzOj1NdA4q2tJ?=
 =?us-ascii?Q?A5mTi5IOR173uL1cX+L72y/pXjO4jMGlQyhotLSgRTsgeM9SnvM6gbUYzMgv?=
 =?us-ascii?Q?1P1IMwbZOJF+GBFGhGg3Wfsl8S+7s/yAHkmCHrFHLtQ2Gab85fC7iB/QcGJB?=
 =?us-ascii?Q?MGNVQdYPe7/K1oTv+9loOZIbSaDSFYns4huTTTXqYYvTS8V/obaz8myF7b/Y?=
 =?us-ascii?Q?wyK+7X/fNSSlcdE8x4N4h7LCwRmZiDDUyB/akYYCy0SU4ie2usmPgfi/SumV?=
 =?us-ascii?Q?uaiO1P/XHsBk9cAaDaFceNgvkMUgUE/IDvmlS0UZWQtajj1j1jH+K7lPYbOO?=
 =?us-ascii?Q?+ec91qGwKwncm65MDwnxRjvmRtU6BOcGr0L0nVwCHd/v7oqwtqjiIzGP8qoQ?=
 =?us-ascii?Q?JH3YZ6Pzfvw06n4oMlSiTEiAvywZywoAZAffWfauR9ITEof6OVuBUiDf/uFd?=
 =?us-ascii?Q?FEqxFOsgtyO9fc39AdV+9rpTCb23ZC9JYzUbE3qo6Hin0QCFe+ALnoBHZvyE?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e29c8359-827b-462c-09e0-08dca5682719
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 07:23:13.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRrZzhY5HvnUcWJ9Manc79uFMHrk4HUagVBu0HnSFgqLtRThUvWbDPWP0h/oQah+Jihs8EqYEDN5QVoFFp4JmeClnaKLLuQSk/rGn/FfuC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jul 2024 07:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5316

Hi Matthias,

On 7/15/24 6:14 PM, Matthias Pritschet wrote:
> Hi Quentin,
>=20
> thanks for reviewing.
>=20
> Am 15.07.24 um 09:45 schrieb Quentin Schulz:
>> Hi Matthias,> On 7/14/24 11:09 PM, Matthias Pritschet via=20
>> lists.yoctoproject.org wrote:
>>> [You don't often get email from=20
>>> matthias=3Dpritschet.eu@lists.yoctoproject.org. Learn why this is=20
>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> changed one letter (s/B/A), so the sentence is correct again.
>>
>> I believe we need your Signed-off-by here, c.f.=20
>> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#impl=
ement-and-commit-changes
>>
>> """
>> For each commit to create, use the git commit -s command with the=20
>> files or directories you want to include in the commit:
>> [...]
>> The -s option of git commit adds a =E2=80=9CSigned-off-by:=E2=80=9D line=
 to your=20
>> commit message. There is the same requirement for contributing to the=20
>> Linux kernel. Adding such a line signifies that you, the submitter,=20
>> have agreed to the Developer=E2=80=99s Certificate of Origin 1.1 as foll=
ows:
>> [...]
>> """
> Ah, sorry.
> To my defense: the -s was not mentioned in the top level README. ;-)
>=20

Which top-level README?

https://git.yoctoproject.org/yocto-docs/tree/README#n13 points to the=20
guide I sent you yesterday.

Mailing list contribution is something not everyone is familiar with, so=20
I'm trying to understand how we could improve documentation around it :)

Cheers,
Quentin


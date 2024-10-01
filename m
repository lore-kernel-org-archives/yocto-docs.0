Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21AFCE7D0C
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 10:20:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.35])
 by mx.groups.io with SMTP id smtpd.web10.77725.1727778032834321522
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 03:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=T7b/QF0U;
 spf=pass (domain: cherry.de, ip: 52.101.65.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2DACGK4ot1mYf8A2x8UFRJUPPMIdGWGUiK5DXniLiRtYQlzS/CXmcst6dAoowvYb9t1vZHYMKWXkhqoeJ2hZJ3YkzvC0XZqEHSBsyjqSn0RPaiJ7MCI4B4b2cyhBPb49iOPkIb1CBixgtKugObIsL6zIDBl/+AtareN3lNYuUwN4dHsslVgwC2ewL/dGEcwixD0xaJvekn0lFSaTFEcNH18yA3+LwHisPK5mmIx70W9OtZnLx8ayKMhb04qUvggU1iwiJM41vWCIWAV20XsPKZewYQPgLgi+c5keDJrJ5+cLz34QMKpLR7JNRlj4TQlXVPltNorIrjfDMe9/38tDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3OrZUTWgkttQnDMUn+0gAXj+ASW8lokAandTBBR4Ys=;
 b=VSvun9lNfY+xoohm4NxIVVIxhLNCLU6X/isqM6n9apxJ0x579SuhRqqyljownwDh40ZfT6lVMk8KrZmVJaf9TaGxt2EkTfCTZ/005wJ3c1uuIi0By5D/lB6p5Bk4mHRPqvXJ/JYPJIOV5xxEtYDvsali4ILbJ32nV+9ElwU5ay/KkyUkuNHaZYlSOZnimBqH99JqRARuTxKR5WRgnIOdJfV1VAzsV8KFOTq1LaoOPFEdfMG27uIGU5m4n4C3DTvaSXqhnWok8G/JNg6+0E+sMWHC049QTtTKtnO0qolu6mjRHmqJrxn2noxtYZfZRba/q02v2uUNsA/b83c+R352Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3OrZUTWgkttQnDMUn+0gAXj+ASW8lokAandTBBR4Ys=;
 b=T7b/QF0Up2AQeoUQs68Skej6W/3Ce5eOxEOMikIcnkqSlR/6co9dBe3WERiWcIIQIm2P6yUa7NCW2gqXp91VzG/gk0Ef4fJnuUNmIBMimObcBLiCs1hhghRDJuxcvfy0LtMKrxhtdO3M6SfElrj2JiqVwunKaLoT4/KVhUyYBX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by PA1PR04MB11081.eurprd04.prod.outlook.com (2603:10a6:102:485::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 10:20:29 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Tue, 1 Oct 2024
 10:20:29 +0000
Message-ID: <9b2a68da-8ee4-4b1e-935b-c8ae0995aa09@cherry.de>
Date: Tue, 1 Oct 2024 12:20:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/4] migration/release-notes-5.1: document
 oeqa/selftest envvars change
To: Antonin Godard <antonin.godard@bootlin.com>
CC: docs@lists.yoctoproject.org, yoann.congal@smile.fr
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
 <20240927220033.3941455-2-yoann.congal@smile.fr>
 <f71bb041-ad48-4294-aaf6-ab8d86b32a28@cherry.de>
 <2bde7e98-b39e-4ea2-916f-b7fb043bc84e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2bde7e98-b39e-4ea2-916f-b7fb043bc84e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|PA1PR04MB11081:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3620ac-dbd9-44cc-ebbd-08dce202acb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?79+loWIDXEU/C3R48DBN2OqwrzsS2Y2t9JUqruYiZ7k2uY9A0wWXcFfkA/aD?=
 =?us-ascii?Q?OIAOGLUH+PmM8vmkJOIz/VYxJkCUKT+F3u4OLZrTs27EeBonRAOEjhkWq48O?=
 =?us-ascii?Q?nFy1vi6UrUUJljoOobwjB1ToLCeM02ZLDixUdG02j8gEmkfH1vf/ZEZP+1DY?=
 =?us-ascii?Q?ZiN2ZHX8tU+Z2YvkSf9m3+6smVjg8ZYbXAjydN4pJPNZvQyXa1gPXt5AeUNw?=
 =?us-ascii?Q?k6YcuA+CkrOSKjDZ0fLx4vMAqnM2WzyaQlaHKC6tyvEY9QU86VOfp20aPPQm?=
 =?us-ascii?Q?IchCRLQxJrWw3oyCcqO50sCunyCQvYeU105VmpCrQZY3igQ9kFZUeRFoWuJS?=
 =?us-ascii?Q?YuPYsK+DzCLVeuQEiKzSVGekUcumU0tjiq7m/m6OedVNdF6pHViHD/Gu5pjM?=
 =?us-ascii?Q?1u+fCl3hPJLcGBO2/hSiOvRyqzyWayAUg4bOUU0IrfkO7ik7Tbxe7VLXa165?=
 =?us-ascii?Q?92sVGc1/gQxkquWYWe6hKmJVxYbXLNBENQPWOY+wQeuOHsH/WwoZPHm2Vkgl?=
 =?us-ascii?Q?RnmgwbKhkADTu8+ZMT3r7C79Xb82CjXjECMYXhIWyhcpHHLO9tRNnNJ4UJZm?=
 =?us-ascii?Q?L3vsZ0yL/Vjwf/ljxGlM1tj/+ppA/9YWeqgkqAzTtCrg0ieyiAKhsg/FDX9i?=
 =?us-ascii?Q?j0w2E7saxjzUSwZaYBpBoO/i6LabZOT9y7JTRUv0aZB/BFkZqyu3sDUzf8AV?=
 =?us-ascii?Q?tZ5vvjIJroMWh0huuj9mDb/H9RJ10LVGHum5IEPGdiVf2FWKMGqSeiNGXeAD?=
 =?us-ascii?Q?q4DKvA0ww9wD4ePxeBlKMOiLR5RNm+YapwCla1FsuqRKMHNz++Y+i7DSdeF6?=
 =?us-ascii?Q?Z1VRrO4JyMnHLB8hPFWvEbrfQWfiaLMIqJzVLi3j8YmWh7mRQJIB3+A6juE2?=
 =?us-ascii?Q?IDsAl7Ou2wYK5H0AnuphTeGoJGxkFwdleZJq04iExDwcd6QZWetSOrzfRs1r?=
 =?us-ascii?Q?uCfG65nVd6p9svUmNysAsFQt3V/duXN8Y0FAqGZwK3DIGQjC+DT01Y4y+Q4G?=
 =?us-ascii?Q?0yaHY8dorBrrib2mQgcShCxOaecw69jzId9WKq4jbCltwwSAKzu+l7wgcIR8?=
 =?us-ascii?Q?fFAc7wDFjYkcRrvwoXokHTVHz3/HBi07UZtI8AS2xbXctek+lh2Xv63pRYaC?=
 =?us-ascii?Q?KiOHBLJZoc5HcqLnQvJGkY4kLuEFJWiDLEbnGGGTDpHKFR1yzqdgyekC3f8U?=
 =?us-ascii?Q?j0tIXyFAVkZGROMRNC5Js87CTE9rXT6aOQ6K7hBxRBe7r/VUzQ1Gf2sJH5A?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4GThfrFbRR3X700ee1iNBotXhllMawnoYjj0WUWDm99CLdBq6d80QYyQi1Xj?=
 =?us-ascii?Q?0TcV+Qh/79oz+AjdDWCF2PpGA/gFrtE3t4WWTFQ41A2wzVdAaZsOZ9GX57gC?=
 =?us-ascii?Q?YKhVk/9cp4fzAP/5c8K+H7peguXqILXmLSdUz2NE8Grb89ztFnxB22/cHpw6?=
 =?us-ascii?Q?5M5B/J9mgoX8kFM+IBIvTzLj50a6yIsZrC/csHvc3zw/vUKLdZIUJjKtFlNE?=
 =?us-ascii?Q?o9afKQe6rVHVH/Vu29N65EKR1VHzOVwN0OaJKLoHXRE/SpdF28u8AlQCCwnT?=
 =?us-ascii?Q?OT96l3QvYp2nOFlpPdNSg85UbzqeEvPXlVnaZjvzfQ7MUIgTvZ9h7oKWu9eU?=
 =?us-ascii?Q?b52nKEDxg+erj3hD6Zb9JnNwElri31Bwkq4Zgc1I266QwxMMqvf3U/1h2uyx?=
 =?us-ascii?Q?DCkurJLybm/cKwIAjtEYF9mNJeckYBuzBEW7ZiHZy7qa0nV8nUGInAXp5xQZ?=
 =?us-ascii?Q?3MsRpse8cYs0tSaCzc/wnn72qdRGbH+qMGecWdWWCf2zIn4FWHnC0xDpwgSv?=
 =?us-ascii?Q?RSWROOB5fOg/Uy4Qt7x2s0a9/3g8OCTx3Qt57qb9dG9bboMGFMXBEi5TOMuw?=
 =?us-ascii?Q?BTGxp/ZTmFENExZSUuZkKemVY/2b5in7nMef3k1eJN9G1d4S7GSzNxTOvOF4?=
 =?us-ascii?Q?Mk/JLAl/rNlYY6KR/HZuf3aMUeeDW+4ejp3T4NhrpmCBcdCyq8fOSB6ApkNp?=
 =?us-ascii?Q?yDFTR9pDACplh1SF3/qEQr8C4BcRbgXE+eIKYC9XmtIEFQKzyV3OGxcPIA9m?=
 =?us-ascii?Q?zPcrYHwhzaoNst0DgLQLrSdU6NxrtLa5pxeNpWXkZnW+k10t2IBU6DJGypfe?=
 =?us-ascii?Q?DZFdodfhqCtM7pUKlronc9HUKfb4xkWmIVfd8gBnkDHzdpU9PKZ8FjdoeuYC?=
 =?us-ascii?Q?eQbz9xXqbhtGuku5GOJd9KjOePH7HwxLdSg9BcKyJmRn7tAiBFPHzP+zO5oE?=
 =?us-ascii?Q?pj8OM/8racTqEdKZQPgJmePqJpkGCBRAXz66eRjfbgwVpXZNjqPJLQpCwdmV?=
 =?us-ascii?Q?VfPZTYqS4NXJNewK1ffmUPaFayVAY3tqzyLI6NxnD3Cux0Z0UIU0R9LWsdSE?=
 =?us-ascii?Q?A2qLpL6Q4oEzeyxkbyrtQWwQ+cW8Sw/BtVBLCSP+vQ3SwcYLHaUAv5WM88Rp?=
 =?us-ascii?Q?mWtxD0r6KuRJ/UH3jtMl3vcUqIocj8hPWeJr3pNFUMTpTAhon6IIVqjSVEue?=
 =?us-ascii?Q?G8LrYUxdNbTuD6M/WRFJ1uX0ya+z3GC/w3K3CqHDUe/yGprVavdBskwfmC7I?=
 =?us-ascii?Q?/tVh4mAoVkGCh0iXtoPsfhd5vPVWc/Zsv3zpFynUV5vkJHWR9hnI4Ic+UBy6?=
 =?us-ascii?Q?HsEmLQzjMQ87gLoF9LJuI0LMfgbRj/Ks9q+k4Q95mCrQAKdB3bOLTbQVI56/?=
 =?us-ascii?Q?2RCbzDMmY5U9Q4hXpQxB6omUJnKoHxU6/cVbVzW0t0VX4bszDcY64xI2QnDY?=
 =?us-ascii?Q?JjGZPF8QC2NB/E6R9hc516OzvflwEGD0PSsH3BpvSm2B4owIZPInmFyOvCY1?=
 =?us-ascii?Q?xV7/t7TrtP5R9PXAdHK6eYQWftEox1nzVo8SVyHyv0//IAfMozYcCkJSVTJP?=
 =?us-ascii?Q?aVIRFFzHjrhkfyo8b6vYqPq839nU6ANsPJzFqHw44q2QlqvDC29cabFHegKs?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3620ac-dbd9-44cc-ebbd-08dce202acb6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:20:29.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgZWrmJzG3tEdTPLdX9rhGGl7NEtzYSfZAXu6OKnobR431UsnWtI+K1GQHdWRnjRjHuYIHcYdJacJAbxjZUJA4gqCV+fnPNIoekmsks4dto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11081
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5387

Hi Antonin,

On 10/1/24 12:09 PM, Antonin Godard wrote:
> [You don't often get email from antonin.godard@bootlin.com. Learn why=20
> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Hi Quentin,
>=20
> On 01/10/2024 11:40, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Yoann,
>>
>> On 9/28/24 12:00 AM, Yoann Congal via lists.yoctoproject.org wrote:
>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>
>>> This covers the Poky commit:
>>> 61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely
>>> point to builddir, 2024-09-10)
>>>
>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>> ---
>>> v1->v2: Reviews from Quentin Schulz:
>>> * environnement -> environment
>>> * oeqa/selftest now only rewrite*s*
>>> * Add exemples for the selftest change
>>> ---
>>> =C2=A0 documentation/migration-guides/migration-5.1.rst=C2=A0 | 15 ++++=
+++++++++++
>>> =C2=A0 .../migration-guides/release-notes-5.1.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>> =C2=A0 2 files changed, 17 insertions(+)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.1.rst
>>> b/documentation/migration-guides/migration-5.1.rst
>>> index b43fecc2d..4625ff0e1 100644
>>> --- a/documentation/migration-guides/migration-5.1.rst
>>> +++ b/documentation/migration-guides/migration-5.1.rst
>>> @@ -141,3 +141,18 @@ QEMU changes
>>> =C2=A0 Miscellaneous changes
>>> =C2=A0 ~~~~~~~~~~~~~~~~~~~~~
>>> +-=C2=A0 oeqa/selftest now only rewrites environment variable paths tha=
t
>>> absolutely
>>> +=C2=A0=C2=A0 point to builddir (i.e ``X=3D$BUILDDIR/conf/`` is still r=
ewritten to
>>> point to
>>> +=C2=A0=C2=A0 the selftest ``conf/`` directory but not
>>> ``Y=3D$BUILDDIR/../bitbake/`` which
>>> +=C2=A0=C2=A0 still point to the ``bitbake/`` directory)
>>> +
>>> +=C2=A0=C2=A0 For example (taken from autobuilder environment): ``BB_LO=
GCONFIG``
>>> is an
>>
>> nit: could use :term:`BB_LOGCONFIG` here since we have it defined in the
>> reference manual? We could probably even avoid explaining what it means
>> here (not necessarily though).
>=20
> Good catch, you can indeed use :term:`BB_LOGCONFIG` and avoid explaining
> its purpose.
>=20
>>> +=C2=A0=C2=A0 Environment variables containing relative paths from test=
ed build
>>> directory
>>> +=C2=A0=C2=A0 to outside of the original build directory may need to be=
 updated
>>> as they
>>> +=C2=A0=C2=A0 won't be changed by selftest.
>>
>> selftest should be single-tick-quoted as defined as standard in the git
>> repo, c.f.
>> https://eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Fgit.yoctoproject.org%2Fyocto-=20
>> docs%2Ftree%2Fdocumentation%2Fstandards.md&data=3D05%7C02%7Cquentin.schu=
lz%40cherry.de%7Cd86b9396dbb24e6bb9a408dce2012bb1%7C5e0e1b5221b54e7b83bb514=
ec460677e%7C0%7C0%7C638633741917208894%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3DMqJFRj5%2FMNumviLU168shE0bsiL84%2B5BqcPvHKV9q5M%3D&reserved=3D0
>>
>> This was done by Michael but he's not the maintainer anymore so I guess
>> whoever replaces him may have a different opinion, in which case
>> extending or replacing it would be most welcome, is that you Antonin
>=20
> Indeed, I am slowly replacing Michael in this role and getting familiar
> with the documentation details. I'm also writing the release note for

Welcome to the community! And thanks for taking maintainership of the=20
docs, it's always nice to have someone looking after it, regardless of=20
the project.

> the next release at the moment (will send a series of patch this week
> hopefully).
>=20
> Thanks for your reviews, they also help. As for selftest, I haven't seen
> it referenced with single-tick quotes elsewhere, unless you meant double
> ticks for code?
>=20

I think what we discussed at the time with Michael was basically that=20
anything that isn't an English word, or is but shouldn't be understood=20
as one in the context (e.g. truncate as in the tool and not the English=20
word) should be highlighted so that people don't confuse it with the=20
English word.

I think this is what we meant in the standards file here:=20
https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n79

Note that these were rules Michael/we came up with for new contributions=20
to the docs, because we knew updating everything to match the standards=20
would take a long time.

I still remember reading every page of the docs during the migration to=20
Sphinx and I am not ready to do this again any time soon :) So patching=20
when stumbling upon things that don't match the standard while reading=20
the docs and enforcing it for new contributions made sense at the time.

Anyway, that's process and standards, they need to make sense to the=20
maintainer and the community, and can evolve over time, so up to you,=20
just putting out there the history and "current" state of affairs :)

Since 5.1 is supposed to be out soonish, maybe something to be picky=20
about after the release is done ;) Up to you!

Cheers,
Quentin


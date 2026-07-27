Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600EAC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 17:18:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36381.1785172731863305815
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jul 2026 10:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=nBlToHKI;
 spf=pass (domain: cherry.de, ip: 52.101.69.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QuMx9b1YcZizlXPQVCnexpQA/Z6UpPrK5sbFRl5WXpgimZBJzTY7xwHJcn1ipkRDpSN8FW/d4+3DoA/jzi3IEPH85Rvxzh8yr85t6JD1f7i4jMXxpDIog40aua0zr48XwH4iV6tTzKHeHVJYVMTx5EqGP+bYTnPWEqxrHdZLql/HKwJC8tNuCqWfMfRMXhvKDaEWRpedyz5DrEjvZM6lxHxIASJGvmrGXVnUfBxs/P7bW5/w5B7m36MIvA6F6rMp18a5WUv5dqTbCVHjp3jjE/ucQYQBRA62CBcwIDNUFqjak71dn3q0Pg/VW2Fn15ipJWLgddwVe8pwe2E4Z85BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSiM+y7LXbimyHFtiZpZ5TzzAEaccY5x3KFuV9NBtUA=;
 b=cxPOZf6/km182h5v+k8g2lvuudLN2u0cAVyzjm33ZYVlqJjZ5sShxsOBZfV5Zr5Xkff1jCT/lVts/gVHPdxOJVubO12ysrzC5sp/1GVmkSJbuUuyyTmOMQdoDxuDW17t/bfUGtnX9Hfg2l53xvtBs/Tz9NEziuMcjAA7O2mCF0u+84EDRPB5uxeaXtXQgOyDLovdeWULDX55yxXlnbVUXVQM5gwLRPueB9Ybpj3kmIhF1FK0g1tmAb76GLR4VVgcJHhgj9XLQJv/e5YFeRjDBD5euK3Jw0PT+ACfr2rww0zNEag6/VdZmSkiE++AeRgZ3nnOtd+A1PXM7C/0qFKWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSiM+y7LXbimyHFtiZpZ5TzzAEaccY5x3KFuV9NBtUA=;
 b=nBlToHKI5qV80AfjPv6ewIr89IxL+lteUbODo/yRswov6KAhUpF9v8EA3iT9XxesOs/SnpFcLgi9Jwl93WazkEDRfq1J6PAhd1VQoHrjK4Y1ZZBjnljfUH0X++eMTA1JEuL96xVQkMv8HBKNQxzN4eAbceiMKAsrnyb6iZDEM+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:18:48 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:18:48 +0000
Message-ID: <9a62ad9d-24db-4f87-8c7d-82e1e5d6f6ea@cherry.de>
Date: Mon, 27 Jul 2026 19:18:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 4/4] recipe-style-guide: Prune unicode from code
 example
To: niko.mauno@iki.fi, docs@lists.yoctoproject.org
CC: Niko Mauno <niko.mauno@vaisala.com>
References: <20260727163529.30595-1-niko.mauno@iki.fi>
 <20260727163529.30595-4-niko.mauno@iki.fi>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260727163529.30595-4-niko.mauno@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VE1PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::30) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7b7d89-2d91-4f93-286f-08deec031f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	C1YztDFoc1ZI2GsMf2ncdCVS/AcR0eGiHIWIfUr0avGz9Ysrj7kiN9P4Do0r1n3soWh0i7jY4dkzIv9i3DwWl7dJSiTzCkSOQ/nC/ert59IY0SYL/1nV58chfA3lt2WbZJwT1vfi5UpxKoq13UapucjqJqUBw7TvQVXgRgtDJgt1Y0gSPUq5tJaFhB7mWdz9WQdeC7rLI+9K+tEZ9DrdSVKFLbDhlsfGO63xU9OeQ6a6guNEqchJKM8hComCt/NR7T8i7N4aLl28Ji4wL8QHHSmCJwTZVKk8ReCt9/gtA7jd8bvyue2Y+IEOXTYX5r0R6Ce+n3wtisvmNo0sadX4Ose52CIP8phbQ7Zx5oVahtS+8yLmp7crzEuqKv765HxGGpWit7AavUEVi42Kl/ym6+Uz02chscepe1akNjiLPsN7bQa5MJFmxApLrdGaF+E/w6AoM6EwkawuyhsHH76Wxau3HrmSnq1o210ovRyhTen6/mFjKGVrvOYUZOnd95ls80bFrC3wDTYFcPBwdovLOIvGeHb/ITvoLiM/HrQIkciee5ghrl6SglshPg5zgRuVgV4PzGyvwfyqzQ6Z8p1n0tLcD1X5klzXZR5T7oAdBK/dNAStNh2E/mo4Hh9l/uPW481o+12NZ+16Q7GYb9MYMXAd2koEJPv0juUtkqAX43s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l/7R1ZwJz5Fet5MlAZRtfdY3AgyXyHksgCDsC9F0FHsGVPg/vJjtqxeIMttX?=
 =?us-ascii?Q?f3+PGSK4F55QN4AvJfxWH0J/kcHxdDO5KGooGDHLppEL5ls08gS4lsQ/5ztD?=
 =?us-ascii?Q?2OQZKek4l3GGdCrWzP9lhkewdVUlnQ8IXANMurth6OTDcUN9FswTcytPyynl?=
 =?us-ascii?Q?05c5h2hhVqGtXga2x0R1jFVqBI4kWTHh69G+VdTu22ancOXWyPVkPsL4XLrP?=
 =?us-ascii?Q?erqbwBJWW7532/QMYOT+v1K8tTGzbOE9WWybQFILd46P5ZvdC6Lpmc7ynbMK?=
 =?us-ascii?Q?2zoThD2Ilz2hgwpbwOXRymFNMG5Mqxe/S8H1GW5ckzH0i1kC+RkrafmWQl2y?=
 =?us-ascii?Q?XJ1WTCHoH44pDTZnkaXtZFkDn32luqIKsimLYJRdFULRijAVrVJtkepu0NN9?=
 =?us-ascii?Q?7SQApW66DAQ3PTU590VGNHaQT9BgugcxiN8oFaq8Y2MNV+/S3ACFbls9lJFP?=
 =?us-ascii?Q?TCCfnAUGxNavO0rkB8hJwBPqkDQQEJC/wQchjX0sdq+KD8ji7SHGw47ngfDX?=
 =?us-ascii?Q?nup//0uPVrGdNYZs8rjPin7H/GPFth5JNAcboxo/7Yh+DDY+/ix+r/YQv3dL?=
 =?us-ascii?Q?1R63E66xVwwZKaw55zNmqhwdmEAqr8Kj2Prt4Ebs0Y0hDKmiXImv2wKQ6xjT?=
 =?us-ascii?Q?bx1LGKdIW6IonLs8+JRdVPPSweDJi1XoMA4zEXye28Sf4vNCdeP6kv81F/Pg?=
 =?us-ascii?Q?4ev8TQIuuEMtGUdn03mfAkim3D+CfxoFUr4YWQn8gfGbe59ps3xo+yuITHvF?=
 =?us-ascii?Q?BWzSVTuudel1aPMIIr5mK6PdOU2OOSC+5/spHbSjgEzLxqaXIry0vkowuck0?=
 =?us-ascii?Q?jwqUd7uAoY4Gg6/KjShvnrkeRyZVWqrt3WnMy8hYeNx7eDhili8mb9jryhEp?=
 =?us-ascii?Q?3UfHdq0sIxYPt+tlfFHDmPV6CB7cx9etapxkifHpi448OVlXbYC3xPhEQrPT?=
 =?us-ascii?Q?WuwB/dddCUkTO5bKGZJkrwPhQ/wz9oLlJ3INADc89zMtpmiTbWTQa2h9c4FW?=
 =?us-ascii?Q?RZfs4x4fSG3HK46H7UldQNlJHvltoiP1SyHuGAzPv7S5pNxTvvEHyOEgCvxF?=
 =?us-ascii?Q?W6PJjk7LfmT+JqTtm9xbntuWRp9ql0H/Dc05Pj/EuLi1F2VTpBrRPHp2Rgxa?=
 =?us-ascii?Q?u961x0XJVH24VUdaH7bCpVEPSAFAFnIhmPsAEmFsCDfzBu/H/W1KCgXXfi3r?=
 =?us-ascii?Q?I4xPCeAtfWKomwbGiy/A8mUJbExAhYMy6IV4/PhJAg7UZaUk/Xkw7iU1V9MK?=
 =?us-ascii?Q?JAGv+p8JrUg6OpB1drn/8vSOa1kPhrdDhhG13l9QP4rJhJqGJRSQ6HvqSlLz?=
 =?us-ascii?Q?RaaWMFmLi8mQDL/mEomIymhCQa+9NBIqIIhL17M2h7bZHGzH4Gu1Ih47rNKG?=
 =?us-ascii?Q?BaKjugVZUd6QpKZOLmiQu9C02mVjM/sI2Hug/7p7333O9U3ZI1CCkbdDXwmB?=
 =?us-ascii?Q?61sOemJ9V3QB5Mfg23uTj4QQc/2MvjouWq9StgTfGPZZh1+RdEWQqXyMNLhm?=
 =?us-ascii?Q?9pWRNqLKNSSR8+Epr1/AeSN6mMCUoOaeA+estDmMFe+XsGN60X8znPCYXkzi?=
 =?us-ascii?Q?mv93hrnnypRPl0K6NsZGEaw3SaMitk4QR7CKUIGnTq5KXNgU/4cRUmjvKu5Y?=
 =?us-ascii?Q?65f6KStbwtSehySbqTnG3+wm9lLKK6xJkZ0WVZCc8bIZhl2x7w6mL+ckIuP3?=
 =?us-ascii?Q?mv/xut3MznJliTzhVG/NNeKsi7pcIl8Eg9cdRiWDIZfDkNgPl0p6oDIPqrcq?=
 =?us-ascii?Q?XMTXAG98fw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7b7d89-2d91-4f93-286f-08deec031f46
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:18:48.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X99IcQvjzpWDFahEQVyTFwJuefuol0Z58t61Qw5D3yEJZRHrRCizRJ5UmfhFiX8LZGcJNngV7huu9gXdzxukk4AM/43pi8Qxyu2HhQ2MkLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jul 2026 17:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10150

Hi Niko,

On 7/27/26 6:35 PM, Niko Mauno via lists.yoctoproject.org wrote:
> [You don't often get email from niko.mauno=3Diki.fi@lists.yoctoproject.or=
g. Learn why this is important at https://aka.ms/LearnAboutSenderIdentifica=
tion ]
>=20
> From: Niko Mauno <niko.mauno@vaisala.com>
>=20
> Copy-pasting example segment containing unicode characters causes
> breakage like:
>=20
>    ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RDEPENDS:${PN}=
 =3D =E2=80=9Cfoo=E2=80=9D'
>=20
> therefore replace the unicode characters in the example with regular
> ASCII characters.
>=20

There's one additional location where we use those special characters,=20
in documentation/contributor-guide/identify-component.rst, would you=20
mind sending a patch for this as well please?

I think it'd be nice to add a check in pre-commit such that those=20
characters never (well, if one runs pre-commit :) ) make it to the docs=20
again. Is this something you'd be interested in looking into maybe?

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5A8C2BD09
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.79])
 by mx.groups.io with SMTP id smtpd.web11.32892.1721029544037436757
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 00:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=Tnd8MlvJ;
 spf=pass (domain: cherry.de, ip: 52.101.70.79, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKReKeSGkxR/10bgTpk4/JSX4qkezkaXqhgPWPeTtZzQHNPueX1uf20gDkIf56guMZL1Hc+RcC5SQkdzTg5iOWzCmw7HkAXo9ggrzyU1yLytBjed/s5p+CkuYPLl3nDErttoXk9zjwvc+iEA8umU+X4FPHwJBJTgQC0p9FwkJlaLqLxSZpl/UCotPQNrQsay3BvfhqvT1rGoe61SV3bhX0pLS8eOoz72u1H/SjN+TQa4EL99tQb4zuiCAzmX4lFdeVHotoEn8Pv5etS1T0a0q7Sks08xfnWi7CVcKyxq5s+uZe9RvnSY56d4UuZzmK4yNGm0PdlEqhes+KdZTgl1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90VnriUBEH/OpauO+oyKqZ2NvYqoBXULs3HnOJQxCzk=;
 b=ciOeTCfmHP77XxxdB7qgYAV7mZPJvAh0IP3FaOBWkXG3yOsOt2GRTM37V6PbM8lvspLFTK9Ht61UpJoAQXyulllLwayUGQeCp7Nrrxb7pEzAuIf0dhsNJ9W4KzJ1EEldD8GJbYSKOLDjniQi/FjMcziMcpQaLqwoUjua/AYEteTQo9ekN83cjG6zZCizkIumlwIcDYDnTwFoKMV/3xnJhAN7swFd1jWQjrm7PfRyjgzLbUjMh1lvRPja4cegZ7zr8MmP3sIznUONVb4S70ZD29SiPREymRGAQiKBMJuEPP0hEUtuh7864NORat9ZF3Xp8E0u5N510bHaqSnmiHA5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90VnriUBEH/OpauO+oyKqZ2NvYqoBXULs3HnOJQxCzk=;
 b=Tnd8MlvJ9ihEfbZ2I6wowKtzDb6SnBoYF2dt0ZHwEQDIu4tO/yZzrsL79Lyl9qj6UJrOFGRstXJNB3sYoULrUfkn27Hxx38VKmR1EUlWjcA8I4nXJePuyOECg5Bghz59N0Hoagr1t5hId/zlYoyQrOiM3Bs3Y0G9TZ4yqFEyAfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 15 Jul
 2024 07:45:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.7762.020; Mon, 15 Jul 2024
 07:45:38 +0000
Message-ID: <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
Date: Mon, 15 Jul 2024 09:45:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix typo
To: matthias@pritschet.eu, docs@lists.yoctoproject.org
References: <20240714210908.3964010-1-matthias@pritschet.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240714210908.3964010-1-matthias@pritschet.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 74940f37-210e-482e-1316-08dca4a21e9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZhRwfQBcXVQRMlNe4nSK6R8zXyucLBCdSvGNze5+OdpbfaCSYZ96KGDx5a6S?=
 =?us-ascii?Q?WranbQDdu/FqlEmpfggwYBuilBY5TYvto3C9Q0TVi1QhEdWtD1XLFGzUCxut?=
 =?us-ascii?Q?dWMTW4lA3b7G0Zw17CVy2uIGfHxUdrzHUZnrgtNsDbXMeLFA96ueJp/UvsvP?=
 =?us-ascii?Q?WaUhpdqsHeuBBRFjHZ+gPxhwhY/BSYCp1fEo7r/7+dVpc1zE+KuN8ac39D0w?=
 =?us-ascii?Q?zCerrHmc3ee6ykkYoFi6F4F2j1h6jEUwOi7Gy0PsuXrWx3EU5k38nJGx2QMN?=
 =?us-ascii?Q?5F8tqEFE8+804EGjMfvm276UfwU1L+Nbzya35Kk983Ekb7oaJmd7tqzzOggm?=
 =?us-ascii?Q?e+sw351A/aBNFaSRPIS1HM+EuY/Fk1ZNWx2RKR28aTrsA8qnLdlaNf7g0ZK/?=
 =?us-ascii?Q?p71TxeUZudLLNcuZoOO8EtRPUP81lmUh4GDgiU65E1gtO0sR4ZsF7jfaUWrb?=
 =?us-ascii?Q?thy0xMtoNaHOlEdC0A9hJ6h9uFuBPxf82LnjCh/Gc+XUycEoyIweqAhhJopr?=
 =?us-ascii?Q?9tMUMaIsYb9bHdWJUqA+EMHK2q+Gu7eTQIAE1nrZGU/mOh7HBLEOQ2N2bYUU?=
 =?us-ascii?Q?ecyXuU3TY3/j5DQ08qUVsl3HSIVrQreKvpWL7Zd51UxnJTIxmxQBFdLfDNGR?=
 =?us-ascii?Q?EcPG61YIJO5UDh+pGxpomWNrSmBesoVMIvEZ8R7/vW1hhbYr0zLKHSeZHIqM?=
 =?us-ascii?Q?ZLJA1MrbG9QKoBT6rLawZRuc+xyktDYNtxryFDJJ7B2K/4oChq3krJ3A/Qob?=
 =?us-ascii?Q?aKlhHMBOfxQwxPyYixgjUIZ2zg1WnVAhqIsbaTCQD8LTZlJoQzzlf7x4xCf4?=
 =?us-ascii?Q?ENwFP02gqxgTMFBz639o/IfdklTF8Bcsl+5Oi4Ho/jrixZZaMfQkhUDyY0ZV?=
 =?us-ascii?Q?KP1nDfL6Y0RuOvKUZ67laWFmRC+bOejlzYomLZBWt3I6p8kFGDk4lZaRUMV3?=
 =?us-ascii?Q?Lq6oHtAdy0qV4toQl/JFIbwRQH4K0aJHpoxlex8POmOXQ/BSBL4NPESM1a0T?=
 =?us-ascii?Q?WTfBQtB0eYEyVf1DxQx5LK4DhtTaotGZKBwSU8dx4DVNFzHN6Is2GXmb61+x?=
 =?us-ascii?Q?+JBDlnXN4jDMO0aCEk8xYjJ74P6IP1Gry4g8DYsnZEksSujE+YR6SU2yRKzt?=
 =?us-ascii?Q?VQt00Uv/SVGBmq/nYkk0uAdJ7NPTQX9Xbq2WrvI4OGdwoliIKOvstrxQcEjb?=
 =?us-ascii?Q?9vZ/53XvnavYsIGqA6rsnGBqON2iYOSBMiXXp10xGAra4Qz1857na6NMdYyA?=
 =?us-ascii?Q?gQr66ThBFLst1iIaLMywY4HySMZiYaY4XhSqQi6q039Sg74xPillQvg7haIe?=
 =?us-ascii?Q?xB8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+37wRe8t1npEzqjoeY7avW1a+BswguRPgbT0x+lbSuN5zoD/KTKZMTY0A02Q?=
 =?us-ascii?Q?7MCamn5ScqtQR6eMwkGbd86x43iUhok8SqBAesFhebEFodeWa56J8iHA5KIt?=
 =?us-ascii?Q?CNs/tfJfrECdiY2QZqRGCNcBcmO8Ek2B1KxAjTPTbZPTr/IHHZ/pkoxZaR3F?=
 =?us-ascii?Q?OYVE1PN+CiHjvC/VDOKNyNXtznLJOWJtrtI1m/f7Fn5ctPcCxiJNn84fciJA?=
 =?us-ascii?Q?IZBjKw1gS9MFClt5viEg/q3tABiGj1aqdwX/OOHn8cD++soRCYIZsTjNWzgK?=
 =?us-ascii?Q?6wM3XjgRM3uxSmn2SsHNTmMEHjE+E01lXPJ31cFHIBU+/p7+/yEo91Mqa4Jw?=
 =?us-ascii?Q?ejb1Lty+UNe11LNwW+7yt51GRM62G9Hkse1syO8CesBg+v8qHzvtdUF4KWMd?=
 =?us-ascii?Q?M3Fky9Wt2eyNVqXM1Vni3AM7OcG9ElnnCajB1AvnUUXbVxR18ZwRsAUpMT5L?=
 =?us-ascii?Q?Rhy9mGjbcN5l/RE82qSnAYmskS6MdFl8aKoJk5BoVNT6bm903n1/5avcar5R?=
 =?us-ascii?Q?SNWTf5B4eEGOc8XbNVgi0I+oIRpquvtQMUTIYtL6ZKJlWrijiNOB7+XBgAvZ?=
 =?us-ascii?Q?zztpdRy5hWv18P/yqwO+S+4eNc2/GiuXg9OiqQyqcpNSMKgBrT71asOmgrUo?=
 =?us-ascii?Q?IjfedJpL13EMfBHOWQU6S5iuqxRi+b3MsAKpDWeMZtAqp4ONzqHes15Nf9Kd?=
 =?us-ascii?Q?gd9r5gFyeU9FrjaptwhHHNPKedVbLjEPz/xE+1zAIQzGxkMsCUQ6/iw8o6Yj?=
 =?us-ascii?Q?59tj/665B/zJQvfA49VHowShNFIB2klgmHNeLyrquJ1sB1V6wL0Ay6PoQ8yx?=
 =?us-ascii?Q?K324FP0rOraPTBlW7fo632IC42j71/tagMxOjMiHh0amOkXWygoA3WyZSW0s?=
 =?us-ascii?Q?mLMI5/Qinpf/AsC4xTizGFzy/crUL47Hd/CGSJkGh4eobrT9L8nMKdXEDQ5d?=
 =?us-ascii?Q?JiPJc4H6FOMvXwKH8e71OB3Di0+2sK7yfg4hL5sTq2iV5trhlIxmL+ycERwA?=
 =?us-ascii?Q?Y7uXjYB8SpaHjSQ7Gof7j5GsvLh9au5P+A3R6k4aH6Y/s1MzWeW5CoAYnk4X?=
 =?us-ascii?Q?ryt+7XKx5g1t83nXTm8QtZgqUSMm5XV13gTLEjvTK46OgEBJYve/DexnGFFq?=
 =?us-ascii?Q?DnYXkQGI+COQbaeaDh3DsxqHlKDDtrF6wz7Nb1UrTxTuFGktah/6cNsy84p3?=
 =?us-ascii?Q?w3a0T/cgsZIGUlmMCdYZT7b/qa1UTI6+9tvlyfaIpoO+m7bCLA3qgCClTZlH?=
 =?us-ascii?Q?WuaG+4d5Y1v+/OqD6Rdiwlc86KGFfj4ixuA2jrpL2RvRfDIq6akGpUuqJSEf?=
 =?us-ascii?Q?r03M8/ysvEe3hdYAUl812cSGWHUpZTCmK18fQ14wDTTU+fa4caSuVkSiTMLq?=
 =?us-ascii?Q?EBcHEDnfAbq524W11Pk+1bGpaZu3daBk1jJ8BrsfoeUddIX0Sz8CG1MR7vh3?=
 =?us-ascii?Q?SQfKmL7LGS1/JQsdoN9wFlUpnfQwxqjHZNRYG0LiInQaSR4q92ZxrCwyxVmK?=
 =?us-ascii?Q?0KFCANBP1qs1QlD4h8QTKwQQeQLtG7GUNgzj2Y51pWS446jTfyk5SyIAVFNk?=
 =?us-ascii?Q?u1yD8f1PfGWgCBUvuloBW6klhHnrVNeGfFN9ylwSc2/EuFN8mvqeW+r+T0Wq?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 74940f37-210e-482e-1316-08dca4a21e9c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 07:45:38.6012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCVwkynWOURq3Y2utODeXBil5VtqEU+78jqEMHUdKJ28Had+tCf4yyCTI1iQYgZrnrt+jtqwovo3OVSlD6cpnl2OwgO43dCq1gF5Gb63p4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jul 2024 07:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5313

Hi Matthias,

On 7/14/24 11:09 PM, Matthias Pritschet via lists.yoctoproject.org wrote:
> [You don't often get email from matthias=3Dpritschet.eu@lists.yoctoprojec=
t.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdenti=
fication ]
>=20
> changed one letter (s/B/A), so the sentence is correct again.

I believe we need your Signed-off-by here, c.f.=20
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#impleme=
nt-and-commit-changes

"""
For each commit to create, use the git commit -s command with the files=20
or directories you want to include in the commit:
[...]
The -s option of git commit adds a =E2=80=9CSigned-off-by:=E2=80=9D line to=
 your commit=20
message. There is the same requirement for contributing to the Linux=20
kernel. Adding such a line signifies that you, the submitter, have=20
agreed to the Developer=E2=80=99s Certificate of Origin 1.1 as follows:
[...]
"""

I could suggest extending the commit title a bit to give a little bit=20
more info, e.g.:

ref-manual: fix typo in SYSROOT_DIRS_IGNORE example

> ---
>   documentation/ref-manual/variables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 848cea787..3709fca89 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8618,7 +8618,7 @@ system and gives an overview of their function and =
contents.
>            is just to show the usefulness of setting :term:`SYSROOT_DIRS`=
.
>=20
>         When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is in
> -      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe `=
`B``
> +      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe `=
`A``

Good catch :)

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

However, I also believe the example is for the wrong term? I think we=20
should move the example to the SYSROOT_DIRS term instead as it's more=20
appropriate. One can also write some example for SYSROOT_DIRS_IGNORE if=20
there's a need for it. What do you think? If you agree, can you send a=20
patch for that as well?

Thanks!
Quentin


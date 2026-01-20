Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74A5CA5FAF
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:44:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10792.1768927454632753241
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=XG0Zl2kZ;
 spf=pass (domain: cherry.de, ip: 52.101.70.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkv4uy6EpnKHcM0S8yWWGTiuAfXKD0KKRgZDtY/G8aCpfC9QAQNHUMPDStI7HSEbjMXVYXKevEVsMVtTbyj9R+CFhISyzpLBLiOVFNtukNt13DADVGgqoYBSLUs5ds/Ty3nrghVXpgpo6bMDXYwqFJfZVNIEtamTywNmT8fzi4eMXwj2hUDEqwWt7ex2dndiWaIZ/IbP8uNzD89QbJAVIu0izqMftE/7e2CZlNtWmpsm59EVMBXte0qZcpjCpwyZh1GpDnez4g+yaW9zsRuZz5rt/9Phh+q8azYALuT5gbqbuuqN1E7oohK5lwdo5fkH9hbnn5T1cnWW3ICkcFJAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1zJjkr0lU8ruAltS1mPe7cKiOJ1AZ8fnFNZ/hlS7NY=;
 b=vTpsiJ9FUllS+r3D4Mty801xFfJuWAjmWuQfBzSH1JIR0wv69x/cQE/EIw6Bgo0DuX/o28nUyv91EhXxSLe0Ze2lkII7UjZ9RY7FFVZFoOVSJm6LraqN6S4SZkqcLKVTjAuiUk9hdsCKlwzQY9flHxALUo71gSbiaTfGdM2CAnS/tMnmEDzZLXchKyuKm4Y2o24uSk/WRlE8JJZfgwMp2v5eqks8MZpfEXFf6elkGcew+JJc1Pb0OJA3TDbAQ1euBZvCU7KTEwCjWrHA3It0+LivMXnmL+Gn1bm47dNvLPtrzclJVesf5mZ28cnq5PT1JTKwo2A0yUdDjvMURi1Wiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1zJjkr0lU8ruAltS1mPe7cKiOJ1AZ8fnFNZ/hlS7NY=;
 b=XG0Zl2kZDlMZwIoXMKTsIyhmtHzymnE/NNYW8wC7qYsQHkHaXs8/jiYvqNX1GBqcaUHsDKTr8J7+71su8M6NS8bO6ES8JVpgNqLPusnhm9gfXHYsbg+57dBjE4sQQN5ukKoZ696KiI8QjQrjT1v3GUrYDpemumrSzv7Rjz/8FFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:44:10 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:44:10 +0000
Message-ID: <1228b861-1510-48bf-87f2-d597098a3c33@cherry.de>
Date: Tue, 20 Jan 2026 17:44:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 3/5] ref-manual/terms.rst: simplify the Source
 Directory definition
To: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260120-terms-refresh-v2-0-fa49d15b209f@bootlin.com>
 <20260120-terms-refresh-v2-3-fa49d15b209f@bootlin.com>
 <bcbc66da-7d35-41a3-a3f7-6f27ce4785e5@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <bcbc66da-7d35-41a3-a3f7-6f27ce4785e5@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: aa22afdc-ff93-40cf-51f1-08de584322de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?heOTH3kSSGlbRmqdAkk7K6mvRjMAuQnuIBg1S49AAoOLw0fFUzFlEdqh5CEA?=
 =?us-ascii?Q?9olgv+A/x6sSdcwFr45jkOc0dACuloy9x6ceKI5t6c2Qv23pziICDB94qtaq?=
 =?us-ascii?Q?oghtRqoNY9T1exozwZOMDYxhsPdJgVNUgDslRXJ8CEguq3S/AlDw/3gZURCK?=
 =?us-ascii?Q?2IJGiqmc5I6Z+Z+KEiGya2IsDB0PgVGnA6Mk9fDPwKkc9mjlsb1wjYcV4slx?=
 =?us-ascii?Q?qfYg2EEFALHaD1REEzGavGuE+zFLWliaKdAJhwu2cW0H312yGblRAaW4eIB5?=
 =?us-ascii?Q?D69N4kAYPsRlkB46BxBWLDGjerXuZxcgoXRT5+qmv12W50UvdHE9/INjJLqy?=
 =?us-ascii?Q?y8mKA2un/g6OUzrP1DtefFDaA8whlfrpIVAoq5YhTjkmr02ripR/aCcs8vz6?=
 =?us-ascii?Q?/RkhmhtwMRygiGOUY1J4xSoSTnVffiLBSQzOMvL7Ithfy8C6QmTtzRx8WWOj?=
 =?us-ascii?Q?L0Ks4obv5jd6L4N+M4W6s6xgSME9Th1mWsOG/WtpIsAiLW+7WhntGPAWLaLH?=
 =?us-ascii?Q?rVuovwLSwKO5d7B7DIEXmD7St/tTsA6UTxBlkS0wVW/CeW0NNubfM0V+0UCC?=
 =?us-ascii?Q?eB9h6RHYdiAXfueR1aheoUqUgiEtmSqhzq4iGaQus8vBb8PyzzJOTJ/SQgyC?=
 =?us-ascii?Q?iGd5LDG/iquXnPftieMKCplFy9mwRe8cCOlVm7/Ry/Tm4s+DU6ddRLRHp6YX?=
 =?us-ascii?Q?e+oo55MRa2NAuX6P/5mK8rAluzF5yAWNq7+BenX/OEFcq/3Zge5kFdqHfSUC?=
 =?us-ascii?Q?J9sq9js7Ln3CIJBf8qKjRvO0oZneZRa1a7yMEWSWSy2sZnWMcFeUxb+m+WTS?=
 =?us-ascii?Q?/VSwHrfZey/SjuEZlkCzeu57P+Y9NGhMfKa30a988O8H7RP8cLIMp2wa4jaL?=
 =?us-ascii?Q?eLb+lcbM7nYMciVjXsxe3PAaM1KyiU5Rufdl8NACe2zFBujMxOVNbLaTt5RW?=
 =?us-ascii?Q?ujfaxXCtC+Wg5n7DmQFPIYVeU7jtoxKadbe7F7zf20SOOyEOV6jO6fAGTliE?=
 =?us-ascii?Q?SMcPFw7J08ZdsFY81zQ65YIa3u9N83rWXhpO4JVeQ7IMXkfbMjP2FQOKgJs4?=
 =?us-ascii?Q?7gKM7P9kgp7+/F2LUelWZewViOEHhRolkbappP20IGymGnFtBV3amKS4sfCf?=
 =?us-ascii?Q?lMfDtkdWQ4v8wgGgvhTC+SIcWA6paBMnHIRR20B8gi9rZlKSncNoRcYdWdUb?=
 =?us-ascii?Q?K0+YbkzI5gcj84cWzTGcceYP9MWW/9lDYG44MB3MeCExndzoRDkiFlMVexda?=
 =?us-ascii?Q?dRGKTifHhTXtzIEMeSZROH8SklDqw7D7aG0GzTkmWLDraJQ1X2gXIVUwYGG3?=
 =?us-ascii?Q?K8TisU7hd52UE5+ePY3qB5UAghkrVRWmEEFmhXnAL/VInjP2jrySoaq+AIau?=
 =?us-ascii?Q?f3yylAvhHDpP9G/ye6TNqh0PI/ScaanL6+tgh6Ko1OrOOAzdJ6LRaWgfw4ei?=
 =?us-ascii?Q?VvwYwj1e60PwtCZYt0bnF7FMTWMPx7MEucBvn77UxK4C5UTvm7oAVT5jbl9s?=
 =?us-ascii?Q?HLZWj6hkQsiWta/XJpetOUz/a9+aAKMHyl14+wZLG3hZmcNDxf5diiN3N43T?=
 =?us-ascii?Q?K/5fyNAE2eEpvqovhHU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?szVC2eA14Rb6tHXZGr5XZWM6gRjwpuQgDBjy0S8PgCSj4bM0SdRVN3sSjS5B?=
 =?us-ascii?Q?7dlgsU8z/fEtWD6Akey8L0/gNMvYRnbvn8b5my52o+VlM3jv3nkBU7esgmc8?=
 =?us-ascii?Q?8/7jkgNh46aeRQpADjl8SCiuKK7LSINLpXUMvS8LvX8xqxn3jtirqkIF2Zkg?=
 =?us-ascii?Q?iskJsEDogAI/bhTI2Pp4oYQWHMO4SYqTEfl9dERc888SGBXPiUQKCgENUiGu?=
 =?us-ascii?Q?f6DNNR+ksyHn6GrfTg1Ke2lzuIqgLCj0oD4c3EI5LuQKyAcblcsVyGry0mZ5?=
 =?us-ascii?Q?7LCG8SLFiHgwl+94rNxlaFJ/9PW8+kGxvQekxBg1Jvpu8zo+zKkiudi/I0Kq?=
 =?us-ascii?Q?rlUsqoDIqLNDXoD5H8elXwtT4a/Uhts2XnK4UpgnymIvqAfyFk2LBKYlCKkn?=
 =?us-ascii?Q?3TQ1vBI3fzAesrvqMIKlbO5uhWXoAO9UMO9qqunQZ0v0wHFmwpXb1nnkLdAt?=
 =?us-ascii?Q?O44ivbI2Pm6DC4sK4x1CpzHQI0JK9nlbKFR1ank0PRvT+z0EslBXOoa780Zy?=
 =?us-ascii?Q?R6BYEPiDZ7HG4YwKPhfIMITlsVrr8E9EsydUykZmr09AFKg3zTCSPnkx5bKX?=
 =?us-ascii?Q?1ySnkPD8IA3mHTAdXVJdll1KX9uAq7WMX6BGK5CaIZHTzQ6suvdUSB9QLNZc?=
 =?us-ascii?Q?7VObNgVbkvija1Z0SoTR+SApZ5ESxsMDkl6uCgMvbNIvBx/Os4ePnRAkJLx3?=
 =?us-ascii?Q?zWZ86Z3NpHw47i7hcsXsRIVtzRrxlTyOdPWfpx2mIX9DvW5fJ1IRuFreQ74T?=
 =?us-ascii?Q?YJGALyAhUhQZJ81oV/JheN8MZjXpuxAT5KjTl15H3IqWYLtyuibjQBZQDKLf?=
 =?us-ascii?Q?zAce5e5c2kBUqymTx2PkB9fvXRKL5q4IxflbFh+7KTOZq6PrVHOcl3jpu5fS?=
 =?us-ascii?Q?ogtwUYHvVn3if5olhmHbjJOn1P5D9bO1TvzjaVlKO0DD3JUnBmRi+riKNKYh?=
 =?us-ascii?Q?1Mxm8zNosP1aPF10gvAor4BXAbgCcyi/3lhMkp6NCcnhTntOn/KDNMYxq4t6?=
 =?us-ascii?Q?XZXtv8WDJbm1FGHISJmDwZI8A741GNUKL1XnNZu+DVTMTJm6+TXt82ci6XKI?=
 =?us-ascii?Q?oborYv1FdFih9JCrZrQNzQ2x5dIIEcJ4KhcG42Dl1gCil+NSPNHow5P1p5DB?=
 =?us-ascii?Q?nDxdIMIMA02ex5bP6z7WJQPJFx7LYCRJGHLZOaitzMBchGEfPfIST7IghoMo?=
 =?us-ascii?Q?RxYx1DAvH9Wi5zzOse38N6z/xwxabeFVLILHPcP7FSPrILyvlmvRBQfMH5s7?=
 =?us-ascii?Q?fydLk3weB97SCevNOSpZa2dnTHpoOS5RepAh7c8A/yG1/fOIlf6Ef1oMCkaY?=
 =?us-ascii?Q?5ESKqvy/g38LekkqyEWBn8cNb00pAseMuBZ8ah4gh/d6gNOAzmwzgcTjNXOW?=
 =?us-ascii?Q?DTnYnG37s25yatqX7TjT3io2Au0qvwpda58r9tcX1yDfc9pS1K8UyPaHAA3h?=
 =?us-ascii?Q?IvBuFQjoff3N7t/YpoUgwCUCP4P7mwmMqHg1cTi/ZyajN04NsS3Wdq+zltQY?=
 =?us-ascii?Q?iLehc+zXyUh6F+AId43jxMXdKRkmnBbwRBTbs4p7VAlD/8vRG1PjCRw5fNv0?=
 =?us-ascii?Q?NHdIAQDVEeEsrb4PP45TmuQUX4tnqlPXnqtUzBIbcp9RaqEqLs8yEp89c+XB?=
 =?us-ascii?Q?mWYPLM+5Cir/GN3BkUne76ll+uctUG4xYcwXpMYVgJECfg/wnoUYOP3H45rG?=
 =?us-ascii?Q?0CvDYKpz2eIS+ftPHuLMmCqKb6YDpHOIThpi8mrV5NjDLiq3vY9UcUzYnfwF?=
 =?us-ascii?Q?nzKQ1W8YnirfMhlhJ6zhHtk+z4130LXM7RL3NGknsZ7uCF1u2WMc?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aa22afdc-ff93-40cf-51f1-08de584322de
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:44:10.5133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObXKkqpzoWMYOx8xjwi9h9/fM76JkwP7+GyJ/D05UNqil1RUZD55iVQjR5RzlkK+KIfU1ttA9oBC8DQmikzgtF53nw/GQdT8dmNNP++J6Ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8605

On 1/20/26 5:42 PM, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Antonin,
>=20
> On 1/20/26 4:17 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Now that we no longer have Poky around, simplify the Source Directory
>> definition:
>>
>> - Make references to existing documents that show how to create this
>> =C2=A0=C2=A0 Source Directory.
>>
>> - This directory contains sources, the layout in which they are
>> =C2=A0=C2=A0 presented does not matter so much, as it can be different a=
nd/or
>> =C2=A0=C2=A0 freeform depending on whether we use bitbake-setup or not.
>>
>> =C2=A0=C2=A0 The definition chooses "project" as the name of the source =
directory
>> =C2=A0=C2=A0 and is the one that should be used when showing examples in=
 the
>> =C2=A0=C2=A0 documentation.
>>
>> =C2=A0=C2=A0 A typical Source Directory would look like the following:
>>
>> =C2=A0=C2=A0 project/
>> =C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 build/
>> =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 layers/
>>
>> Other parts of the documentation referencing to this as the Poky
>> repository still have to be updated.
>>
>> This will also mean that this definition will be used a lot less across
>> the documentation: in most cases, when the "Source Directory" is
>> referenced as the Poky repository, it can be replaced by
>> OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep
>=20
> Not really? The Source Directory will be project/layers/ no?
>=20

Reading your next patch, no, it'll indeed be project/. This confuses me=20
tbh, I don't really like having a Build Directory within the Source=20
directory but eh, what can I do about it :)

Ignore this part of the review then.

Cheers,
Quentin


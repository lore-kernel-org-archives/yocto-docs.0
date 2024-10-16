Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11875D1AD36
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 09:29:06 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.96])
 by mx.groups.io with SMTP id smtpd.web11.19164.1729070940981012200
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 02:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=awnorFRH;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.96, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWBOaaMHjz4/oonrm7ta3m3tfn/0STB/29BueZVCj2tDMXrCogwHVYWJqmuRUKcPYxtIZRjTzZj87NeqiFGDBC/8RBXvfqgJAg9yROpt1oi2KO5eJvL4iHqAGcW1oyqru3naLT2kyB2LDDC8g4YZafGsXhAFjAjnfLbvn8fwNpEkJ/xbw2Xi4oJle8IpgjRnUpqwldc3L8F5oZXTV3N2uG2kr7o0B72KbG1/C9fjrQQCWKsda8e5GWmzUkWinUIP4gbj4pJy9h1eIhAYmJInmdVQItZ766P1r6Ws4C/AgToqifemG7BH9mIYGk0T1T4pyf9iISb1Y9185rocURkWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDpu/Jo+rRfS9DhBwZumSCz/CwOQYag5/EkeyyKRye0=;
 b=ofbSuGzecH/i9+pZf5mG5lu+8KF6yWA4+vVa9punw1wGYeVi+MF4AXspoGTMBU6iCaH7md8bEa1/Re+O8yWC9bQl8GfQZoKv5wqMrL7vCKXH5ruOpbYGtB+3/AkCNPibZn0Sws5IEks1y//BTjsWVmOx5N1xlZ1+LwHPBInbyAcZ7fe8hC/GwM5I13wgs1y2zp0pKU9W1iSa2I0USwJp7JNUHuHhtslsWm//74q7iM0QngOmzcWXLDZhYOOSYxOHMa0rXyZ/fatmrCOeIMb7LlsebUAePGi5HUc/UClLdYxALafOYDPrYq5pBhyZ3vsMeilqEcYdrQ6bZGFYLgip6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDpu/Jo+rRfS9DhBwZumSCz/CwOQYag5/EkeyyKRye0=;
 b=awnorFRHe+xNzMbmM+hf1vPZCjXbJbiRHW7iD4ez95+t/F5usMbIvTOtTTvihBSiehZL5Imy9++ClyeJ8m0QRtL0p2ElYCLD22gosY2llApevVF5MixP9noEemgo1mu72kfsXIPLBBAeQuULe7/s8VsF3jZkI10OO9DeIV+b9m1dYJUxTRwB3EETlTp8qPIplbcfVxZrWN40DAnabeTRF4XlWxQEaatVBU2T4KLCVgw94IbSijLJ6EdsXhsE2yShx6A9Yp5HhmDaFOv6u/dto1Wo/fIkKReTiRogbnL7WN7uof5qky+t6UfMcZbNQlgZOaA615wkEGrt9F0MV4jugA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM7PR06MB6787.eurprd06.prod.outlook.com (2603:10a6:20b:1ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 09:28:56 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 09:28:56 +0000
Message-ID: <0038382d-03d7-45f2-a698-732b97cae1d2@vaisala.com>
Date: Wed, 16 Oct 2024 12:28:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCHv2 2/2] docs: Replace VOLATILE_TMP_DIR with
 FILESYSTEM_PERMS_TABLES
To: Antonin Godard <antonin.godard@bootlin.com>
CC: docs@lists.yoctoproject.org, quentin.schulz@cherry.de
References: <20241015160735.3066914-1-niko.mauno@vaisala.com>
 <20241015160735.3066914-2-niko.mauno@vaisala.com>
 <txudacpuo4gp6kgmxvmdlbwpl26n5uwubbo7jhwudharzyu6i7@jtqtnmowzsjt>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <txudacpuo4gp6kgmxvmdlbwpl26n5uwubbo7jhwudharzyu6i7@jtqtnmowzsjt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00002E73.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::42) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM7PR06MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: c8fb85e0-7926-4ec6-b535-08dcedc4f57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1CmC/AvPd4aF2UzFi4TL7mA8+tekgNVibayktmdSu3kcvdp+8pyCg1OOkpwx?=
 =?us-ascii?Q?QXprqhkFb2/8cKBZnOSFyucTzTwhVs9vk7jBLAQd1YfQacjJOtKb0oeJTvZM?=
 =?us-ascii?Q?j8j2Ijtr2RufB7AF6cMRadsn1VNc4UpU4vIoxTJ3ehAXtFaTQzYq+PfgJdfX?=
 =?us-ascii?Q?eGtLrDhC6/zT9EB331lKdhKgesrFKblsOMj1fxEQj+NxTdHqXygOVTP/ekIm?=
 =?us-ascii?Q?EVlf9e3+ifNzGE7HGCV+HI/RBzclqWseRzy6EAjitJIvE9/DBwOJ3hCnLUIP?=
 =?us-ascii?Q?WPbkKXmc/juhaaY/LMzq2jc8emEDiP12qh4EobPtjNOY7e/T1b4j+tDdmf2U?=
 =?us-ascii?Q?p8Mues59IKWhfGmz2gti0pIC41EXTTpeuctjQZFpnLRXLpyqoVxSngEnD4M2?=
 =?us-ascii?Q?6LbgERP84/AGnFxIrBU84w/EiGCVA5rdLs1EDOxHZ0UoMFU99gsoPehjzkMh?=
 =?us-ascii?Q?WyXPRNCrWGqQtKmRHk52LhIan7x1XCbkBEc/sc6mNvzhiNJEy2LwM9lhE81R?=
 =?us-ascii?Q?Cg9SC/myXHywz9qlFgO/SLMXKNbe4IFCixtLUaz3MCquPul97mCA8e2ENZBZ?=
 =?us-ascii?Q?0QIQRHGYCp4YGD3OZeMgWPcDQF/hMKzMIJipMN1Sd3hnTXdda+GR568mxyPM?=
 =?us-ascii?Q?BRulAuPtPMmaT8Gsj+xBq88/OKsBrHgcEnfdShB4WTWfhyY82ydvy3MRjdPt?=
 =?us-ascii?Q?JYTiA67Hy32hvrtujx+xwvuU2AwhlFu0K28k+iXxnGAjhst+8VED7wpRCyiB?=
 =?us-ascii?Q?K8+HOaqYzG0PwE1VyHVBSIbl1AwuQhwMp2rbu0SVDoJkf14DlkqZ6Raxmjzh?=
 =?us-ascii?Q?Qmw8jn4epPW9Hurg8QYOVwCu4+8VOJz1uwsUFcC7k/heol1ztjjbNZxxQAOU?=
 =?us-ascii?Q?lXgmNMYahD2JvSmYIUhANsElzyz/4NyfWegcB1hzu2WaxKFoIn34C7+U7HVP?=
 =?us-ascii?Q?yFu/KGD3cdv/tKAU2EC2+Q74FjxCdrTnfJKQ7KPVUpJvyINOwpQuZKcqqxCN?=
 =?us-ascii?Q?GI2zXtBy4BPySQBm7mhC51+UbGdCuwHr74owc2dn3hguytx7koAH87lVBPMD?=
 =?us-ascii?Q?PmjhEcIe6udGwfJ8taBSyjghKx5B89rQt2G21zzLMgBnf36IRCLA9ogxLxLn?=
 =?us-ascii?Q?ksb2ZTi557uyA4SaXbGzbO1qQFoBRL6VC6LVhYAalE3vh5k6SWLlaaV8i0JO?=
 =?us-ascii?Q?b9g/qKhKbo7S+sbGmhlHdmjVaZ8vijF/Uk0D3TtQ/sHAV8Uforoy8K7kc1s?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uJbgjLZeo1N8GryS/c6/9CXWktqitPojsGCEkNCDQmJzxkjsR18GbYh79F5R?=
 =?us-ascii?Q?4vusqumtXQwq5NLALhH/LjlxTKe/g2PbGNunhFAr3WXnGru4YqMRR3tpbUHg?=
 =?us-ascii?Q?uxywOkfUbooXd47kaoBO+0E5OJHU51g3L/pKkdBqHchWqd+Ds4MHhY2RFKHz?=
 =?us-ascii?Q?gBGl2nXPVGZCiYiPhqWxnRHTUkounjv6c9XqFMWKftf4I7iWC9K8uiKqlzeZ?=
 =?us-ascii?Q?Aec76j5R4tCitDLdUpsTyocnDqlUyUepyRlPEQiJoezXrqyEgIm4ttweUVap?=
 =?us-ascii?Q?EWD3GvZpRTxd93D9PxqVfZqheSg+LQcYYGdUqbZ6rNvx0xXgtqS9alFqUSEJ?=
 =?us-ascii?Q?iPinoV4Q2zXUrWzmwVfFjVcZKkNejPAgQRm4ZQazATV4RaKYgV9qm3yxfXF6?=
 =?us-ascii?Q?b1BIEd8xWYzpmys7BfnlTOCfdY88ebIpm41rQMYFCXNqPVbGeqjl/Fr9vBW2?=
 =?us-ascii?Q?L/1Y8k5p+kIIxEcvTsc01yaWuw0EgMj6NAL10LrZFAru2eDXQU4cVJfQM9Q8?=
 =?us-ascii?Q?ALbJA93fc8Kez4zgp+piJCWrfqrOuK4sNIfy2UyIGSDDlW3QSaxnxMW+4Qyn?=
 =?us-ascii?Q?z+QZhvRCBh6KxBiN1C4VKo7JktR6nCKbyYsQ+RQwgGBb0SPoihlpCg1ZTzxz?=
 =?us-ascii?Q?12KcT02vBFfnCBrEk8kj+qmtAGKRqlk70JBw4aFHzjcc9oTZevWYy5VImTdh?=
 =?us-ascii?Q?Vp5stF2mgfcKj6llHBhi6v7x/2GEfEWmdNpuLtJ/j2o2+xYb3aOH/t6YL/EF?=
 =?us-ascii?Q?Rhgfw6QvH2Oksg+XBmkHBJRkPr1RfIpUp9dB/OIavmvb2c7ZcUMBQlamOOBJ?=
 =?us-ascii?Q?Hk5FrA3DjGQIjc/13ZgSkuPAGkjHeqeT7zoXzvirxbg6ef2/liTYBGRE66kD?=
 =?us-ascii?Q?BinuCt+8PeaeCaF+VqbBUfjlcR3BkO6xFeWoN0Oqa2rsv9ig1/Pc9S1AZGMF?=
 =?us-ascii?Q?ZySjFVV1ji6V7rUSwmvp05eXRlD2q7arK6JhlkElCAVBB7AVC1aO9YcIRlqY?=
 =?us-ascii?Q?iG0itXtBaPS8Q0qPi+mXPEVzBmUMtMJXx02o9YNBIV8gGm0LtDEmmtyntlL6?=
 =?us-ascii?Q?l4JwqMxRhqmdtTBudLpamrNUI4zbEyUR4SsY4T9zScrMi/PYPgEsYlYBGfDf?=
 =?us-ascii?Q?Ia58BxzUVIPxZsyUPCyQXVj0eWNwQRBYFzVPTiu2vk1AHCfq2YNIvS0OGJL6?=
 =?us-ascii?Q?7gCTNIQzOUeEzHKM2wqGdxTmgRqj2Fq0Tzp2HE48vtJWU7NMjRUblbLCKVF2?=
 =?us-ascii?Q?BR0UGsAldtql5y45ixmYhvKa7cQLLagkRqRH9yRM/vJtsNWOojQ/KWAJQIqm?=
 =?us-ascii?Q?wbHZvGXnTE51QqQucM2CJmzwW0IEjUMwGD+Wq6a9yAghhPIRQq83B9Zj0AhI?=
 =?us-ascii?Q?DMz0CpXRhLhj68dIlOIF1kwufsX7Tz4w/QksVFOcu8+H8trZl9x59yuvNwwm?=
 =?us-ascii?Q?17YByOLasKmJ2sNFZJCSiz4dXEbmwV0v2s7OnUu4XcpC2WtnOD6u+hjtzLbb?=
 =?us-ascii?Q?jBox4nl4NmfVK/b4lMT4HXpl1tKgN0/roXWveJey4rbBBD27NjFthDsczq6D?=
 =?us-ascii?Q?xvBXuNfxqcBlIQFX3lJ7jFVGnF9O6K6AGiIC0T07XVG20FdEf7j4TeGaML0s?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fb85e0-7926-4ec6-b535-08dcedc4f57e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:28:56.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCKLTTa6klKhpb41/myJ9faztdozBvxCneuq6F+IlugNorzYmKQXOEPnESMv/tOjHLm5WeXks2r8h0DQfqjMZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6787
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 09:29:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5500

Thanks, submitted v3 which applies the changes otherwise as suggested,=20
however in the last item I slightly modified the first half of the=20
sentence too (to avoid using the word 'files' twice in the same sentence)

-      For guidance on how to create your own file permissions settings
-      table files, examine the existing ``fs-perms.txt``,
-      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt``.
+      For guidance on how to define your own file permissions settings
+      tables, examine the existing ``fs-perms.txt``,
+      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt``=20
files.

Please advise if there is any issue.
-Niko

On 16.10.2024 11.12, Antonin Godard wrote:
> [You don't often get email from antonin.godard@bootlin.com. Learn why thi=
s is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Hi Niko,
>=20
> Thanks for the patches!
>=20
> On 15/10/2024 16:07:35+0000, Niko Mauno via lists.yoctoproject.org wrote:
>> The VOLATILE_TMP_DIR variable was removed and it's functionality
>> replaced with a FILESYSTEM_PERMS_TABLES entry in
>> https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900=
fcecfe64c3536f1
>> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES inste=
ad")
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   .../migration-guides/migration-5.1.rst        |  5 ++++
>>   .../migration-guides/release-notes-4.2.rst    |  2 +-
>>   documentation/ref-manual/variables.rst        | 29 ++++++-------------
>>   3 files changed, 15 insertions(+), 21 deletions(-)
>>
>> diff --git a/documentation/migration-guides/migration-5.1.rst b/document=
ation/migration-guides/migration-5.1.rst
>> index f58de3156d..64944b99cd 100644
>> --- a/documentation/migration-guides/migration-5.1.rst
>> +++ b/documentation/migration-guides/migration-5.1.rst
>> @@ -122,6 +122,11 @@ The following variables have been removed:
>>      ``files/fs-perms-volatile-log.txt``, which means that volatile log =
is
>>      enabled. Users can disable the volatile log by removing the value
>>      ``files/fs-perms-volatile-log.txt`` from ``FILESYSTEM_PERMS_TABLES`=
`.
>> +-  ``VOLATILE_TMP_DIR``: :term:`FILESYSTEM_PERMS_TABLES` is now used in=
stead.
>> +   By default, ``FILESYSTEM_PERMS_TABLES`` now contains the value
>> +   ``files/fs-perms-volatile-tmp.txt``, which means that volatile tmp i=
s
>> +   enabled. Users can disable the volatile tmp by removing the value
>> +   ``files/fs-perms-volatile-tmp.txt`` from ``FILESYSTEM_PERMS_TABLES``=
.
>=20
> Nit: can you add an extra space between the first and the second bullet p=
oint?
> To align with the rest of the doc.
>=20
>>   .. _migration-5.1-removed-recipes:
>>
>> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/docu=
mentation/migration-guides/release-notes-4.2.rst
>> index 30049b89f6..ac3bb9cebe 100644
>> --- a/documentation/migration-guides/release-notes-4.2.rst
>> +++ b/documentation/migration-guides/release-notes-4.2.rst
>> @@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
>>
>>   -  New variables:
>>
>> -   -  :term:`VOLATILE_TMP_DIR` allows to specify
>> +   -  VOLATILE_TMP_DIR allows to specify
>>         whether ``/tmp`` should be on persistent storage
>>         or in RAM.
>>
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 62a225ed1b..59ecfaf016 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -2994,11 +2994,11 @@ system and gives an overview of their function a=
nd contents.
>>         and users across an entire work project. It is best to do this i=
n the
>>         packages themselves but this is not always possible.
>>
>> -      By default, the OpenEmbedded build system uses the ``fs-perms.txt=
`` and
>> -      ``fs-perms-volatile-log.txt`` which are located in the ``meta/fil=
es``
>> -      folder in the :term:`Source Directory`. If you create your own fi=
le
>> -      permission setting tables, you should place those in your layer o=
r the
>> -      distro's layer.
>> +      By default, the OpenEmbedded build system uses the ``fs-perms.txt=
``,
>> +      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt`` w=
hich are
>> +      located in the ``meta/files`` folder in the :term:`Source Directo=
ry`. If
>> +      you create your own file permission setting tables, you should pl=
ace
>=20
> s/your own file permission setting tables/your own permission setting tab=
le files/?
>=20
>> +      those in your layer or the distro's layer.
>=20
> Seems confusing to me=E2=80=A6 I would just say "those in your layer.".
>=20
>>         You can override the value of :term:`FILESYSTEM_PERMS_TABLES` va=
riable
>>         in the ``conf/local.conf`` file, which is found in the
>> @@ -3009,11 +3009,12 @@ system and gives an overview of their function a=
nd contents.
>>
>>         In order to disable the volatile log, which is enabled by defaul=
t, one
>>         can remove the ``files/fs-perms-volatile-log.txt`` value from
>> -      ``FILESYSTEM_PERMS_TABLES``.
>> +      ``FILESYSTEM_PERMS_TABLES``. Similarly, in order to disable the v=
olatile
>> +      tmp, one can remove the ``files/fs-perms-volatile-tmp.txt`` value=
.
>>
>>         For guidance on how to create your own file permissions settings
>> -      table files, examine the existing ``fs-perms.txt`` and
>> -      ``fs-perms-volatile-log.txt``.
>> +      table files, examine the existing ``fs-perms.txt``,
>> +      ``fs-perms-volatile-log.txt`` and ``fs-perms-volatile-tmp.txt``.
>=20
> I would end this sentence with "files": "...and ``fs-perms-volatile-tmp.t=
xt``
> files.".
>=20
> Cheers,
> Antonin
>=20
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com/


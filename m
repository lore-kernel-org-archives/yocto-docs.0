Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4258D1D88B
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 16:11:49 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.114])
 by mx.groups.io with SMTP id smtpd.web10.781.1729008703273288899
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 09:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=vi+4UirK;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.114, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhbtH7hVIKKMWyA67HOXzTinf9yAPVIRoe6bolhUjBQVz0gTM6IPWLKygpcAwkh/TFjok2jrg3a77pmBpu41nq6s7wbVlhxqdFgYwzVhng8ewtqsu0IurqrThG3151Dv6zCUbsk4pczrlbxWTvDIunRk4poswMSAa60hZnoksqtcLHVqtfd/JGuZA/3cNnCDAmf8FYD2dmsIdl2YZ+ZBp/qOS+2FSSel9Mn8qIPFqnOC8D4EYX0CNlLBvSEq7MvM+g/cxo3//eBAE9V2hNtp8Xpu+ve2HXWC1aXvEVDuzWj+yCdZkbauVpq0joqH7ZaI4mt+VmwyA0hJ1i+G0rABnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkfoRDPeAe/8OhVaiwdtpgP4x2Wote0FKktfaEhmnTE=;
 b=KW7d8xKX90lKvEYq48K6GeEpoaUN7067LKLGiUYIE21c7wallWnEya5KsGdFgQ/gr0BlUxvxAFmQQtaCrvbfP9Tiu1vI28LISqViPdJOq1DzuKO0nsTtO8Kx3hY4sPQP45QxFFTTU1+4lsJboWsP+HpWk2V1N7niDVgzErrY1dEaBD7ZxS0iz+S7em5rPiWrNHm3cF9FrReOhwMX9k4S0OvC+Ahjm7tcwle9NVccUZ0S2lCZbP61FQK0Wa4Jeui+3z0etkGN4laRIstnUzeFOBygx/C1kckmYbvsu/EExgEF30CD/OvIjG8ftdDWXWHXikj6dDHr1aXrXqGh0CjmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkfoRDPeAe/8OhVaiwdtpgP4x2Wote0FKktfaEhmnTE=;
 b=vi+4UirK/tcDWzubcnBEFHL1noele703/2FTUidZdmcYZZUc3YohAjDSXQK24NeQWA5ho0yEWSTWFLufTDud2kLga4C4XTG4+z9XHAFD8/IgkJEGZwma1wPG4SEJFrANSqkTCTGnL4xXDpT7J21XhGSiT702gZaXSX4KG89/p68kDdDebB3jb1XKCG53Rc3fOGHHeKL9ayiuTJD8YEb6qeWu4JlTkMHwgWPzSlfG6hz0sv8yoJphTSB6wdBgBoA23Fc5vwTNMusl0GsMi5tYLzH0qvR8V8SdLmqy/10ucB1rkFC1encIoG4lReIwkj+O2xRJ690hZuDwz3uekn4QXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS5PR06MB8599.eurprd06.prod.outlook.com (2603:10a6:20b:650::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 16:11:39 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:11:39 +0000
Message-ID: <1edf889d-9ed3-4332-b327-2eae9da9959d@vaisala.com>
Date: Tue, 15 Oct 2024 19:11:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] ref-manual: Cleanup VOLATILE_TMP_DIR
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
References: <20241011144847.1332607-1-niko.mauno@vaisala.com>
 <20241011144847.1332607-2-niko.mauno@vaisala.com>
 <fd96f072-fa22-4516-af80-d11cf20b65a1@cherry.de>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <fd96f072-fa22-4516-af80-d11cf20b65a1@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS5PR06MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 230a0ada-b582-492f-ce27-08dced340d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JXdVKGNGglyKSOyqSHJR8j14xtBLcTWbnrjSfCVdWrHCrDdYijpMWstKA80v?=
 =?us-ascii?Q?yFdx0gE+kW3U8e2omKTcF5O5sa7fEEch8oSMELEQEn+pYDlSxcvrsCNghtDm?=
 =?us-ascii?Q?lDt87hRh63iBaQja1+oyKHbi5mKcSXd4ZyK1zyY83cuHpxyZMopOlDxNaPCH?=
 =?us-ascii?Q?001bdRK0byvgpIzsR59+WO5OaiE9epSghf7960zdRGk21rO3vxRvm9hshape?=
 =?us-ascii?Q?ZEDlF+gauMRYVmv/BqnkeUDYnBdpJUBMKe/vZpS4Cz78e6isFqCzPAlAcstP?=
 =?us-ascii?Q?PPrjUVCFwqqLzCW+TSVDY0M11fTWhvpSOnPN0YtThoHAFY2apYcDXn5w2Qch?=
 =?us-ascii?Q?rBnkb/gIlP9CXkVZYu8x91JdtUrGih4uQBWDK2O5R4QORLuDDPe5zNilh2iH?=
 =?us-ascii?Q?8gDIqwwAYIilXRrOudTRLVdzr32Q4CWIP7Smbrti/CG6izOhExyTzrRPJtjF?=
 =?us-ascii?Q?mFfy0mtF9U+e7F1h1t3aDe22I5paH9d9r0YGOh2mRns0q2bJ0PMKYnlqdLha?=
 =?us-ascii?Q?ruUpkgVBsh8txU3+lV896KQe/pjroBVwQ/jQtN2fsuyGlo+FTYih9hr7/KB9?=
 =?us-ascii?Q?ee/rlba1+U+sQOwf4yVPGxEqlYSSJUrax2jM7ZXw+GTzb2AT2ZxB2j2z5B1o?=
 =?us-ascii?Q?yE3UctY3H1SU/gQGNmABCVYEdtKgoLGir/pCwIC+mBTO9GHoWgGS/gK5yYQN?=
 =?us-ascii?Q?DVtkTns8YGHIwnyzCODd25YfgZ4H8jdhLsZu3m4k9+H7TVm2K2gBpJCFUkX0?=
 =?us-ascii?Q?hhxFKPZlQsqd/tb/2hd1uHdLmTZgAIzE3hg7/8ixAJKM7uwZp9UBoHHElBpU?=
 =?us-ascii?Q?WA9EMT0jhexyo6lBXe3HlE2RAWm4o1x4ZdbiHj4v6d6aHnqVTeehZ9zextN4?=
 =?us-ascii?Q?xVo7HQFT8i4IXjs1a3Doq0p8yVIlSt0HXfNZ+wBcv5rAWlVbl+WRrP+ldf3i?=
 =?us-ascii?Q?HfP1icQRDFuLwPdOOk724FxDe+pRNUU+HXkB8lxqvMi4k3Gn4y+28hFXJCPq?=
 =?us-ascii?Q?tNd8NTU9UwQ1bZnpEI+OJGdbQI8G6AGEpd2Bf0FshRvBQuOsheXDGGoLBOda?=
 =?us-ascii?Q?CpkxGGwOv4fBNbsTFVjGGafg9l1eBDitD814sFn+KyCmMAey2vRRyeCc7aYB?=
 =?us-ascii?Q?wWCyTqPmXtnFBe8cTzKVuJHYv3ThK1QUeWmoPz3CrxzQoeMvvCK6vQ34an0M?=
 =?us-ascii?Q?dk892jwLXgzF8JubpUMFXEgu8KcxbZR0p8B0ehiCBr8yr+M6Gced5Vjn5g4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cFPMpgG+vv8B2eHH4ZdpxDe+XBiqKfaeX9ln5Czq2+XC1kxhGsHF7Cjw5S/D?=
 =?us-ascii?Q?e128jAM5zpriT1y+TzU76l4AqN5CLY24iOBDa5rgABC+UvFvq3hzVBc7yRHb?=
 =?us-ascii?Q?msVSZZYfoCeJqsUclXjjgsyIpztDKjXeluIk74z1e/yvMy29F7AxATWz2iOh?=
 =?us-ascii?Q?YELJekdYFXROEWBq9meKbH8dO3A/2o9rWAaPY/VF7L1Xx9BtaAQRslZzrlHa?=
 =?us-ascii?Q?ezbb4Mlv3aLaZuIs3LDBwYEHjA5qb2C7UOp7Tsdqr0cpM/EUyTvV6SzWbU2H?=
 =?us-ascii?Q?L/dIeld5BcK/2HVyf+okLgLpcvEMSAgMMXzizjDF1ikV76+GTLkVyBi1TQRy?=
 =?us-ascii?Q?AD2Y7AAKVMHF7i1xQlq+AOAYNeGycb/RZ7pbfqwwQp3Xhed4b3zODWOaMtVo?=
 =?us-ascii?Q?QHHAXTn5SPdvDNOLbZW9irA5/iAF7OKg2VP+GiyJIv2P80oQjZaEzOanhMOn?=
 =?us-ascii?Q?KR6kDqyMimHVimzIZTVhsOBKFWKZQaETuSnjksEuxoySsL809Qmj1DZ3C3rZ?=
 =?us-ascii?Q?ZhuwZOU5Ls6wUjjZmjPAJUWTjjWObcpnTMkpF9nKkRGL//NzC3UegfQhHiAb?=
 =?us-ascii?Q?RRYrbtQ1Z2XgWiyJFH33H8GndSl5SSZa5YhqrLc4cFmIMq9ir98EygyhQXkm?=
 =?us-ascii?Q?0AYfwP7sTrtus1JLZ4PKUG5w0wNqfJkwhWoHsWrRgaLuqx7jZLrHIOW8xQAx?=
 =?us-ascii?Q?j/8Sai7M36UuaIIyYvhwU4QGRn2ZP6KqZkrE+awgu+BkCoICIygJG4OhnmIA?=
 =?us-ascii?Q?IrcF8LuD3uGZ6VtAnBS3BDUVDvXIShMB0a+L2iY5wxPvRoVtdeLLx2xs/GSj?=
 =?us-ascii?Q?YLNajWwtKQRyOZd6o3DxsguTLjgZktIIKqGGABhQBhH+avGp2qEj1cXCK1Qr?=
 =?us-ascii?Q?cOiWaNYkvp8Kj0ODnTBE0Hhz21MmWoxoHha8ddK0wZyBKr7+3T4LsyZrSXbL?=
 =?us-ascii?Q?T6o2qqh/lHTEsP/G2NnFDKoPveX9T18CEBuD7A8su7goPkCI1OBypSPbV7yj?=
 =?us-ascii?Q?K3YDHUcFGbOgBEXCa0Avuetk1xy9LqwWljGr48RJlNby4+vEuuSg+VMkWBsf?=
 =?us-ascii?Q?ZPqhYwEIymOz9ifalbmQC57BTcbsRW+IF50BAB5XGhVAY9YNZioo6xg2hC2x?=
 =?us-ascii?Q?R1vqOnl4/3Okc5I9T68aX41InldFIHM+M6VeEJ7BQyDYtMjMME8qF9C1AuHp?=
 =?us-ascii?Q?Pr1Q1cCCrx1eyc9tPIpJV7Z2tlrJFFrGDAcTkpixWc+7xqgTJXZOPf5POXk9?=
 =?us-ascii?Q?aTnc5MKaFH0JsyjhUU6iwBFsoRJ2ib7XaQNR4IxdsnhX49fq8vLo5xUiU4rK?=
 =?us-ascii?Q?8rxmbjcRCRz1yLbtYHVmQgyc2PfLf0MPre3TY47+G0Qyty6pXUeiTkDYYc8J?=
 =?us-ascii?Q?UoxoEHp8lN2d/KNzM/ZfJ0M9AxMwvQ29b7b067nFolDGeAiHLNZ7hia+kcTq?=
 =?us-ascii?Q?QItrlBMcsRtho+iW62tUE0PAt8IoA38HaGedN1A3ahMK/MOzMKSfxLbu9WbM?=
 =?us-ascii?Q?AOyIZEN/pzSecq+oZ6rB/Bl8jn09vMISftl/leTZkbMYCroV4AaHPW3yyFG3?=
 =?us-ascii?Q?0mG9l8N4vxl9IbMiDbYlxJgnQyBVsciDPCkNy7Sw2YjnsbXd1+YAzW5rxn3H?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230a0ada-b582-492f-ce27-08dced340d4d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:11:39.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXVxyZQJ+el7P31XkaZoqlpIbTzYOf7j6XFNh1rd4ULnvBwQn2KwVUmrZ4iwPfxfC6mHFg2dSJ6eaSYY90QilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8599
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Oct 2024 16:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5492

Thanks, submitted v2 which strives to address the issues that were=20
pointed out.
-Niko

On 14.10.2024 13.51, Quentin Schulz wrote:
> Hi Niko,
>=20
> On 10/11/24 4:48 PM, Niko Mauno via lists.yoctoproject.org wrote:
>> [You don't often get email from=20
>> niko.mauno=3Dvaisala.com@lists.yoctoproject.org. Learn why this is=20
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> This variable was removed in
>> https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900=
fcecfe64c3536f1
>> ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES=20
>> instead")
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>> =C2=A0 documentation/migration-guides/release-notes-4.2.rst |=C2=A0 2 +-
>> =C2=A0 documentation/ref-manual/variables.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ------------
>> =C2=A0 2 files changed, 1 insertion(+), 13 deletions(-)
>>
>> diff --git a/documentation/migration-guides/release-notes-4.2.rst=20
>> b/documentation/migration-guides/release-notes-4.2.rst
>> index 30049b89f6..ac3bb9cebe 100644
>> --- a/documentation/migration-guides/release-notes-4.2.rst
>> +++ b/documentation/migration-guides/release-notes-4.2.rst
>> @@ -38,7 +38,7 @@ New Features / Enhancements in 4.2
>>
>> =C2=A0 -=C2=A0 New variables:
>>
>> -=C2=A0=C2=A0 -=C2=A0 :term:`VOLATILE_TMP_DIR` allows to specify
>> +=C2=A0=C2=A0 -=C2=A0 VOLATILE_TMP_DIR allows to specify
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whether ``/tmp`` should be on=
 persistent storage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or in RAM.
>>
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index 71b3325c8f..7686e538be 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -9983,18 +9983,6 @@ system and gives an overview of their function=20
>> and contents.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PACKAGE_INS=
TALL =3D "${INITRAMFS_SCRIPTS}=20
>> ${VIRTUAL-RUNTIME_base-utils} base-passwd"
>>
>> -=C2=A0=C2=A0 :term:`VOLATILE_TMP_DIR`
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies the persistence of the target'=
s ``/tmp`` directory.
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 By default, :term:`VOLATILE_TMP_DIR` is =
set to "yes", in which=20
>> case
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``/tmp`` links to a directory which resi=
des in RAM in a ``tmpfs``
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filesystem.
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If instead, you want the ``/tmp`` direct=
ory to be persistent,=20
>> set the
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variable to "no" to make it a regular di=
rectory in the root=20
>> filesystem.
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This supports both sysvinit and systemd =
based systems.
>> -
>=20
> Same remark as for the other patch:
> - explain how to persist /tmp (in :term:`FILESYSTEM_PERMS_TABLES` in the=
=20
> glossary for example)
> - provide instructions in the migration manual so people know they need=20
> to stop using that variable and how to replace it while keeping the same=
=20
> behavior,
>=20
> Cheers,
> Quentin


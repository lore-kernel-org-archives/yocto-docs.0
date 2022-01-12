Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEEBC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:18:14 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.68])
 by mx.groups.io with SMTP id smtpd.web12.23894.1641997091899719209
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 06:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=kJ3DM9BM;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.2.68,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ7rZfXzKhPAnBE6PsErreV9omO1GnZF7pTrfCJZ3iqE4IPqhTnlU9/8+s9Cez956Vx7qVjIrAy68T21vqBUYw2T7zQTIsVfHX0m5q2ylaOzD6urx0ItZ9pr3LNPgHtM+cn/6c1dXcl0F2BVLPB3Ti8fUyL0MAtv7VRJLpxSLccdea7+cqxRwQUtQ4wKXXHMtd2zEAOXkLQruqc4cr42l1cM01J/YtbXfjpwZH3aPPhKO0VLfkEaNisLIaXJ0fGXa9P/1WaA6eTYh8M0pDJt/zXuOJSgZhs22WhfmUYPNFrxgi2Y7gD+E3ua38CYx+3bpKwld0YXbKoEnQeB2hctPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxKL7/VuIHDvP1iFYQpwA3eQV8bX6WFYtmSNbnioa0w=;
 b=ma+Oz1+18sXHqSELV6XTrqAmgYH7fRs9d3s090g01UqcxI1skvsbqVk9NM5HpeEHK41Ur6dcagHeg5Y5mJ/Q0EhvCDPC8VkJ+eSDZUtZKgIjsXNC/8cUT8j39hGSZH3X+NvH3U5w5lPvIJiLHXM/AWQqXNoKI8wmJ8bCJrSbyLhLO9niDLohe9fb10vgfN9MAtgli6/R1qT9Grcf5STA2w2JoF7VEOguEk8GggTQSckZPJm+yzVsUJ8tmJvQZMCTKbRR6TEFgfeqjEufk5KlgIDjqtQQJJ1yhBw9CH+JolqPARfiCnoGNfI1sbGjUt2Iz/sJMjUyu0hybceXEumVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxKL7/VuIHDvP1iFYQpwA3eQV8bX6WFYtmSNbnioa0w=;
 b=kJ3DM9BMPDwHqjv7aefPAY+eHec7+QCt054wLe7CJWrmr1J1ttJeNceFwL3YYEmR98JXmG+LnFGlTAB9aZwM2SR+qcDfBXdtT8E32s3WetfUAFf0SQqeU0vXFob2aqDdTdLnCyplEXvKi63xaiKPMvaReplmwEf7uUpSG3XzN3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB6518.eurprd04.prod.outlook.com (2603:10a6:20b:f8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 14:18:06 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::a8e8:87d3:e868:cc93%7]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 14:18:06 +0000
Message-ID: <3d5f5652-8d92-f455-7541-da63e12fbafd@theobroma-systems.com>
Date: Wed, 12 Jan 2022 15:18:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [docs] [RFC] doc: add release notes for 3.4
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org
References: <20220105203318.1859315-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220105203318.1859315-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR08CA0193.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a2886f-174a-46ec-edae-08d9d5d65a4f
X-MS-TrafficTypeDiagnostic: AM6PR04MB6518:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB651834DF64E39A7D33DD47E2C2529@AM6PR04MB6518.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+g+Vyq7dBqnrICPuB5hC5uMArx3enB17JukmXUthUWa6sik9+cNc5Vep8M73CzIpAxWL9hC3kYgTm8c1HYg5hq5FavtegXCJ95YgaKrNSA9C7Eh3g4Wp2mrPE/bEVPtP8Lz/hmVbDIdtdlWLPt2HJEAAReHuYdRpRID5KAzAzXlUwKzAUkm+lFcVrGug/02D9h1+A46rJpvh+9453rhVVRDamPaxPxPp4ZykB6uj5T5w8WwG7yaE1sLTHGsdtRVZx6AXgU7JDZkvoCE0R3wIt2xK2Sjq2mym1QkFXGJx/0owdLECmoLIbA75xf035+AJBuHpU3arkIiO1Vwd86/68FOJo6JLRS75+qMcWMrnKlQHyU6hRMjJ9AiMud9ePZv1z9Pr9Jr1QESQok0pDYmA6H5/wSnDooIg2+zUrNpeLEMTLXeJR1fXpxSvZw8ZOnlZVbGbEkPuL0S5r7vuFwshrt1YMhG6bOY3wnULcXrYe1YXyUj92XTb+bwTnrs8epauBaOlUJiZgOJSylipCXnavRjfwWaHI0nC+xF4TUWCsOCRHuSgRPkp25vNV/Nl6THiODXPm6ZtqsZqgeANB4H8j+HOfi8TjBiZsd3+WsUn8SN/1bWhdqDn6Ct70xaVRVsNTiVJosip3v43BICbmcqP4wjMV301spWIw+W4YzCb3tie/0kWj+HVe02rWwcHOoj+QHdMYkpxour2EE453ijn5hHi9Wz/pNiO3PHv0WgpZ10K1W7q/P8UIP/FGE2rB+xJBGDiv4o53cRDM3vjFAM2tpla1Q97Sbum7P/ZEbDv2g/3QtJFE6DeqQidPJC3CHvh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(31696002)(316002)(66574015)(66556008)(186003)(83380400001)(86362001)(44832011)(36756003)(38100700002)(2616005)(31686004)(966005)(8676002)(5660300002)(6486002)(2906002)(30864003)(508600001)(6512007)(8936002)(53546011)(6506007)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VN13/S9L1YDoNJCG99EuSOyD5FXVSd5ifCPWai77Iuz/un/4CP6NqOvnhDdt?=
 =?us-ascii?Q?vPXeV2NQyx6daMVlb8sSJeeSK17e3jh/kyMwIqE8A/sbvibcYUHDtF+qIwNV?=
 =?us-ascii?Q?yBRCvD6L3Sqo4kpW2E2yIRVM92kVFxMp0DcaLziR4C6F/nbMPp2kPivDYsbJ?=
 =?us-ascii?Q?lyOoMzPQI1MWW7y3kDIBZA006GAiyxdAE3Z3xP0/OSQKh6Fcz+eO84qXZnip?=
 =?us-ascii?Q?QHCx39bVk4AoffwCF5zBFI8RhHy6U9BUHHGZwPesFiDvZZaInyJoGtjPsShh?=
 =?us-ascii?Q?1dABn8fJWtmTiscIX4KFUnRB7V1zIynOrVnbsjavsXL+lWajHP4CeYxMFoqv?=
 =?us-ascii?Q?OQmsrluDUl5//2U2Iuv5l2y3b+jsV0TplUAuC11BVJecNXKOfNlFLpf61VB7?=
 =?us-ascii?Q?ssp3f6zWZWibqjsQ2bf4bzAjBunipG+X2uzSn0n3gp4kY8VuAL2Ic8RfF8gv?=
 =?us-ascii?Q?egCPjgd5VlddNHVyj0cr+G/TUIY+7+xOnFIH5AE3Z4Iec3AtpSE4J1LOvzID?=
 =?us-ascii?Q?zyDCTA9rNuOUDPdUhUWLxfXIrx2iJiRgJz2Vwm142vH/r0DJWdkr8uJVnyN9?=
 =?us-ascii?Q?bXkzWsoc7BnsvHbHnIJqHUxuvG1T+rKeEQoMM42M95aiVYxt6NovpQeIx26F?=
 =?us-ascii?Q?xLJkrdRHxZBOI+8To2huqSPJNW+kbc/4r/nfIiae0kjDCQmIJsZ/pgLqFhBO?=
 =?us-ascii?Q?sVZBMnOP7yLA6h9ZBzcCF0lz2iP0D45R1lHsKOnYtiyOehrAk+s6PdbQ974d?=
 =?us-ascii?Q?Dctxn+lUq+NiwsEnEsFaSAUfwjxTDrBEOZLefcMwd3BHpuF506sUZ60Ict4v?=
 =?us-ascii?Q?LJ/NkVS7fM7yXHFNr0Yl14kHXNz+uo2dZzZNzChEKGV2jgVBZn/BVnJx2l0H?=
 =?us-ascii?Q?pSiRK25ZBGE+0HyxZ/skgYKKY6GM6NUijrZzWWBRnGIRVtXNLNv8vUwDiWR/?=
 =?us-ascii?Q?kG63t6cE6PXDto+E95HLcsCRR6565LvRYt/8idqZOxkvbj3AHDn+RJGfxAGa?=
 =?us-ascii?Q?MdVohBOMxHnBAiHhhlf6TVmIKjz+5EF6ffY4B1SO7xso5W9inSKg3BI9PPIy?=
 =?us-ascii?Q?mLc7vVilQbhkQTJhI+bw4K89sagI220lqKW6Wv7eRWKmtQMCmrN+hHzzFlYw?=
 =?us-ascii?Q?5TxCCxiAbMjpqQtNRX2Qez+TcyH3+PGepCg/uP+JDuHbprke3CGf8nr4B+jZ?=
 =?us-ascii?Q?yrLkcoYcwXFvEOYZeNcxpl8YeerEL/eD1hK1aBom1kA1bUBn3cCGOzASfGQW?=
 =?us-ascii?Q?E3BSpVuHqzWW+cobvs0NlYNvvDrCRR6bPbJYc8fKLr9dbtN+drkh2UG3IMO8?=
 =?us-ascii?Q?11ABhfYAhd01AlMZv8EXa6q6WmZLhvSUy1ZThdsLTynpq3sMXxvkCfoTlG3/?=
 =?us-ascii?Q?7b0VwjRszy8w6i5BTJSThgaFichiZWbNiB20fRSw3JiASqw/gHlpDorwRyNh?=
 =?us-ascii?Q?PjL26AGBHzi/YNli9dKB5+cVWbAV6gr/Nm0miusCf2kasXKNPkYB0uGnRpqa?=
 =?us-ascii?Q?AwpICTib2fGL8stxIiyKbDjyP9QI7OKSURm8P/z++ZzqzBaC3N8y+HX02JSI?=
 =?us-ascii?Q?Lmus3RnG5BVVS4J153xE9xak0v//59tXJc5uztgrDWmNlHapSVvHnB0Y2yFF?=
 =?us-ascii?Q?IqlsYjYLR/z5r1m56zVQedqEsNP4eM5SprIZ+IqKHUK8SUDVwI1106ieMgAb?=
 =?us-ascii?Q?/BkOflrZGscAk7iniZP0KXdReU0TFZWcFg6CCityG7SszcQYUdBfYrz8ByJj?=
 =?us-ascii?Q?EpKL7l8r74zzSAzkhv6wRVUCgDXO31E=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9a2886f-174a-46ec-edae-08d9d5d65a4f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:18:06.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8yaoFSnlrreNhJgiymkxI/VGYNpU2Uwa2MQRkL/Vtfn/aFyHSmfB/9FiM4w5pSURlF1ZFu9iKrBiN/uBQ13gjQsLkuwiugYtvDjUhcJA47l5Ta9pdcrPXkHpOzZMnylI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6518
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 14:18:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2393

Hi Michael,

On 1/5/22 21:33, Michael Opdenacker wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  > The idea is to add the release notes to the documentation
> repository. Let's start with 3.4, to collect feedback,
> before migrating earlier releases.
>=20
> The release notes have been adapted to make them
> more reader friends. That's why they no longer start
> with raw tree and branch information.
>=20

The html file you sent is not enough since we're missing css and js=20
files, etc.. So we can't really use it as is.

I'm wondering if we shouldn't merge the release notes with the migration=20
manual and have something like "releases" section with a page per=20
release and a section for the release notes and one for the migration=20
manual?

Nevertheless, it's a good idea to make those available on the docs website!

Cheers,
Quentin

>   documentation/conf.py                         |   1 +
>   documentation/index.rst                       |   1 +
>   .../migration-guides/migration-3.4.rst        |   2 +
>   documentation/release-notes/3.4.rst           | 803 ++++++++++++++++++
>   documentation/release-notes/index.rst         |  15 +
>   5 files changed, 822 insertions(+)
>   create mode 100644 documentation/release-notes/3.4.rst
>   create mode 100644 documentation/release-notes/index.rst
>=20
>=20
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 1bea180325..3015892d29 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -72,6 +72,7 @@ rst_prolog =3D """
>  =20
>   # external links and substitutions
>   extlinks =3D {
> +    'cve': ('https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__nvd.=
nist.gov_vuln_detail_CVE-2D-25s&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DL=
YjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfC=
EbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DYAMWVnh_VVk0c=
lV239nrPfLp8S-6cL6U62V5mRlCelU&e=3D ', 'CVE-%s'),
>       'yocto_home': ('https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__www.yoctoproject.org-25s&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjL=
exDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbc=
iWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DsguL5kONDffJB9Gp=
oE4ubJ3QnLwIJEpmhufSSLJ4lSU&e=3D ', None),
>       'yocto_wiki': ('https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__wiki.yoctoproject.org_wiki-25s&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=
=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dgdu=
upfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DUYuAyWiRg=
iyBw5874QSSnqzKvwGwiFRjukUdD22gpS0&e=3D ', None),
>       'yocto_dl': ('https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__downloads.yoctoproject.org-25s&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3D=
LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dgduupf=
CEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DE30I-y2yGyiz=
7-pf4Nkh3POnr5yIxJCUuKPBAKjX8w8&e=3D ', None),
> diff --git a/documentation/index.rst b/documentation/index.rst
> index 0fca6ce720..ebc9cd2222 100644
> --- a/documentation/index.rst
> +++ b/documentation/index.rst
> @@ -42,6 +42,7 @@ Welcome to the Yocto Project Documentation
>      :hidden:
>  =20
>      Release Migration Guides <migration-guides/index>
> +   Release Notes <release-notes/index>
>      releases
>  =20
>   .. toctree::
> diff --git a/documentation/migration-guides/migration-3.4.rst b/documenta=
tion/migration-guides/migration-3.4.rst
> index e785277356..624d5803c4 100644
> --- a/documentation/migration-guides/migration-3.4.rst
> +++ b/documentation/migration-guides/migration-3.4.rst
> @@ -4,6 +4,8 @@ Release 3.4 (honister)
>   This section provides migration information for moving to the Yocto
>   Project 3.4 Release (codename "honister") from the prior release.
>  =20
> +See also the :doc:`release notes </release-notes/3.4>` for this release.
> +
>   Override syntax changes
>   -----------------------
>  =20
> diff --git a/documentation/release-notes/3.4.rst b/documentation/release-=
notes/3.4.rst
> new file mode 100644
> index 0000000000..f3f63d1fe6
> --- /dev/null
> +++ b/documentation/release-notes/3.4.rst
> @@ -0,0 +1,803 @@
> +Release notes for 3.4 (honister)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +New Features / Enhancements
> +---------------------------
> +
> +-  Linux kernel 5.14, glibc 2.34 and ~280 other recipe upgrades
> +-  Switched override character to ':' (replacing '_') for more robust pa=
rsing and improved performance - see migration guide for help on migrating
> +-  Rust integrated into core, providing rust support for cross-compilati=
on and SDK
> +-  New create-spdx class for creating SPDX SBoM documents
> +-  New recipes: cargo, core-image-ptest-all, core-image-ptest-fast, core=
-image-weston-sdk, erofs-utils, gcompat, gi-docgen, libmicrohttpd, libsecco=
mp, libstd-rs, perlcross, python3-markdown, python3-pyyaml, python3-smartyp=
ants, python3-typogrify, rust, rust-cross, rust-cross-canadian, rust-hello-=
world, rust-llvm, rust-tools-cross-canadian, rustfmt, xwayland
> +-  Several optimisations to reduce unnecessary task dependencies for fas=
ter builds
> +-  seccomp integrated into core, with additional enabling for gnutls, sy=
stemd, qemu
> +-  New overlayfs class to help generate overlayfs mount units
> +-  debuginfod support now enabled by default
> +-  Switched several recipes over to using OpenSSL instead of GnuTLS (wpa=
-supplicant, curl, glib-networking) or disable GnuTLS (cups) by default
> +-  Improvements to LTO plugin installation and reproducibility
> +-  Architecture-specific enhancements:
> +
> +   -  glibc: Enable memory tagging for aarch64
> +   -  testimage: remove aarch64 xorg exclusion
> +   -  arch-arm*: add better support for gcc march extensions
> +   -  tune-cortexm*: add support for all Arm Cortex-M processors
> +   -  tune-cortexr*: add support for all Arm Cortex-R processors
> +   -  arch-armv4: Allow -march=3Darmv4
> +   -  qemuarm*: use virtio graphics
> +   -  baremetal-helloworld: Enable RISC-V 64/32 port
> +   -  ldconfig-native: Add RISC-V support
> +   -  qemuriscv: Enable 4 core emulation
> +   -  Add ARC support in gdb, dpkg, dhcpcd
> +   -  conf/machine-sdk: Add ppc64 SDK machine
> +   -  libjpeg-turbo: Handle powerpc64le without Altivec
> +   -  pixman: Handle PowerPC without Altivec
> +   -  mesa: enable gallium Intel drivers when building for x86
> +   -  mesa: enable crocus driver for older Intel graphics
> +
> +-  Kernel-related enhancements:
> +
> +   -  Support zstd-compressed modules and initramfs images
> +   -  Allow opt-out of split kernel modules
> +   -  linux-yocto-dev: base AUTOREV on specified version
> +   -  kernel-yocto: provide debug / summary information for metadata
> +   -  kernel-uboot: Handle gzip and lzo compression options
> +   -  linux-yocto/5.14: added devupstream support
> +   -  linux-yocto: add vfat KERNEL_FEATURE when MACHINE_FEATURES include=
 vfat
> +   -  linux-yocto: enable TYPEC_TCPCI in usbc fragment
> +
> +-  Image-related enhancements:
> +
> +   -  New erofs, erofs-lz4 and erofs-lz4hc image types
> +   -  New squashfs-zst and cpio.zst image types
> +   -  New lic-pkgs IMAGE_FEATURES item to install all license packages
> +   -  Added zsync metadata conversion support
> +   -  Use xargs to set file timestamps for significant (>90%) do_image s=
peedup
> +   -  Find .ko.gz and .ko.xz kernel modules as well when determining nee=
d to run depmod on an image
> +   -  Show formatted error messages instead of tracebacks for systemctl =
errors
> +   -  No longer ignore installation failures in complementary package in=
stallation
> +   -  Remove ldconfig auxiliary cache when not needed
> +
> +-  wic enhancements:
> +
> +   -  Added erofs filesystem support
> +   -  Added --extra-space argument to leave extra space after last parti=
tion
> +   -  Added --no-fstab-update part option to allow using the stock fstab
> +   -  bootimg-efi: added Unified Kernel Image option
> +   -  bootimg-pcbios: use label provided when formatting a DOS partition
> +
> +-  SDK-related enhancements:
> +
> +   -  Enable do_populate_sdk with multilibs
> +   -  New SDKPATHINSTALL variable decouples default install path from bu=
ilt in path to avoid rebuilding nativesdk components on e.g. DISTRO_VERSION=
 changes
> +   -  eSDK: Error if trying to generate an eSDK from a multiconfig
> +   -  eSDK: introduce TOOLCHAIN_HOST_TASK_ESDK to be used in place of TO=
OLCHAIN_HOST_TASK to add components to the host part of the eSDK
> +
> +-  bitbake enhancements:
> +   -  New bitbake-getvar helper command to query a variable value (with =
history)
> +   -  bitbake-layers: layerindex-fetch: add --fetchdir parameter
> +   -  bitbake-layers: show-recipes: add skip reason to output
> +   -  bitbake-diffsigs: sort diff output for consistency
> +   -  Allow setting upstream for local hash equivalence server
> +   -  fetch2/s3: allow to use credentials and switch profile from enviro=
nment variables
> +   -  fetch2/s3: Add progress handler for S3 cp command
> +   -  fetch2/npm: Support npm archives with missing search directory mod=
e
> +   -  fetch2/npmsw: Add support for local tarball and link sources
> +   -  fetch2/svn: Allow peg-revision functionality to be disabled
> +   -  fetch2/wget: verify certificates for HTTPS/FTPS by default
> +   -  fetch2/wget: Enable FTPS
> +   -  prserv: added read-only mode
> +   -  prserv: replaced XML RPC with modern asyncrpc implementation
> +   -  Numerous warning/error message improvements
> +
> +-  New PACKAGECONFIG options in btrfs-tools, ccache, coreutils, cups, db=
us, elfutils, ffmpeg, findutils, glib-2.0, gstreamer1.0-plugins-bad, gstrea=
mer1.0-plugins-base, libarchive, libnotify, libpsl, man-db, mesa, ovmf, par=
ted, prelink, qemu, rpm, shadow, systemd, tar, vim, weston
> +-  u-boot enhancements:
> +
> +   -  Make SPL suffix configurable
> +   -  Make UBOOT_BINARYNAME configurable
> +   -  Package extlinux.conf separately
> +   -  Allow deploying the u-boot DTB
> +
> +-  opensbi: Add support for specifying a device tree
> +-  busybox enhancements:
> +
> +   -  Added tmpdir option into mktemp applet
> +   -  Support mounting swap via labels
> +   -  Enable long options for enabled applets
> +
> +-  Move tune files to architecture subdirectories
> +-  buildstats: log host data on failure separately to task specific file
> +-  buildstats: collect "at interval" and "on failure" logs in the same f=
ile
> +-  Ptest enhancements:
> +
> +   -  ptest-runner: install script to collect system data on failure
> +   -  Added ptest support to python3-hypothesis, python3-jinja2, python3=
-markupsafe
> +   -  Enhanced ptest support in lttng, util-linux, and others
> +   -  New leaner ptest image recipes based upon core-image-minimal
> +
> +-  scripts/contrib/image-manifest: add new script
> +-  Add beginnings of Android target support
> +-  devtool upgrade: rebase override-only patches as well
> +-  devtool: print a warning on upgrades if PREFERRED_VERSION is set
> +-  systemd: set zstd as default compression option
> +-  init-manager-systemd: add a weak VIRTUAL-RUNTIME_dev_manager assignme=
nt
> +-  Add proper unpack dependency for .zst compressed archives
> +-  util-linux: build chfn and chsh by default
> +-  qemu: use 4 cores in qemu guests
> +-  runqemu: decouple bios and kernel options
> +-  qemu: add a hint on how to enable CPU render nodes when a suitable GP=
U is absent
> +-  devupstream: Allow support of native class extensions
> +-  Prelinking now disabled in default configuration
> +-  python3: statistics module moved to its own python3-statistics packag=
e
> +-  pypi: allow override of PyPI archive name
> +-  Allow global override of golang GO_DYNLINK
> +-  buildhistory enhancements:
> +
> +   -  Add option to strip path prefix
> +   -  Add output file listing package information
> +   -  Label packages providing per-file dependencies in depends.dot
> +
> +-  New gi-docgen class for GNOME library documentation
> +-  meson.bbclass: Make the default buildtype "debug" if DEBUG_BUILD is 1
> +-  distro_features_check: expand with IMAGE_FEATURES
> +-  Add extended packagedata in JSON format
> +-  local.conf.sample: Update sstate mirror entry with new hash equivalen=
ce setting
> +-  poky: Use https in default PREMIRRORS
> +-  reproducible_build.bbclass: Enable -Wdate-time
> +-  yocto-check-layer: ensure that all layer dependencies are tested too
> +-  core-image-multilib-example: base on weston, and not sato
> +-  npm.bbclass: Allow nodedir to be overridden by NPM_NODEDIR
> +-  cve-extra-exclusions.inc: add exclusion list for intractable CVE's
> +-  license_image.bbclass: Detect broken symlinks
> +-  sysstat: make the service start automatically
> +-  sanity: Add error check for '%' in build path
> +-  sanity: Further improve directory sanity tests
> +-  sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure me=
ssage
> +-  tzdata: Allow controlling zoneinfo binary format
> +-  oe-time-dd-test.sh: add options and refactor
> +-  vim: add option to disable NLS support
> +-  zstd: Include pzstd in the build
> +-  mirrors.bbclass: provide additional rule for git repo fallbacks
> +-  own-mirrors: Add support for s3:// scheme in SOURCE_MIRROR_URL
> +-  common-licenses: add missing SPDX licences
> +-  Add MAINTAINERS.md file to record subsystem maintainers
> +
> +Migration instructions
> +----------------------
> +
> +For details on changes that you might need to make when migrating from p=
revious releases, see the :doc:`migration guide </migration-guides/migratio=
n-3.4>` for this release.
> +
> +Known Issues
> +------------
> +
> +- Build failures have been reported when running on host Linux systems w=
ith FIPS enabled (such as RHEL 8.0 with the FIPS mode enabled). For more de=
tails please see :yocto_bugs:`bug #14609 </show_bug.cgi?id=3D14609>`.
> +
> +Recipe Licenses
> +---------------
> +
> +The following corrections have been made to the LICENSE values set by re=
cipes:
> +
> +-  acpica: correct LICENSE to "Intel | BSD-3-Clause | GPLv2"
> +-  dtc: correct LICENSE to "GPLv2 | BSD-2-Clause"
> +-  e2fsprogs: correct LICENSE to "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
> +-  ffmpeg: correct LICENSE to "GPLv2+ & LGPLv2.1+ & ISC & MIT & BSD-2-Cl=
ause & BSD-3-Clause & IJG"
> +-  flac: correct LICENSE to "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD-3-Claus=
e"
> +-  flex: correct LICENSE to "BSD-3-Clause & LGPL-2.0+"
> +-  font-util: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2=
-Clause"
> +-  glib-2.0: correct LICENSE to "LGPLv2.1+ & BSD-3-Clause & PD"
> +-  gobject-introspection: correct LICENSE to "LGPLv2+ & GPLv2+ & MIT" (a=
dd MIT license)
> +-  hdparm: correct LICENSE to "BSD-2-Clause & GPLv2 & hdparm"
> +-  iputils: correct LICENSE to "BSD-3-Clause & GPLv2+"
> +-  libcap: correct LICENSE to "BSD-3-Clause | GPLv2"
> +-  libevent: correct LICENSE to "BSD-3-Clause & MIT"
> +-  libjitterentropy: correct LICENSE to "GPLv2+ | BSD-3-Clause"
> +-  libpam: correct LICENSE to "GPLv2+ | BSD-3-Clause"
> +-  libwpe: correct LICENSE to "BSD-2-Clause"
> +-  libx11-compose-data: correct LICENSE to "MIT & MIT-style & BSD-4-Clau=
se & BSD-2-Clause"
> +-  libx11: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2-Cl=
ause"
> +-  libxfont2: correct LICENSE to "MIT & MIT-style & BSD-4-Clause & BSD-2=
-Clause"
> +-  libxfont: correct LICENSE to "MIT & MIT-style & BSD-3-Clause"
> +-  lsof: correct LICENSE to reflect that it uses a BSD-like (but not exa=
ctly BSD) license ("Spencer-94")
> +-  nfs-utils: correct LICENSE to "MIT & GPLv2+ & BSD-3-Clause"
> +-  ovmf: correct license to "BSD-2-Clause-Patent"
> +-  ppp: correct LICENSE to "BSD-3-Clause & BSD-3-Clause-Attribution & GP=
Lv2+ & LGPLv2+ & PD"
> +-  python3-packaging: correct LICENSE to "Apache-2.0 | BSD-2-Clause"
> +-  python-async-test: correct LICENSE to "BSD-3-Clause"
> +-  quota: remove BSD license (only BSD licensed part of the code was rem=
oved in 4.05)
> +-  shadow: correct LICENSE to "BSD-3-Clause | Artistic-1.0"
> +-  shadow-sysroot: set LICENSE the same as shadow
> +-  sudo: correct LICENSE to "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
> +-  swig: correct LICENSE to "BSD-3-Clause & GPLv3"
> +-  valgrind: correct license to "GPLv2 & GPLv2+ & BSD-3-Clause"
> +-  webkitgtk: correct LICENSE to "BSD-2-Clause & LGPLv2+"
> +-  wpebackend-fdo: correct LICENSE to "BSD-2-Clause"
> +-  xinetd: correct LICENSE to reflect that it uses a unique BSD-like (bu=
t not exactly BSD) license
> +
> +Other license-related notes:
> +
> +-  When creating recipes for Python software, recipetool will now treat =
"BSD" as "BSD-3-Clause" for the purposes of setting LICENSE, as that is the=
 most common understanding.
> +-  Please be aware that an initramfs bundled with the kernel using INITR=
AMFS_IMAGE_BUNDLE should only contain GPLv2-compatible software; this is no=
w mentioned in the documentation.
> +
> +Security Fixes
> +--------------
> +
> +-  apr: :cve:`2021-35940`
> +-  aspell: :cve:`2019-25051`
> +-  avahi: :cve:`2021-3468`, :cve:`2021-36217`
> +-  binutils: :cve:`2021-20197`
> +-  bluez: :cve:`2021-3658`
> +-  busybox: :cve:`2021-28831`
> +-  cairo: :cve:`2020-35492`
> +-  cpio: :cve:`2021-38185`
> +-  expat: :cve:`2013-0340`
> +-  ffmpeg: :cve:`2020-20446`, :cve:`2020-22015`, :cve:`2020-22021`, :cve=
:`2020-22033`, :cve:`2020-22019`, :cve:`2021-33815`, :cve:`2021-38171`, :cv=
e:`2020-20453`
> +-  glibc: :cve:`2021-33574`, :cve:`2021-38604`
> +-  inetutils: :cve:`2021-40491`
> +-  libgcrypt: :cve:`2021-40528`
> +-  linux-yocto/5.10, 5.14: :cve:`2021-3653`, :cve:`2021-3656`
> +-  lz4: :cve:`2021-3520`
> +-  nettle: :cve:`2021-20305`
> +-  openssl: :cve:`2021-3711`, :cve:`2021-3712`
> +-  perl: :cve:`2021-36770`
> +-  python3: :cve:`2021-29921`
> +-  python3-pip: :cve:`2021-3572`
> +-  qemu: :cve:`2020-27821`, :cve:`2020-29443`, :cve:`2020-35517`, :cve:`=
2021-3392`, :cve:`2021-3409`, :cve:`2021-3416`, :cve:`2021-3527`, :cve:`202=
1-3544`, :cve:`2021-3545`, :cve:`2021-3546`, :cve:`2021-3682`, :cve:`2021-2=
0181`, :cve:`2021-20221`, :cve:`2021-20257`, :cve:`2021-20263`
> +-  rpm: :cve:`2021-3421`, :cve:`2021-20271`
> +-  rsync: :cve:`2020-14387`
> +-  util-linux: :cve:`2021-37600`
> +-  vim: :cve:`2021-3770`, :cve:`2021-3778`
> +-  wpa-supplicant: :cve:`2021-30004`
> +-  xdg-utils: :cve:`2020-27748`
> +-  xserver-xorg: :cve:`2021-3472`
> +
> +Recipe Upgrades
> +---------------
> +
> +-  acl 2.2.53 -> 2.3.1
> +-  acpica 20210105 -> 20210730
> +-  alsa-lib 1.2.4 -> 1.2.5.1
> +-  alsa-plugins 1.2.2 -> 1.2.5
> +-  alsa-tools 1.2.2 -> 1.2.5
> +-  alsa-topology-conf 1.2.4 -> 1.2.5.1
> +-  alsa-ucm-conf 1.2.4 -> 1.2.5.1
> +-  alsa-utils 1.2.4 -> 1.2.5.1
> +-  alsa-utils-scripts 1.2.4 -> 1.2.5.1
> +-  apt 2.2.2 -> 2.2.4
> +-  at 3.2.1 -> 3.2.2
> +-  at-spi2-core 2.38.0 -> 2.40.3
> +-  autoconf-archive 2019.01.06 -> 2021.02.19
> +-  babeltrace2 2.0.3 -> 2.0.4
> +-  bash 5.1 -> 5.1.8
> +-  bind 9.16.16 -> 9.16.20
> +-  binutils 2.36.1 -> 2.37
> +-  binutils-cross 2.36.1 -> 2.37
> +-  binutils-cross-canadian 2.36.1 -> 2.37
> +-  binutils-cross-testsuite 2.36.1 -> 2.37
> +-  binutils-crosssdk 2.36.1 -> 2.37
> +-  bison 3.7.5 -> 3.7.6
> +-  blktrace 1.2.0+gitX -> 1.3.0+gitX
> +-  bluez5 5.56 -> 5.61
> +-  boost 1.75.0 -> 1.77.0
> +-  boost-build-native 4.3.0 -> 4.4.1
> +-  btrfs-tools 5.10.1 -> 5.13.1
> +-  busybox 1.33.1 -> 1.34.0
> +-  busybox-inittab 1.33.0 -> 1.34.0
> +-  ccache 4.2 -> 4.4
> +-  cmake 3.19.5 -> 3.21.1
> +-  cmake-native 3.19.5 -> 3.21.1
> +-  connman 1.39 -> 1.40
> +-  createrepo-c 0.17.0 -> 0.17.4
> +-  cronie 1.5.5 -> 1.5.7
> +-  cross-localedef-native 2.33 -> 2.34
> +-  cups 2.3.3 -> 2.3.3op2
> +-  curl 7.75.0 -> 7.78.0
> +-  dbus-glib 0.110 -> 0.112
> +-  dejagnu 1.6.2 -> 1.6.3
> +-  diffoscope 172 -> 181
> +-  diffutils 3.7 -> 3.8
> +-  distcc 3.3.5 -> 3.4
> +-  dnf 4.6.0 -> 4.8.0
> +-  dpkg 1.20.7.1 -> 1.20.9
> +-  dtc 1.6.0 -> 1.6.1
> +-  e2fsprogs 1.46.1 -> 1.46.4
> +-  elfutils 0.183 -> 0.185
> +-  ell 0.38 -> 0.43
> +-  enchant2 2.2.15 -> 2.3.1
> +-  epiphany 3.38.2 -> 40.3
> +-  ethtool 5.10 -> 5.13
> +-  expat 2.2.10 -> 2.4.1
> +-  ffmpeg 4.3.2 -> 4.4
> +-  file 5.39 -> 5.40
> +-  freetype 2.10.4 -> 2.11.0
> +-  gcc 10.2.0 -> 11.2.0
> +-  gcc-cross 10.2.0 -> 11.2.0
> +-  gcc-cross-canadian 10.2.0 -> 11.2.0
> +-  gcc-crosssdk 10.2.0 -> 11.2.0
> +-  gcc-runtime 10.2.0 -> 11.2.0
> +-  gcc-sanitizers 10.2.0 -> 11.2.0
> +-  gcc-source 10.2.0 -> 11.2.0
> +-  gcr 3.38.1 -> 3.40.0
> +-  gdb 10.1 -> 10.2
> +-  gdb-cross 10.1 -> 10.2
> +-  gdb-cross-canadian 10.1 -> 10.2
> +-  gdk-pixbuf 2.40.0 -> 2.42.6
> +-  ghostscript 9.53.3 -> 9.54.0
> +-  git 2.31.1 -> 2.33.0
> +-  glib-2.0 2.66.7 -> 2.68.4
> +-  glib-networking 2.66.0 -> 2.68.2
> +-  glibc 2.33 -> 2.34
> +-  glibc-locale 2.33 -> 2.34
> +-  glibc-mtrace 2.33 -> 2.34
> +-  glibc-scripts 2.33 -> 2.34
> +-  glibc-testsuite 2.33 -> 2.34
> +-  glslang 11.2.0 -> 11.5.0
> +-  gnome-desktop-testing 2018.1 -> 2021.1
> +-  gnu-config 20210125+gitX -> 20210722+gitX
> +-  gnu-efi 3.0.12 -> 3.0.14
> +-  gnupg 2.2.27 -> 2.3.1
> +-  gobject-introspection 1.66.1 -> 1.68.0
> +-  gpgme 1.15.1 -> 1.16.0
> +-  gptfdisk 1.0.7 -> 1.0.8
> +-  grep 3.6 -> 3.7
> +-  grub 2.04+2.06~rc1 -> 2.06
> +-  grub-efi 2.04+2.06~rc1 -> 2.06
> +-  gsettings-desktop-schemas 3.38.0 -> 40.0
> +-  gtk+3 3.24.25 -> 3.24.30
> +-  harfbuzz 2.7.4 -> 2.9.0
> +-  hdparm 9.60 -> 9.62
> +-  help2man 1.48.2 -> 1.48.4
> +-  hwlatdetect 1.10 -> 2.1
> +-  i2c-tools 4.2 -> 4.3
> +-  icu 68.2 -> 69.1
> +-  igt-gpu-tools 1.25+gitX -> 1.26
> +-  inetutils 2.0 -> 2.1
> +-  iproute2 5.11.0 -> 5.13.0
> +-  iputils s20200821 -> 20210722
> +-  json-glib 1.6.2 -> 1.6.4
> +-  kexec-tools 2.0.21 -> 2.0.22
> +-  kmod 28 -> 29
> +-  kmod-native 28 -> 29
> +-  less 563 -> 590
> +-  libassuan 2.5.4 -> 2.5.5
> +-  libcap 2.48 -> 2.51
> +-  libcgroup 0.41 -> 2.0
> +-  libcomps 0.1.15 -> 0.1.17
> +-  libconvert-asn1-perl 0.27 -> 0.31
> +-  libdazzle 3.38.0 -> 3.40.0
> +-  libdnf 0.58.0 -> 0.63.1
> +-  libdrm 2.4.104 -> 2.4.107
> +-  libedit 20210216-3.1 -> 20210714-3.1
> +-  libepoxy 1.5.5 -> 1.5.9
> +-  liberation-fonts 2.00.1 -> 2.1.4
> +-  libffi 3.3 -> 3.4.2
> +-  libfm 1.3.1 -> 1.3.2
> +-  libgcc 10.2.0 -> 11.2.0
> +-  libgcc-initial 10.2.0 -> 11.2.0
> +-  libgcrypt 1.9.3 -> 1.9.4
> +-  libgfortran 10.2.0 -> 11.2.0
> +-  libgit2 1.1.0 -> 1.1.1
> +-  libglu 9.0.1 -> 9.0.2
> +-  libgpg-error 1.41 -> 1.42
> +-  libgudev 234 -> 237
> +-  libhandy 1.2.0 -> 1.2.3
> +-  libical 3.0.9 -> 3.0.10
> +-  libidn2 2.3.0 -> 2.3.2
> +-  libinput 1.16.4 -> 1.18.1
> +-  libjitterentropy 3.0.1 -> 3.1.0
> +-  libjpeg-turbo 2.0.6 -> 2.1.1
> +-  libksba 1.5.0 -> 1.6.0
> +-  libmodulemd 2.12.0 -> 2.13.0
> +-  libnsl2 1.3.0 -> 2.0.0
> +-  libnss-mdns 0.14.1 -> 0.15.1
> +-  libogg 1.3.4 -> 1.3.5
> +-  libpcap 1.10.0 -> 1.10.1
> +-  libpcre 8.44 -> 8.45
> +-  libpcre2 10.36 -> 10.37
> +-  libportal 0.3 -> 0.4
> +-  librepo 1.13.0 -> 1.14.1
> +-  libsdl2 2.0.14 -> 2.0.16
> +-  libsolv 0.7.17 -> 0.7.19
> +-  libtasn1 4.16.0 -> 4.17.0
> +-  libtest-needs-perl 0.002006 -> 0.002009
> +-  libtirpc 1.3.1 -> 1.3.2
> +-  libubootenv 0.3.1 -> 0.3.2
> +-  libucontext 0.10+X -> 1.1+X
> +-  liburcu 0.12.2 -> 0.13.0
> +-  libuv 1.41.0 -> 1.42.0
> +-  libva 2.10.0 -> 2.12.0
> +-  libva-initial 2.10.0 -> 2.12.0
> +-  libva-utils 2.10.0 -> 2.12.0
> +-  libwebp 1.2.0 -> 1.2.1
> +-  libwpe 1.8.0 -> 1.10.1
> +-  libx11 1.7.0 -> 1.7.2
> +-  libxcrypt 4.4.18 -> 4.4.25
> +-  libxcrypt-compat 4.4.18 -> 4.4.25
> +-  libxfixes 5.0.3 -> 6.0.0
> +-  libxfont2 2.0.4 -> 2.0.5
> +-  libxft 2.3.3 -> 2.3.4
> +-  libxi 1.7.10 -> 1.7.99.2
> +-  libxkbcommon 1.0.3 -> 1.3.0
> +-  libxml2 2.9.10 -> 2.9.12
> +-  libxres 1.2.0 -> 1.2.1
> +-  linux-libc-headers 5.10 -> 5.14
> +-  linux-yocto 5.4.144+gitX, 5.10.63+gitX -> 5.10.70+gitX, 5.14.9+gitX
> +-  linux-yocto-dev 5.12++gitX -> 5.15++gitX
> +-  linux-yocto-rt 5.4.144+gitX, 5.10.63+gitX -> 5.10.70+gitX, 5.14.9+git=
X
> +-  linux-yocto-tiny 5.4.144+gitX, 5.10.63+gitX -> 5.10.70+gitX, 5.14.9+g=
itX
> +-  llvm 11.1.0 -> 12.0.1
> +-  log4cplus 2.0.6 -> 2.0.7
> +-  logrotate 3.18.0 -> 3.18.1
> +-  ltp 20210121 -> 20210524
> +-  lttng-modules 2.12.6 -> 2.13.0
> +-  lttng-tools 2.12.4 -> 2.13.0
> +-  lttng-ust 2.12.1 -> 2.13.0
> +-  m4 1.4.18 -> 1.4.19
> +-  m4-native 1.4.18 -> 1.4.19
> +-  man-pages 5.10 -> 5.12
> +-  mc 4.8.26 -> 4.8.27
> +-  mesa 21.0.3 -> 21.2.1
> +-  mesa-gl 21.0.3 -> 21.2.1
> +-  meson 0.57.1 -> 0.58.1
> +-  mmc-utils 0.1+gitX (73d6c59af8d1...) -> 0.1+gitX (43282e80e174...)
> +-  mobile-broadband-provider-info 20201225 -> 20210805
> +-  mpg123 1.26.4 -> 1.28.2
> +-  mtd-utils 2.1.2 -> 2.1.3
> +-  mtools 4.0.26 -> 4.0.35
> +-  musl 1.2.2+gitX (e5d2823631bb...) -> 1.2.2+gitX (3f701faace7a...)
> +-  nativesdk-meson 0.57.1 -> 0.58.1
> +-  netbase 6.2 -> 6.3
> +-  nfs-utils 2.5.3 -> 2.5.4
> +-  ofono 1.31 -> 1.32
> +-  openssh 8.5p1 -> 8.7p1
> +-  opkg 0.4.4 -> 0.4.5
> +-  opkg-utils 0.4.3 -> 0.4.5
> +-  ovmf edk2-stable202102 -> edk2-stable202105
> +-  p11-kit 0.23.22 -> 0.24.0
> +-  pango 1.48.2 -> 1.48.9
> +-  patchelf 0.12 -> 0.13
> +-  perl 5.32.1 -> 5.34.0
> +-  piglit 1.0+gitrX (d4d9353b7290...) -> 1.0+gitrX (6a4be9e9946d...)
> +-  pkgconf 1.7.3 -> 1.8.0
> +-  powertop 2.13 -> 2.14
> +-  pseudo 1.9.0+gitX (b988b0a6b8af...) -> 1.9.0+gitX (0cda3ba5f94a...)
> +-  pulseaudio 14.2 -> 15.0
> +-  puzzles 0.0+gitX (84cb4c6701e0...) -> 0.0+gitX (8f3413c31ffd...)
> +-  python3 3.9.5 -> 3.9.6
> +-  python3-attrs 20.3.0 -> 21.2.0
> +-  python3-cython 0.29.22 -> 0.29.24
> +-  python3-dbus 1.2.16 -> 1.2.18
> +-  python3-dbusmock 0.22.0 -> 0.23.1
> +-  python3-docutils 0.16 -> 0.17.1
> +-  python3-git 3.1.14 -> 3.1.20
> +-  python3-gitdb 4.0.5 -> 4.0.7
> +-  python3-hypothesis 6.2.0 -> 6.15.0
> +-  python3-importlib-metadata 3.4.0 -> 4.6.4
> +-  python3-iniparse 0.4 -> 0.5
> +-  python3-jinja2 2.11.3 -> 3.0.1
> +-  python3-libarchive-c 2.9 -> 3.1
> +-  python3-magic 0.4.22 -> 0.4.24
> +-  python3-mako 1.1.4 -> 1.1.5
> +-  python3-markupsafe 1.1.1 -> 2.0.1
> +-  python3-more-itertools 8.7.0 -> 8.8.0
> +-  python3-numpy 1.20.1 -> 1.21.2
> +-  python3-packaging 20.9 -> 21.0
> +-  python3-pathlib2 2.3.5 -> 2.3.6
> +-  python3-pbr 5.4.4 -> 5.6.0
> +-  python3-pip 20.0.2 -> 21.2.4
> +-  python3-pluggy 0.13.1 -> 1.0.0
> +-  python3-pycairo 1.20.0 -> 1.20.1
> +-  python3-pygments 2.8.1 -> 2.10.0
> +-  python3-pygobject 3.38.0 -> 3.40.1
> +-  python3-pytest 6.2.2 -> 6.2.4
> +-  python3-scons 3.1.2 -> 4.2.0
> +-  python3-scons-native 3.1.2 -> 4.2.0
> +-  python3-setuptools 54.1.1 -> 57.4.0
> +-  python3-setuptools-scm 5.0.1 -> 6.0.1
> +-  python3-six 1.15.0 -> 1.16.0
> +-  python3-sortedcontainers 2.3.0 -> 2.4.0
> +-  python3-testtools 2.4.0 -> 2.5.0
> +-  python3-zipp 3.4.1 -> 3.5.0
> +-  qemu 5.2.0 -> 6.0.0
> +-  qemu-native 5.2.0 -> 6.0.0
> +-  qemu-system-native 5.2.0 -> 6.0.0
> +-  re2c 2.0.3 -> 2.2
> +-  rng-tools 6.11 -> 6.14
> +-  rpcbind 1.2.5 -> 1.2.6
> +-  rt-tests 1.10 -> 2.1
> +-  ruby 3.0.1 -> 3.0.2
> +-  rxvt-unicode 9.22 -> 9.26
> +-  shaderc 2020.5 -> 2021.1
> +-  shadow 4.8.1 -> 4.9
> +-  spirv-tools 2020.7 -> 2021.2
> +-  sqlite3 3.35.0 -> 3.36.0
> +-  squashfs-tools 4.4 -> 4.5
> +-  strace 5.11 -> 5.14
> +-  stress-ng 0.12.05 -> 0.13.00
> +-  sudo 1.9.6p1 -> 1.9.7p2
> +-  swig 3.0.12 -> 4.0.2
> +-  sysklogd 2.2.2 -> 2.2.3
> +-  systemd 247.6 -> 249.3
> +-  systemd-boot 247.6 -> 249.3
> +-  systemd-conf 247.6 -> 1.0
> +-  systemtap 4.4 -> 4.5
> +-  systemtap-native 4.4 -> 4.5
> +-  systemtap-uprobes 4.4 -> 4.5
> +-  tcf-agent 1.7.0+gitX (a022ef2f1acf...) -> 1.7.0+gitX (2735e3d6b7ec...=
)
> +-  texinfo 6.7 -> 6.8
> +-  tiff 4.2.0 -> 4.3.0
> +-  u-boot 2021.01 -> 2021.07
> +-  u-boot-tools 2021.01 -> 2021.07
> +-  usbutils 013 -> 014
> +-  util-linux 2.36.2 -> 2.37.2
> +-  util-linux-libuuid 2.36.2 -> 2.37.2
> +-  vala 0.50.4 -> 0.52.5
> +-  valgrind 3.16.1 -> 3.17.0
> +-  virglrenderer 0.8.2 -> 0.9.1
> +-  vte 0.62.2 -> 0.64.2
> +-  vulkan-headers 1.2.170.0 -> 1.2.182.0
> +-  vulkan-loader 1.2.170.0 -> 1.2.182.0
> +-  vulkan-samples git (55cebd9e7cc4...) -> git (d2187278cb66...)
> +-  vulkan-tools 1.2.170.0 -> 1.2.182.0
> +-  wayland-protocols 1.20 -> 1.21
> +-  webkitgtk 2.30.5 -> 2.32.3
> +-  wireless-regdb 2021.04.21 -> 2021.07.14
> +-  wpebackend-fdo 1.8.0 -> 1.10.0
> +-  x264 r3039+gitX (544c61f08219...) -> r3039+gitX (5db6aa6cab1b...)
> +-  xeyes 1.1.2 -> 1.2.0
> +-  xf86-input-libinput 0.30.0 -> 1.1.0
> +-  xkbcomp 1.4.4 -> 1.4.5
> +-  xkeyboard-config 2.32 -> 2.33
> +-  xorgproto 2020.1 -> 2021.4.99.2
> +-  xserver-xorg 1.20.10 -> 1.20.13
> +-  zstd 1.4.9 -> 1.5.0
> +
> +Contributors
> +------------
> +
> +Thanks to the following people who contributed to this release:
> +
> +-  Adam Romanek
> +-  Alejandro Hernandez Samaniego
> +-  Alexander Kanavin
> +-  Alexandre Belloni
> +-  Alexey Brodkin
> +-  Alex Stewart
> +-  Alistair Francis
> +-  Anatol Belski
> +-  Anders Wallin
> +-  Andrea Adami
> +-  Andreas M=C3=BCller
> +-  Andrej Valek
> +-  Andres Beltran
> +-  Andrey Zhizhikin
> +-  Anibal Limon
> +-  Anthony Bagwell
> +-  Anton Blanchard
> +-  Anuj Mittal
> +-  Armin Kuster
> +-  Asfak Rahman
> +-  Bastian Krause
> +-  Bernhard Rosenkr=C3=83=C2=A4nzer
> +-  Bruce Ashfield
> +-  Carlos Rafael Giani
> +-  Chandana kalluri
> +-  Changhyeok Bae
> +-  Changqing Li
> +-  Chanho Park
> +-  Chen Qi
> +-  Chris Laplante
> +-  Christophe Chapuis
> +-  Christoph Muellner
> +-  Claudius Heine
> +-  Damian Wrobel
> +-  Daniel Ammann
> +-  Daniel Gomez
> +-  Daniel McGregor
> +-  Daniel Wagenknecht
> +-  Denys Dmytriyenko
> +-  Devendra Tewari
> +-  Diego Sueiro
> +-  Dmitry Baryshkov
> +-  Douglas Royds
> +-  Dragos-Marian Panait
> +-  Drew Moseley
> +-  Enrico Scholz
> +-  Fabio Berton
> +-  Florian Amstutz
> +-  Gavin Li
> +-  Guillaume Champagne
> +-  Harald Brinkmann
> +-  Henning Schild
> +-  He Zhe
> +-  Hongxu Jia
> +-  Hsia-Jun (Randy) Li
> +-  Jean Bouchard
> +-  Joe Slater
> +-  Jonas H=C3=B6ppner
> +-  Jon Mason
> +-  Jose Quaresma
> +-  Joshua Watt
> +-  Justin Bronder
> +-  Kai Kang
> +-  Kenfe-Mickael Laventure
> +-  Kevin Hao
> +-  Khairul Rohaizzat Jamaluddin
> +-  Khem Raj
> +-  Kiran Surendran
> +-  Konrad Weihmann
> +-  Kristian Klausen
> +-  Kyle Russell
> +-  Lee Chee Yang
> +-  Lei Maohui
> +-  Luca Boccassi
> +-  Marco Felsch
> +-  Marcus Comstedt
> +-  Marek Vasut
> +-  Mark Hatle
> +-  Markus Volk
> +-  Marta Rybczynska
> +-  Martin Jansa
> +-  Matthias Klein
> +-  Matthias Schiffer
> +-  Matt Madison
> +-  Matt Spencer
> +-  Max Krummenacher
> +-  Michael Halstead
> +-  Michael Ho
> +-  Michael Opdenacker
> +-  Mike Crowe
> +-  Mikko Rapeli
> +-  Ming Liu
> +-  Mingli Yu
> +-  Minjae Kim
> +-  Nicolas Dechesne
> +-  Niels Avonds
> +-  Nikolay Papenkov
> +-  Nisha Parrakat
> +-  Olaf Mandel
> +-  Oleksandr Kravchuk
> +-  Oleksandr Popovych
> +-  Oliver Kranz
> +-  Otavio Salvador
> +-  Patrick Williams
> +-  Paul Barker
> +-  Paul Eggleton
> +-  Paul Gortmaker
> +-  Paulo Cesar Zaneti
> +-  Peter Bergin
> +-  Peter Budny
> +-  Peter Kjellerstedt
> +-  Petr Vorel
> +-  Przemyslaw Gorszkowski
> +-  Purushottam Choudhary
> +-  Qiang Zhang
> +-  Quentin Schulz
> +-  Ralph Siemsen
> +-  Randy MacLeod
> +-  Ranjitsinh Rathod
> +-  Rasmus Villemoes
> +-  Reto Schneider
> +-  Richard Purdie
> +-  Richard Weinberger
> +-  Robert Joslyn
> +-  Robert P. J. Day
> +-  Robert Yang
> +-  Romain Naour
> +-  Ross Burton
> +-  Sakib Sajal
> +-  Samuli Piippo
> +-  Saul Wold
> +-  Scott Murray
> +-  Scott Weaver
> +-  Stefan Ghinea
> +-  Stefan Herbrechtsmeier
> +-  Stefano Babic
> +-  Stefan Wiehler
> +-  Steve Sakoman
> +-  Teoh Jay Shen
> +-  Thomas Perrot
> +-  Tim Orling
> +-  Tom Pollard
> +-  Tom Rini
> +-  Tony Battersby
> +-  Tony Tascioglu
> +-  Trevor Gamblin
> +-  Trevor Woerner
> +-  Ulrich =C3=96lmann
> +-  Valentin Danaila
> +-  Vinay Kumar
> +-  Vineela Tummalapalli
> +-  Vin=C3=ADcius Ossanes Aquino
> +-  Vivien Didelot
> +-  Vyacheslav Yurkov
> +-  Wang Mingyu
> +-  Wes Lindauer
> +-  William A. Kennington III
> +-  Yanfei Xu
> +-  Yann Dirson
> +-  Yi Fan Yu
> +-  Yi Zhao
> +-  Zang Ruochen
> +-  Zheng Ruoqin
> +-  Zoltan Boszormenyi
> +
> +Repositories/Downloads
> +----------------------
> +
> +poky
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.yoctoproject.org_poky_&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=
=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dgdu=
upfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D7MDPcYReI=
6ZR4mZVF1L9Sj2EhEuI1sf-eWf1APYwtTk&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.yoctoproject.org_poky_log_-3Fh-3Dhonister&d=3DDwIDaQ&c=3D_sEr5x9kU=
Whuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-1=
72IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFP=
r&s=3DYJTjWqkjPUk2HM0kSUHQwByC58ycFx4jdZmFLZ_ZT9k&e=3D >`__
> +-  Tag: `yocto-3.4 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_poky_tag_-3Fh-3Dyocto-2D3.4&d=3DDwIDaQ&c=3D_sEr5x9k=
UWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-=
172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARF=
Pr&s=3DSDbfh4zryaxsuctbbGSqixbesbMbOgxoLuRSCrNRZMY&e=3D >`__
> +-  Git Revision: `f6d1126fff213460dc6954a5d5fc168606d76b66 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_poky_commit=
_-3Fid-3Df6d1126fff213460dc6954a5d5fc168606d76b66&d=3DDwIDaQ&c=3D_sEr5x9kUW=
huk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-17=
2IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr=
&s=3DGmH0wM7JTnN3k1MfNKqoSek4WsOjYPbPRohYQmTPbjo&e=3D >`__
> +-  Release Artefact:  poky-f6d1126fff213460dc6954a5d5fc168606d76b66
> +-  sha: 11e8f5760f704eed1ac37a5b09b1a831b5254d66459be75b06a72128c63e0411
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_poky-2Df6d1126fff213460dc6954a5d5fc1=
68606d76b66.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIz=
VmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmE=
av6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D_Fo0lcrF23Di3nTlZ-vYW6FJA=
GGUiHagVRsAHDvpGAc&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_poky-2Df6d1126fff213460dc6954a5d5fc168606d76b66=
.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA=
1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrd=
nzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3Dt99R0PL7Hwtcp9HBVBIojm15n5S6JrMsR_e-=
2MWXAgY&e=3D
> +
> +openembedded-core
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.openembedded.org_openembedded-2Dcore&d=3DDwIDaQ&c=3D_sEr5x9kUWhu=
k4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172I=
Iy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=
=3D_P6d5DoerNnK5r1Gi-dnByTL7NZFJYVdFL1bunUreb8&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.openembedded.org_openembedded-2Dcore_log_-3Fh-3Dhonister&d=3DDwIDa=
Q&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ=
4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6=
W42-XwWfMsxARFPr&s=3DUm5BzhR3D8kpym9vQrct1QOB1cbiNjctFPMuOY8Evoo&e=3D >`__
> +-  Tag: `2021-10-honister <https://urldefense.proofpoint.com/v2/url?u=3D=
https-3A__git.openembedded.org_openembedded-2Dcore_tag_-3Fh-3D2021-2D10-2Dh=
onister&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1=
XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdn=
zquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DpDU3anFThQFVPOxaq3kCL4EELuWJqxdoCxjuD=
Yf9e9M&e=3D >`__
> +-  Git Revision: `bb1dea6806f084364b6017db2567f438e805aef0 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.org_openembedde=
d-2Dcore_commit_-3Fid-3Dbb1dea6806f084364b6017db2567f438e805aef0&d=3DDwIDaQ=
&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4=
njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W=
42-XwWfMsxARFPr&s=3DT8scbd3il-TmQ7Di0MksRsH57W9vHivQ571N3D21NVc&e=3D >`__
> +-  Release Artefact: oecore-bb1dea6806f084364b6017db2567f438e805aef0
> +-  sha: 9a356c407c567b1c26e535cad235204b0462cb79321fefb0844324a6020b31f4
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_oecore-2Dbb1dea6806f084364b6017db256=
7f438e805aef0.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rX=
IzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSg=
mEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DbCAxLbBrAlef7Szkr26AzHQ=
ZoxFLSN42mIbBrKaQ4gg&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_oecore-2Dbb1dea6806f084364b6017db2567f438e805ae=
f0.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5y=
mA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSy=
rdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DCEtIX8Dp6mInGlhymU9i_GRZRQ45bNKi76=
Xp_hofKf4&e=3D
> +
> +meta-mingw
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.yoctoproject.org_meta-2Dmingw&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwj=
JtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DJEl=
Ec8CVjUhrL6AKeydJK4ubCI47jn1LsDB1QOtD0Vs&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.yoctoproject.org_meta-2Dmingw_log_-3Fh-3Dhonister&d=3DDwIDaQ&c=3D_=
sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQ=
hZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwW=
fMsxARFPr&s=3DX_Ke9sIj17UCdYoUOLAlD4ZXPTAWCirS9LcRTcB8HRc&e=3D >`__
> +-  Tag: `yocto-3.4 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_meta-2Dmingw_tag_-3Fh-3Dyocto-2D3.4&d=3DDwIDaQ&c=3D=
_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZgu=
QhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-Xw=
WfMsxARFPr&s=3D6HmzRkrfhvYQTnHmFTei9NxUKAWKr7DByo3yF3WIsAw&e=3D >`__
> +-  Git Revision: `f5d761cbd5c957e4405c5d40b0c236d263c916a8 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_meta-2Dming=
w_commit_-3Fid-3Df5d761cbd5c957e4405c5d40b0c236d263c916a8&d=3DDwIDaQ&c=3D_s=
Er5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQh=
ZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWf=
MsxARFPr&s=3DLFmWp2Rt0RA1mwro9J1Ttye0UN-nMtrsCP_JLRAxhW8&e=3D >`__
> +-  Release Artefact: meta-mingw-f5d761cbd5c957e4405c5d40b0c236d263c916a8
> +-  sha: d4305d638ef80948584526c8ca386a8cf77933dffb8a3b8da98d26a5c40fcc11
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_meta-2Dmingw-2Df5d761cbd5c957e4405c5=
d40b0c236d263c916a8.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbci=
WoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D2FmqVHdSRNMqjKA9O=
j3Ar70hjwCKDyL27hShE2s0tGw&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_meta-2Dmingw-2Df5d761cbd5c957e4405c5d40b0c236d2=
63c916a8.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6=
e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3Dyp1YeVOS_5CiA34dhu17KPsLdrwk=
dlaNimSg3adgxNk&e=3D
> +
> +meta-intel
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.yoctoproject.org_meta-2Dintel&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwj=
JtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DDQ5=
NcG-HNvibQMuZni2heQJIL6mLSyLNQZ17yn6BMj0&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.yoctoproject.org_meta-2Dintel_log_-3Fh-3Dhonister&d=3DDwIDaQ&c=3D_=
sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQ=
hZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwW=
fMsxARFPr&s=3DRN5go05n1AGSeZf-bcxmNAm9sIuNikCGuKk6UaxZw7g&e=3D >`__
> +-  Tag: `yocto-3.4 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_meta-2Dintel_tag_-3Fh-3Dyocto-2D3.4&d=3DDwIDaQ&c=3D=
_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZgu=
QhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-Xw=
WfMsxARFPr&s=3D9ZwI-fETAa0rnFb7BDz_OwWBXVgaOlKflLbAgYS-kBM&e=3D >`__
> +-  Git Revision: `90170cf85fe35b4e8dc00eee50053c0205276b63 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_meta-2Dinte=
l_commit_-3Fid-3D90170cf85fe35b4e8dc00eee50053c0205276b63&d=3DDwIDaQ&c=3D_s=
Er5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQh=
ZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWf=
MsxARFPr&s=3DeZ-rKPMp2Cel297rOzTivlXcQdMOs_tvH_l-LA-Pva8&e=3D >`__
> +-  Release Artefact: meta-intel-90170cf85fe35b4e8dc00eee50053c0205276b63
> +-  sha: 2b3b43386dfcaaa880d819c1ae88b1251b55fb12c622af3d0936c3dc338491fc
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_meta-2Dintel-2D90170cf85fe35b4e8dc00=
eee50053c0205276b63.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbci=
WoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DciJWJv0NyACTdiaG7=
SKBexWtQRRql-empTNgIZJ7Db0&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_meta-2Dintel-2D90170cf85fe35b4e8dc00eee50053c02=
05276b63.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6=
e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DJ5JwZIlsFTrgwujiUB3pr9zKTHPt=
2W9xjB2axHMiWY8&e=3D
> +
> +meta-gplv2
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.yoctoproject.org_meta-2Dgplv2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwj=
JtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DsvC=
HwhBlWd9bCBb5qVjIhwPTRtc-dTjoKgIEwD2Go1g&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.yoctoproject.org_meta-2Dgplv2_log_-3Fh-3Dhonister&d=3DDwIDaQ&c=3D_=
sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQ=
hZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwW=
fMsxARFPr&s=3D9NkslWtl7CNu8O03O8nfjIwIdDfisaMCApmSGak8xKM&e=3D >`__
> +-  Tag: `yocto-3.4 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_meta-2Dgplv2_tag_-3Fh-3Dyocto-2D3.4&d=3DDwIDaQ&c=3D=
_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZgu=
QhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-Xw=
WfMsxARFPr&s=3D6z8E1Y557klKtHhH5m_XBLLGMBSPitvVKLDf-UObqG8&e=3D >`__
> +-  Git Revision: `f04e4369bf9dd3385165281b9fa2ed1043b0e400 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_meta-2Dgplv=
2_commit_-3Fid-3Df04e4369bf9dd3385165281b9fa2ed1043b0e400&d=3DDwIDaQ&c=3D_s=
Er5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQh=
ZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWf=
MsxARFPr&s=3DagtPtVgsaXYALg-KHPHfHxX4KbdlRqpn7HXac-7Qg7s&e=3D >`__
> +-  Release Artefact: meta-gplv2-f04e4369bf9dd3385165281b9fa2ed1043b0e400
> +-  sha: ef8e2b1ec1fb43dbee4ff6990ac736315c7bc2d8c8e79249e1d337558657d3fe
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_meta-2Dgplv2-2Df04e4369bf9dd33851652=
81b9fa2ed1043b0e400.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbci=
WoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D9p3bnUYg1cTOY19e0=
kl4KCtG-K-H8vKtF82llvR97JI&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_meta-2Dgplv2-2Df04e4369bf9dd3385165281b9fa2ed10=
43b0e400.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6=
e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DF8jtI0O5rJOSQ0HKUwm7P5aZH-MO=
MFQt5offOZL3foE&e=3D
> +
> +bitbake
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.openembedded.org_bitbake&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=
=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dgdu=
upfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D-B4kgZ5ro=
098AFHJ5erRD_CwMinDDLlHLfcAOa-38bk&e=3D
> +-  Branch: `1.52 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_git.openembedded.org_bitbake_log_-3Fh-3D1.52&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4=
_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy=
1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=
=3DMy8gYMFMhqLI5A21PBflc8zYdd6ivRlteGolRnEwXkY&e=3D >`__
> +-  Tag: `2021-10-honister <https://urldefense.proofpoint.com/v2/url?u=3D=
https-3A__git.openembedded.org_bitbake_tag_-3Fh-3D2021-2D10-2Dhonister&d=3D=
DwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6=
m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQz=
MuYK6W42-XwWfMsxARFPr&s=3DwgOhcAvpQ0LNnz-FUcj_FN-9R7v7JZuHcNbLdB7Dm_M&e=3D =
>`__
> +-  Git Revision: `c78ebac71ec976fdf27ea24767057882870f5c60 <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.org_bitbake_com=
mit_-3Fid-3Dc78ebac71ec976fdf27ea24767057882870f5c60&d=3DDwIDaQ&c=3D_sEr5x9=
kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_=
-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxAR=
FPr&s=3DMpHwwnfkOUk07jfAN-b3lZ2PBdGxNvwWcZJ-RnA2-9w&e=3D >`__
> +-  Release Artefact: bitbake-c78ebac71ec976fdf27ea24767057882870f5c60
> +-  sha: 8077c7e7528cd73ef488ef74de3943ec66cae361459e5b630fb3cbe89c498d3d
> +-  Download Locations:
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yocto=
project.org_releases_yocto_yocto-2D3.4_bitbake-2Dc78ebac71ec976fdf27ea24767=
057882870f5c60.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7r=
XIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpS=
gmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D9Li7tvrXSEhPu5w7I-QOI2=
kdD_xl5dfd0UHxu1XOOWs&e=3D ,
> +   https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__mirrors.kernel.=
org_yocto_yocto_yocto-2D3.4_bitbake-2Dc78ebac71ec976fdf27ea24767057882870f5=
c60.tar.bz2&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5=
ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YS=
yrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DuD336vlYmIayGgWlTUC8FrXUYTM0T4teZ=
N1pHRpzpk4&e=3D
> +
> +yocto-docs
> +
> +-  Repository Location: https://urldefense.proofpoint.com/v2/url?u=3Dhtt=
ps-3A__git.yoctoproject.org_yocto-2Ddocs&d=3DDwIDaQ&c=3D_sEr5x9kUWhuk4_nFwj=
JtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3Deif=
Del-FlT9POYkjzFzaKdEtFY3rkihsxaH1kEKFEpg&e=3D
> +-  Branch: `honister <https://urldefense.proofpoint.com/v2/url?u=3Dhttps=
-3A__git.yoctoproject.org_yocto-2Ddocs_log_-3Fh-3Dhonister&d=3DDwIDaQ&c=3D_=
sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQ=
hZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwW=
fMsxARFPr&s=3DOSVJ_U_Qg_l-tleb5DNabVGaWe9axPmYuIzinsxodkQ&e=3D >`__
> +-  Tag: `yocto-3.4 <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_yocto-2Ddocs_tag_-3Fh-3Dyocto-2D3.4&d=3DDwIDaQ&c=3D=
_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZgu=
QhZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-Xw=
WfMsxARFPr&s=3Dz2FUOE29zu_QpqVLxN9lXXgdJsQqtHbixE2jPL6D_xU&e=3D >`__
> +-  Git Revision: `d75c5450ecf56c8ac799a633ee9ac459e88f91fc <https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_yocto-2Ddoc=
s_commit_-3Fid-3Dd75c5450ecf56c8ac799a633ee9ac459e88f91fc&d=3DDwIDaQ&c=3D_s=
Er5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQh=
ZhkI_-172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWf=
MsxARFPr&s=3DZ1eWhSiYWP1DqUC5kDHFIpKvK61cXPBKu5sQq7YpLA4&e=3D >`__
> diff --git a/documentation/release-notes/index.rst b/documentation/releas=
e-notes/index.rst
> new file mode 100644
> index 0000000000..c008bd3bf8
> --- /dev/null
> +++ b/documentation/release-notes/index.rst
> @@ -0,0 +1,15 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> + Release Notes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +|
> +
> +Each document in this chapter offers the release notes for past releases=
.
> +
> +.. toctree::
> +
> +   3.4
> +
> +.. include:: /boilerplate.rst
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2348): https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.yoctoproject.org_g_docs_message_2348&d=3DDwIFaQ&c=3D_sEr5x9k=
UWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-=
172IIy1t&m=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARF=
Pr&s=3D95_qXbNfdN3d8zA5l_IG1zQMLgp50-vZK1pfSvb86bU&e=3D
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__l=
ists.yoctoproject.org_mt_88223106_6293953&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFw=
jJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=
=3DgduupfCEbciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3D42Z=
XzJT7-mTKkIekued7XcOy7axLRHxoDRFAWzO0lg0&e=3D
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists=
.yoctoproject.org_g_docs_unsub&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLY=
jLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DgduupfCE=
bciWoHpSgmEav6e86YSyrdnzquAX1pQbxQzMuYK6W42-XwWfMsxARFPr&s=3DmgYEyvtBLghOZj=
QwvdAt7X1pUOPpcRHNCOzykLYS1Q0&e=3D  [quentin.schulz@theobroma-systems.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


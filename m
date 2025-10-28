Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B7ACCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:04:57 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.55])
 by mx.groups.io with SMTP id smtpd.web11.4759.1761645890121986190
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 03:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=lRSFGncN;
 spf=pass (domain: cherry.de, ip: 52.101.70.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQOGS9e4ERN2l1YweeQcbEvGXojLt4Ox8syE0rQJe8FoVQjWqrviU+0Pxzg+en2biu6ts832K4BZ6Vl1ZxaknwWw7zk+j1kSP+7uAEVNorTnqK1ad/Gy/OhhDP9uf8anvz+Q2rJRktKYBS14qK1MTf4rlHUd+nAgZtSJNAuoqHg+5aFiQoeQZH2aK4Z3XbqG4DWeRDyBQ2e0lkpunr6SF+6M4pxz0GGqSbx8SzG/XG52gAlyPIYkJVT3Y1X5fdivPAowDsTOPmatCbmrt/fEWGmyIKk//VLZqzTq8lmjduV+1pCr/yDcOGvANssfmZntEdtn/n8QHG/OX3R29lpowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PplmtPJZHXpB1JKe6UNF4RKvJrT+PV2MAnc1u/1G2+o=;
 b=pnUCsEJL1MQ/rX9zljwe2esNd/a2YUCBxBT2xTPBi15jyavoP7/s57p8AkEM4w5IkYIzfZ8rrEcrrtUZxAp8YiSYHJNdCr5n7A+OuQfmr3fXoO/fDcW+2GpNY9kcCA/XC8FZgRlNiyvBvOif1J8/HIgeMjm/hRTmrNpkjrmRkj84C+kMpkKwMfKFJ90ayTC1EzeiC3h5Y93oetu5qSbG13ShHqGq2+wRDcy1nveQGLu/tY9JS44IwKiDK+gLbk5lLq/fLhmc246bVA5t9vlLdzXvT2TkzT9bmFp3uCBmwCNRLKxSOeTM/r9mHVT4gYkHWgSPF+csTvM+Hy+DlUdifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PplmtPJZHXpB1JKe6UNF4RKvJrT+PV2MAnc1u/1G2+o=;
 b=lRSFGncNvCJ6QzxQuwPrXLGiftwERRTNqPe8NNp3wokCRrzCCct/5Ex3oOF274eIA8JBnSOb2K7cxz2LLKvM7VBwFyA3YpRjmbeWjNwAdciILbYZ4/UvUoyHmij4LGMCIdIJra3T9R+5c8kGwg86vL8X12pV5ZtAFUhiYJbDi80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 10:04:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 10:04:46 +0000
Message-ID: <e84d4047-dc45-4d05-b30e-38c9c7b2b85b@cherry.de>
Date: Tue, 28 Oct 2025 11:04:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/sbom.rst: reflect that create-spdx is
 enabled by default
To: ejo@pengutronix.de, docs@lists.yoctoproject.org
CC: yocto@pengutronix.de
References: <20251028081249.1378992-1-ejo@pengutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251028081249.1378992-1-ejo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0322.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adaf6d6-aa8d-444f-413a-08de16096c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DPrUoAcQZ0gkfXgSxn4ThBuIzwuZdnQGKLhfEkc0IyiOITxlTBD0Z8Dx5kDa?=
 =?us-ascii?Q?LrcYfqAQB4rhuQrROH9TPcdYypQoFZnWuUgtHeWnwH7R8Q22eOZmxpZl3x8y?=
 =?us-ascii?Q?eKt5oBUPIXIitZbz7PqRZW/OhPTpByOUohEeYnyTS+7UVAORFOLDJpJli+3s?=
 =?us-ascii?Q?gwrt9H+4zBUEKdlqya5nrF+20kVlxaZIP73T1q5xtlscbuG8fxWHwgDH9HX1?=
 =?us-ascii?Q?KNcK9q/CBqgqnLFc7LH6XqsZTIJYLqjHiuEY95cp+aY1VZ4QmKhUJF0KiWSy?=
 =?us-ascii?Q?vXefPosUIUN1cZUrQdxxIKN5CfPYU2aKSup87W8W/WBsjO8lCxjzi6cxht/C?=
 =?us-ascii?Q?6cC4Zd6TwtI2aQrq7aiUy1WZb0AyWDCK2ozTvlcbINPlOJOPQi2VeMaWBev5?=
 =?us-ascii?Q?biscf8uXBycowiaZ5fRbLU5nGbOKVr4FFTYsIdPyuCnt3ZcpfNkTA+7h64oj?=
 =?us-ascii?Q?E20zfPafr6US4rC1eDpLI149EZO6vvbjrx/3zI/Oceic0uTu/7d7EMHheQZN?=
 =?us-ascii?Q?V/fdl3UXxUT7nlr/WG5xI7QkyGrFlhUZHoeb5dnndRB6xt3Dgbu+iIAMQkD/?=
 =?us-ascii?Q?XD0Ltgu7eKpHsIysE2iwKvJ9AuxSIhKZSUtI5YrJPowaqYXS7YuJkh75vKVe?=
 =?us-ascii?Q?ctttJ6YWfaaAgIki9GexMuQU00lQwKb4opUmwBbh5Sbp9lU390/t6T+XwAA5?=
 =?us-ascii?Q?zqDyiwxeSvaVdzCFppjATIpz4LgMmGVytWcNVuyQZU/Ad+2wd/yYI8mjlVal?=
 =?us-ascii?Q?yfjt6CAuLutdK29WZRbtEE9+Mpsz6flLgpcfROgAcWQ+djwoleZpUWjbXIIH?=
 =?us-ascii?Q?t5m+klQlSOAydUE/lbjC9GLJLt1kEtPqY44yXzzsy8PyrQa58ZLEM7A3Anaa?=
 =?us-ascii?Q?G8Sy/ce5nZE+R7PFfQPOMj+iJSyn6XMD5TirpAqJu+b37eYSFzkifUKacul3?=
 =?us-ascii?Q?zxFdmGH+idxM9bk4k78B0yWJVX/tQSolcIWXSnF0jPxfhZghU17EUq4bAj0Q?=
 =?us-ascii?Q?SwHDHoQ2GIIV43h7MSvzX7lx0rWQxQXBRKaX9nTZjNyGFijo4v2k+gi2Le1K?=
 =?us-ascii?Q?EsTSOxwZYrOx/2L0BHCjPZTYtr/c5ViU01sJ8YfVI3uFHyAfeiJ2uxirIbMP?=
 =?us-ascii?Q?EYnvkTjGAGpXm4mi8w7dV9i7G+OdtK4rsyH0gYngXo/tYIlaeasUD4qdmI4A?=
 =?us-ascii?Q?QRj2++SBtnQ/VneehdVsqKE+lRheXC88ZadMJxwCuivU8+K48Fog3tEO9xW8?=
 =?us-ascii?Q?hLNFKsDtkKdXvW7rYwpoXS+mAeqhSLS4JunbxIMJDyp7Chx+KRV3vchceFHZ?=
 =?us-ascii?Q?m+yadvIjLE6/gku0dsQA4Oz5xKr3rs/wVET81hSbHVKBu5W2pen6vtdoQO6p?=
 =?us-ascii?Q?zoWj0qh4kojsDuzqhLidbQrlzedCMVs/Nj8mUBWtCxlE1FFVJB04mGRRbWCI?=
 =?us-ascii?Q?++4u1SqSDSQsE37RzWJybkUsmOM66PqH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9I26ON1u2RO8RUuknld2tr0J1fHLxPPJMQR2b1SpVjq/ZqdwgOO6R9riBdAp?=
 =?us-ascii?Q?Fv5JvB1tymYleia7SEftaY2HJMBn1XpiGo0M/w6V+nEd8972/9pbF+Wm2pht?=
 =?us-ascii?Q?w21/CgWpGyHCNEHE039mI2T5tYZdB/dfeeVuyRJuTmKGIRWERRZf8d3/JOPI?=
 =?us-ascii?Q?deTFilOrIf7FraVmZFELmoeRLdEEZSzEzBmL6LQsJt3XSjUIGyK9R0+VZl9b?=
 =?us-ascii?Q?J5tyR9tgGsgtNB96JWDzDEKNm7DIT9pudss4ycXoUUkZ8MXleUuYeuGNoLa8?=
 =?us-ascii?Q?Lc+z53LgXokMoKiw9TgZDhjJN1ciQEqOOpLr/OWZhI5NKIz3dKTwcPp+ONE8?=
 =?us-ascii?Q?oUGg3tHJb5xefzrmHYEbTlpEIt6I9y2y97KsMFxTEE7jL5GT5w/vXYr8/xun?=
 =?us-ascii?Q?Z75AfBnLipf/tWr9VnCPQJRcp//rhvfxqREcqPzpwXwgItllqGghEEBPVSLG?=
 =?us-ascii?Q?Een9w5SlVzaeLUQhKGXVHgJ2tExsQJJKgrs5rOOv9ERbKuRe+MPpUICHp0p8?=
 =?us-ascii?Q?xNxipoRUpw/DWMuIXbQljwHTLOf8p7bCZvWuw347kIuHU6VgRM5QFMyZ0x67?=
 =?us-ascii?Q?uiyXpkNHbyDPPIrl2kjz6DoNxzrHid+lbEaDle/fszmaoZLAznSw2/rQ9BvJ?=
 =?us-ascii?Q?BIlDm6mwo7wQ8dS6OljYVf5dtUsEfhUO3xOJHP3bPDJT8MhzNvj3xGj7l6r6?=
 =?us-ascii?Q?nZO11a1g0NFtlhPn8PMelxgNVdkVVPQBy0PmosmPYf/8ZVLwfr4asMxq6oQK?=
 =?us-ascii?Q?Rc6a/iyi0Depc305CFKaeAP+Vq4T835y6qn9X7Kykj6M3H19AHOMuhJhfzQ9?=
 =?us-ascii?Q?xREayAh5i6YnveMNfhUcYPHA7BkPJAo3YelZJUEKfTTTd424yuUwwUbmZ0kf?=
 =?us-ascii?Q?5aHK709EGkyPyhsVLeRWO4Icx2J/caZyjJvtph+H6euxWu/kqP1qE3geYuSr?=
 =?us-ascii?Q?3HbbJXNSGkMprMeqhXt1UKx7K3MuKmgkQ/SxHePSrYcQJJV0emdGu8v0zQOa?=
 =?us-ascii?Q?PWWXWI1fPi5OtmLGJwg1o9uXgucN/bgwivhMl8QepGGx9x5BrrWkOdEWJgFP?=
 =?us-ascii?Q?eDOwGFBVjQ3Mw0EJeL2WkSlOSocTsgODmbTagpCFhEPU2W8m0VBo/twlkU0t?=
 =?us-ascii?Q?C79lYwJMd+VE3XmqjjirlFeZakseFnavflhsbd5pnmzarECqDzT22AQ78DIN?=
 =?us-ascii?Q?inHJ1QYPjKOeJC3brsQ7SA87Swohg8ckHmocax/VsEcAMJAMPIy6zPAnZ4Wk?=
 =?us-ascii?Q?R6HfAI6FrBQ4ceH27zYQjW+/ouyFNUYn1NjdCbOvS5DI1+8Wd9NVagvJhZtO?=
 =?us-ascii?Q?VBe6p1oWINydyDKZa6njNVsjfrQXtaM598mrHPmx3Q2aUtiyJIbaXzgV98Oh?=
 =?us-ascii?Q?FiToYH4C6RVLHr/gCG7TTOL67sN94IFOBZcDJKcYkVz/VUt2CIj2V+JggwwM?=
 =?us-ascii?Q?7CVfBXZt8hTg+xVuN25GlFeZyF2qY9gvosWnZjN5gLa0vayBqsnhOnMorZY4?=
 =?us-ascii?Q?TeKq1SvtQ7XgN16sCdCr9cod6la4NHfDF8MkkFv3FgDfhsnbAfs1ZwF6gIv+?=
 =?us-ascii?Q?6AbUOUML7KkeMGOuEG1hWkkF6PuY6uI2aw0mVCD62KIuLPugqtCTiipFmF9H?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adaf6d6-aa8d-444f-413a-08de16096c41
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:04:46.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyxobcfQZI3lyZ4VemdvG0S4mswthno3YUFKBtbpPIyCtTGxNITT+CbrPHJO0UzXpypD2rVt2HJErr22FC2mtwMwr3pFX0+04BV/7aE+Pf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 10:04:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7876

Hi Enrico,

On 10/28/25 9:12 AM, Enrico J=C3=B6rns via lists.yoctoproject.org wrote:
> Since nanbield (b34032ec "defaultsetup: Inherit create-spdx by
> default"), the create-spdx class is pulled in by default, not only by
> poky.
>=20

Indeed!

> Adapt the text to reflect this and also change INHERIT to INHERIT_DISTRO
> since this is the more concrete variable to modify for disabling
> create-spdx.
>=20
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>   documentation/dev-manual/sbom.rst | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual=
/sbom.rst
> index ca0fc8b9d..d54a33a47 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -24,19 +24,12 @@ users can read in standardized format.
>   :term:`SBOM` information is also critical to performing vulnerability e=
xposure
>   assessments, as all the components used in the Software Supply Chain ar=
e listed.
>  =20
> -The OpenEmbedded build system doesn't generate such information by defau=
lt,
> -though the :term:`Poky` reference distribution has it enabled out of the=
 box.
> +The OpenEmbedded build system generates such information by default (by
> +inheriting the :ref:`ref-classes-create-spdx` class in :term:`INHERIT_DI=
STRO`).
>  =20

s/in/via/ ?

> -To enable it, inherit the :ref:`ref-classes-create-spdx` class from a
> -configuration file::
> +If needed, it can be disabled from a :term:`configuration file`::
>  =20
> -   INHERIT +=3D "create-spdx"
> -
> -In the :term:`Poky` reference distribution, :term:`SPDX` generation does
> -consume some build time resources and thus if needed it can be disabled =
from a
> -:term:`configuration file`::
> -
> -   INHERIT:remove =3D "create-spdx"
> +   INHERIT_DISTRO:remove =3D "create-spdx"
>  =20

INHERIT_DISTRO is set with a weak operator (?=3D) so one can simply set it=
=20
from any location with INHERIT_DISTRO =3D (or if parsed before=20
defaultsetup.conf, with INHERIT_DISTRO ?=3D). There's no need to go the=20
overkill way of using :remove here.

In any case,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


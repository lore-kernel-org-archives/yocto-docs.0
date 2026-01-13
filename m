Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8B9D2D10C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 14:17:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59997.1768313818848006646
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 06:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=RROkPPqi;
 spf=pass (domain: cherry.de, ip: 52.101.84.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmFfZc7dw3DXOgNHNg7zrbdCJn2xxPzDy5q5y2FFNYJu/U/vBC6xEOTzqX7n21r81loHtox7818n8zMMuazqgspCdqdRNx/eOfXTWDujQjQrKlBYM86bN8yfkCPXXQmZ+KzWtifiEJYM3XKQSNgYqgAhP7mFoWE1sCpEXtTtAiwVlN6sDnLJ2H6fAzi+qYNfOPEZmpyNdkmp7YmJI3Fjn3F2fUJ8wWcyNDCNFKOGb9vZBlSGCvsRcfaS01FFO1Kh8ErKAAKPyjZ66PwjBn8s6waRG+pOgPIAEHjM6R8VGvsm4ZqxT4NtrPaU9xu0cEjNOjdynGfgZPWphxa+QVrQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p30YHAjY9OR49GtN589H5PrSKbz6OlrtftOM2vJNEzI=;
 b=XRY90gelEFSgp6q2845uBmpyq8YZ5IhLeTjvYLCu8LpSo8DT+po5DuYFQAgaurl+Fojpd1vkTHiAhQUBXAQgEkwGFb5TQ2Qd4foMD6/OuZBfimqQryJNZ1q47WxAh6HRuXkanb24LDryhgGR+yZOUKuFNJQ7d8mBMZO2UcqxBrxG8sLKU16mhjL0EBn7n+bI3lPpFfnjvy86WqZnTx4YLsY+1grGLVDFIbHe4diZTYUu4R2q4vGtlKDwQ62EVYObUmu+CTfwS/gdZVP7cTe7VPukrBeMFXj+bl4hvvYW8nUYu98bTj8gOioXM12z8uKzL95QNoa3Gc12Xr9Celj3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p30YHAjY9OR49GtN589H5PrSKbz6OlrtftOM2vJNEzI=;
 b=RROkPPqi4/grKYugSI+hfJXQbxE7DMDLgNGqMV5H3hF3cWAPd9C26sdwDe1A4np2ap+o4nLTjp1sU2dgRW8w85QYdXCut8hjq+iqKqrGn/wcb3Sjgs1ZiY4QshdYy2KFevQarmP2YtzjXjoafmcH86m0D3wrq5LH+P9j7jHx28w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10607.eurprd04.prod.outlook.com (2603:10a6:150:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:16:53 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:16:53 +0000
Message-ID: <f4187c0b-cea3-40ad-bf65-193b672d770b@cherry.de>
Date: Tue, 13 Jan 2026 15:16:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 26/53] ref-manual/structure.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-26-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-26-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10607:EE_
X-MS-Office365-Filtering-Correlation-Id: b95a60bb-e401-4582-8d65-08de52ae66d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XoRp6YWO3dLtkk/UM6wYbW6Fwtk5QFVeupPzZetY+sTh100I53sg7Hg5+sWB?=
 =?us-ascii?Q?gGhJnAsbTzJsih3T1FwYFFCgeZiMlH9xx3ZFIGZRNcwv7QXW0cxLw4rOUE2C?=
 =?us-ascii?Q?Esx8ZFWk9TrQYUxyfmgd4ss0dJ8Ly1u3m1GL8KD4RkZ+xU/vuvQPSUB3iPCe?=
 =?us-ascii?Q?30kzpaFsKJytnZcE3y0xluRM13fsWH/9uXBzEsm3VDVN3smTpBqnZ91dZV5q?=
 =?us-ascii?Q?0UnGa+HNXvbqcT1l644xcZA40s7zvgTRtjfxK8uDYzKT/N4NrvxNSfEV4urc?=
 =?us-ascii?Q?IWejTh7ypbHxPFrQY0qSJRJyHsRsFvsoaiqQ5bFSJ6LeQc7eatFIZbBLfgWl?=
 =?us-ascii?Q?wjOpaeICqDO24+ewaL7NAGze9hfnbWJfYxVPIl3IFa1Zx8pbA/eWPtZsYrco?=
 =?us-ascii?Q?OsK9wdRXI583s69axKrec/gD18ey/GFg+8MEsC7g8+Yl6hSQZVc5zIiU9oSo?=
 =?us-ascii?Q?/lBNp9I1Rak4srY3CdzsoyQPaGqKYAyAbjbGre/QF+ezHxlg3EJdwv3HUD80?=
 =?us-ascii?Q?eNfjaFulBfh180s/DVsUOjjuKtslUjkAGgWmuF0oFL8sVlNS0WUV5LyANOt4?=
 =?us-ascii?Q?cBfELuZeIQ085pSpbnSH++2g5ATzZeIC5zHHHcW5xyOcIvtTYgy83z7BS5nX?=
 =?us-ascii?Q?lCp0ylhuPxcYhC8lZxW8i92tKwY8BXvqOxrukPTJhUicDeMvS0n7HWdYLYpg?=
 =?us-ascii?Q?uafrE+G1xTv/Nru7CpPzWlbbEN8lIJD07jFGcS2S9tgOD5hf3wEHEPS83EDv?=
 =?us-ascii?Q?pjVFcIF7MVMndoQElLBrDgIRtQueVJFgDUdazYy+zuQV5GMHgLzJ7qHwmqgx?=
 =?us-ascii?Q?qTWDo9ophcdZH952O3TddZx88tNLa/zq/H3yFTC7UxSOkM5bz3flpYRNymYL?=
 =?us-ascii?Q?Ggte/E0nWI617Bg60D+JT6L45WaEJ7MYd77a5CcKly5M4DmrBNgUXcgMa0PN?=
 =?us-ascii?Q?TCNZoHveqG8FNfmeOK8vQ0E8KOdxGNLre+cT6B1m2/ylq+ZQ+RqAygi+3RzC?=
 =?us-ascii?Q?H7vfNzkiIAxpSnyg9/eWRTa0V/OuyTzVzBnGworvL928lxx1BFhSJs4UBbeL?=
 =?us-ascii?Q?UgJ1IL+pQymP0QbrKZKPsxED6UhpS5YdLhg+jnOg43JckwFdxwRaO4hnpVfe?=
 =?us-ascii?Q?Q5L6nSOSmM51CBAYeP+YMFa1YNewQlIXWgw/PKWhlp6cxE/jD2m4SAETBCKe?=
 =?us-ascii?Q?lX+7SLGhDMTZf50nlEIvC/8Ba68T04nwuCcMFZGlUD6uaYjvNx/KEmvK9S4u?=
 =?us-ascii?Q?R05qM1rzedza2plTAKBgGU10tlfChQkULbt8PP/KbED79FSUo0GI4bCkb33T?=
 =?us-ascii?Q?xNiglM1nhgBKUFzwdeqPOmQuHXjhoG88dvgpZEZelLtPs+Bo5Rz6phjhMlJ3?=
 =?us-ascii?Q?agoQtql0n/QSKtEI0xPFP+aIgCI5YMX35zWpB9DNySpPNyygqrUxtS1FKHt0?=
 =?us-ascii?Q?IN0hyZMUaMFEIrX5BYROwKlksLZ6b2ZZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUa7o70+szvvODckyfO9Cv395WUfSy8alua27SnGqMFxYQaiEB3BncO2S6OR?=
 =?us-ascii?Q?VuOtPA/Ys1ZNacAEDRGVhwez16t+u6MWjZNDLGtOlQjfJoYDIL3iVcF8yb0+?=
 =?us-ascii?Q?zt7YUiWyCUbmlJaZGNFAUWZIIzT7V8uFjpbIEDHphIoQBlW8mERKvz+LwleN?=
 =?us-ascii?Q?ltWLGazobPJKSxP+AW5bfiSXFBQuZR3bMaHu6tKJlaQPzAQbhbn+xKeQarUn?=
 =?us-ascii?Q?V0hAyqPvhLpl9NOrZolA2XYOoLTpyjjEKkLQ0xWCEDdZu/QN7QAxWbgOXsoi?=
 =?us-ascii?Q?XYLP289qhjfvXmeoq5bSXrOtUw4aWbZ3c5TL4fCX6Y/5I8Y9mhUYeCRrFoAb?=
 =?us-ascii?Q?ZpkoMbitSRp3gTK1siuh+M3q4HNRzPPsvcfZ7yVuPpeSD3eJBucZU5a1jXLW?=
 =?us-ascii?Q?GSLecvhr0G0+Iwt/c0+tKRt+qSaoe8sXKMvFvadAdi+5csCMMfAQSWW8ASRV?=
 =?us-ascii?Q?JLwM8MpyiubNbWRBRohQ0V7tERcn2a7tG0NlYaVv+MfxHrOvT/5t5OCaMm6P?=
 =?us-ascii?Q?g0gmMeQIyYYpCO8wTLXn5gEUIM/oD3CY3H3N6g4PVCL/K9H0FwQZN0aQ0OCI?=
 =?us-ascii?Q?EfONa5vo/k9U/fgiHRoTpUoALiFCTD92AxiXMLnpaKPnKEJjn9s8fBYQS0bu?=
 =?us-ascii?Q?rG7GE374uF4JqGMJPAgo4GqmIxdLINav0O+yYyOGZUdtd4U5qs92ZO5FUpFn?=
 =?us-ascii?Q?STWpeLc3w/UrymRKM2msXk7O9v+lZVtiLc/+HxXJkwUfr3O7cJRC3lGHo9/F?=
 =?us-ascii?Q?pFoQJrX9CLXqKTwMNAnKlKPAK0oc2PbChC0KuQ9i5YF8MF5r+kVtvS9I4viK?=
 =?us-ascii?Q?QfWOYEiTbgqlSQRrV4iqk4rU4eD4PBHngv17P1upxNGfSXj6xliI/IGh1YBl?=
 =?us-ascii?Q?kMCDsMHUHDElnPu96B7pGBge72A87UJ0ajpxxr9L1jpevS9j2oCu/VK0I4eB?=
 =?us-ascii?Q?5YNsdIJy4s4k93z8ZFgu8W6QwXzCS/ElzF/188ci5L6sUT5YEp/978XoXDmg?=
 =?us-ascii?Q?6PH8ed9tdIoupjtsomsllFFJgvuWTSMK1wY2YdfsU4xsLdBkvyfCgvCsdXUJ?=
 =?us-ascii?Q?PoMNfznT89ywzBZNe6s+wwfB7pLZIymZ55G+2JqG38LY9IWZTouz9Lax7rJ9?=
 =?us-ascii?Q?M2XMZLzqnkFKDhg5KTWBSlOcMKFOUJ3MU7LCKWe1qVofcSnNSSIKQ3OLmJX2?=
 =?us-ascii?Q?tkx8DAiP49WVNUSz7vtvu6TokBouf8BHfdK+9poBhlyVvq8bCnCPzcRYQXdR?=
 =?us-ascii?Q?ibzYMeQQTBzFLwAAU0kQ4lYpTR1e0MRuHG3H7HfiszZhB5bgKt4mz5OcgrXD?=
 =?us-ascii?Q?zPbiIuCr4awT05kIth0i0OnMu374UwWGzWpA4G5HwPXFC5kLJo7vGYcP3r73?=
 =?us-ascii?Q?f194v684V9kXwZ8byi7bH8f5Js5AsDItgdLnv0z953hzVL6Gty3l3/zpVm8B?=
 =?us-ascii?Q?DSRp58QBnn6HmnbA78GEsU6Qn3sUSni9loUfXI+FSFHs+9DssGJe7P/hNKIW?=
 =?us-ascii?Q?zkPoO+yn0+dbm3REXREX3M3/NR7rs0BZyn3hdwkA2bm2+1YteWcBoXPugAIh?=
 =?us-ascii?Q?QO8i2Rjgjf6SXLR5VR4VPi8QgGv+81aoXEsYb2QT5wiYBn8rqB+on2eGgruI?=
 =?us-ascii?Q?SpKxFJ4MF0pPmt1ByZYUn7u2j6i5r6VkbZPpn1CB8fK4rzcE+DKwaCLxRR8g?=
 =?us-ascii?Q?YaM3tVCAKZ2wTVMsdEXLpoM3ru1fYOp/Hjdtx4MPae0B4ouDrrf1/R5Kehkp?=
 =?us-ascii?Q?H1Vl+pOpdw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b95a60bb-e401-4582-8d65-08de52ae66d9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:16:53.7418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sSNiIEEsuTmn3CEukrrw7MlnNlQZX5svr+yAWioX0R6IqrSLsbziDw3Q8CLdDDhl6m9q1gs0Wy+9RAHsWuhVfg27fieMpLAT8YKnxSFCAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10607
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 14:17:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8515

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core
> in most cases.
>=20
> Add a introductory directory layout at the top that is reflected in the
> following section. This document no longer uses Poky as its source
> directory, so all paths are explicitly mentioned, to highlight the
> separation between core components. This lead to some re-organization of
> some sections.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/bsp-guide/bsp.rst        |   4 +-
>   documentation/ref-manual/structure.rst | 150 +++++++++++++++++++-------=
-------
>   documentation/ref-manual/terms.rst     |   2 +-
>   3 files changed, 90 insertions(+), 66 deletions(-)
>=20
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
> index 8e332aec0..9da8400d2 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -81,7 +81,7 @@ directory of that Layer. This directory is what you add=
 to the
>   ``conf/bblayers.conf`` file found in your
>   :term:`Build Directory`, which is
>   established after you run the OpenEmbedded build environment setup
> -script (i.e. :ref:`ref-manual/structure:``oe-init-build-env```).
> +script (i.e. :ref:`structure-core-script`).
>   Adding the root directory allows the :term:`OpenEmbedded Build System`
>   to recognize the BSP
>   layer and from it build an image. Here is an example::
> @@ -221,7 +221,7 @@ section.
>         Checking connectivity... done.
>  =20
>   #. *Initialize the Build Environment:* While in the directory where the
> -   different layers are cloned, run the :ref:`ref-manual/structure:``oe-=
init-build-env```
> +   different layers are cloned, run the :ref:`structure-core-script`
>      environment setup script located in :term:`OpenEmbedded-Core (OE-Cor=
e)` to
>      define the OpenEmbedded build environment on your build host. ::
>  =20
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index d567cade0..3b8fb0263 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -16,6 +16,19 @@ and directories.
>      names that contain spaces. Be sure that the Source Directory you use
>      does not contain these types of names.
>  =20
> +For the following sections, we assume the core components of the :term:`=
Source
> +Directory` are organized as follows:
> +
> +.. code-block:: text
> +
> +   =E2=94=9C=E2=94=80=E2=94=80 build/
> +   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ...
> +   =E2=94=94=E2=94=80=E2=94=80 layers/
> +       =E2=94=9C=E2=94=80=E2=94=80 bitbake/
> +       =E2=94=9C=E2=94=80=E2=94=80 meta-yocto/
> +       =E2=94=9C=E2=94=80=E2=94=80 openembedded-core/
> +       =E2=94=94=E2=94=80=E2=94=80 yocto-docs/
> +
>   .. _structure-core:
>  =20
>   Top-Level Core Components
> @@ -67,8 +80,8 @@ about the contents of the :term:`Build Directory`.
>  =20
>   .. _handbook:
>  =20
> -``documentation/``
> -------------------
> +``layers/yocto-docs/``
> +----------------------
>  =20

May I suggest adding a link to the upstream git repo for each layer?

[...]

> @@ -298,8 +320,8 @@ file, it uses ``sed`` to substitute final
>   .. note::
>  =20
>      You can see how the :term:`TEMPLATECONF` variable is used by looking=
 at the
> -   ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
> -   You can find the Yocto Project version of the ``local.conf.sample`` f=
ile in
> +   ``scripts/oe-setup-builddir`` script in :term:`OpenEmbedded-Core (OE-=
Core)`.
> +   You can find the :term:`Poky` version of the ``local.conf.sample`` fi=
le in
>      the ``meta-poky/conf/templates/default`` directory.

Should we be using the "real" path here and add layers/meta-yocto/?

>  =20
>   .. _structure-build-conf-bblayers.conf:
> @@ -319,9 +341,9 @@ when you ``source`` the top-level build environment s=
etup script (i.e.
>  =20
>   As with the :ref:`structure-build-conf-local.conf` file, the source ``b=
blayers.conf.sample``
>   file used depends on the :term:`TEMPLATECONF` script variable, which
> -defaults to ``meta-poky/conf/templates/default`` when you are building f=
rom the Yocto
> -Project development environment, and to ``meta/conf/templates/default`` =
when you are
> -building from the OpenEmbedded-Core environment. Because the script
> +defaults to ``meta-poky/conf/templates/default`` when you are building u=
sing the

Should we be using the "real" path here and add layers/meta-yocto/?

> +:term:`Poky` reference distro, and to ``meta/conf/templates/default`` wh=
en you are

Should we be using the "real" path here and add layers/openembedded-core/?

> +building from the OpenEmbedded-Core environment (default). Because the s=
cript
>   variable points to the source of the ``bblayers.conf.sample`` file, thi=
s
>   implies that you can base your build from any layer by setting the
>   variable in the top-level build environment setup script as follows::
> @@ -329,12 +351,12 @@ variable in the top-level build environment setup s=
cript as follows::
>      TEMPLATECONF=3Dyour_layer/conf/templates/your_template_name
>  =20
>   Once the build process gets the sample file, it uses ``sed`` to substit=
ute final
> -``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` values.
> +``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` occurrences.
>  =20
>   .. note::
>  =20
>      You can see how the :term:`TEMPLATECONF` variable is defined by the =
``scripts/oe-setup-builddir``
> -   script in the :term:`Source Directory`. You can find the Yocto Projec=
t
> +   script in the :term:`Source Directory`. You can find the :term:`Poky`

The script is in oe-core, not the source directory? Should we be using=20
the "real" path here and add layers/openembedded-core/?

>      version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf=
/templates/default``

Should we be using the "real" path here and add layers/meta-yocto/?

Cheers,
Quentin


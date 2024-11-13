Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887AED41C2C
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:50 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web10.8473.1731491921924968472
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 01:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=M9OY4NyP;
 spf=pass (domain: cherry.de, ip: 40.107.247.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFc08ZYFanpBz0Dzrbnm2lhsKnEWSkF19LyJWgsGviUpt+CP4RyGPAnbDY7n3EG4NGT/ns1sxV80KWSCfhrTwAcG7WsYSrPvyf1FUMvuhAhZhZ6P2oKMXHwEAcFDNypX/GiEVZUdZUUbXyChtr7nMSJLaydBAO44cOJYxOqTOR//nKwXJusIO56YOdIKW96MTSqsodPyslYEjo56jhPTUdyBTiizMM6in3kCyborOttR8wTCGyP6pye+6lvwQ/HoWE3LybCZe0ZgdohNgM8uMwnB7K6qVvnaf70hf6aXhZcII4s2b4+uA/PTlLlEKY//4rFURo+62Cjz5lMF2AITsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuNPDhI6246vny1AvCzOpIARZzdBq2LSTXacXMJmgUA=;
 b=qzDQm/ZIkQ1io6eOmTlI0aFDoDbsH4FAdQCuTfoNsY/N9960cFT8+EeoSuBVmeVauCJyhGdVyfPLcsHVmflKicr5h3vs7rcfstXBG+9Hk+xeBIZ2fXnQJiIMcP+1iGFpOyw+SBDOqjy4U23Cgl1OemlWuozfrgIVjPJFzKMJ9XopY0ECBgUFvXOJy0NIiX393i3uYLiLaj+7Jrz4eHuglWBTZngpS6EXeAdYZByDb6orJeFqay+yJoAYwRF1YhhENlhOvNtyZOn8nxz52AdZlJZLXCjGu+DDrCWxph1+rcepWSGpUSdfLWpl7b3N3gEBCdcTu59bRkosjPL4H6DixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuNPDhI6246vny1AvCzOpIARZzdBq2LSTXacXMJmgUA=;
 b=M9OY4NyPtHbYrc8kPXqJ1HBt2Mor03tI012PG5n229KgAHwVdDZ5cXkrt15L/m3FeDeMLIxeUQ0+lxNjUWPs9tupiXehKo9BA0zVxxolDJzWGr3cAE2jyw7T/En+AsEVHAu0I0PK+F6T2w9XzCPcbUllCJEWJZDMksgtEU6v6Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10508.eurprd04.prod.outlook.com (2603:10a6:102:41c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 09:58:38 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 09:58:38 +0000
Message-ID: <e5dde215-3310-4a3f-bd10-c02137d5c1b7@cherry.de>
Date: Wed, 13 Nov 2024 10:58:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dev-manual: document how to provide confs from
 layer.conf
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
 <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241112-layer-confs-v2-2-22a09f1a0a8e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10508:EE_
X-MS-Office365-Filtering-Correlation-Id: 806ab31e-81ae-4baf-4efa-08dd03c9bea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i7Em8ReRlULrZS2eVfKdiiUuNKG64nMNiZCNfc1Ka2QZJrir1BkgcyPGahUy?=
 =?us-ascii?Q?BTQt+N2le/Udb9x81x8FCk7+WdY6anrsfVSYsJ8RhIF2qBAU5Fffd2ktrh9z?=
 =?us-ascii?Q?3Xhpr4P9bHbBhqWo4sqwTFi07DKUTIhasAAerrhB2GOvt1z7Zn4Iwq+qIHn9?=
 =?us-ascii?Q?lp6GpqsUu7s2sGPUrsmzDdiEz+Qk5GysnxPJL2y5tlI5uRTbTCs9J/5zIi5x?=
 =?us-ascii?Q?yBrQLJZrIVb/hU6JK9j2egqfX/0S6TLkJZUVtsm7e1rwq06MIWCBitUDoAjx?=
 =?us-ascii?Q?yAadtOkp8Nf3qai43i6innpQN7QaEBd2CvmKwY+znoxRixrJ2eMvfAMi9R29?=
 =?us-ascii?Q?W5xxfuXXBb/RxJVCkxcdlqKspKjLO83XscdUlzrumOdy/c9STTaOm2sPt3Y0?=
 =?us-ascii?Q?W+XrvvSF0BThkISKqPyewVd2vxPkYG+QpFEAA34mnaZNur9/EqhOf2DovBLZ?=
 =?us-ascii?Q?1GEcALjxSefBThB8ebzVpV1X33Mk6NqCwco+8eAJE0zU0VUvXN8pLsJfOaaz?=
 =?us-ascii?Q?4M946NwqlYum1RfXKKtt9xXNWC+pwSng6Z7Y6hAPynQiFtNuFcbEsIdJy9E0?=
 =?us-ascii?Q?NEOjAtpyw0m9i2KK7vQNAk+IM00ZIABecBrdppYKJilBQ/DIjBUblbOG7vnh?=
 =?us-ascii?Q?aE1WFO8Flk9xHm1F7W5Gx8qXcz2eLOMcTNR1TpnW5QZ5sOqSjVAhegyx86i7?=
 =?us-ascii?Q?n0p49fRzXx4CYbrUBOqTMiiIFAtqNTd5HIpGClkzerM7ISqcg4TtX8DJvMaR?=
 =?us-ascii?Q?SUUc62ptUD/Vt1JhwNLvV6cAbk1m6qcFUS4peIY+ZBOQ1u3XhzJEisnw/tHC?=
 =?us-ascii?Q?dG+F7S+WIZkhCwnaTmZTE1fdrfwbl/KgRmPeGxdpzwAxpJRTOY1oiK3icyso?=
 =?us-ascii?Q?WSpsOxFNyrVIIKBTWISrGdbFHpbSY4HtMQTqOD4LIh7nOrlCR9l+7oKb2m8D?=
 =?us-ascii?Q?aWq9xC3ibN+WH7ebMXjlJ2mRlS7wFMq19UZqJTyy5L94UEuZQnHw2ZZPGavU?=
 =?us-ascii?Q?evYWWctbEZ6dn+2DaRrfYRsNPc61NWejLuYG243u0nzXqR/kg+ba8fLswetN?=
 =?us-ascii?Q?M3tPjfIRoHd0t2PLI6R06hvT1hkX+eQTXZFyarA8hAH01DBZZeOJySkU5voh?=
 =?us-ascii?Q?aqsK2sWrlmotH+YDz8vZ54OmGs6fjDN5l9IFHmC1Z2BDtrInvIPSOmnZ7hMd?=
 =?us-ascii?Q?eYwM5vvQCKoljB+0GRS5tva1s/YWm5FoANif7OLEp/XT5/FVQwC2xUYju4nI?=
 =?us-ascii?Q?4JFqSmF8nS65RCsr25r1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oYmNiemQD6PsAiHPkhb8OYuUdCt5I3T/WjTEHSn6HwPY1d1VOnNxQpn5GwJH?=
 =?us-ascii?Q?qfMQEu55CtvcXTjCj+vJoyazhrGtR5+bNYYGZMk1cg/ny6RUymLGuTshXcoI?=
 =?us-ascii?Q?C4n/9IMC1LbiKWoiYpEg6ScY2a4Pd1J2Agj5bH0P7OL0dv31yIadRrxOEW4K?=
 =?us-ascii?Q?UvaZf6LHzBNF143tHLZ6/7O87c9xkjw41X8gqR3MZ9+g1MoUexrpFFgaEOyX?=
 =?us-ascii?Q?uoGcCdVbn9D/jn4vXYD8OLuHyVFOAwRRRomU0wPRgUw9n57ieGpubZSsR1ky?=
 =?us-ascii?Q?nEJUq2I/lci/bxzS3UMU0gndQ+yRm2QlZOxiUDmWCMeEEGhGEvu+VTbwGCns?=
 =?us-ascii?Q?TfGH56lB4sXNZ3FQ7j6syzpahyIwWIUYWIpXyiMaaf4obeY6pCvko2gFWtds?=
 =?us-ascii?Q?itoB8bHkxPT0USygt2wvvcWhjXS+rK2LJbjKVJh/bjSO/Zt0zMjKEOxUQ+xG?=
 =?us-ascii?Q?Yr4rCZQmdCBMgsRCfLHVn14yv79rLLfu9zGXiAkDb9dM+qz3YLIe3yzxQnil?=
 =?us-ascii?Q?zUeIdUtadoOA2ed+ZS4jR148ERCrf913FKRncsKygo9HLIylMfa1Sjlkz9bg?=
 =?us-ascii?Q?TY162d+TCkqHFMeIdgI3WxktdzsTqBBQX78IDw0rbfMfMQyUT1IqwrhdMFM7?=
 =?us-ascii?Q?UPG2gPAtHakpLyHodHRSabECNcNMOanY1aSx16rjZ798gwLsWiCYcBDsQkZx?=
 =?us-ascii?Q?YmIZQeGPS1S9l3uYCqg2F3o11z94vXjiRjY320U/cv43bObwoHJE0iFgNoPK?=
 =?us-ascii?Q?3+XMZox1lSkfYxQrx+0uppf5IddNzMRtaCRK9J1xIKKnJ9BkU/S5/dpOXWXW?=
 =?us-ascii?Q?w+wQw5A7nqVJ+avP1uWci+6LEMURYcWg2M9FdgvPMUUO7Wu3/krUVINh9G0Z?=
 =?us-ascii?Q?kKAV4+7jJV2uCNA8nzky4LYIqAZqJuOlht9PlehlB4XjILRMItxWmVC+9Xjs?=
 =?us-ascii?Q?AQMzDTACLe+6OKVzEs8DqTA2BZvYMUznJTQApMNiKBiPWe7yjC7XHHeK2DDZ?=
 =?us-ascii?Q?Zxm1CDOMHeEYm70RwlxYJbYYCd/pFVRMA9zhYGwYTT/9Dl9Pr2EuifkHV8s9?=
 =?us-ascii?Q?xA29Pb5ZoatscF6F8yS9JP3lnSv+RBEqXNB39exd8Xz5W7eJhSe1d/gcwS5P?=
 =?us-ascii?Q?68ueUUgo+5dMJ7eBK++TMS5gThNcJ0TnoRIlTu5nt2R8rDMMDF8flWNFHcPN?=
 =?us-ascii?Q?fMrxmNtamDelCYSXLGsRIUWTDi/rIRHfbBQGNHrrPdTFnkklMpnt3qrZepKK?=
 =?us-ascii?Q?ppfnGWtA6iMVFPhuIKelc5jdwbgsb/wOKtDiq7DdCRdnz0hMUxEuzBJwt0wQ?=
 =?us-ascii?Q?hsFWDDzdt7yJPvmIPvTVYBsOnDmdpBqIZv4W78+Eut1v+/p3t8AyRdX9qV8N?=
 =?us-ascii?Q?Zw9k9ki8rDUGeLR4qI118ardqyMXLqak8ynWcgUt/itVig9XCDPHJKuP8iUF?=
 =?us-ascii?Q?uP+LWIONC/AVSquBL3hDsLsg+v6IkCX8Ji9SAsOObJcV07Ru7drHHOUwBOtt?=
 =?us-ascii?Q?ALYlfNyjq/2L37RK3ewoZxAMO4VKgw/jItgqwOQDJJKptnTwainKmG07ZImK?=
 =?us-ascii?Q?AKpKmT2Ox25dI9VcxKYLRR7VuxPv6+9ceJBOyQ7gYgjFKm3RImlGoqxaD5uT?=
 =?us-ascii?Q?+u4CfLH4bhRH4dGQC93s8f4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 806ab31e-81ae-4baf-4efa-08dd03c9bea4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 09:58:37.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KHAz2fIBIR7XCO3nV/rijzBXV5W6rKrFyQmdYFWMRtfBQaBsROBr0mkFwwtYYJno8rB2GK/y2MDUsuHd8kIpB6Be4sU5KjRhnIXkb8g14c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10508
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 09:58:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5724

Hi Antonin,

On 11/12/24 12:32 PM, Antonin Godard wrote:
> Add a section on providing global level configuration from the
> layer.conf file. Since this file is parsed at an earlier stage in the
> parsing process, it's not possible to combine bb.utils.contains and
> {DISTRO,MACHINE}_FEATURES to conditionally set some configurations.
>=20
> This patch documents:
>=20
> - First that this file can be used for providing such configuration.
> - Then demonstrate how to conditionally provide them, using a technique
>    that is currently used in meta-virtualization
>    (https://git.yoctoproject.org/meta-virtualization/tree/conf/layer.conf=
#n50).
>=20
> Fixes [YOCTO #12688].
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/layers.rst | 86 ++++++++++++++++++++++++++++++=
+++++++
>   1 file changed, 86 insertions(+)
>=20
> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manu=
al/layers.rst
> index 91889bd0ae391c7b6e62068778ae5c180c840762..e449fd43ad86c9a027e317e49=
b6e2f2f340a08d4 100644
> --- a/documentation/dev-manual/layers.rst
> +++ b/documentation/dev-manual/layers.rst
> @@ -644,6 +644,92 @@ variable and append the layer's root name::
>      order of ``.conf`` or ``.bbclass`` files. Future versions of BitBake
>      might address this.
>  =20
> +Providing Global-level Configurations With Your Layer
> +-----------------------------------------------------
> +
> +When creating a layer, you may need to define configurations that should=
 take
> +effect globally in your build environment when the layer is part of the =
build.
> +The ``layer.conf`` file is a :term:`configuration file` that affects the=
 build
> +system globally, so it is a candidate for this use-case.
> +
> +.. attention::

I would recommend using .. note or .. warning admonitions over other ones.

Right now it seems we have mainly .. note, but also a handful of ..=20
admonition and a couple of .. tip so maybe that's not the best advice.

Anyway, why this suggestion?
https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#dir=
ectives
"""
Admonitions: attention, caution, danger, error, hint, important, note,=20
tip, warning and the generic admonition. (Most themes style only =E2=80=9Cn=
ote=E2=80=9D=20
and =E2=80=9Cwarning=E2=80=9D specially.)
"""

> +
> +   Providing unconditional global level configuration from the ``layer.c=
onf``
> +   file is *not* a good practice, and should be avoided. For this reason=
, the
> +   section :ref:`Conditionally Provide Global-level Configurations With =
Your
> +   Layer` below shows how the ``layer.conf`` file can be used to provide
> +   configurations only if a certain condition is met.
> +
> +For example, if your layer provides a Linux kernel recipe named
> +``linux-custom``, you may want to define the :term:`PREFERRED_PROVIDER` =
for the
> +``linux-custom`` recipe::

"""
you may want to make :term:`PREFERRED_PROVIDER` for the Linux kernel=20
virtual provider point to the ``linux-custom`` recipe.
"""

Because we are not setting PREFERRED_PROVIDER **for** the linux-custom=20
recipe, we want to have virtual/kernel point at linux-custom (and it's=20
set outside of that recipe). Moreover, the content of PREFERRED_PROVIDER=20
for the linux-custom recipe isn't really of importance, it's more for=20
other recipes depending on *a* kernel (e.g. kernel-modules, image=20
recipes, etc...).

Not happy about the way I phrased it so maybe you can suggest something=20
better here?

> +
> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
> +
> +This can be defined in the ``layer.conf`` file. If your layer is at the =
last
> +position in the :term:`BBLAYERS` list, it will take precedence over prev=
ious
> +``PREFERRED_PROVIDER_virtual/kernel`` assignments.
> +

Mmmmm, except if the machine configuration file sets it too with "=3D"?

> +Conditionally Provide Global-level Configurations With Your Layer
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In some cases, your layer may provide global configurations only if some
> +features it provides are enabled. Since the ``layer.conf`` file is parse=
d at an
> +earlier stage in the parsing process, the :term:`DISTRO_FEATURES` and
> +:term:`MACHINE_FEATURES` variables are not yet available to ``layer.conf=
``, and
> +declaring conditional assignments based on these variables is not possib=
le. The
> +following technique shows a way to bypass this limitation by using the
> +:term:`USER_CLASSES` variable and a conditional ``include`` command.
> +
> +In the following steps, let's assume our layer is named ``meta-mylayer``=
 and
> +that this layer defines a custom :ref:`distro feature <ref-features-dist=
ro>`
> +named ``mylayer-kernel``. We will set the :term:`PREFERRED_PROVIDER` var=
iable
> +for the kernel only if our feature ``mylayer-kernel`` is part of the
> +:term:`DISTRO_FEATURES`:
> +
> +#. Create an include file in the directory
> +   ``meta-mylayer/conf/distro/include/``, for example a file named
> +   ``mylayer-kernel-provider.inc`` that sets the kernel provider to
> +   ``linux-custom``::
> +
> +      PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
> +
> +#. Provide a path to this include file in your ``layer.conf``::
> +
> +      META_MYLAYER_KERNEL_PROVIDER_PATH =3D "${LAYERDIR}/conf/distro/inc=
lude/mylayer-kernel-provider.inc"
> +
> +#. Create a new class in ``meta-mylayer/classes-global/``, for example a=
 class
> +   ``meta-mylayer-cfg.bbclass``. Make it conditionally include the file
> +   ``mylayer-kernel-provider.inc`` defined above, using the variable
> +   ``META_MYLAYER_KERNEL_PROVIDER_PATH`` defined in ``layer.conf``::
> +
> +      require ${@bb.utils.contains('DISTRO_FEATURES', 'mylayer-kernel', =
'${META_MYLAYER_KERNEL_PROVIDER_PATH}', '', d)}
> +
> +   For details on the ``bb.utils.contains`` function, see its definition=
 in
> +   :bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`.
> +
> +   .. note::
> +
> +      The ``require`` command is designed to not fail if the function
> +      ``bb.utils.contains`` returns an empty string.
> +
> +#. Back to your ``layer.conf`` file, add the class ``meta-mylayer-cfg`` =
class to
> +   the :term:`USER_CLASSES` variable::
> +
> +      USER_CLASSES:append =3D " meta-mylayer-cfg"
> +
> +   This will add the class ``meta-mylayer-cfg`` to the list of classes t=
o
> +   globally inherit. Since the ``include`` command is conditional in
> +   ``meta-mylayer-cfg.bbclass``, even though inherited the class will ha=
ve no
> +   effect until the feature ``mylayer-kernel`` is enabled through
> +   :term:`DISTRO_FEATURES`.
> +

Since you go to such great lengths to explain how to create the bbclass,=20
require it conditionally, etc... Maybe provide how to "enable through=20
DISTRO_FEATURES" so we have the complete picture?

> +This technique can also be used for :ref:`Machine features

s/for/with/ ?

Looks good otherwise :)

Cheers,
Quentin


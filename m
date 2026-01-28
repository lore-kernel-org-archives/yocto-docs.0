Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD1FD25B48
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 11:48:52 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11255.1769600929445918560
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 03:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=F4INjQqN;
 spf=pass (domain: cherry.de, ip: 52.101.69.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPQv7vOcnbrCgFCc6ZARBDck5BGGwLV8wh15I8rt3+UQMxRbC5jl9psGNO4d9AMOzM2SdlUhZBUil4qZpqBRNvruS2bVcn1ip2QcXdAmY8L6+5g5jNWnySnni6U6If9ctBBvGezXzabx1fELqRuUkfaaT0uCzPKyAOnu5f/seZ9kR5vb9s6yatHDDFtS7728itOC7x9W0bhK1BcszcOo0u+r7WfNBNLyCoWLk+vx/qspaeiGOvXDFU8XRScQyfunoH/obYDnzD7fbH7amylwrFuDKZeDLfkBowvAazejxRgO6QY44Xwj1rRtYyd2+GyEc1p0GRrI0YU/vzezLiKx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaNVp34CisKNK7dRt3xckVtheWClFLK1FDofiE6GeV0=;
 b=K0EbN/bZYTFE+EdPSjNpn59Y/EOBKVIW1tDNTKFZ9WwI3h813zyRHvAn0R/rvd7eKSNxPqmIXOWqBYcJzYNSrt3PsM1kgCpS1SC+Seot2dBZlMKleT2KrreWjVz16Roi/kYBdZ49fnQ4iliHUNS7xDsmBjqZpVYvDo+z5nehtxULjpT6qD75eDSoICT8DOUrQhVtVSUyab6J2pli6rXIf9awzzar3U9wVjwmWSX8xf060xnt80SkoyizTv9lsFfNTprQmJAephUFHXY2gGAgVZ0HvPZlK0Il5+312v4tQv+C7R57z6jcCQjb5AFVgDIxVDVih4Y6R22hFPJ+LKZ7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaNVp34CisKNK7dRt3xckVtheWClFLK1FDofiE6GeV0=;
 b=F4INjQqNu6C/DS9HMXBL+b1UJZTEU+HDBhradV+mh4cilRynFBVuOQ74BcIodmDhN99X33bthmSmRz7Y03V1dbgHsntjrSrHh6duXBLGzje+cBIoTf08bqaaW9YuHuQiQvLDS/s7wPkCe/EIxzEXwAEK1X/MMWOG0U7GeqThj3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB8963.eurprd04.prod.outlook.com (2603:10a6:20b:42e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:48:45 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:48:44 +0000
Message-ID: <0126a3ff-df2a-47b9-90b7-3f4fe791ebb0@cherry.de>
Date: Wed, 28 Jan 2026 12:48:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 26/56] ref-manual/structure.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-26-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-26-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed8d429-a942-41f2-2ff3-08de5e6330e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aRp1OAGnLKjbHE8xp2mih8n/eEgUWU7db4LuyKX2Q6enPQeNylSewA7YhAFL?=
 =?us-ascii?Q?RXHWYcKTPFusNZsjy5MbqvA80s54dHaX1yEul9d879Sy3Dvzk2NE+UACCQYO?=
 =?us-ascii?Q?FUMbGHU3I6iMtV7z3kXhc5k9KFsqoZGx/X2nm6hcFHVVW6f75yDVGomC8WMV?=
 =?us-ascii?Q?Bw4jYjKKs7PbVTUtLFa3aOvXoNWZUvaAsB9qe9KNtsEra+UnTnvz749ItZP/?=
 =?us-ascii?Q?Iod8Ykf4IRkWOUJSIc41krj5PDew+ZJPHZDShL2tD6ShNzlZQ79FF5NZZld9?=
 =?us-ascii?Q?nvhTkNWJhfsD8AWhnVF7AAMj02qE52NUs/jHK1zfHN3ExOsRLnxwzNEjUgwx?=
 =?us-ascii?Q?BjFL0NlBCo/pvKPoFiqGWJVEQtUboFRy15rw2Ussu2ItOBlAY1cB+6ntGutx?=
 =?us-ascii?Q?0ZEg+SefoNwAjO8KDMS7fS5jrqruufWDSql/KPl4y04gsEIJ43G0kbTFt377?=
 =?us-ascii?Q?xYx4cC1oP5RReeRrS3J3ZJngG6fN1BFKT5HObOnl0joCQeK9C7JKEqDGKunl?=
 =?us-ascii?Q?Z2XiqZtDAfzA9e9E/fyOks2NmZrvuFjfnPtkBvFRK6Cg+dRosCuZl7vbj9Eq?=
 =?us-ascii?Q?CAD3H3uk8+uKgTw/F6qB5rA/wXnCTjZNDcz8u1zbQ73CID8s3Zo/806bwtwk?=
 =?us-ascii?Q?IJ1mvKdIH3wrOXjvbf7+8eOiDhoaU2NWrwmTlF1eud1N1vaZ7pZHH0I+BtD8?=
 =?us-ascii?Q?wYmLUTO4ioOaH+7x4ai4YMcCcVFA9E4OrSqLq6GFwcH2qkBzoVDqIkwrhLUD?=
 =?us-ascii?Q?RRrjjC7Z8+9S+nJunHYiGNdPbM8q/OJF3dt68OEiyYpp5UFz1kR1R7DcYeuL?=
 =?us-ascii?Q?CQYRVkbwNn/XuP5YxspecqP1sX/0naMDg0AJRaDu/EiBxW/PX+8w6F0479nf?=
 =?us-ascii?Q?zgkoiFk93zB6sHAVUEzRt1idYxiPUJOrTZJpPsvUAPsSQlk2REc4eaBL+rFW?=
 =?us-ascii?Q?CbtxVNOyOJr2Dek6EpWRkuZKJC+yXBv37BZfsPhvrTnqUBBx9hq9SDA9hBwQ?=
 =?us-ascii?Q?+FE/DrfiaKfpLe+XsvwOR98MThgkDEcjL5QoDvPNA+JUTbyyxnj5cvAR4+Gs?=
 =?us-ascii?Q?ORQ0qkW77CcREI63MQA4Tw7PyayDA4+3Guh0dyPPa1nrSIuho8Uy7MFuHGYY?=
 =?us-ascii?Q?Qv5Z8hWpkQ9DyjUsMG63VPuBb5VRW2TmYns6+TjUvZwMn1YFu0jjsIXXmqgc?=
 =?us-ascii?Q?cI5PndUE8YeuwEUJ+qABULpCmW2YmV7Y8Z5a6856BBE31HsRzZpIHQOzJmJj?=
 =?us-ascii?Q?QCnlNG5EMH8ShdjZzFwe/iF2SbAV9MjutA5FPB0SleL3cIirMVT9FhOSq4hm?=
 =?us-ascii?Q?bHBXVQxcg6ONCPlecqnM0Ao4OFg+tBplPsnMIoac8FhCccETJ/5vcN+A2Veu?=
 =?us-ascii?Q?lu4otHQGlUVIW1SIi8UPmtQjs3XATTcHeN+qWNoF8YfNq8azVMDADVA+YWdr?=
 =?us-ascii?Q?kPWaaoZrwFMx8IO8SktL4iQwB2iv7vJZLZ4PttyREIieuGDhrxRErueqFDZZ?=
 =?us-ascii?Q?Q+KrGE2lMpmXrEFebOLf+bVZ+mvdwUVKcgo9bNoU6TX01SBfRVAStBpMo3ZS?=
 =?us-ascii?Q?JVjYTlpGLlIxE2Omhv0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KP/z/uJAEbs6Za7krHGGh97QObn7FzCeU64OJYNNCfhYlfhTDq/QjerbRdDc?=
 =?us-ascii?Q?XekCV4NGn18+c+YvARL+DpOYzeyjhlrLhbImd8xFO5sP242yDBETrIV5t2hw?=
 =?us-ascii?Q?5daTuJFp00Gy/qPDL+4VnUn6UrQxuSP4OvvfOSJb8s/dmz7Y55DaeCiJltbO?=
 =?us-ascii?Q?t8s/sqIMHSKFdj96Pn6HKw1JLaeqnOXZ7OqDDS7KEufU1Gxy4TjoAAvkSlmG?=
 =?us-ascii?Q?s6eNBgvOreLBFaqgUnu/Y6Tp5b8h0mjaeeJKnFfkBh05GhhojileEiPNFHrO?=
 =?us-ascii?Q?i3JGHD4JEfaaoNhTjS4X4T56smkhO7raT73UANBLzF/PSaOvv0TjxTXSnjkm?=
 =?us-ascii?Q?DrMEzUO9fdxcyzGOPZzL8a7Ad9VcqQYb1sVpQi4/qZYwEhLOote7TALH+UOU?=
 =?us-ascii?Q?7YZ2VhDfHvo981/9PqzPLqYgQbYHv4SnZxB5YLK/l3WZnqPBJ+LcaTvUnRmM?=
 =?us-ascii?Q?33/WAMrwLmIoocSeyFe1H6gK/bMcGncbMfeWAYnqp/DpYBKrs3uO2shxjacx?=
 =?us-ascii?Q?0MFjZFhurFpvFyp130IyBxDDa9U7j0a6HJhIVB6yv1QO9GTriZUaj0T6WED4?=
 =?us-ascii?Q?RDXBd7A2B2d+fMGlrgJU0My2WITPCkk5W7HM0SWMjn71fHtpSGQ94iMkcL4A?=
 =?us-ascii?Q?71pUL846OMwaJcvEhRzIVJxtB2k5sClUYkxXqDxqQUVAvpcH769ZCbU0JFUA?=
 =?us-ascii?Q?5Zh5omLmsSUPj6gu3lh3gPkdRBOR0C8HA54sP5SO+YMENu6Gxh8J4rK7YOEq?=
 =?us-ascii?Q?xhsLFxEoJf4lW5zRUQbS3+W2nwbl5UZsCIp5ORuU+ZzysxstDgqnjUNROXNu?=
 =?us-ascii?Q?AdoN6PTfQBUU85ZCEldR8/P7Uy3lkMQYgOKHiTIVQK6O3eBXcGa8CZuGWYrs?=
 =?us-ascii?Q?nujBBHFvbFw1b4TW2MDU4DXBEQXXK1I06B0jlg4HrTMs/i//wEbsH7GDtHzf?=
 =?us-ascii?Q?6eyj0MUhnRqMtwgCv2sTcVzAHNiQes6CWXMtGKU9RT3dQzwB+5FPqkwzH1jY?=
 =?us-ascii?Q?n6hNr65+K1eg0E1mePdB3on+WPuWX/NOX0VR9wM99fn1OS+6RrnvxvvgwSke?=
 =?us-ascii?Q?pX+WiJ2YfZNfI41J5hqs3Yq1Ewj1X6RJC320MQQWGMfTJG6zNtTnTEYLG/9E?=
 =?us-ascii?Q?h7dnnEfugL/vYG0FgyCV2LA7gHglTQgnqAZFHluaiK0jE2PPKGfbuNx9pK6K?=
 =?us-ascii?Q?r+z3ezng8G1geMNCsWL+dZw3QF8KXkSUYh7ydLxzzkhw9p9hWs61xbla0u5J?=
 =?us-ascii?Q?8WoS9u5JT2dlWUwsnq9//X+msvBe5dYH+zPsXgMs2gFk9lXSwyjKFLXT2/an?=
 =?us-ascii?Q?lr7zAF+RzsjAwXpCs3zmGNZp6sa4kKW3HaMOLx19s/f/kyPfr6/zuGNXa6aC?=
 =?us-ascii?Q?F/xUUh4BiQbasKRWUWtKMKQnaMgJa2mWA0W6InDrMedz8MHHms1MHjkmOPUN?=
 =?us-ascii?Q?7FcR2+hEhYhZId1WJmaSQa6xxLCQ3uBwhxG5dChfgWXp7E3rQ7wOojKUGwqQ?=
 =?us-ascii?Q?lEMfI9pCEZiFP6bDDthngxgov/x0FRY2KX/Koz+ypacmmrzVQ4caEQN5223L?=
 =?us-ascii?Q?N7q8gABVfHHV5myW00xikfjvivQmmL1I1Q1HFD+ypzpH7EEpfWZr3UzcL7Vg?=
 =?us-ascii?Q?RcpyCaSuwg6GPIYoqvBUd1Che0i+AB87YLqQCVDCEmVXeOUvWGpNbcObLWUN?=
 =?us-ascii?Q?+SvKdS5GWL4sTWkGWUylbekMIHFzz9ssXfxcxWFtB89CAxGTFMnsEBs5xQUN?=
 =?us-ascii?Q?aFVYteoEtM8wIIqavpCAZS6+/viSlk0+dZ34FEYv2/pkcDIosfch?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed8d429-a942-41f2-2ff3-08de5e6330e4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:48:44.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGfN+KMmC+ufb255I1jrAOLcVb6GCfbLNfXMukcpxviVPo99cR4vRSeHAIBt6ckAtajxeLP4JeZ/CpE/GJa4T0j+fdl2BXB5S5jHVdScLUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8963
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 11:48:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8758

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
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
>   documentation/ref-manual/structure.rst | 169 ++++++++++++++++++++------=
-------
>   documentation/ref-manual/terms.rst     |   2 +-
>   3 files changed, 105 insertions(+), 70 deletions(-)
>=20
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
> index 4c0939ab0..67f61b7b2 100644
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
>   #. *Initialize the Build Environment:* While in the :term:`Source Direc=
tory`,
> -run the :ref:`ref-manual/structure:``oe-init-build-env``` environment se=
tup
> +run the :ref:`structure-core-script` environment setup
>   script located in :term:`OpenEmbedded-Core (OE-Core)` to define the Ope=
nEmbedded
>   build environment on your build host. ::
>  =20
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index d567cade0..86f3109e1 100644
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

suggestion:

+The Yocto documentation repository is hosted at
+:yocto_git:`/yocto-docs`.


>   This directory holds the source for the Yocto Project documentation as
>   well as templates and tools that allow you to generate PDF and HTML
> @@ -76,37 +89,28 @@ versions of the manuals. Each manual is contained in =
its own sub-folder;
>   for example, the files for this reference manual reside in the
>   ``ref-manual/`` directory.
>  =20
> +This directory is not mandatory for building with :term:`BitBake`.
> +
> +``layers/openembedded-core/``
> +-----------------------------
> +
> +The :term:`OpenEmbedded-Core (OE-Core)` repository is hosted at
> +:oe_git:`/openembedded-core`.
> +
>   .. _structure-core-meta:
>  =20
> -``meta/``
> ----------
> +``layers/openembedded-core/meta/``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  =20
>   This directory contains the minimal, underlying OpenEmbedded-Core

suggestion: :term:`OpenEmbedded-Core (OE-Core)`

>   metadata. The directory holds recipes, common classes, and machine
>   configuration for strictly emulated targets (``qemux86``, ``qemuarm``,
>   and so forth.)
>  =20
> -.. _structure-core-meta-poky:
> -
> -``meta-poky/``
> ---------------
> -
> -Designed above the ``meta/`` content, this directory adds just enough
> -metadata to define the Poky reference distribution.
> -
> -.. _structure-core-meta-yocto-bsp:
> -
> -``meta-yocto-bsp/``
> --------------------
> -
> -This directory contains the Yocto Project reference hardware Board
> -Support Packages (BSPs). For more information on BSPs, see the
> -:doc:`/bsp-guide/index`.
> -
>   .. _structure-meta-selftest:
>  =20
> -``meta-selftest/``
> -------------------
> +``layers/openembedded-core/meta-selftest/``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  =20
>   This directory adds additional recipes and append files used by the
>   OpenEmbedded selftests to verify the behavior of the build system. You
> @@ -115,15 +119,15 @@ want to run the selftests.
>  =20
>   .. _structure-meta-skeleton:
>  =20
> -``meta-skeleton/``
> -------------------
> +``layers/openembedded-core/meta-skeleton/``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  =20
>   This directory contains template recipes for BSP and kernel development=
.
>  =20
>   .. _structure-core-scripts:
>  =20
> -``scripts/``
> -------------
> +``layers/openembedded-core/scripts/``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  =20
>   This directory contains various integration scripts that implement extr=
a
>   functionality in the Yocto Project environment (e.g. QEMU scripts). The
> @@ -136,8 +140,8 @@ back to the Yocto Project, such as ``create-pull-requ=
est`` and
>  =20
>   .. _structure-core-script:
>  =20
> -``oe-init-build-env``
> ----------------------
> +``layers/openembedded-core/oe-init-build-env``
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For this one and all the others (above and below): watch out, this will=20
switch the cross-reference default string from oe-init-build-env to=20
layers/openembedded-core/oe-init-build-env, is this what we want? Do we=20
need to change the cross-reference string everywhere?

[...]

Cheers,
Quentin


Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F03D41161
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:23:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32456.1768472588408750302
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 02:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=i1I+xGqp;
 spf=pass (domain: cherry.de, ip: 52.101.65.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbVcnfPntrmtChvrXd20DKBNiWeITwPIj9tN0swxsvzvnmY6OJNqAIysmTyY62L7H7lMP5r+nPoQYv5mbhjNObhQwY60cNDVo+qdoOP2IYJR8+m1GERaobys034aWod3LRVXuykUM0ank+QaS7N/yL29yxNiw6eN/Fe7BrITd3udH61hFPqckkZqLtFUq4QFEEgrHk+9bDWzSvkZPp6kn22jvZIiDbjaxAIJivI2LPjUlnqD3zG73aY3PUn1fNrkxf5CBk+blhIw8ya8Ni8kq1wER0Fwpw9dZlvFHNWLl9Qm8oCV77MDBTPkS+5Oe4OZpal3txWG3JfozSc92eK3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kP9XANlOSqIwwRHk0/11eyr5F59zgx6DOZ7OZFs/ka4=;
 b=rt7BZVKJKUyNt0caa/CjaDDd/Z0TsZlNIfsFlwNUwgsbk9fsdEMLxBbwjEDPIPdNK3cMZAH3DSCBFsO82MQ+SRIvA4mJnz+npUY9xEOzHNO1gvzcz9hlHI89wi2MYrnofMgyxzojWkX7jVXyFlp+PClMeHfyf8wsVR1yRvkINWn0W+g+bDcHYVVq2LVEed4lQ3oV36mh6F2MurOEqM1CGRffC2RsFehgsRddyrPFm9VaMikNVSLteIN9d3aevFYZAD7/45qJyL0Bhkv9sOvgU7C4dErxmosm4p8XsMN/z3azLgU7zNiKhhSfMM7q87MsbPtN9p935hKjgrcVNDM+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kP9XANlOSqIwwRHk0/11eyr5F59zgx6DOZ7OZFs/ka4=;
 b=i1I+xGqp4iXARb5O4U1TZ2diVGsp3wJSJ4YWL1hboWLNblssMBO8uARhTJEIYnW/d6fJJWKDxgcsJ3S4mTl7W0a9Mqzr9Sy2atQ2oTeDMJHYNtGCCeOh8UhBLNENjBbYdnp0tLwCNXWtARvtCqFrwXEOmkfLwg+LxjKIeM2l/tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB11326.eurprd04.prod.outlook.com (2603:10a6:150:2a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 10:23:03 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:23:03 +0000
Message-ID: <0bfb6a4f-140e-4abf-9260-808418acc568@cherry.de>
Date: Thu, 15 Jan 2026 11:23:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/5] ref-manual/terms.rst: simplify the Source
 Directory definition
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
 <20251224-terms-refresh-v1-3-691329fd038f@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-terms-refresh-v1-3-691329fd038f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB11326:EE_
X-MS-Office365-Filtering-Correlation-Id: 37008229-5c50-4e60-e716-08de542010c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ol5ekHC2RnZxvkgSK7DKQN4W/d2/IGSNpiJ8169/X0Ef3ngM1pWBR2KEpcqT?=
 =?us-ascii?Q?WS0/UbYpb78CqbUjNz9GJOXyj3bG1txyz9jw6Imr/oeJzfaLlHVan6oL0iAO?=
 =?us-ascii?Q?mIxp/t6IKeK5185tL8pAXHm2PD98xqzHZH7q0EKh0hheytlkxFY6Q+4nJASA?=
 =?us-ascii?Q?qec4zkRrNYTmF8kEAEvURIb0bb1MMYrw8HanAx6xqGijjFrA56fVwh6G6MKE?=
 =?us-ascii?Q?xpNZaRM74ILm0aNk4PBRChLhlYdrRAnXmI/w2QECTgFb13nyl5wgffzBnBS8?=
 =?us-ascii?Q?F/uoyt2pPEo/lFiBlN1o9ITxs7UooReS7MAY35vvGyvYkeU4cAjd0Myy9S2o?=
 =?us-ascii?Q?ZtOynEk1ItcDSgWIIyvAKRPJvawYLFDXsYaDxNiaRGe3YsaHLUc2Jx+uCVoC?=
 =?us-ascii?Q?fz71BUvgPyX8fEy75tAPRTIAMKTfT6F5mABXAX1hcM5v8vC8ZGbcnt4mFm71?=
 =?us-ascii?Q?l3a7j9VFaovmxdU+3k8DwlkFDrX3w+VhtxNl9hs/ZDKrTJ6xUmOZU0s1SfvJ?=
 =?us-ascii?Q?YE1VHKvmIJc3f7txzvJTRPQLrEwnjmiNkgd+Y+31J2HpF+bTz1UPxTCjknn+?=
 =?us-ascii?Q?QLsh7ILjsHLy+qgyePmdUwrtTYI09Fm6ClYp8rRVXkyHc98sv6qaEe5faIed?=
 =?us-ascii?Q?+J2Lz7274bHoqVMWzPjqwfqtArBAs5JLQ0iBdwKjwBB/mr8JbkXRSkhEV2sa?=
 =?us-ascii?Q?M5uR2qOMHNHsWuAghOkhFF2H8GcHnInvDm5niLgtfx8tu7LMGqwK0BpQkylp?=
 =?us-ascii?Q?lhN6PD2TomYVBB+Cy1FMAr3aoFaAHXA7Eu0AEOvkdumTaozmrzJMerjh4G3A?=
 =?us-ascii?Q?9GI/vsyB/YKwGPZcwtWWxqIf3n1UV500/UNeTQObJLJdcZjcyMZb96k2P5hP?=
 =?us-ascii?Q?RqTuaPMyAV4+E2EPT0D8NTJ8nDswc/+zaoLtbqvfh0KAlXFZY/ZnsBfU7+um?=
 =?us-ascii?Q?DrzHU8qvfDddGyT+hSHS/8Y7YPu1XAEB+YG3ZxBoMSfH72Bv/uCyM5Xt6eJK?=
 =?us-ascii?Q?sJC6FSzOJc8orxqf8JhbaivvLxIzlpbpHuzpyk4/7JdaO85/wQ1qxctWOVdf?=
 =?us-ascii?Q?Fo/DAA1Nh08YO2jZExLEpVsEMqR093metkxEgBpOO8NGLx6TS2m+387lwOpA?=
 =?us-ascii?Q?xNRUPXxTpHXGfCGLkVmgnZBkR43cR1M3/EvpeTLbkdn0hfNIzEO5FxKyEN4m?=
 =?us-ascii?Q?0OzRV7cQD+flYzlN2oRYYmft3MaiW4c8AsOID0SX0JqB6797gFmjGOJeE7Xl?=
 =?us-ascii?Q?tyHf9WO0Dnm2PCkXmwh7KEzlvqUEWwSld63qSSCDMLmq25Ja3f0AkQIvjKiU?=
 =?us-ascii?Q?rUctI/EcFBBuMtHAQEes4D2JfZ7mY0PYTDtrLyCSZY3bIplcLvGCYR7rWLvX?=
 =?us-ascii?Q?1vXqhqFejDjsfQdXGbH4P/6J68LReIfD4xCIeUlRRIfZKqkR5kx6C23gSKb9?=
 =?us-ascii?Q?el6jo7+8L+GCKOmhkDZ/AKVkNazwIjQZ4RJ/M8lhhcBPVH34GI72aADKTU6g?=
 =?us-ascii?Q?hiIIwW1nqELHpZtFo7WGVGQ2AJyrYfts94qmTrNduNQJuzrq0i6HKBTxsWs0?=
 =?us-ascii?Q?LVssqHAhJB7kJpl+rMM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IYbf8Lzo/fPicoAjE1v3NFXqO583bt7ksbpfmy1wEjS8Zm0W6touw5blOWmI?=
 =?us-ascii?Q?PaNcXltvhLnCnGTl9hVFiVwZrXGbfnZcSIrEZRtUJKVY6FEk12i2tmV+s/cy?=
 =?us-ascii?Q?Eoz1kkHiDXPo7pihdKFLG9dwfdKaS3T81BN265DRQs8o28hQszwtyGKTQ+mO?=
 =?us-ascii?Q?/JN2nb1c9mqfT8lgxkJ/HOhqxOB1HmeDSmxxRPR1xv4wfGts+OCJj8AwlT04?=
 =?us-ascii?Q?/a2Eg4P3qWv9n/NXBJuGOF68tz2/8xSb/zCIXnDof8T/nLUZKMD73Co3XaHo?=
 =?us-ascii?Q?nWQXYJWrU/tPC8WzHbnset8J50p/Xr3hXqczoGgzM+GQc9h+G/VkxGkKRt1y?=
 =?us-ascii?Q?MRxFl2fxT9SLuN2bAAXlCyxlj7Qb/GgQPJPYBn+p5six62/NKZKgQQCIvvKP?=
 =?us-ascii?Q?SkCvbE9Wyq831R8MoI/5Cl+TllzrP8i5x8L5lSYV0+kq8Zm94ljKCsS6KsUQ?=
 =?us-ascii?Q?g5d/rCowlOrdKhATxDUjM3QavoqU9UAdqIdbbon9pugZf3lNnkQqg/fkFwke?=
 =?us-ascii?Q?DpdVuXWcFARqpH5I9ZSelNuGSZ5ehN8SIIW96GL6FjCct3i1zbo8ev4aaQDw?=
 =?us-ascii?Q?8A6r7SB5sxgec2nkIFX2DrnQpjAXAiIqfVFdNrFQ+orfEWWPV6lz+Oq2d29R?=
 =?us-ascii?Q?o1TwFs499GzVr3378Tt+1ziGxF2ybMGH/WaAT20w0DwKRXAP9Gwf4Z8D5JEL?=
 =?us-ascii?Q?UMTTJ0NHdQMpicdx8af7+QK8pw1LcSW53tm7D+PHUUZ3RgZZeIpTbIPqdTNO?=
 =?us-ascii?Q?tGvORXP6UB8O4M2enCa/gOqj1yka43qHyVgZcSefE444uBFhF0q6MnkaeRGi?=
 =?us-ascii?Q?sj2BDLUSnSQGZeRdS+TsvXr30mDc7oF8TUApWIyAFhSxJerowHc7gdy9Rjt4?=
 =?us-ascii?Q?M+nnhORdOu5Pzqs85wjOKlrqh+lEg8sltGfhopqsQyhEMuhuGKZRTAl2L5L4?=
 =?us-ascii?Q?19qL9vaqN1gBK07UuMI8v5jNc6OW18yC0p+1lrVvvunAepUKludTEnrhco7r?=
 =?us-ascii?Q?hZpf/wA4xMEZr1TKZT7A/Q98DEmMB8yupy0n7k7BTjL9xPbSM7FjqOX7FtLU?=
 =?us-ascii?Q?1QhuDecrfmG+xpRdOTTABMs62v2ivJIAzoRFz6MZ/Q8J7RvI5mnkhEFomPBO?=
 =?us-ascii?Q?borxRGR5griCAPRLuQod6FqY3ryjWGIqQXOweyah7HYmRNYNkkPlhMeMDc0G?=
 =?us-ascii?Q?X/XjZLUy3fa5JnDNG1nKMOxrn17gXRY/u61iKEVnL3/d45/k3ioM/vZegCQf?=
 =?us-ascii?Q?J1VQV9DN80y+n1PAdcqnGgiy1kR5eUyZSs3E1Hgb4l3iRqLd8z6QPySGfZOX?=
 =?us-ascii?Q?q0XgePkuHzamnk4npS84dDUUuYpIFKmjncodjbFo9Lpu6M9YmiXbQjnSGUlm?=
 =?us-ascii?Q?skCuigeNIwKjliEoevRJEsBznwUUT+jAhT3p4PMzOIYgErLAfdr7fVvTpnmi?=
 =?us-ascii?Q?24DSl+FBPkBsYTTQRRLiLGUXsZRsti/LiJo1rByaEdQX7v7QeOrJb1+7mxiA?=
 =?us-ascii?Q?lFK4+ilNPmZAh36BlOS+OHdul1X1OMH0KgVjQSlmT8QCS7KIzceJ9M6mKo7f?=
 =?us-ascii?Q?8q584AtyUG0A9kA3Z+W1zzu+vKR1Sucblnwkwgi2/m0vDB/RrlNTmMQlM7/y?=
 =?us-ascii?Q?CEyB/ga0rDLbBdwPKq7ZAyfTOeHpfrllIk4RE1nIFvmLFFXk1/FP1zyJzoML?=
 =?us-ascii?Q?/KoHhd2vuKQ9Jnhu1XlzIwYXYdSD3HguvsuPpTTvWjRNq3G9CjJI7nC7wIMK?=
 =?us-ascii?Q?4AVPhY5GFA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37008229-5c50-4e60-e716-08de542010c3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:23:03.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMPSpxP70tn4GImeTxgNnfuK2ANTtO8v86OCL3Yjyn8dFjka7m5Del0zyXOQN6/K0elS3DwBIpkJ1C8czoTQqqksigRCy+SN70tINrHK+jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11326
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 10:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8570

Hi Antonin,

On 12/24/25 5:24 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Now that we no longer have Poky around, simplify the Source Directory
> definition:
>=20
> - Make references to existing documents that show how to create this
>    Source Directory.
>=20
> - This directory contains sources, the layout in which they are
>    presented does not matter so much, as it can be different and/or
>    freeform depending on whether we use bitbake-setup or not.
>=20
>    The definition chooses "project" as the name of the source directory
>    and is the one that should be used when showing examples in the
>    documentation.
>=20
> Other parts of the documentation referencing to this as the Poky
> repository still have to be updated.
>=20
> This will also mean that this definition will be used a lot less across
> the documentation: in most cases, when the "Source Directory" is
> referenced as the Poky repository, it can be replaced by
> OpenEmbedded-Core, Bitbake, the documentation, or meta-yocto. We'll keep
> this definition around regardless, as it can be useful to denote this
> group of directories in a more general sense.
>=20

It'd help to provide the expected directory layout in the commit log at=20
least.

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/terms.rst | 66 +++++++++++--------------------=
-------
>   1 file changed, 18 insertions(+), 48 deletions(-)
>=20
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
> index b7a7679ae..21e30de96 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -526,20 +526,23 @@ universal, the list includes them just in case:
>         a software bill of materials`" section of the Development Tasks m=
anual.
>  =20
>      :term:`Source Directory`
> -     This term refers to the directory structure
> -     created as a result of creating a local copy of the ``poky`` Git
> -     repository ``git://git.yoctoproject.org/poky`` or expanding a
> -     released ``poky`` tarball.
> +     This term refers to the directory structure created as a result of =
setting
> +     up your environment to build images with the Yocto Project, which c=
an be
> +     done in two ways:
>  =20
> -     .. note::
> +     -  Using the ``bitbake-setup`` command-line utility (see :doc:`Sett=
ing Up
> +        The Environment With bitbake-setup
> +        <bitbake:bitbake-user-manual/bitbake-user-manual-environment-set=
up>`).
> +
> +     -  Manually setting up the :term:`Layers <Layer>` (see
> +        :doc:`/dev-manual/poky-manual-setup`).
>  =20
> -        Creating a local copy of the
> -        poky
> -        Git repository is the recommended method for setting up your
> -        Source Directory.
> +     In either case, the result will be a set of :term:`Layers <Layer>` =
and a
> +     :term:`Build Directory`: this is the Source Directory for your buil=
d. The
> +     documentation usually denotes this directory with the name "project=
".

Can we have a code-block here with the typical layout so it's a bit more=20
visual?

Something like:

project/
=E2=94=9C=E2=94=80=E2=94=80 build/
=E2=94=94=E2=94=80=E2=94=80 layers/

Also, don't we have a config/ subdirectory when using bitbake-setup?

>  =20
> -     Sometimes you might hear the term "poky directory" used to refer to
> -     this directory structure.
> +     We present a :term:`Source Directory` structure and its components =
in the
> +     :doc:`/ref-manual/structure` section of the Yocto Project Reference=
 Manual.
>  =20
>        .. note::
>  =20
> @@ -547,43 +550,10 @@ universal, the list includes them just in case:
>           names that contain spaces. Be sure that the Source Directory yo=
u
>           use does not contain these types of names.
>  =20
> -     The Source Directory contains BitBake, Documentation, Metadata and
> -     other files that all support the Yocto Project. Consequently, you
> -     must have the Source Directory in place on your development system =
in
> -     order to do any development using the Yocto Project.
> -
> -     When you create a local copy of the Git repository, you can name th=
e
> -     repository anything you like. Throughout much of the documentation,
> -     "poky" is used as the name of the top-level folder of the local cop=
y
> -     of the poky Git repository. So, for example, cloning the ``poky`` G=
it
> -     repository results in a local Git repository whose top-level folder
> -     is also named "poky".
> -
> -     While it is not recommended that you use tarball extraction to set =
up
> -     the Source Directory, if you do, the top-level directory name of th=
e
> -     Source Directory is derived from the Yocto Project release tarball.
> -     For example, downloading and unpacking poky tarballs from
> -     :yocto_dl:`/releases/yocto/&DISTRO_REL_LATEST_TAG;/`
> -     results in a Source Directory whose root folder is named poky.
> -
> -
> -     It is important to understand the differences between the Source
> -     Directory created by unpacking a released tarball as compared to
> -     cloning ``git://git.yoctoproject.org/poky``. When you unpack a
> -     tarball, you have an exact copy of the files based on the time of
> -     release --- a fixed release point. Any changes you make to your loc=
al
> -     files in the Source Directory are on top of the release and will
> -     remain local only. On the other hand, when you clone the ``poky`` G=
it
> -     repository, you have an active development repository with access t=
o
> -     the upstream repository's branches and tags. In this case, any loca=
l
> -     changes you make to the local Source Directory can be later applied
> -     to active development branches of the upstream ``poky`` Git
> -     repository.
> -
> -     For more information on concepts related to Git repositories,
> -     branches, and tags, see the
> -     ":ref:`overview-manual/development-environment:repositories, tags, =
and branches`"
> -     section in the Yocto Project Overview and Concepts Manual.
> +     The Source Directory contains BitBake, OpenEmbedded-Core (OE-Core),
> +     Documentation, Metadata and other files that all support the Yocto =
Project.

Isn't Metadata what we used to say about the content of OE-Core? This=20
way of listing implies to me OE-Core isn't metadata (it is).

Also, it doesn't necessarily need to contain the Documentation (e.g. via=20
a manual setup).

Cheers,
Quentin


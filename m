Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5089DC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 09:25:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.web11.29565.1749201910671447695
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 02:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=HQSDenqX;
 spf=pass (domain: cherry.de, ip: 52.101.84.4, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+UPzdeXVRD0yRotSgxMHo6OmuXogvr/2eV2tN+x+1+21RhUd56jLzgWFnDUbm/xqtkdT+gsEJcnF2F+PVKftTVQkK7qgSlpxaQVchjLE4lu5WrpA5MCgjxW5Mh8Mtd2cNFtRTpEoEQo8tCc1dGJK74sTyI0RQEzIE1N7G0lzfBToNl2Ksecky2dP2nPIy19FN5H+ruw3A0MOxWRsWcK8zUeSJEQ10xszA6ABwWc6HbsFqyeyMm8pVD4IkSGpeqNePUt48M/B7qrosjd6EMlsaEyv58REM1NUaETaYOXDw9vvPzpZgJUWdQx51K1wQ8hI1yBDtRlYr/xvflt/qXo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLaBMK5tf0rc6Awy0NgSSsCYKSUMed+hXHGKocctB84=;
 b=iClLDTmL4CzzuuMKaQzyBJy0xhDwgkY5OHw6/Dv8s9IZbzxyaTlwfbx17ZiNvhAiOvbUjfoGz17YuQEqap9SDiBKY29p7Bm/Hj+vandUmxXW5mgs48shW1cwJxOucoReUoswSV7UTpdvGER2pm9yL48rGV29hqZeI8KVANXxCIKZZ4G35n1IvcyB1bE2YD4XH/oywoKrJ5zjNhXTDpN9ZC+kSKlWZvgAZWFLHaPbcVmgs3nfkKlEK6aLfSWqcU+qDfiyfiCcGl02uTpbm/UtjFo3G47E7XpBsByfe1yv5EEYWKu+0wr3awWugZU0MVPaK8KleVKsXWxdNYybqn8z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLaBMK5tf0rc6Awy0NgSSsCYKSUMed+hXHGKocctB84=;
 b=HQSDenqXe9Jz6v80UP2/Kg9EXNI4zlnT8H1Aqjadc3g7PCZnfqBlupyZd8Y1FhKn0TEfXDMDBLBItE+Or6QRUJ1JxGKwcQFsdSJFPUvuI7BwY2TANG30yk8OWxVVZE6o1jSSOIJ0O89t6b+68L95NwTbK/bsB6dTxPwbK6tmDq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10311.eurprd04.prod.outlook.com (2603:10a6:102:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 09:25:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 09:25:06 +0000
Message-ID: <0cd19563-a1dc-48ed-9924-63a75c5e72f2@cherry.de>
Date: Fri, 6 Jun 2025 11:25:05 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCH] Add a document to list supported Yocto features
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Yocto TSC <tsc@lists.yoctoproject.org>
References: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::27) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: c55f32c9-953f-4c11-dd52-08dda4dc0629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5AD8jiOfmCrjGhzV3z11QhF+dT8eHza0zt4Oos4NtsSyr6OLEtMgbZ1TtmFa?=
 =?us-ascii?Q?jmXMAYKt7b/vxyWo7weDD7CoI7cYUBmBXPmZXzijeviofjB2Hufnfk82fsR2?=
 =?us-ascii?Q?u37vh9OpbosWIo3pz5XEyrQ6GU9dBtGHLui8zEwFNsiEb9U7HSTt2+UIGEpK?=
 =?us-ascii?Q?ZOTSSsl/fTCpNpVM38mSLH5gVsrGyu+ckO29OmZLxpqDVjKE/Tk0WYrp56f+?=
 =?us-ascii?Q?xzWF/LgbCF047IyvjGy66xiRFH5mwjnuUJWAWl8DxYy5pS6XSra9HZEy74Ov?=
 =?us-ascii?Q?YX9SJtnNU2MN8FyJYo3PLBbQvllZhLEaU1Zx5spfyi++lq7o1lDqqVD6BQod?=
 =?us-ascii?Q?7fle1Vpt/IhZ0RC5vf7E8kWK8Afo3VA2QvmX8tgRUVgkD+8dchq1bOOXvh2x?=
 =?us-ascii?Q?/S2nnSM8mUl8G8AUyvEGyHeNB1J7P/Ka9i57H65eqEgK9vN6L+amzW84iQgv?=
 =?us-ascii?Q?yYezK8+HetruIBn2akB7SBvnyMdHM0Ho2ulQGB45F5KCBBIS5rwEp09bi+Mq?=
 =?us-ascii?Q?gx14Kw/XWsR/qK15VNJpnyzSUj4xvq6nKdyQrGEQrWOiWq8TgvY0N5HvAKzG?=
 =?us-ascii?Q?kyc0C8DqaaYNe1Xov9L5YI3ujXSixIo6n0SNIa4L2DPpL/eTmojbTF9ygl2N?=
 =?us-ascii?Q?4JE7CZaXj993/Vpxs3b0X3bPd/d/b4fb52hdCSJyizSJCXcDOvkki+Nj8740?=
 =?us-ascii?Q?RU+BrnYCeZP/UWFUhDyBeUMANdnPCOEHH0LchJuedURWr2/tAheVGLIwaFbb?=
 =?us-ascii?Q?gik7vfgizGTVzA9g+3DYkbeG6xMgFr49m52WXS+qgpZj9gPJ1qkqxZhAxbSg?=
 =?us-ascii?Q?LtodU+WdAgg898cGOYkC+uE0p/3CkyAKlvyuWBEyEJ8v+tHUg2lwwXy+4677?=
 =?us-ascii?Q?myhkJMD+8I2tNwWxgrBEyX3b/r02GXb6PYggonMiDzP3A2Ndapq7Ur8KmACY?=
 =?us-ascii?Q?pr4DC8C7CQCyS2qi/mpT4jiHaW4Nv3fiQ+Izo2uqOkliI5MW19D/LL8mHZ05?=
 =?us-ascii?Q?Z1C7lImgdosC+jCJodItNg7/S8la7gpGMpRlAVh3JbhvQtU0FZzOOeg3s3Xd?=
 =?us-ascii?Q?urT0qiP3LtadC7eZZ4g2IK92VJzcr0N52ZrLhXUTYh2A0LpAe+Kj+HgB7XzJ?=
 =?us-ascii?Q?R4p7a1FmLJtAr6jdGO5CqKukrgkfOeYvPbHenOiFi/r2EauXihvgXFpQYRLm?=
 =?us-ascii?Q?W2m2IHzhuPpJOc/5Fqox6WKnZOKrPifpQN1mKAPnQge+lJUocsnMdwWGszSP?=
 =?us-ascii?Q?Tzb7FoLBivjNLKavFoi869BmZkcOpqy0kNfr1ZNdeJGzc8NKb0tI9tK/j5F+?=
 =?us-ascii?Q?jczi8buaofnufrTvaed2sANfHqCeeadNEYQLXuxuMK6K4A+yQmyzJbrtcGLg?=
 =?us-ascii?Q?rjOSgn8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rX/ELRG1zYNQCUgM7Q6OW76Vkjqr1YblmWc4lBo7Vbbohg1/Sq1UrDMguHoS?=
 =?us-ascii?Q?XsSYEP2m9h+RIYNDDCn+pkvQWCc8pPkjLPcKaqPna5+vyotX2twOomcg/7qD?=
 =?us-ascii?Q?ATfCLiJJ4DlU45kQkR4BkrTQtGXhG5V+WSjoU3kZ2dxygVjir//ja8SZv/gZ?=
 =?us-ascii?Q?4l7fy62HyKHbOvR2rXCv8d9XqOUYARa3vkmFq9maT8Sh9wVHILFpk71lFPeo?=
 =?us-ascii?Q?q39NFKMZAh0c5gCmkhb6Jx/Ncu9ZtlAcn4avx31YdgudoKEZj3invxlZi+3T?=
 =?us-ascii?Q?vGMy6Hf7vWAA+CArQTZ96HcBk93eIGHpEiFcSKLYNbz9pwSEYSLVYSpXcTjA?=
 =?us-ascii?Q?JVWGVYgTuD4rEcmugj4R+yXvNWp8SuQ5LkS+ae23dqGMfS6JO89DDjISFAQV?=
 =?us-ascii?Q?kk4NU5KFOfJSkkTzBir5COPVaokpJRkWfjxRMed+uboIZ6kR7nsqevR8v9XX?=
 =?us-ascii?Q?sXYABw8oCQZTTmeV1kTZr968bK4Lagv3AGbOfkKdUiTXnjElqr/17lBSO6Oa?=
 =?us-ascii?Q?dPPMC4sB0naciomsdDLmEto7hEQkFsBNJN0axZs8UuDnNSp+vUWn5hk6Qijm?=
 =?us-ascii?Q?NCS2RtRP0aIcol+cAcDHIwXZBspntRq0ocBWSMo4F9pR1pWNF0kiWBlRpX3Q?=
 =?us-ascii?Q?ZOYLjPKUH3DtIYxTH5ngHXy3y3IRIGKdbe8ljaDb8Tz4GudnCYtxxLEbJdA9?=
 =?us-ascii?Q?cKhVi8cYwzG1rycgNbz2jKdYdicIbRhBX8YtSPFItKger593q9rUW8WW2F+g?=
 =?us-ascii?Q?cPTlwOpUJELJKuJVvNHKacA9LceTsUVf2TxsxdxfnNViKUXf2jZIJlMDI3h0?=
 =?us-ascii?Q?jMX0uBKXgXyeJrslbSKMl+ZGpeIBEBrHr6Z6olldq9pkVn2+j54UpCSaw1W+?=
 =?us-ascii?Q?sBvo/7E61e9pIB/EmmLhpHkKgpqzAxjqn5PnsaRqY//xVZ3uAYccWQyxZBWe?=
 =?us-ascii?Q?8hXZ6SS5ijBiv9LPQCRMR8+sKM/yH3mZincVJgY/kkSuu2q1H6jDCwpjhI1L?=
 =?us-ascii?Q?m6ry3M1t1VXjrNUMFGsAEZW+cm6zYE1XrC3dUZAwV4EovbQ5iZhhu+wfPZiQ?=
 =?us-ascii?Q?pmWhekPNjI3OmHkziJPU81q9/lqUmDvroK9fQr/KPZ1loTyPcPpsMNI8FRow?=
 =?us-ascii?Q?Hw4tAI1+fkmvfq4fwKBk7uetan03LVsMCsZf59if/OUIXz9IV7Rg3tii5T/F?=
 =?us-ascii?Q?I0NorWuC8gW9jHJGAwV75B8PumNNtT9yihQzlGYwi/rkmyEJkjpdwlAJed0y?=
 =?us-ascii?Q?9NZ2/30iknT+OuRuKdjhEDwIsBRx8UbOFnjyR5I9bPoyCAk0ctHsRcEGi/m8?=
 =?us-ascii?Q?+OcFG30Kq22mUG+B5yDJsqZcBEJ6vginhD66dRjEbZJ2k0NduSSnUEc6Tnt/?=
 =?us-ascii?Q?PkpCiP1xp91sYwt6wfuDQqm1FBSK8yK5YbZwSWus7n3/OEcbFlXTh9ttCnyJ?=
 =?us-ascii?Q?awCv46viH7VAG5/+T3cCBQEPKgddPofDPZ3YRFY4W3XhJaDuwL07VgVSu8pt?=
 =?us-ascii?Q?gIVUz99rHZk47XhONGeUCflU85WkSM8thKOv6G9YusxZlyYW2CIaJSpu7pEn?=
 =?us-ascii?Q?W3dLbDcu4vtW+8vMq0IsKa1vWKAmqIpIhfyBXl++DhmzvEoA4X06j/BZLfU5?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c55f32c9-953f-4c11-dd52-08dda4dc0629
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 09:25:06.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AihSFIuPPEKBPvtwYEYBCrdGMmbdcoBSsVfCaQWIs6H55W0OoYXJFsbaSNWf00SlS015IkVwqAjaSVa8kM3THeuGWkWmmuZK7KPy+MNexws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10311
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 09:25:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7015

Hi Antonin,

On 6/6/25 9:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a "Yocto Project Supported Architectures And Features" document that
> aims at:
>=20
> - Defining the different levels of support for features
> - Listing the maintainers for a feature
> - Listing the existing builders on the Autobuilder for the feature
>=20
> Co-developed-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Yocto TSC <tsc@lists.yoctoproject.org>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/index.rst                 |   1 +
>   .../yocto-project-supported-features.rst           | 264 ++++++++++++++=
+++++++
>   2 files changed, 265 insertions(+)
>=20
> diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manua=
l/index.rst
> index a746dde492..53fa98cc99 100644
> --- a/documentation/ref-manual/index.rst
> +++ b/documentation/ref-manual/index.rst
> @@ -11,6 +11,7 @@ Yocto Project Reference Manual
>      :numbered:
>  =20
>      system-requirements
> +   yocto-project-supported-features
>      terms
>      release-process
>      structure
> diff --git a/documentation/ref-manual/yocto-project-supported-features.rs=
t b/documentation/ref-manual/yocto-project-supported-features.rst
> new file mode 100644
> index 0000000000..8776a1a7eb
> --- /dev/null
> +++ b/documentation/ref-manual/yocto-project-supported-features.rst
> @@ -0,0 +1,264 @@
> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
> +
> +**************************************************
> +Yocto Project Supported Architectures And Features
> +**************************************************
> +
> +The Yocto Project is putting continuous efforts into testing the changes=
 made to
> +the :term:`OpenEmbedded-Core (OE-Core)` metadata and core tools. The det=
ails on
> +how this test environment functions is described in the
> +:doc:`/test-manual/index`.
> +
> +These tests are also run for stable and Long Term Support versions of th=
e Yocto

Could point Long Term Support to the :term:`LTS` as well since we=20
already have it :)

> +Project. See the :doc:`/ref-manual/release-process` section of the Yocto=
 Project
> +Reference Manual for more information on these types of releases.
> +
> +The infrastructure behind the test environment is the Yocto Project Auto=
builder.
> +For more information on the Yocto Project Autobuilder, see the
> +:ref:`test-manual/intro:Yocto Project Autobuilder Overview` section of t=
he Yocto
> +Project Test Manual. The Autobuilder contains a set of Builders that are

I would squash the first and second sentence with a simple link

:ref:`Yocto Project Autobuilder<test-manual/intro:Yocto Project=20
Autobuilder Overview>`

for example.

> +associated to an architecture or a feature to test. For example, the
> +``qemuarm64`` builder corresponds to testing the ARM 64-bit architecture=
.
> +

Wondering if this information should be part of=20
documentation/test-manual/understand-autobuilder.rst as well/only?

> +Below is a comprehensive list of target architectures and features that =
are
> +supported, as well as their level of support. For each architecture or f=
eature,
> +their corresponding builders are also listed.
> +
> +Primary Supported
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The term "primary" means that dedicated builds for these architecture or

s/architecture/architectures/

> +features are being run on a daily basis on the Yocto Project Autobuilder=
 and
> +also tested with incoming changes before they merge.
> +

Should we mention this is typically the -next branches? E.g.=20
master-next, walnascar-next, etc...?

> +Below is a list of primary tested features, their maintainer(s) and buil=
der(s):
> +
> +.. list-table::
> +   :widths: 20 20 20 40
> +   :header-rows: 1
> +
> +   * - Feature
> +     - Description
> +     - Maintainer(s)

What are we trying to achieve with this column?

What am I supposed to derive as information as a user of YP/OE/BB based=20
on that?

Is this some kind of public recognition from the project of efforts from=20
some people?

Are we supposed to be able to contact those people maybe? Should there=20
be some mail address there or some pointers to some document on what to=20
do if we want to contact them?

> +     - Builder(s)
> +   * - :wikipedia:`ARM <ARM_architecture_family>`
> +     - ARM architecture testing
> +     - Collective effort
> +     - genericarm64,
> +       genericarm64-alt,
> +       meta-arm,

This stood out compared to other entries in this column as I recognized=20
most others as machines, but this is a layer.

So this then prompted me to look it up on the autobuilder and I see that=20
we have tags for builders.

Some are "layers" like meta-arm, "qemu", "toolchain", "qemu-alt", "ltp",=20
"ptest", etc.

I'm guessing they have a purpose and things are tested differently in=20
the autobuilder based on this tag? Is this something we want to document?

> +       musl-qemuarm64,
> +       qemuarm,
> +       qemuarm-alt,
> +       qemuarm-oecore,
> +       qemuarm-tc,
> +       qemuarm64,
> +       qemuarm64-alt,
> +       qemuarm64-armhost,
> +       qemuarm64-ltp,
> +       qemuarm64-ptest,
> +       qemuarm64-tc,
> +       qemuarmv5
> +   * - :yocto_git:`Beaglebone </poky/tree/meta-yocto-bsp/conf/machine/be=
aglebone-yocto.conf>`
> +     - Beaglebone image and SDK build testing
> +     - Collective effort
> +     - beaglebone,
> +       beaglebone-alt
> +   * - :doc:`Reproducible </test-manual/reproducible-builds>`
> +     - reproducibility testing
> +     - Collective effort
> +     - reproducible
> +   * - :term:`Buildtools`
> +     - Buildtools generation
> +     - Collective effort
> +     - buildtools
> +   * - `meta-agl-core <https://gerrit.automotivelinux.org/gerrit/AGL/met=
a-agl>`__
> +     - meta-agl-core layer testing
> +     - Jan-Simon M=C3=B6ller
> +     - meta-agl-core
> +   * - `meta-arm <https://git.yoctoproject.org/meta-arm>`__
> +     - meta-arm layer testing
> +     - Jon Mason,
> +       Ross Burton
> +     - meta-arm

Ahah, should meta-arm be removed from the first row?

> +   * - `meta-aws <https://github.com/aws4embeddedlinux/meta-aws>`__
> +     - meta-aws layer testing
> +     - Thomas Roos
> +     - meta-aws
> +   * - `meta-intel <https://git.yoctoproject.org/meta-intel>`__
> +     - meta-intel layer testing
> +     - Anuj Mittal
> +     - meta-intel
> +   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualiz=
ation/>`__
> +     - meta-virtualization layer testing
> +     - Bruce Ashfield
> +     - meta-virt
> +   * - :ref:`Multilib <dev-manual/libraries:Combining Multiple Versions =
of Library Files into One Image>`
> +     - Multilib feature testing
> +     - Collective effort
> +     - multilib
> +   * - :term:`OpenEmbedded-Core selftest<OpenEmbedded-Core (OE-Core)>`
> +     - OpenEmbedded-Core layers selftests
> +     - Collective effort
> +     - oe-selftest-fedora,
> +       oe-selftest-debian,
> +       oe-selftest-armhost
> +   * - Package managers> +     - Package managers (RPM, DEB and IPK form=
ats) testing in the
> +       :term:`OpenEmbedded Build System` (different from the
> +       ``package-management`` :term:`image feature <IMAGE_FEATURES>`)

Would that then be :term:`PACKAGE_CLASSES`?

We can keep the disambiguation though.

> +     - Collective effort
> +     - pkgman-non-rpm (other builders use RPM by default)
> +   * - :ref:`Patchtest <contributor-guide/submit-changes:Validating Patc=
hes with Patchtest>`
> +     - Patchtest tool selftests
> +     - Trevor Gamblin
> +     - patchtest-selftest
> +   * - :wikipedia:`RISC-V (64-bit) <RISC-V>`
> +     - RISC-V architecture testing (64-bit)
> +     - Collective effort
> +     - qemuriscv64,
> +       qemuriscv64-ptest,
> +       qemuriscv64-tc
> +   * - :wikipedia:`systemd <Systemd>`
> +     - Systemd init manager testing
> +     - Collective effort
> +     - no-x11, qa-extras2
> +   * - :term:`Toaster`
> +     - Toaster web interface testing
> +     - Collective effort
> +     - toaster
> +   * - :ref:`Wic <dev-manual/wic:creating partitioned images using wic>`
> +     - WIC image creation testing
> +     - Collective effort
> +     - wic
> +   * - :wikipedia:`X86 <X86>`
> +     - X86 architecture testing
> +     - Collective effort
> +     - genericx86,
> +       genericx86-64,
> +       genericx86-64-alt,
> +       genericx86-alt,
> +       musl-qemux86,
> +       musl-qemux86-64,
> +       qemux86,
> +       qemux86-64,
> +       qemux86-64-alt,
> +       qemux86-64-ltp,
> +       qemux86-64-ptest,
> +       qemux86-64-tc,
> +       qemux86-64-x32,
> +       qemux86-alt,
> +       qemux86-tc,
> +       qemux86-world,
> +       qemux86-world-alt
> +
> +Secondary Supported
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The term "secondary" means that in some cases there is code/feature/supp=
ort
> +which is desired by people using the project and is in the project's int=
erests
> +to support, however there isn't wide enough interest and support to just=
ify
> +testing all incoming changes on it. There are however project member
> +organisations and maintainers willing to run tests and review fixes.
> +
> +This category may be applicable=C2=A0as support/usage in an area develop=
s and grows,
> +or as support/usage fades but we continue to have tests. It can also app=
ly where
> +resourcing isn't available for full primary support but there is
> +member/maintainer support for running tests.
> +
> +We therefore have the following criteria and policies for such items:
> +
> +-  It can be clearly isolated and defined by specific configuration.
> +
> +-  There is a clear documented group of maintainers agreeing to maintain=
=C2=A0it.
> +
> +-  Those maintainers are active and responsive.
> +
> +-  It is being actively and publicly tested (potentially using
> +   the=C2=A0:ref:`Autobuilder <test-manual/intro:Yocto Project Autobuild=
er Overview>`
> +   by agreement, or otherwise).
> +
> +-  Testing would not be part of standard incoming change testing and=C2=
=A0regressions
> +   would not block incoming patches.
> +
> +-  The :yocto_wiki:`SWAT </Yocto_Build_Failure_Swat_Team>` team would no=
t handle
> +   any test builds on the autobuilder.
> +

Autobuilder has always been capitalized in this patch until here, so...

s/autobuilder/Autobuilder/

?

> +-  Test results can be submitted as part of the release process if=C2=A0=
desired.
> +

Submitted where? Can we see the test results somewhere?

Cheers,
Quentin


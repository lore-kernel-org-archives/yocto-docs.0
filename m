Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE03ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 09:46:53 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.62])
 by mx.groups.io with SMTP id smtpd.web09.4218.1663148804508642964
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 02:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=rx1UPCGX;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.62,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIDiaDN6tiJMTKROGDl08BpMENir5rZ4gTj44Mzz0VYlUh9hLaouAmstmO7XqNr7ISY47spUy4cwcULOiEJt4Ko/6OXAhYG3OPhmytpTnJNLIJm49zPny/MF5ma6vxnA5PBuD5ipa+vlk6TVnSRotCGH6CR9ujf7SjZ4Tuo7TihFHns5756okPPTHQf3lJTRlXp1NGduf4R4v15i7mkaS8ZcGF4NkqrOdKdnce0JJk0YdpU1RFXqaCslb6e8fL+gRg7FuhHRkakbdNm8sAvhX8JuD2dqj953xDWE2pfxrqvd3IrDVqk3N/dXls8Ih0R5ESlXkX1wxMLWyOZKfdaM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEUYtG+N56kWC/gBab97ZMusm8zmZjwVZ+u7a7Aicgc=;
 b=Eo9clIUQjMK/zkXiD/eq6cY6HlewT2hh+EAIOgRrGCQX2vVEIbwV8TcmAwEdqST8/Hhkr2JnmD+UhLjxdzmJ4TLcT/mVAV9YhwbN9/ONvLzD0qMlauARa8SYVV2Wf1Dp5uxoRtr59PEfcfmTFPRpCKyihEzd0eE+mm5hHynjesKFI5DbClNQ6vc6TiOOwPfAJxRXoeOoulx/v2MCljI7Z2bLls07PJO6Cu/Ohkk21MbgLHzn7m6AuIgUVpP1cckXzRQfOb8+FG3VdL0oB/8aqsgNI7rFL9RYZEX97vFheiGTqQhRuorNl7LOQIPec6aM5UxeW0ZJWBuYpDGH5E8GzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEUYtG+N56kWC/gBab97ZMusm8zmZjwVZ+u7a7Aicgc=;
 b=rx1UPCGX2R+IBb11mG3kAAUAdMw6NHhCSPkROuSk0+2DRbI4p6LlRRzE8Ad1x8IAiIa24kOsv9avDvjAfUhI2gjxlubfxzRNWxGSps0kszPBSN2BhX1E6r5aURrMvryCRhjNsS6y+UrhBec//yriGF2VR1c0UZmFFE8DauVcYCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB9207.eurprd04.prod.outlook.com (2603:10a6:20b:44e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 09:46:41 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 09:46:41 +0000
Message-ID: <ab373eed-5d35-2134-c82b-a41888735412@theobroma-systems.com>
Date: Wed, 14 Sep 2022 11:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH] manuals: fix typos in the context of 'icecc' &
 clean up whitespaces
Content-Language: en-US
To: =?UTF-8?Q?Ulrich_=c3=96lmann?= <u.oelmann@pengutronix.de>,
 Yocto Project Documentation <docs@lists.yoctoproject.org>
References: <20220914093528.3073257-1-u.oelmann@pengutronix.de>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220914093528.3073257-1-u.oelmann@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c189d82-3536-46e5-df95-08da96360690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tgKrn21vRnBREw1rBTDx587Nbj1sTILaGOEZ7eGxAN48OU4w4s+pJ/Qx9rXhPlfLlMulq5XUTx1bWLOOBl5K5ifOX/xvDoDcexTVjJo4wqCJGTgOAXrdfNelyY+iyTyWdO1vh2AamSopz5FArS43WiSyrI2XfijeulMh1x993lcqbflkLijO7aX3hSAXTd3FBHkL2OFn7lGn0yUFAqXc+BAdUiQQkNQSzTKSXuhVRzin87uGgFLcvFhT2TMsUyYEvPKwqaSA2H7D1QDLfKxIYw/56FWfb3KpHkl173XJxUHkUm4Vn8zP0rt3h0KNMSDsA7/4smq5I84+9i5i57hvmxymLjdQOGjwi94NP/camYLL9Zq9P2bwi8LfrHY+Gdgt2ExJG/A25dsdrXLzj1Fl2E2OjEvCJM/Aufqd6HmLv66eRtPRWDEqzh0It5iHJ7Hr6uqgaLTo9I2D75KjYQjanCczKnEibLs0u2PXWuLjMVsrM6zDknKDvh4oeoUJRJVzyBVxOFADFHY4oeBG1RVFeueT+DXVdLjuUV905nrnk4NgdJLaJ9KF1PSzGN4ZB6PWkqXKLY/UmsfHAI0clcyRJqm1LCDiWHE5qHN9TxKIh/WgWISA7V8ACHF3Z1sWv8VM3P+AkNOf8QrzmY9r8u2ioghdyOiz8ixGGWc98+OpXKgOPxLtjvqDPYZzu79RbVlYv4XI8sLr9wFDEMKE6P/BD+8qxTXqjXeYFFR6+g4n3RMh8yPme8U12S6Nt5EGiL6kcWUPs3mDEXNtPzcBLZU4Q/NknkwDANtvXRWLM0Sxpjs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(39850400004)(136003)(366004)(451199015)(66574015)(26005)(316002)(110136005)(6486002)(5660300002)(31686004)(86362001)(66556008)(66946007)(478600001)(8676002)(66476007)(6512007)(38100700002)(53546011)(36756003)(6506007)(2616005)(44832011)(186003)(8936002)(83380400001)(41300700001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IHupgtdCAFvWaKfpe0sJvoA4JvrW3/YfVqVRQvGjXqkQaBO1zH1q8xPTdo+y?=
 =?us-ascii?Q?vw5rEP3Wrz+1yI4QNhYFrQKLah9WUFJhIp7/FsqhE4BCk/4rj2kphMfNnrMK?=
 =?us-ascii?Q?HC3tEvELwSnd8abls6VZML6/cCkD526mBGlJdai5/8QRYAyXgzbfNtaymn/H?=
 =?us-ascii?Q?NwEYcp/3SmCXIuGJPj3GEf/NLfY58vJATZvLMkAecNleA1nqosr6+5EfsgYX?=
 =?us-ascii?Q?KMa8I7DrqnmsQdTLY03tb7rUMWydr9HnT8CIBKOd/YJmIJU2Ju8k4qAy/Obn?=
 =?us-ascii?Q?/sOfm/AXUfPRHF41C6iU5sy8dphyVdcBwvclOhsn5y90fIevroxxHlAG6MYA?=
 =?us-ascii?Q?Mxo2wLl8RA8FQaGq9FC2NumIJXTvi35Vh8b1qbIDlMIwwX86K4DQph/Wm41q?=
 =?us-ascii?Q?aplIcmnIVOhf9P/Mue75gG61a1O/mlOLB0W9ZUUBv4CrD1dZb7e5Nl7fUwQ3?=
 =?us-ascii?Q?8x3MF9oCTvXu1mNASJ9xgHG54vcl1isBWME3XL3LzQ5SO6+toSkhejLr7RUr?=
 =?us-ascii?Q?6ipxwtZE/C4VyGjiB94v4lsuAYnoq192ZXFliXjHOlGG6z3z/lpG74is2T1r?=
 =?us-ascii?Q?TyAvzZ9VshooOwcxn51pYvflKtOv/mJ3aAnP/g+eOK7ODZUX74eIAKmbfNCM?=
 =?us-ascii?Q?q+GfEQmikZI3LP9lNw9OlXILgIIQYOO4vee89cdMYdx5KoSp8aLxxjzHk8rV?=
 =?us-ascii?Q?7HaIQ1xkKKXv1S7cAci2bSvYUpMz7FGSrB5igAmwP7ZVMPsTPUJzHLv42v+H?=
 =?us-ascii?Q?GoqGlbcEXCoFt80qNsfzWOzOeYIpZ2XExTpsM+weqv8w0W7zT5Yre+Df6RmN?=
 =?us-ascii?Q?mGFyCMBiae/c72ZXTowATpipI288Tr4dubbfZ41HV7uHj8eE9NIxrFgRy7v9?=
 =?us-ascii?Q?5k0euiAfgwk9/PkIsOteELG5Xz1APi29dCOdg4NM/tjh0q1QeAiWAOHSz483?=
 =?us-ascii?Q?kckNG+G0trjMBxmN3VrsrREHmVVX+ZxLnYjYCI8wYRuQZdOrs51X6rk11MX5?=
 =?us-ascii?Q?xAUZgawRhuoBv5+CauIguzU2UUmwmqqp5Fev1mNxOtHW7v9M5qZD1XeOuZgx?=
 =?us-ascii?Q?jmTXYOru2cKY63V1Kzg3KvovYZ8rlJa1th08dd8XhKOUndUh6+bjqwpZlheP?=
 =?us-ascii?Q?EpTiT3r1x2UXqJInpEBJzTkKpCrpFmf3JGOaV7cqtwzXnXP1VO3FdQ/Wm1io?=
 =?us-ascii?Q?VTTtaolto5x3I3hjvy6g3a1gbe09va47+DOsjwgMVJNyyfYBuBV27kegIGFG?=
 =?us-ascii?Q?ICJ6yeyQOn6p/y2TVEUJ6O6G7jTFqMleL94xHjOjMqakJYwOtin+9AMe2YRe?=
 =?us-ascii?Q?eJo4HiV2GqKz9BFVokc1qouzkwHARus7HhSgYP1M1ZXrhTMuwDRz1KHDr3H6?=
 =?us-ascii?Q?wXCPVEKC8PUqIq/97f4TzBLf2TfRvP5FYeZ/OtXlMhT3YiZleqav6BPtodSU?=
 =?us-ascii?Q?LNni0M06Go8DO+B69ItAtiAgjPZEaK5IqQKifgXalHvoq1MB/jdX2eqYaOCi?=
 =?us-ascii?Q?HZN66ebHy2kXOxlOKOgVa2bDzAqkGLONfCb3pRRjWKLIFuKCurv0925TGt5z?=
 =?us-ascii?Q?ikra1R6EfobCaU96oI0lV2FB2GpZ27X3gZtvx4D2/WVCgEM5RJ1/je3qtkMi?=
 =?us-ascii?Q?8YKriYMkyhlUaH/eeZVK4E4=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c189d82-3536-46e5-df95-08da96360690
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 09:46:41.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZpSkZvvvqBN0TogExRv0iaRPaCdKY9YNYTu1UmxVDmZCM6+nRbV3sz0UiVm0A19lNEGR/2HiCFU4cmNqknCY9jaFrUk+qV/4/zo5OETZxaB7cX4+Gz2HcUxZOPYNAzuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9207
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Sep 2022 09:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3165

Hi Ulrich,

On 9/14/22 11:35, Ulrich =C3=96lmann wrote:
> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> ---
>   documentation/ref-manual/classes.rst   | 14 +++++++-------
>   documentation/ref-manual/variables.rst |  4 ++--
>   2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 424c505715ff..949de0758d01 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -580,8 +580,8 @@ Finally, here is an example that sets the root passwo=
rd::
>   .. note::
>  =20
>      From a security perspective, hardcoding a default password is not
> -   generally a good idea or even legal in some jurisdictions. It is
> -   recommended that you do not do this if you are building a production
> +   generally a good idea or even legal in some jurisdictions. It is
> +   recommended that you do not do this if you are building a production
>      image.
>  =20
>  =20
> @@ -792,7 +792,7 @@ The class stages directories with symlinks from ``gcc=
`` and ``g++`` to
>   ``icecc``, for both native and cross compilers. Depending on each
>   configure or compile, the OpenEmbedded build system adds the directorie=
s
>   at the head of the ``PATH`` list and then sets the ``ICECC_CXX`` and
> -``ICEC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
> +``ICECC_CC`` variables, which are the paths to the ``g++`` and ``gcc``
>   compilers, respectively.
>  =20
>   For the cross compiler, the class creates a ``tar.gz`` file that
> @@ -800,8 +800,8 @@ contains the Yocto Project toolchain and sets ``ICECC=
_VERSION``, which
>   is the version of the cross-compiler used in the cross-development
>   toolchain, accordingly.
>  =20
> -The class handles all three different compile stages (i.e native
> -,cross-kernel and target) and creates the necessary environment
> +The class handles all three different compile stages (i.e native,
> +cross-kernel and target) and creates the necessary environment
>   ``tar.gz`` file to be used by the remote machines. The class also
>   supports SDK generation.
>  =20
> @@ -811,12 +811,12 @@ using ``which``. If :term:`ICECC_ENV_EXEC` is set
>   in your ``local.conf`` file, the variable should point to the
>   ``icecc-create-env`` script provided by the user. If you do not point t=
o
>   a user-provided script, the build system uses the default script
> -provided by the recipe ``icecc-create-env-native.bb``.
> +provided by the recipe ``icecc-create-env_%.bb``.
>  =20
% is not a valid character for recipe filename I'm pretty sure. I=20
understand what you want to do but I don't think that's the right way to=20
do it.

We could also use the exact filename since the recipe version hasn't=20
changed in 11 years so I think it's better to use: icecc-create-env_0.1.bb.

If you're afraid we'll get out-of-date, you could use a link here and=20
someone running linkcheck (we really should start doing it...) will be=20
notified of the dead link. :oe_git:`icecc-create-env_0.1.bb=20
</openembedded-core/tree/meta/recipes-devtools/icecc-create-env/icecc-creat=
e-env_0.1.bb>`=20
would probably be the link.

>   .. note::
>  =20
>      This script is a modified version and not the one that comes with
> -   icecc.
> +   ``icecream``.
>  =20
>   If you do not want the Icecream distributed compile support to apply to
>   specific recipes or classes, you can ask them to be ignored by Icecream
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index df7d4bfbae55..98a981b19b11 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -2966,8 +2966,8 @@ system and gives an overview of their function and =
contents.
>  =20
>         If you do not point to a script that you provide, the OpenEmbedde=
d
>         build system uses the default script provided by the
> -      ``icecc-create-env.bb`` recipe, which is a modified version and no=
t
> -      the one that comes with ``icecc``.
> +      ``icecc-create-env_%.bb`` recipe, which is a modified version and =
not

Ditto.

The rest looks fine, thanks :)

Cheers,
Quentin


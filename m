Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7281C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:35:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.19974.1747906494808546113
 for <docs@lists.yoctoproject.org>;
 Thu, 22 May 2025 02:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rtolg3hY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9AD643201;
	Thu, 22 May 2025 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747906493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6Dmp3KvaN2Rg7bGe1WYgtEtFveNjX9wZGm+70UYgxU=;
	b=Rtolg3hYiCFJ1ZQH7STwbz1pVjdvt+Pi8TxxpVayZ+BSwS/7dm7KyhePrAvMQUchaO2NR9
	FNg8M/Cz8AuD9V/bDTemDb7CQ19lTL91mg3MG75wSyvXXyGeyK4/YkyDJuo8b32+ELHyGW
	tsNfFPC5GBaW8axvqBCLBcOrJ2AIGOkGAC6sUBV/QID6sejBC50/MJAPhrSmn5WWFo7xPm
	Nsj4mP1aeTQeFCgkwR3b9Fa/sLv0k15QZlJiYWPDvuTq7eN4PfEbX0L8ngGCw8MzI+2m77
	Ks0/ZCVmhvkNke/A7+5FhdF4DJo+vdivHsNZkwLvPjhA4EBdpZk/0aW7VL+IIQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 11:34:52 +0200
Message-Id: <DA2L51D2Z4RJ.2MJEUG0QTSSXN@bootlin.com>
Subject: Re: [docs] [PATCH v1] ref-manual: uboot-sign: Support firmware
 property in FIT config
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
References: <20250520095457.3642012-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250520095457.3642012-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehiedvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfekieeufeeiveekkeevjeetveelkeejiefgfeeihfeghfeghfduvdejuddvvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtp
 hhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 May 2025 09:35:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6873

Hi,

On Tue May 20, 2025 at 11:54 AM CEST, Jamin Lin via lists.yoctoproject.org =
wrote:
> Add documentation for the UBOOT_FIT_CONF_FIRMWARE variable, which allows
> users to specify an image to be assigned to the "firmware" property of
> the FIT configuration node. This explicitly defines the primary image
> to boot, instead of relying on the first entry in the "loadables" list.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   | 2 ++
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 5187033f7..54a98bf24 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3426,6 +3426,8 @@ The variables used by this class are:
>  -  :term:`UBOOT_FIT_USER_SETTINGS`: adds a user-specific snippet to the =
U-Boot
>     Image Tree Source (ITS). Users can include their custom U-Boot Image =
Tree
>     Source (ITS) snippet in this variable.
> +-  :term:`UBOOT_FIT_CONF_FIRMWARE`: adds one image to the ``firmware`` p=
roperty
> +   of the configuration node.
>  -  :term:`UBOOT_FIT_CONF_USER_LOADABLES`: adds one or more user-defined =
images
>     to the ``loadables`` property of the configuration node.
> =20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 643a3e7ae..b430fa51f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10327,6 +10327,14 @@ system and gives an overview of their function a=
nd contents.
> =20
>           do_compile[depends] +=3D "trusted-firmware-a:do_deploy"
> =20
> +   :term:`UBOOT_FIT_CONF_FIRMWARE`
> +      Adds one image to the ``firmware`` property of the configuration n=
ode
> +      of the U-Boot Image Tree Source (ITS). Sets the firmware property =
to select
> +      the image to boot first. If not set, the first entry in "loadables=
" is used
> +      instead.::

Extra "." here.

When you write:

"""
The first entry in "loadables" is used instead
"""

It's not really clear to me what it is used for.
Used to boot?

> +
> +         UBOOT_FIT_CONF_FIRMWARE =3D "fwa"
> +
>     :term:`UBOOT_FIT_CONF_USER_LOADABLES`
>        Adds one or more user-defined images to the ``loadables`` property=
 of the
>        configuration node of the U-Boot Image Tree Source (ITS). This var=
iable


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



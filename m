Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E749C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:17:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.89879.1749568620871663416
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 08:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=og2dRi59;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6952E1F4F3;
	Tue, 10 Jun 2025 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749568618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zKTfjnB7zudj7Jk548Q/hnfg5ZJCWStOAwpN8aYhRQ=;
	b=og2dRi59IzsDMJRYXI8hRMn9undoB8/NrOmdIfErqqRpMWmJRJd2qV++ma+Bp++U9Uf1si
	AGCV13/0yDIp+h1bo4yyLVDPaQdRJmDUXuGrWPJomxuYYYUAXAQAdWul/HUFQ7ZmJWUsxY
	sEyTLQaa6Af+jgZv8qqOlccYfldGqntjLe9Ej7GmCkiIJ7bImkustGMsoIQ8gBBLz5cY8x
	rAUhpruyCorLkiyAwJ8XJqZiq43k+Ck5gWsNk7Rx+jwhy5o7j5RXMCQev+qbCHi9RDw8du
	MbzXZUjMKrwSxVffmaLCWiA1kZQTVfoTa5zKO/hWyt17tjg9EkomMK6oOI8N8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 17:16:57 +0200
Message-Id: <DAIYBB4O2ZKB.2DPEVG3GG5DGR@bootlin.com>
Subject: Re: [docs] [PATCH 3/3] migration-5.3: replace kernel-fitimage by
 kernel-fit-image
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
References: <20250606140647.80782-1-adrian.freihofer@siemens.com>
 <20250606140647.80782-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250606140647.80782-4-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedttddugffgledvjeeihfegvedvuddtgeeggeejfffhtdektddvieeugfevtdeuudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7053

On Fri Jun 6, 2025 at 4:06 PM CEST, Adrian Freihofer via lists.yoctoproject=
.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Add migration documentation for users moving from the removed
> kernel-fitimage.bbclass to the new kernel-fit-image.bbclass.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  .../migration-guides/migration-5.3.rst        | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/documentation/migration-guides/migration-5.3.rst b/documenta=
tion/migration-guides/migration-5.3.rst
> index 22653fc911e..4e03d075b5e 100644
> --- a/documentation/migration-guides/migration-5.3.rst
> +++ b/documentation/migration-guides/migration-5.3.rst
> @@ -59,6 +59,41 @@ Removed classes
> =20
>  The following classes have been removed in this release:
> =20
> +-  ``kernel-fitimage.bbclass``: the class has been replaced by the
> +   :ref:`ref-classes-kernel-fit-image` class. The new implementation res=
olves
> +   a long-standing issue with the previous implementation (see
> +   `bug #12912 <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1291=
2>`__).

You can use:

  :yocto_bugs:`bug 12912</show_bug.cgi?id=3D12912>`

> +
> +   If you are using the kernel FIT image support, you will need to:
> +
> +   1. Make sure to include ``kernel-fit-extra-artifacts`` in your :term:=
`KERNEL_CLASSES`

You should use the "#." rst syntax here instead:

"""
#.  Make sure...

#.  Use the...
"""

> +      variable to ensure the required files are exposed to the :term:`DE=
PLOY_DIR_IMAGE`
> +      directory::
> +
> +         KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts"
> +
> +   2. Use the specific FIT image recipe rather than the base kernel reci=
pe.
> +      For example, instead of::
> +
> +         bitbake linux-yocto
> +
> +      You now need to use::
> +
> +         bitbake linux-yocto-fitimage

Could we also suggest that the kernel-fit-image class should be inherited b=
y the
custom kernel recipe or that an extra recipe should be created for the fiti=
mage?
(I don't know what's the best option).

> +
> +   3. If you want to use the FIT image as a replacement for the kernel i=
mage in the
> +      root filesystem, add the following configuration to your machine c=
onfiguration file::
> +
> +         # Do not install the kernel image package
> +         RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
> +
> +         # Install the FIT image package
> +         MACHINE_EXTRA_RDEPENDS +=3D "${PREFERRED_PROVIDER_virtual/kerne=
l}-fitimage"
> +
> +         # Configure the image.bbclass to depend on the fitImage instead=
 of only
> +         # the kernel to ensure the fitImage is built with the image
> +         KERNEL_DEPLOY_DEPEND =3D "${PREFERRED_PROVIDER_virtual/kernel}-=
fitimage:do_deploy"

I would suggest a last sentence:

"""
See the the :ref:`ref-classes-kernel-fit-image` section for more informatio=
n.
"""

> +
>  Removed features
>  ~~~~~~~~~~~~~~~~
> =20

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



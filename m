Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E07D0BB72
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 08:45:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10016.1729759519349569306
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QNrL6Pjl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21E5B2000E;
	Thu, 24 Oct 2024 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729759517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnaTNOriMOzn/yF2et7C/3vN+/IHWldmyjK+zzaZdAk=;
	b=QNrL6PjlKVsJrFZ/4a+ffj4Ui01LfOvLTzLEUqr1OOXBNsS9vzniI6sFeFb7rAzKYsfqA5
	qzhb6+vXulfhpWwQlw4D8KQm0k6cs5snvk11t0x7nyOSnG1BSULV7AqEjkQyfstjFpCUx1
	x+snbj22dtA+oNYKHniPbIxKDF2hZFnwwNzJQ9E/qiveqGNztjmu0NhSuQjEpFiCsNcfif
	MZFw003VOgcSu9vdrmdQ6LrCZPXzFEvn9iapzwaRT2dqplGRhJOcGAECHpWZj8PxLGXSUY
	wxqduD4gOt2nAsEljwhxYKMUkeFcwSndFAeGJJF60AlPkgMS+9PiRu450X7q8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Oct 2024 10:45:16 +0200
Message-Id: <D53WKNUVZIY2.26M80TC42LQRS@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: Sync variables letter index
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241024071837.976031-1-niko.mauno@vaisala.com>
In-Reply-To: <20241024071837.976031-1-niko.mauno@vaisala.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 08:45:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5577

Hi Niko,

On Thu Oct 24, 2024 at 9:18 AM CEST, Niko Mauno via lists.yoctoproject.org =
wrote:
> Update variable name letter index so that each letter leads to first
> variable name entry in the list. Also add letters Q and Z to index.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  documentation/ref-manual/variables.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index dc7a19efef..07ed143ac5 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8,13 +8,13 @@ This chapter lists common variables used in the OpenEmb=
edded build
>  system and gives an overview of their function and contents.
>
>  :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
> -:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FEATURE_PACKAGES>`
> -:term:`G <GCCPIE>` :term:`H <HOMEPAGE>` :term:`I <ICECC_DISABLED>`
> +:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FAKEROOT>`
> +:term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <ICECC_CLASS_DISABLE>`
>  :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
>  :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
> -:term:`R <RANLIB>` :term:`S` :term:`T`
> -:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
> -:term:`W <WARN_QA>` :term:`X <XSERVER>`
> +:term:`Q <QA_EMPTY_DIRS>` :term:`R <RANLIB>` :term:`S` :term:`T`
> +:term:`U <UBOOT_BINARY>` :term:`V <VIRTUAL-RUNTIME>`
> +:term:`W <WARN_QA>` :term:`X <XSERVER>` :term:`Z <ZSTD_THREADS>`
>
>  .. glossary::
>     :sorted:

Thanks, it was outdated. It would be nice if Sphinx could do this on its ow=
n!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


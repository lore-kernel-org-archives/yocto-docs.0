Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55243D6ACD2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:52:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.72228.1732715542357293492
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 05:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dcRW01XE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F24960005;
	Wed, 27 Nov 2024 13:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732715540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8bWxldPU9yKPr1nW8E2pT/nfsJ9LhH4veiIqo5LY3M=;
	b=dcRW01XEM2c049WO0PLeaj3r+eL+RvYqqLZSR7R5W3pUVoGNlLOhBzyBwx9ANa6YiODNBg
	C6ML+bJMM7TjqiFmmqUiwC0kF2zaWwpfALK5iOdu1fMxnOkbsKL8T99pHQnyPJIL5tBU3D
	h+GFNGHJwD70/x2uZUe706MEdEm5eyTUdEq3w5z7NLHl4D5KnsO7HlVWq5zmfFbBV4Busu
	uORhcy/euYYhGlaaxii1qMzXyvMdOEy5P+BmPWIN437lAZ7txh6GdGYTP7yxktkH5nGtEC
	eszHxn+vsMjJx1BijyjjmhvLhbP4jdwk+VaOphrw1TD6DKCG4APq2mdq3Xe39w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 14:52:20 +0100
Message-Id: <D5X0EA9D59P5.91R819T099D@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4] classes.rst variables.rst: add documentation
 for uki.bbclass
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241127112056.361318-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241127112056.361318-1-mikko.rapeli@linaro.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 13:52:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5831

Hi Mikko,

On Wed Nov 27, 2024 at 12:20 PM CET, Mikko Rapeli via lists.yoctoproject.or=
g wrote:
> Documentation for the new class.
>
> [YOCTO #15650]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15650
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  documentation/ref-manual/classes.rst   | 50 ++++++++++++++++++++++++++
>  documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b92f4e4f20..ad22511b4d 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3345,6 +3345,56 @@ and the `signature process
>  See also the description of :ref:`ref-classes-kernel-fitimage` class, wh=
ich this class
>  imitates.
> =20
> +.. _ref-classes-uki:
> +
> +``uki``
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Im=
age
> +(UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/=
>`__
> +format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc=
 to a
> +single UEFI firmware compatible binary. The class is intended to be inhe=
rited
> +by rootfs image recipes. The build configuration should also use an
> +:term:`Initramfs, ``systemd-boot`` as boot menu provider and have UEFI s=
upport

There's a missing backtick after Initramfs here, which prompts an error mes=
sage.

Otherwise the rest of the patch looks good to me.


Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


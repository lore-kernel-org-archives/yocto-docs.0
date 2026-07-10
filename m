Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E964C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:55:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8049.1783670128482602169
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 00:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HnpLht4A;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB6DD1A0F24;
	Fri, 10 Jul 2026 07:55:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8062760341;
	Fri, 10 Jul 2026 07:55:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F203911BD2698;
	Fri, 10 Jul 2026 09:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783670126; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CGFbhCRVQnOhfkEULibW3pLRk6eTbagGUQNxQMcgNrs=;
	b=HnpLht4A+NWGQacyCplLBMd0xtE3oqc5PdtJGSUvZ7eY5jaVk2fj8umPijT9CjJLtgkXor
	9UzGU5wsZ3woyI3r2QIbm3s6Ff+2zJmkpN1plX0wY2Yoe7XcDH9ADsziy25AjD7/ld6ReO
	uNjIxa+pa8dEdRuKltxVNVqpeePHRqJthNaWO9qMwHADME9SIXNjlT0PSHwdS7vW4u/YRh
	QF6DXDBsAYbrQWHhchrD+aXA8OUFAH3L9TlGcg2TWIJQETTbbjcy08IuG7PWQIoGKOYLPx
	g+Qp1tlOAhmzHO3UnimvXvbN/gwm1+csiTOXPI+tXHG2l2jIy+VuNXLkbesHKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 09:55:23 +0200
Message-Id: <DJUQAEXAC03Q.2T7IDXHKVIX95@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: expand on kernel "do_sizecheck" task
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca>
In-Reply-To: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 07:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10049

Hi,

On Thu Jul 9, 2026 at 10:31 AM CEST, Robert P. J. Day wrote:
>
> Expand on the description of do_sizecheck() to mention that it will
> size-check on *all* kernel images listed in KERNEL_IMAGETYPES.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
> index e1db2d5ed..db0abad00 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -837,11 +837,10 @@ can successfully build the kernel modules in the ne=
xt step of the build.
>  ``do_sizecheck``
>  ----------------
>
> -After the kernel has been built, this task checks the size of the
> -stripped kernel image against
> -:term:`KERNEL_IMAGE_MAXSIZE`. If that
> -variable was set and the size of the stripped kernel exceeds that size,
> -the kernel build produces a warning to that effect.
> +If the variable :term:`KERNEL_IMAGE_MAXSIZE` is set, this task compares
> +the size of all stripped kernel images listed in :term:`KERNEL_IMAGETYPE=
S`
> +against that value. If more than one image type is listed there, warn on
> +any that exceed that value, but fail only if none of them fit.
>
>  .. _ref-tasks-strip:
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index c92b195ff..ba83b6e6f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5603,17 +5603,18 @@ system and gives an overview of their function an=
d contents.
>        information.
>
>     :term:`KERNEL_IMAGE_MAXSIZE`
> -      Specifies the maximum size of the kernel image file in kilobytes. =
If
> -      :term:`KERNEL_IMAGE_MAXSIZE` is set, the size of the kernel image =
file is
> -      checked against the set value during the
> -      :ref:`ref-tasks-sizecheck` task. The task fails if
> -      the kernel image file is larger than the setting.
> +      Specifies the maximum allowable size of the kernel image file in k=
ilobytes.

I know this was already the case, but I think those are kibibytes, not
kilobytes. How the size is computed:

  size=3D`du -ks ${B}/${KERNEL_OUTPUT_DIR}/$imageType | awk '{print $1}'`

du's docs:

  -k     like --block-size=3D1K
  -B, --block-size=3DSIZE

  The SIZE argument is an integer and optional unit (example: 10K is
  10*1024).  Units are K,M,G,T,P,E,Z,Y,R,Q (powers of 1024) or KB,MB,...
  (powers of 1000).  Binary prefixes can be used, too: KiB=3DK, MiB=3DM, an=
d
  so on.

Otherwise looks good, thanks! I'll merge in master-next with this modificat=
ion.

Antonin


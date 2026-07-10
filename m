Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDA9C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:11:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8208.1783671109225880078
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 01:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WLbnz1nH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6BC3C2F4FB;
	Fri, 10 Jul 2026 08:12:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E6D60341;
	Fri, 10 Jul 2026 08:11:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C232811BD2658;
	Fri, 10 Jul 2026 10:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783671106; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z+haK15fWPbRK0PJBlP9i+MuA8SPHWDLyaGcGJAPSqs=;
	b=WLbnz1nHttffTtCBPrkTRjPEMQEB/UAiAin5VBnCx04G/cw36478arUxhsdPwwNiv470jE
	yl5nLL5bXCgySpeQF9XAj0670why83ZLf/h4skwoLdXqOrTv2PUrzn6Q4HWCofPUThtGQc
	CEfauMDcW0MUdddvJCmjbiNrSrntWKQal8yyGpibDkVDSICV0hvkD+vaTbT1hRT7Sv5rMW
	wV76xB3AxlxJHo7OB2lhgTW5suc9orKPmfReaD9JLKSI4rAZenKM5Vo+jEvTw4UkKaM1Bu
	ff3eKqI12tJt5mTa4d2S6wZ5mov5YEz3Hie5Z2IKsYugyA6nU1snwFGwu2oW1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 10:11:44 +0200
Message-Id: <DJUQMXDTBWXD.P3TB5BYLA1IK@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add
 "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS" to variables
References: <bbb920f3-06ee-356c-1641-e9d4dda960d8@crashcourse.ca>
In-Reply-To: <bbb920f3-06ee-356c-1641-e9d4dda960d8@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 08:11:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10050

Hi,

On Thu Jul 9, 2026 at 10:48 AM CEST, Robert P. J. Day wrote:
>
> Add this variable to the variables glossary, and add links to it and
> back to the do_strip() task for completeness.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manua=
l/tasks.rst
> index e1db2d5ed..ea0899f53 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -848,7 +848,7 @@ the kernel build produces a warning to that effect.
>  ``do_strip``
>  ------------
>
> -If ``KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`` is defined, this task strips
> +If :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS` is defined, this task strip=
s
>  the sections named in that variable from ``vmlinux``. This stripping is
>  typically used to remove nonessential sections such as ``.comment``
>  sections from a size-sensitive configuration.
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index c92b195ff..1629df99f 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5623,6 +5623,11 @@ system and gives an overview of their function and=
 contents.
>
>        See :term:`KERNEL_ARTIFACT_NAME` for additional information.
>
> +   :term:`KERNEL_IMAGE_STRIP_EXTRA_SECTIONS`
> +      If this variable is set, it should contain the sections to be
> +      stripped from the ``vmlinux`` image by the kernel-related
> +      :ref:`ref-tasks-strip` task.

An example would be nice:

"""
For example::

   KERNEL_IMAGE_STRIP_EXTRA_SECTIONS =3D ".comment"
"""

Thanks,
Antonin


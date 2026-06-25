Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710EFCDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 08:17:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6533.1782375451835231712
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 01:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DT9PJ+mG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 08A231A0996;
	Thu, 25 Jun 2026 08:17:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB0B15FF03;
	Thu, 25 Jun 2026 08:17:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0306F106C8077;
	Thu, 25 Jun 2026 10:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782375449; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IvGXjCRJQQnXnh2nnOAsGmU2gVEicAGPk6PPAhpdsAQ=;
	b=DT9PJ+mGv2XbsZUwddg1CWGHs+Jin+7LtuVUZAoTv45ztcmnLk+vvCe1Au7EU8HKVFE2q0
	nNX5fRYQukWFjKGZQVxaq0ufrWhbXj0gobY6/rkBi3vRP5rq8W/Ww1/16b/nIdAIDrYBmq
	z7Ay42fuoJMPc4Y2HPcuYWZOSn9dmxduGFtgCfuBeTsJKmsIi9e0xTKCGMTwprQxRassNe
	NSBYWckWReu3VhgdTfjsysxAViOVGu6974Py+0XFkIeUlqNImCR0e4VW5wl9IsZPyQv5nO
	L30KPxb8cZ70sqwCg4qJXyrTQmw7qlGIwBR/P6cV6og32s+XIFcOebr4JgEHcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 10:17:28 +0200
Message-Id: <DJHZD547JEQV.2IBYR1I7NBF7E@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: add missing entry for
 build/tmp/deploy/spdx
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <87401ea3-1ac5-48c3-c579-4bb673e5820b@crashcourse.ca>
In-Reply-To: <87401ea3-1ac5-48c3-c579-4bb673e5820b@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 08:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9875

Hi,

On Wed Jun 24, 2026 at 2:40 PM CEST, Robert P. J. Day wrote:
>
> There is no entry in the Build Directory section for the directory
> build/tmp/deploy/spdx, so add it.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>   i'm going with SBOM referring to the entirety of all that SPDX info.
>
> diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-m=
anual/structure.rst
> index ff84b250b..0e8674d68 100644
> --- a/documentation/ref-manual/structure.rst
> +++ b/documentation/ref-manual/structure.rst
> @@ -539,6 +539,16 @@ licensing, see the
>  ":ref:`dev-manual/licenses:maintaining open source license compliance du=
ring your product's lifecycle`"
>  section in the Yocto Project Development Tasks Manual.
>
> +.. _structure-build-tmp-deploy-spdx:
> +
> +``build/tmp/deploy/spdx/``
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +This directory contains a Software Bill of Materials (:term:`SBOM`) in
> +:term:`SPDX` format, as explained in detail in the
> +":ref:`dev-manual/sbom:creating a software bill of materials`"
> +section of the Yocto Project Development Tasks Manual.

How about:

"""
This directory contains JSON files in :term:`SPDX` format which are used to
create a Software Bill of Materials (:term:`SBOM`), as explained in detail =
in
the ":ref:`dev-manual/sbom:creating a software bill of materials`" section =
of
the Yocto Project Development Tasks Manual.
"""

The sentence as it is sounds off to me.

Antonin


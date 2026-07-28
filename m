Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39CFC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:31:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6479.1785223886218599685
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iV8x29sN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E91CC1A1281
	for <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:31:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE941601BF;
	Tue, 28 Jul 2026 07:31:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E65E11C13DDA;
	Tue, 28 Jul 2026 09:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785223879; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q6aDdGk13rP55ZieTg6QKkvwlEhy13VuBJLzugviEz0=;
	b=iV8x29sN+xy+w+1l+q32YMwyq8GMwWsEOqqSz4OSY0KKGAmCw9RebcKsS/OOn05eMqooRt
	kE3o3yCKGZLwDN8NWySmLRgg8mjjgEawD1XIp5zAXuNMDstBV8sJKi91Xzf0lDrsJRFON4
	CtQQc7GO4cCckic1zulcg+VK7PtuyP/7ydS9fh5UBesqW/Gz+lez7zEMS8QFKGrhK9FN1A
	iIcZDFVzJjaMPhk9NijouqiNR0078h9QDM5AmD5Ps69iifd2fBRysW2Dq7pj7YdGz//6Zy
	lW3ImFYWqBoX4kINFU71d3WuKCpEHOvuzqfJL+mVSzMBlGADtQE4QngeP7j+/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 09:31:18 +0200
Message-Id: <DKA11RVSKMIV.2KTHUGS1LWTID@bootlin.com>
Subject: Re: [docs] [PATCH v2] features: Add distro feature "audit"
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <joerg.sommer@navimatix.de>, <docs@lists.yoctoproject.org>
References: <alchGk8fYN2cPmGa@navimatix.de>
 <db22bdb6f13cb1a7159a9284058eba3f07a4a700.1784236750.git.joerg.sommer@navimatix.de>
In-Reply-To: <db22bdb6f13cb1a7159a9284058eba3f07a4a700.1784236750.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:31:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10161

Hi,

On Thu Jul 16, 2026 at 11:25 PM CEST, J=C3=B6rg Sommer via lists.yoctoproje=
ct.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> Changes since v1:
>
> * I've added a link to the documentation wiki.
>
>  documentation/ref-manual/features.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
> index 77d034f0c..d12b7fa13 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
>     section in the Yocto Project Application Development and the
>     Extensible Software Development Kit (eSDK) manual.
> =20
> +-  *audit:* Enables `linux-audit <https://github.com/linux-audit/audit-d=
ocumentation/wiki>`__ support.

We haven't received feedback on whether audit should be added to OE-Core, s=
o at
least we need to note here that this recipe in available in meta-oe. By add=
ing
the following note just below your addition?

.. note::

   The ``audit`` recipe is provided by :oe_git:`meta-oe
   </meta-openembedded/tree/meta-oe/>` in ``meta-openembedded``.


Thanks,
Antonin


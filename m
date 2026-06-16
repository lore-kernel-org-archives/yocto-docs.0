Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB07BCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:34:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154341.1781616880457445650
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iUeGLsic;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1001EC2BB32;
	Tue, 16 Jun 2026 13:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CCF2601A9;
	Tue, 16 Jun 2026 13:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A41F106C9D87;
	Tue, 16 Jun 2026 15:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781616878; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GsGj9laiYSu8TIUDwBuWrEhd7wjfrDzNFSYZB2hQlJ8=;
	b=iUeGLsic7Dqqb6/Q03+m0EEZbDnETE7fvxMhsbjkmtj7NQKgs2HEuWBGlAiuCRNhmkv817
	V+LbQWzQt/QRIHsHqOhaBNNOn4hV789D1r+Dh6/29hEWAW7vB9qdtnybdRavF7bu7aWvzW
	5xfi7c96koX9xGrvvA6o6W+CNdAbpPJ3tGQOFc7NC4W0usur8XqT2CjN7PhdQLyNwh/si1
	hsdPW5NkM8ZH7evC1JiUoTjBRZa3cdBoRbNKAPOge45vZXQhri5J9NT42UxZLyS6qemaUP
	zsflztu4MFCtXMyGCPg6Y64nzPi5bftQ4fE4pNX+5Ha6wJ3yS52HBLC0NrrlJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:34:36 +0200
Message-Id: <DJAIH1ZSQRDF.2RZZVZEHU1OYO@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: add second way to assign "PV" for
 external SCM
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <f1c6733a-a659-a78d-1b41-474b3103328e@crashcourse.ca>
In-Reply-To: <f1c6733a-a659-a78d-1b41-474b3103328e@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9740

Hi,

On Fri Jun 12, 2026 at 9:58 AM CEST, Robert P. J. Day wrote:
>
> In addition to hard-coding a PV value in the context of an external
> SCM, show also just appending the string "+git" to the value already
> calculated for PV.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/external-scm.rst b/documentation/de=
v-manual/external-scm.rst
> index 3ca9079b3..4492de9cd 100644
> --- a/documentation/dev-manual/external-scm.rst
> +++ b/documentation/dev-manual/external-scm.rst
> @@ -13,9 +13,12 @@ Subversion (SVN) and Git.
>
>  To enable this behavior, the :term:`PV` of
>  the recipe needs to include a ``+`` sign in its assignment.
> -Here is an example::
> +Here are a couple examples of how this can be done --- the first
> +hard-coding the value for ``PV``, the second simply appending
> +the string "+git" to the value already assigned to that variable::

s/already assigned/already extracted from the recipe file name/ ?

This is why you'd append, I don't see any other instances.

>
>     PV =3D "1.2.3+git"
> +   PV .=3D "+git"
>
>  :term:`Bitbake` later includes the source control information in :term:`=
PKGV`
>  during the packaging phase.


Antonin


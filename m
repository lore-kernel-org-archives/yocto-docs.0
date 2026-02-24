Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E17E9B258
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 12:43:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19571.1771936973580091042
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 04:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WWMJebnk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2575CC143E1
	for <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 12:43:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C2A75FD9D;
	Tue, 24 Feb 2026 12:42:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4BB10369097;
	Tue, 24 Feb 2026 13:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771936971; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zyn31soSdysDQBXvUOJow3bEFNbeEEgUD0lwe3aVM8U=;
	b=WWMJebnkN3eFa6+8SXaRBxoDydnxmP3D3zhluzLqbtcImCkRP1kmTv4ZyjH2VzFVolXYtS
	M5xT5hTeRbZS8xUQ2fPnLsPDsveqg2ewMc1PNJne+iIqZEx7W3AfeeDQPkO7pEuUOdMAp8
	IovVIIFrbeZNasPaUIG9WcwUPhtXByO4VMnsUOiayxmFWeH44XvyJu27eSqr8pIFbQNF27
	04cA2pSCFIjbr9Kffx0G81MPAkJy19Bx8Zeav56t3ji6/IkdtNPVJPEGCSn73VdXHgLHBm
	2JsnYTqtWr2Sl5ZF1Mum2TxvWbYb+tUzd6Otg/uAVcfZ43uJ2EVasgBdE1rIzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 13:42:49 +0100
Message-Id: <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
In-Reply-To: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 12:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8967

Hi,

On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
>
> Add that the RSUGGESTS variable would be processed only by a
> supporting package manager when installing packages from a
> package feed.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 208b5e43d..92476d509 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8361,7 +8361,9 @@ system and gives an overview of their function and =
contents.
>     :term:`RSUGGESTS`
>        A list of additional packages that you can suggest for installatio=
n
>        by the package manager at the time a package is installed. Not all
> -      package managers support this functionality.
> +      package managers support this functionality. This feature takes ef=
fect
> +      only when the package manager is being used to install packages on
> +      the target system from a package feed.

Could you add a link to the section explaining how to enable this?

"""
See the :ref:`dev-manual/packages:Using Runtime Package Management` section=
 of
the Yocto Project Development Tasks Manual for more information on the
package management feature.
"""

Thanks for the patch,
Antonin


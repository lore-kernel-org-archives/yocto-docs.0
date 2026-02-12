Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E74EB48E8
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:50:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41648.1770886211139909006
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fwFBv1f8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8453DC23D90;
	Thu, 12 Feb 2026 08:50:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69CCE606CA;
	Thu, 12 Feb 2026 08:50:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92A80119714FC;
	Thu, 12 Feb 2026 09:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770886208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gCDxcaOe8iDWzpxeennvBRNIKcNZjpxEQO++lFMI8Cs=;
	b=fwFBv1f8C20d4rOhuqgaf8bdtn4mqas3pBaEQ2gyrhLzp73J3AOx8m8fD18NYiUgJJIBeW
	xQR8Lw550VTVgQjYNmLRZ5bb4GcjiAKsLi4knAq2Pi6DYHu4qKhhOtGrwRsCIVEjSCoYFW
	/ZS0RIslhVO25qGhaRTiNKxOBP0+bMYDx4+chdhNSYLb9iS8pWCzg/6vTUiBbo5/WC+P2k
	Lbsyk+aYnG3Lh2WCSSKkbXvji8SiT8kl0E4zUWsSm1BpKiEnCCNWHFmVcqcbmIwzuOGR/2
	HayNwSrZcMsvk5g5GnfqQwhIuoiA9lWx/uHTcg00+v8kOd7FFqS+HfZnO7j/+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 09:50:07 +0100
Message-Id: <DGCUROORFMR0.ZZUIPYYRXZXE@bootlin.com>
Subject: Re: [docs] [PATCH v3] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de>
In-Reply-To: <20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8901

Hi,

On Wed Feb 11, 2026 at 4:25 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/doc=
umentation/tools/host_packages_scripts/pip3_docs.sh
> index 907ecec55..3e4045e7e 100644
> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
> @@ -1 +1 @@
> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
> +sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sphi=
nxcontrib-svg2pdfconverter>=3D2.0.0'

pip3_docs.sh is not used for ubuntu and debian, meaning we need to find the
equivalent package to add to
documentation/tools/host_packages_scripts/ubuntu_docs.sh, or write a custom
pip3_docs.sh file for ubuntu/debian.

Or drop the ubuntu_docs.sh file and use pip3_docs.sh for ubuntu/debian, whi=
ch
would make this kind of mistakes unlikely to happen. What do you think?

Antonin


Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458BECDE012
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:54:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30286.1782460452183597835
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 00:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ird/qrWw;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EFCE4C5CD64;
	Fri, 26 Jun 2026 07:54:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2653060232;
	Fri, 26 Jun 2026 07:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED463104C976F;
	Fri, 26 Jun 2026 09:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782460449; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GxpFUu76g/dbV9bFKKmzvRDhvslkyV8yf/2kNhTxh7I=;
	b=Ird/qrWwnZ8g4iLy0NB3wWHXcEYW28+u+La1UdY956iFD1Dyd3Vyrgs48YE9Or7EMmgjM7
	8tPJkRyFjGu1990Qoeuz1yEv9gbOpztz+tS3vHz3dyQhSx3idA2Jtzc/3hQEBT1MEPVBrE
	kqeI4jCnX3fJx1My+HZk0qbZfSD7tPBdvWhKsBuA1ietPd/4dZVKwGYItm/kgHAsYGN6mD
	vA+PUA+ez2YTpoHXp6wUn3WukmBqYj8/N+l1+mOylqZtDNURgvWSVK3JOUBkAJjVFg7BQp
	9jLsih3dXhGsUXs3CfJgPUMAiAhWG214ohjL+5ROSqYqO8qG7g5LJVOBDEBdMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 09:54:08 +0200
Message-Id: <DJITHTKC9E7R.GL4SZH0CH92V@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add more explanation for
 ptest-related tasks
References: <f164c2a2-623b-a0b9-f0a9-de488e3c90b8@crashcourse.ca>
In-Reply-To: <f164c2a2-623b-a0b9-f0a9-de488e3c90b8@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 07:54:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9902

Hi,

On Thu Jun 25, 2026 at 5:42 PM CEST, Robert P. J. Day wrote:
[...]
>  ``do_install_ptest_base``
>  -------------------------
>
> -Copies the runtime test suite files from the compilation directory to a
> -holding area.
> +As defined in the :ref:`ref-classes-ptest` class, this task contains gen=
eric
> +installation code that will be invoked for all ptest-enabled recipes to
> +install the associated ptest package::
> +
> +   do_install_ptest_base() {
> +      if [ -f ${UNPACKDIR}/run-ptest ]; then
> +         install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +      fi
> +
> +      grep -q install-ptest: Makefile 2>/dev/null && oe_runmake DESTDIR=
=3D${D}${PTEST_PATH} install-ptest
> +
> +      do_install_ptest
> +
> +      ... snip ...
> +
> +   }

I am reluctant to include copy-pasted code-snippets from OE-Core, they chan=
ge
over time and add maintenance burden. Can you remove it?

Antonin


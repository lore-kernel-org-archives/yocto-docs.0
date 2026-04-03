Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503E9D730BC
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:06:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7155.1775203585803609932
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2026 01:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nLN1Vh9v;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C1B54E428CE
	for <docs@lists.yoctoproject.org>; Fri,  3 Apr 2026 08:06:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 025FC603C1;
	Fri,  3 Apr 2026 08:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A1C3104502AB;
	Fri,  3 Apr 2026 10:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775203583; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TO+F3FSz5FyXl1sCFMdG9ajcfr3MrZbhGE7x8ENig7I=;
	b=nLN1Vh9v1iQ/bwUun8+wjVMjKXWUS87Sq1qDN8JzN0t/WMDdIC96qdU5OxYgE2c8LEeCuY
	CbV7nrezt9Xg72jvdB3yL4GIIRQmECQMZsHGDBax/GkITY9k0sgVUovP+twO3ozzO30MAx
	XlHj8stAiJve0NU8Tt4j68lpzqYTX8cEcTFnlsDkMFCP6vBbt/xuReVPS/tf2AqcD73W5Y
	/mFH52lii4P7Cf5+HPySZ64LCbA4916RUkfkQJwcispAOJHfr+pqOvQcnu6fGefEKHfLC3
	yxWUVRT5nXAlUJKhsSzcyaEwjbYMQ5ElofPOSy0D1b3OtrKkc9R0FESannlpqA==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:06:22 +0200
Message-Id: <DHJD5FDDVNJB.PNZLGSKXTQIY@bootlin.com>
Subject: Re: [docs] [PATCH 0/1] ref-manual: add Gentoo package list for
 build host setup
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "aurelien" <aurelien@hackers.camp>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260402164218.210974-1-aurelien@hackers.camp>
In-Reply-To: <20260402164218.210974-1-aurelien@hackers.camp>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 08:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9172

Hi,

On Thu Apr 2, 2026 at 4:42 PM CEST, aurelien wrote:
> The documentation currently has no Gentoo section under 'Required
> Packages for the Build Host'. Third-party guides commonly reference
> incorrect Gentoo package atoms (dev-util/chrpath, app-text/chrpath,
> dev-util/cpio) which do not exist in the Portage tree, causing
> confusion for Gentoo users trying to set up a Yocto build host.
>
> This patch adds a Gentoo-specific section with verified package atoms
> and notes on the common naming mistakes, along with a reminder about
> Python version compatibility for Scarthgap/Nanbield.
>
> Verified on Gentoo Linux (OpenRC, amd64) against the Portage tree
> as of April 2026.

The reason we don't list some popular distributions here is because they ar=
e not
tested on our test infrastructure (our so called Autobuilder [1]). For that
reason, listing untested distributions here would come at risk of breakage =
for
people without us being able to support and properly test things on our sid=
e.

Also, adding new distributions here comes at a cost, as we need to maintain=
 the
package list over time for these distributions as well.

I suggest you propose this change to the Wiki instead [2]?

[1]: https://autobuilder.yoctoproject.org/valkyrie/
[2]: https://wiki.yoctoproject.org/wiki/Main_Page

Thanks,
Antonin


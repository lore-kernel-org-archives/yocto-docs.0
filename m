Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9F7F36C5C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 12:14:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17747.1776687258154291708
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 05:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bwOlUDeB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F0C361A3371
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:14:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7BA85FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:14:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72BF710460869;
	Mon, 20 Apr 2026 14:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776687254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O0hddIdIxDBHow2F+qbd8Jt8+ubFUNuV0Dynd/N8Cxw=;
	b=bwOlUDeBQAglPJFmTjO2HmQNPd4D5xK/uytFtdwtmb14dQLh2Bb777NEqrHKVdyV54m78x
	iqsUcpOw0z+Yl+Wa8wqM2q4KKXpm3aCXX9tHnev0qsSjJ2I8oiePfKnN6YHAaFXv1xB/lH
	n9kAzuG30yj8iFT8RDm6mujy9v/lfp5e9qEiB9F9mrBxKWOkRfoKD1bDZX2iiSIyg2zLJU
	bmU/iMZgOL4Xx/34l/RrFQsZlYJscJ9jpJwVLmac4BpnVQSZcIUHUr3Wrg3g20oAVqXDcu
	83RavWY+Dyrt8sLDzMI74AWi7y4kFTdELsxYzcHL1YghfPwwGJvadtjBxJLQMA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 14:14:13 +0200
Message-Id: <DHXZ2GGKEOL2.3HHYILCUSYA9N@bootlin.com>
To: <docs@lists.yoctoproject.org>
Subject: Re: [PATCH RFC] sphinx-static/theme_overrides.css: switch to a
 fixed width documentation
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260202-fixed-width-html-v1-1-e987deb9926d@bootlin.com>
In-Reply-To: <20260202-fixed-width-html-v1-1-e987deb9926d@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 12:14:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9290

On Mon Feb 2, 2026 at 11:47 AM CET, Antonin Godard wrote:
> Change the css rules of our theme to have a fixed-width documentation
> instead of it taking the full width of the page. I believe this makes it
> much more readable compared to having long lines with few line returns,
> especially on high-resolution displays. Set the width to 1000px instead
> of the previous 800px, which felt slightly too thin.
>
> I think the removed comment here does not make that much sense for us.
> It was added by commit 0c1e108bc6c4 ("sphinx: add CSS theme override"),
> and I believe is a simply copy and paste of what was is set in the Linux
> kernel, added by commit 9abaf979abb2 ("doc-rst: customize RTD theme,
> table & full width") [1].
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D9abaf979abb2

A preview of this patch can be seen at
https://docs.yoctoproject.org/next/index.html.

Any feedback appreciated! I think the docs are more readable like this.

The only drawbacks I would see are:

- Large tables are a bit less readable (but we only have a few: in the rele=
ase
  notes and on the list of supported features, IIRC).

- Detailed images are not as readable (but can be clicked to be seen fully)=
.

Thanks,
Antonin


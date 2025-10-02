Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393EFCAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 08:06:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.3541.1759392392540575148
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 01:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DGL+ol7n;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60E23C011C5;
	Thu,  2 Oct 2025 08:06:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 381F56062C;
	Thu,  2 Oct 2025 08:06:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECFB9102F1984;
	Thu,  2 Oct 2025 10:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759392388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XpJNw5v7CZs3ZooR2eToVTb6Gms+YeG6xF9mYTxofXQ=;
	b=DGL+ol7nSzuTRQ8E3uVuL9fDgAOTZ7iQpEO/e4XZRCOYs9vw+ZZKBCTBazmbE6ZD/aIrCz
	l7Xk+KpGxgtmk8fF4e15i/5xv7LNdy75gkapjPix5CBYdG5mNHJmQEiwiIsXAhXZG3iQqB
	Em74Wuy/0kwHDs4UXzEBBmyXOex0kpfOz05t7hVpbju2O9KsQr3CQzTAB6nmk2uBSOJuNt
	ZPvG+tslll+mYppHLPHM91+y1nSYnzJ1hS51uEZAzpAuwrJYNXEBBk3B7+Plmxatqxl7Ia
	3835eMf+jhAy7xizM5Q5cOlXLftQZtdgLH0nrn5PVzaMHAN1vAHweD2T6yo3Lg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Oct 2025 10:06:26 +0200
Message-Id: <DD7OJSHV5WM5.CQ4U14E37BW7@bootlin.com>
Subject: Re: [docs][PATCH 2/2] ref-manual/classes.rst: add diagram for
 classes used by base.bbclass
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Talel BELHADJ SALEM" <bhstalel@gmail.com>, "Gyorgy Sarvari"
 <skandigraun@gmail.com>
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-3-bhstalel@gmail.com>
 <DD1YBMXM5MUJ.2N2XDSIL5KN6P@bootlin.com>
 <d81a1245-ad48-49e2-ad01-111102059a54@gmail.com>
 <CAOgG7m3FSG44kT_2j5kpMkShDwjjW60LoSABijLAGDQjibAQgg@mail.gmail.com>
In-Reply-To: <CAOgG7m3FSG44kT_2j5kpMkShDwjjW60LoSABijLAGDQjibAQgg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Oct 2025 08:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7632

On Tue Sep 30, 2025 at 1:18 PM CEST, Talel BELHADJ SALEM wrote:
> Hello,
>
> It seems that Inkspace really requires time to learn, it is not easy as
> draw.io or other platforms.
>
> I planned to add lot of diagrams as the documentation is really missing
> diagrams.
>
> I have to learn Inkscape then.

If it can help, there is a documentation/template/template.svg in yocto-doc=
s
from which you can base your diagrams on.

As Gyorgy said, if you are able to export the draw.io diagram in a proper S=
VG that
we can edit with Inkscape, it would be ok as long as you can somewhat match=
 the
Yocto Project template.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



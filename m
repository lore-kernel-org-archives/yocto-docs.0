Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8509DCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:19:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154008.1781615974680157817
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 06:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=T8RIhze1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1AEE0C2BB30;
	Tue, 16 Jun 2026 13:19:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87565601A9;
	Tue, 16 Jun 2026 13:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F983106C9C8D;
	Tue, 16 Jun 2026 15:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781615972; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HAygVmIvWeHvZc3FJRvOu6XFnyVMAmX9re+c7CNsdCA=;
	b=T8RIhze1Tq5jOqNBI7eOqt1wOT5qX1IJE7U0S652ANDN9x4l3Y7TLMV2cZZqA4N6lHGWOZ
	4xLf8TtT5oOafyn4ad8yK0Ma8+akRX+vYCH5fGmf8V0QN9LRimgpalAkf5Knb+qtha4jrD
	ONr12LKA42GkFAsmqupZU/TpSxGGXUD+mX50yY2T2cRqFSY6VXHiTCBYYg3dD02HQcbL0C
	p3ota+Eh5FUR0MvlAyWI5kmZDLQfaSlpHkpljw/xielh/+JLcc9f3EC5JaRxT0c+j0mSvp
	Ozk466+XiaDnFbEm3lLXKmy0z1ftT4MIOyZl5CZVR0IaoacS7s5TkH+aBKnH5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 15:19:31 +0200
Message-Id: <DJAI5I31FHVH.2S82G1TK9Q85P@bootlin.com>
Subject: Re: [docs] in what context is "sysvinit" the "default init manager
 for YP"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <189ec6a5-2ab7-a0cd-4e88-b0a6f017712e@crashcourse.ca>
In-Reply-To: <189ec6a5-2ab7-a0cd-4e88-b0a6f017712e@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 13:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9739

On Thu Jun 11, 2026 at 10:02 PM CEST, Robert P. J. Day wrote:
>
>   here:
>
> https://docs.yoctoproject.org/dev-manual/init-manager.html#
>
> The opening sentence is:
>
> "By default, the Yocto Project uses SysVinit as the initialization
> manager."
>
>   that claim is confusing since if one initializes a build using basic
> OE, the default init manager is, of course, systemd. OTOH, if one adds
> the meta-poky layer to the build and selects:
>
>   DISTRO =3D "poky"
>
> then, yes, the init manager will be "sysvinit".
>
>   so is it assumed, in the docs, that a YP build will implicitly
> select the "poky" distro? should that section be expanded just a wee
> bit to explain the possibilities?

Outdated docs. You can replace:

"""
By default, the Yocto Project uses SysVinit as the initialization manager
"""

by

"""
By default, the :term:`Poky` distro uses SysVinit as the initialization
manager.
"""

Antonin


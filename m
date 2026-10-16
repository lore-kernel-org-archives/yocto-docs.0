Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB754CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 12:32:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20466.1792153939706515302
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 05:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wXtJPqqs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C3E41A1235
	for <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ED966075D;
	Fri, 16 Oct 2026 12:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 036A9103281F4;
	Fri, 16 Oct 2026 14:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792153932; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1JXHOTTjczijDahZK/QeeosOr0POaoln0rWu5PFJMQs=;
	b=wXtJPqqsl/OuJMAiPHi6PTK9n8C2PKdaeuhN6hiZdJ3ZC+CEQPTD/xdgGtlo9ThajUt2XG
	vvfYXbMbKlraJPMpWJp2pWJjrwGydnf7/U0nyRILUrNouoktXV6RJ+x9F6uB7zsyaM+niQ
	TlaOEm7lfu8z75t9GLgH5tV5po5RXGAGPOn3ffwg68NhuGfiuFyfLRNfFr/qAWEO0EPOwX
	fPWcBrvaVuGvqAkE/QO4ho80GW8dhH6KXzeC8k9Hq2EKcW79v0HrM9b4p0og+8la1vdl1M
	LKzlIjJd5OCr9CHvaBNrudHrcCVFJZSdKdfPoZjzdgYh9hDHYiCJ1NYDAozaKQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 14:32:10 +0200
Message-Id: <DM69JPLMA50U.3VATVP3WUMFK5@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v3 1/4] dev-manual/devtool: fix non-patch local
 file handling docs
References: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
 <20261015200726.2391599-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261015200726.2391599-2-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Oct 2026 12:32:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10691

On Thu Oct 15, 2026 at 10:06 PM CEST, Adrian Freihofer via lists.yoctoproje=
ct.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Non-patch ``file://`` entries in :term:`SRC_URI` no longer end up in an
> ``oe-local-files`` folder: that mechanism, along with ``S =3D WORKDIR``, =
was
> removed in 5.1 (see migration-5.1.rst). Whether such files reach
[...]

Applied to master-next, thanks!

Make sure to rebase on master-next, as there are some conflicts applying yo=
ur
patches there.

Antonin


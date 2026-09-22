Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44963C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:18:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5215.1790065091256545145
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 01:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y+GEmChu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 84D3C4E40ECD;
	Tue, 22 Sep 2026 08:18:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A34B60580;
	Tue, 22 Sep 2026 08:18:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 893DA10329206;
	Tue, 22 Sep 2026 10:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790065088; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LePKBEm6KjsABUlAk8lpeEdJAAfNanjiTfPqbDOI8Fw=;
	b=Y+GEmChujM4JpU3HGh/C5WjwYoTIDIGr6aLHA6bJFp5kKQUwz7J1aNf7Rt5cRTRI5HJNrt
	7ZGFcBMfVCcMA2fYpsgGyvYXFuo744Qxojpujur2LcyprJBMH5wW+VuYtIm4w3LIy14ycV
	F+l89jHU4YmcVRCIvcxdrlxPQuvdazh8/f0ee5vuyNwIwCofWtHXVRmeEPOcrqLBl2RRj/
	ZBEpi/HOQPvI59YRf2imDMtI/ON5UiV3rTaFOHEgdqK1Q6AV5jffBsxSBF2TlyRtXRbwNV
	AaSB93RaR7Uq06/vnD+0LzAlUkG1uhOcoVYVYM10j8GRwZ3nHesx6oPMFoxmRA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 10:18:08 +0200
Message-Id: <DLLP44WE4SFH.RULDXNJ48QG8@bootlin.com>
Subject: Re: [docs] [PATCH 1/4] dev-manual/devtool: fix non-patch local file
 handling docs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.21.0-139-g69cc59f49d35
References: <20260911150750.75697-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260911150750.75697-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 08:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10574

On Fri Sep 11, 2026 at 5:07 PM CEST, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Non-patch ``file://`` entries in :term:`SRC_URI` no longer end up in an
> ``oe-local-files`` folder: that mechanism, along with ``S =3D WORKDIR``, =
was
> removed in 5.1 (see migration-5.1.rst). Whether such files reach
> ``srctree`` now depends on :term:`S`: they land directly in ``srctree``
> only if the recipe sets ``S =3D "${UNPACKDIR}"``; otherwise they are
> unpacked into :term:`UNPACKDIR` outside of ``S`` and never reach
> ``srctree``, so they must be edited next to the recipe instead. Update
> the ``devtool modify``/``extract``/``upgrade``/``finish`` descriptions
> accordingly.

This patch looks good, thanks.

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin


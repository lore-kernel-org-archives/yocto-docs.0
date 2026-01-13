Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E27D2D0F6
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 13:10:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.58452.1768309820749649677
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 05:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=GKHXH3hv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9BF304E420A7
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 622D160701
	for <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8E41103C9270;
	Tue, 13 Jan 2026 14:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768309818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sIMG/z2FsXsN0Pa+zXMYX8wRPtwhbqs5mtYJE6eA+j4=;
	b=GKHXH3hvvHRkkbea4me1LbWVyiWb6Qfs9MouExj9tPKBaNlM45VCHlYVFGkuqKa02UbdF9
	7TTNvqliud4FW5k9jjBEPnwNXm2wfYJH6j0OnWuiWCcXAuMRtUfdzPoq0NnzxaXRiAMpXj
	ihbx03Gwd5ZWi4saIPDPARQGPq7JH1B9kIt3JHfbZjqKBLpKqnvtHGhrR7UC3wIuEwpGVG
	lM/NSMpkRAQToZmbNu37WL4Kgg/0GFpe0k4K+iuWujJSj5OO33C3D7hfeDFuanno9Awefm
	6jhLgaxiKUj8DKFAReOuBOv1IdAoEXF084FaO/o1j9/y+GBU41bWYMm21jO/3g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/3] Add a security manual
Date: Tue, 13 Jan 2026 14:09:51 +0100
Message-ID: <176830971042.418327.9449106930312268030.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
References: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 13:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8497


On Tue, 06 Jan 2026 16:34:30 +0100, Antonin Godard wrote:
> As stated in the first patch, this section of the documentation can be
> used to collect best practices with regards to security and the Yocto
> Project.
>=20
> Having a dedicated section also helps putting security to the front pag=
e
> of the documentation.
>=20
> [...]

Applied, thanks!

[1/3] Add a security manual
      commit: 3dc9307e429a0eca40b5e49dacffd04bff99222d
[2/3] Move security related manuals to the security manual
      commit: 38a324d2d3e171c26eeb2120383e3a04d70a9c99
[3/3] security-manual/securing-images.rst: remove old links
      commit: 68851e0256fade849feece3a359a5d4892ab4828

Best regards,
--=20



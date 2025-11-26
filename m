Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017B6D10F43
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12177.1764162010225204690
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=F1drM9VI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 478FB1A1D77
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8A660721
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A6A9102F08EB;
	Wed, 26 Nov 2025 14:00:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e3DQ+lnv4Dy/WEB9AIRIEzmYk0x/I5+sC6a6dyl6zs8=;
	b=F1drM9VIM2wwNntV+LrytfplSLDF2ahRupzMZeXZqXi883h4eqDII5sfQdsuWYe1q5XQ1J
	qBhQRclhbE99/VtD6OZI036/N07k/4p3AuE9NT4usoKrblwlseNPdbggwdIYCj1FGsp7eW
	Nk2yL/0GEAeW/sOTZVwUsLQCCgRVC53k6ukO3/HoSTbgOMYx7+PFCR6mv6HBJyx30bCMXa
	jVEr7LmUx9b6YWsyIW8/C2DtnQUfy2sHxmmzSOAnydUUYIUXllo6oGmgVOuxDlhpMTktSX
	P02hSu/jWS0o869IQ3Ebc+RHJ9fccW321KjLIhNFt7pWSvEV7sI+3+0cG9azxQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] tools/build-docs-container: add support for ubuntu 25.10
Date: Wed, 26 Nov 2025 13:51:22 +0100
Message-ID: <176416145958.617433.3344243904863037192.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113-add-ubuntu-25-10-container-v1-1-700481817327@bootlin.com>
References: <20251113-add-ubuntu-25-10-container-v1-1-700481817327@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8128


On Thu, 13 Nov 2025 13:05:22 +0100, Antonin Godard wrote:
> Installing essential + docs packages went fine, and building the docs
> too (make publish), without additional changes required.
>=20
>=20

Applied, thanks!

[1/1] tools/build-docs-container: add support for ubuntu 25.10
      commit: 2d3edc85d46a9dd32cc5709e0c75f396bf22c617

Best regards,
--=20



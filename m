Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C00D10F48
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12183.1764162012293123078
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rFmb19Nd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF21A1A1D76
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 967D360721;
	Wed, 26 Nov 2025 13:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7485102F08EA;
	Wed, 26 Nov 2025 14:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vhOTJ1BVMTqI8cxB75a05ksVLPfXbb9GyrjHdTCFdCk=;
	b=rFmb19NdC6/t2uZ2K7kaU6O7jBJ/AAftQdfzdsEdG40znI2DC8anDDolWZbMADJ6x3FGNN
	RNld6Yv/7mv/CNeTmY+aPP2+TNtK/M4js6OCRlHgTmNhUzjwqLxA9BZKTOGsnWCmz4Zb9S
	bpb2z70ZGyJLWDef+oaBHvtGgoiEJJgkm7z1TRFGY/hhifq3DoSUhVOA9UTdV44FR7DTs7
	p8bRDF6yRFkP+h2dyHwKxDomDbykUqiNlCqxsCZBVfx3XzaAQcpF1/sd44YVUJnvLarHVc
	+2mzDt6QP1ex0XgBFUNuCOKHdZlb9apptU9dm04Pv4Q5wlQK5dv7N4BUWXnUrw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Walter Werner SCHNEIDER <contact@schnwalter.eu>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] kernel-dev: add disable config example
Date: Wed, 26 Nov 2025 13:51:25 +0100
Message-ID: <176416145926.617433.4126395571153584652.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103170449.86766-1-contact@schnwalter.eu>
References: <20251103170449.86766-1-contact@schnwalter.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8131


On Mon, 03 Nov 2025 19:04:10 +0200, Walter Werner SCHNEIDER wrote:
> Makes it more clear that the configuration fragment can also be used to
> disable a configuration.
>=20
>=20

Applied, thanks!

[1/1] kernel-dev: add disable config example
      commit: d38ef467081ee73bf23f240ace54b849a3a87612

Best regards,
--=20



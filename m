Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744DACAC5A8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.24177.1758118448882405757
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rKRKYlFr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 87B704E40CC9
	for <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EDC36063E;
	Wed, 17 Sep 2025 14:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97B31102F1BD4;
	Wed, 17 Sep 2025 16:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NL25Z2Rc+9QGrzzTGNIsO05L5xEBBK4fzitc+KS+QDc=;
	b=rKRKYlFrqZQUl2BOLKN/CMHPBjcg9JqAAU1yW8HDk0212NKSO+zuW6aVNklFsCSIrJmHFB
	QGftzt0wobNH5C2WT6xW2U76WUBO82g8xndZUhziqrW2VWdj/jTTh01ux6+rgBb9rgFYxX
	PADM9Y+BHau9fl+EIlNUN9yYJNjpwPpmU/JFqXHPGRs+MNLz1DfmAIFAEloB3yR1LdMeUh
	pPq5Ci1yH9ezlH5noQCZZwehR6WYj6hQv5f1nERhpO5FvD+/2eEF03kphGe9FCoRRuQIbn
	HOyAVMFOrmO7gIgiSEUeZsq2+tbZSFXvNz6yIgy0s9s/rmHeKBuWs9+xB+X8FQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	joaomarcos.costa@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	quentin.schulz@cherry.de
Subject: Re: [docs][PATCH v3] ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary entry
Date: Wed, 17 Sep 2025 16:13:21 +0200
Message-ID: <175811826409.690097.14189788312074835842.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901160759.556662-1-joaomarcos.costa@bootlin.com>
References: <20250901160759.556662-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7534


On Mon, 01 Sep 2025 18:07:59 +0200, joaomarcos.costa@bootlin.com wrote:
> There's a (second) overhead factor applied in images generated with Wic=
,
> and this is already documented in the .wks reference. However, the
> IMAGE_OVERHEAD_FACTOR entry does not mention it, and by looking at the
> partition sizes (e.g. with parted) one may find it confusing that they
> don't match with the expected rootfs size (e.g. in a scenario where the
> extra space is "0" and IMAGE_OVERHEAD_FACTOR=3D"1.0").
>=20
> [...]

Applied, thanks!

[1/1] ref-manual/variables.rst: expand IMAGE_OVERHEAD_FACTOR glossary ent=
ry
      commit: b9040e20b015e9b02683ec3014e4ade5eb59d41a

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>


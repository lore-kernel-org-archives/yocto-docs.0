Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B525C982D7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42788.1789659049598299412
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Bz/ftPAA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B697C4E407AC
	for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 860F95FAA3
	for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8B8711C7B08D;
	Thu, 17 Sep 2026 17:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7gNOkI/dqF44TYNZzmNnun0GWZbUJscHhEVo2sPSDo0=;
	b=Bz/ftPAA0Ql5c40mZs00yfwBkZqTRjv2+CIuscMEyVyVdBrsyecpmiP95YS3l3K53Nudiy
	ArWIC2u9IBMDMSQflKsAUouC9DmYUVCr06Dku+rpnlgB+oWWtaNq+T376uMJmV5i+OsvYP
	zrFvmX0OEKGB2yelGNe1AXM9kp09f1OQflxE25Q6BejiFd/yph3+9JGjXvrwSElLnapd4Y
	PViuQWLhig/mdZOUU9XMXqFG4bcOTbEsO/5xVjLN0OkY3areP2UkjpTb9a0RaRsKY17ZvO
	vJE7K62u1mjJQnfzWfyDUr4I6NsCjbvi/yZZyjBKsrOD6uhwBzo5IjoE+xIdww==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/8] Encourage setting global changes in the proper place
Date: Thu, 17 Sep 2026 16:52:39 +0200
Message-ID: <178965649662.302216.2130285232386472471.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
References: <20260911-remove-local-conf-refs-v1-0-322e1e9a232d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10524

Applied to master, thanks!

[1/8] ref-manual/terms.rst: Configuration File: precise machine conf file=
s location
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Df8bf7fd499ec
[2/8] ref-manual/terms.rst: Configuration File: split paragraph in a list
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Dc5e522d1d976
[3/8] ref-manual/terms.rst: Configuration File: use a link to local.conf
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D649a1df1ab54
[4/8] ref-manual/classes.rst: buildstats: remove local.conf default value
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D9ac06ca129c2
[5/8] dev-manual/wic.rst: remove local.conf mentions
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Df1936b49f4f6
[6/8] ref-manual/variables.rst: GCCVERSION: replace local.conf and mentio=
n recipe existence
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D642c81ef2970
[7/8] docs-wide: advise setting global changes in the proper place
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D3bcc05e93c4e
[8/8] docs-wide: replace hardcoded conf paths to structure.rst refs
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D1407e3463adc


Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6741FA0C4E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14682.1776347531022355038
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gS+LzMQA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49E3FC5C3D0
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B62960495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE1891046088C;
	Thu, 16 Apr 2026 15:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b50wnhNZ1R7Dy26qmMt5cK5XgpRwYYC/GphJP4xTb+k=;
	b=gS+LzMQAfg4HKUIyFGaOB5pKFqLkaKK0kPi3oeqEALH4Awl5npNmg660e01PwaS3EcDS2S
	sLfjzvkjj+FLQnKhmOhb9ceVH03ri8ipHvbFAsiDDP5AvyTbfCigJnIwfrmmwl8bpPGgHI
	9ywZ+cw9ufz40Y5Dv8NUS6s2HiBCvL/ygYzRHH13PaOryPYS72uhm1+Z53a3xOMYHdE2F2
	n8X+6v9TI/HbRp46mZGZZIRLZT5+sm5Dpow2k0LImunTwJ00QJc+eApG9CnlSZ3dXrCJ9O
	JGOOpPO4n90xn7LAJJC0DI7qUU0sqqEFMEy7HqfMTI7dBZO5DXJMzK4QeVJebA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] set_versions.py fixes
Date: Thu, 16 Apr 2026 15:51:05 +0200
Message-ID: <177634729832.75801.15813909996848393256.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
References: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9264

Applied, thanks!

[1/2] set_versions.py: fix seriesversion for milestone tags
      commit: 36ec3e67f9e37b5922feb89b693a4c32aab3ddc8
[2/2] set_versions.py: use bitbake "dev" version when our series is devbr=
anch
      commit: ead65d3bd90f060f1c2bca96ef166d8fc5b7e323


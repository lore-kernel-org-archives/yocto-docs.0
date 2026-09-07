Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF74AC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30381.1788769879415218811
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=iWoFcBlI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C4181A185C
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AE6760383;
	Mon,  7 Sep 2026 08:31:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7D7E11C7AEFF;
	Mon,  7 Sep 2026 10:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DcPDWpSvmWsyv2wd/du1w1GqOnp4G1BcgYm7A3ZXwMo=;
	b=iWoFcBlIGDp2LF5SSZ9bcHfGKt+v0SkXiA0tdVZ60X/Pyp5ppIiyiGCTQV2DD8D4qxpMcv
	1u9YUblcTAeo6BrAQUzeiZOn3XflOjlhLLtBIkKBYlHAGNdVwwJY1lyxKfSwobv+0kVbjb
	a8Avp/UpJIeWCRL7MxnIoi/6dEIefDAfzJJZJ+2l+xOwDFeHx8m8saK5NU95C1a0loWKaC
	Zsd1/viZJXwXa/2IknhKUQQz4Wf0Oc9A8zIyThFXj9AJ2OEfTskw+E5k/5g4ffeC9UIHtC
	kZkZ60fMYHKPLEZaNmGLrWF710XdSpWkFf4l2kmSlQnZ4t6nzaLrj9oJvOlz4g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] README: add references to recent security documents
Date: Mon,  7 Sep 2026 10:30:23 +0200
Message-ID: <178876977221.61738.2855206979601622503.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8ca675d0-b3b5-5602-5b0b-07099df7aff4@crashcourse.ca>
References: <8ca675d0-b3b5-5602-5b0b-07099df7aff4@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10441

Applied, thanks!

[1/1] README: add references to recent security documents
      commit: 32cc5209e60660f12dfc549dba55bce07d2e478d


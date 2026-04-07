Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98C6FEEF3E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81043.1775567620291747416
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=AZdDnBUZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CAE791A31C6;
	Tue,  7 Apr 2026 13:13:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3512603C7;
	Tue,  7 Apr 2026 13:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C13A810450143;
	Tue,  7 Apr 2026 15:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z9ND5eGiAo1aTTfECwBXNTXO5SVdX39UjJ07W0l3spk=;
	b=AZdDnBUZkzV2deY7FI9zfS778U9eYys9GqtcDVJ/9YymXSqQnRN+m99AvCHn4r3ZZ8CqNS
	714tHsYYyXBekeDvhmhWr4O7e3bSBk3bVReKA+AD+EGr0fq6m77H5ZLOPnASrpXTEOEZvX
	qcztoXjoDaLS71GGU8h6HeLIThvKEw1WMA7T03E9EOQ+rnC1IXZKMKuw9SO+jp4zaPxjOj
	1RefDkX3f5e+mrY7sTPxgOecs1A6R/zI8pwrQB2XFL7/sgQtT6n5fxNQNfN9dGdc0glhuG
	pnsyOX4L2lX1Ouhc5VIFkJ+ANUkj52xs4YKW4seJmZJtb7rrmjoNMirXqjXKcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	yanis.binard@smile.fr
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] contributor-guide/submit-changes.rst: Added missing word
Date: Tue,  7 Apr 2026 15:11:49 +0200
Message-ID: <177556742874.245356.10150500076487886417.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401151441.275754-2-yanis.binard@smile.fr>
References: <20260401151441.275754-2-yanis.binard@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9195

Applied, thanks!

[1/1] contributor-guide/submit-changes.rst: Added missing word
      commit: 4656516415d8ff6b1bc25ef64acabee01dd5a78e


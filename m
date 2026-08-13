Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF78CC5CFCF
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17469.1786622552306800582
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=BXLZaVzR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6A4E44E411F1
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AF52602B8
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5255911C4DE64;
	Thu, 13 Aug 2026 14:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lPfYv/n7cxw79P9Jg0ZvoFzXCydTW3x2N/rVSbD5lvI=;
	b=BXLZaVzRktIPoFUu92fKeYiYwKj8YQNZWYKTMeAyNLX4VPNQyFVD6dOTV03Eh81Y+bi+03
	0U6k3GpSHO4PWMRIDbACKhecrEo9F2BxslVLxcmatyDgeXBNaZT3GWeZ8UJ/v2PEnDK7nH
	MpZA8FjA4wfw0Sqldnm/6U7nzcHJCcrCtThzEcOVUOt5LC3PBosAQvofgbAKVMyodyEI5T
	sM4O92k0tLwaeQTQy1J4++ktKGR0gCdXG/WmH/5Q1rAhe4kwkXDW5+Cx3jy7QSXqWqWJih
	S5qDtn01WXXdmCJytnSBbWXjCQ1kRPpFVYx2EAB5LQD/Y+xM77jEpkYHRM40Zw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] docs-wide: remove CROPS references
Date: Thu, 13 Aug 2026 14:01:37 +0200
Message-ID: <178662237157.775933.6151689438582984310.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731-remove-crops-references-v1-1-530beef39baa@bootlin.com>
References: <20260731-remove-crops-references-v1-1-530beef39baa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10278

Applied, thanks!

[1/1] docs-wide: remove CROPS references
      commit: 95cf1ba327a3bcdabadf0ee96d6bf38d05c4c3dc


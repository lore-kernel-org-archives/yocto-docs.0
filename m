Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFB6C61DB4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17065.1787579151883854572
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=LjEdDJqC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 323474E4138E
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 081F85FFC1
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A90411C79573;
	Mon, 24 Aug 2026 15:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DGYtHTjBaeuOMHZzfFqcrHDpLWYCNAZvUhZnN50VVRo=;
	b=LjEdDJqC4+I/cbwmc43IEWnUIn+ldvuAnngSiv0e4fYd9ACbXc6+9JhjgtBHM3koW/fXIm
	uqtWcZeFaePQzpuerXbH/zzAxYnmJ9zNvWlVVefXUgzl8vLcxSZ3/Zv6Y8KIwZHqRWaccY
	cuqtXd1eSSuH45CYOmEvMNhgRcNVx7p87b6QP8yhEN7BM5ev3c+fgXUmY+SRP4roVTta+R
	v4yz5vgZwA0GQWsrhHIoXb/dIhzC7ivTP1acWJYn4Rm5RC41cCwwCgOj67UADxsAPhjzBr
	q2m9jVuOKVhWQ/b3zgCDnz5PboKCz96dslYjkPQLQu1+OJGn4fXciTHht8H/mw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] ref-manual: add uboot-extlinux-config class documentation
Date: Mon, 24 Aug 2026 15:44:19 +0200
Message-ID: <178757686706.159281.5427158067579971267.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813-uboot-extlinux-config-v2-1-e6c2e4b78afc@bootlin.com>
References: <20260813-uboot-extlinux-config-v2-1-e6c2e4b78afc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10328

Applied, thanks!

[1/1] ref-manual: add uboot-extlinux-config class documentation
      commit: 0ca79ce512afdd74193dd6fa21be6ddae34e5467


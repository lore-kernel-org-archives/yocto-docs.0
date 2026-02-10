Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C8AEA8113
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:07:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19154.1770728824603444064
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 05:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=nU0y57zx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 176D04E40BE3;
	Tue, 10 Feb 2026 13:07:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF171606BD;
	Tue, 10 Feb 2026 13:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C77B119D0A7B;
	Tue, 10 Feb 2026 14:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770728822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VbGZ1uKVy/KBtmw/kon9KqNxg2rebMZSW06QX+YfRo0=;
	b=nU0y57zxUIKDswRywCJ70T+yw4vgM7R/lksXsSsJaRKFwwkOP9tb6Q3uVEUxuT4EdbMiJs
	Ge3vOQLy1i2/zShu6iMmZx48z839hCLewLKHAz80IzaeOwcp+AWq6YPNccuUPEb5q/bneu
	tHaQOcIn7XFYRDrdl/EHPGdLmsoXkEpPu0jwsoikpSF7Ikpu5TrMfO1OErLMFlBMu5D0HY
	DlNNK2tzbe+faQjAZZ146nuaxNPwYJH1UbDmSK9XG0q86pmaXIqLBG3GMrW8yMZdCNCL1N
	FWTQ9FFOMaSG0DA/6DIJdqHSC4wQ6ZigRvxtYWjg4anlgK/8P1NgSmle7hsnAQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.15
Date: Tue, 10 Feb 2026 14:06:53 +0100
Message-ID: <177072734092.453512.14719574311512890037.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122030717.1284107-1-chee.yang.lee@intel.com>
References: <20260122030717.1284107-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Feb 2026 13:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8877

Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.15
      commit: 6256a73d71346275f06970c6b1be9df0dd59bc21


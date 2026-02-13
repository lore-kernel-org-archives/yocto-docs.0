Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D8EEF48F9
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67935.1770973647120773729
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=m6C1Uxmj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 881A54E40D2E
	for <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 630E1606CC;
	Fri, 13 Feb 2026 09:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 692E710368E24;
	Fri, 13 Feb 2026 10:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+jZIhMqo260PLDNpOZVRsIaweBr7i+K94hEHVDCy9gQ=;
	b=m6C1UxmjmrvZHusPKgnFppfG10D4WTfkYkZvtBgBLP/VYB+u9HQ/wOSZsduzMPWb2lGM8E
	T1xF3ERJ3aMMsfx4nuuTUsqYrO9864FSBlfc9CmLOYsARQKiVt2HxpEqFVvYbRN2TyTTre
	hw4zdgZzwRROx7pkawdyCgPAt1RF5gNErBssAgn+4fqT2//OQA8dlpsU8IzrrobscIc8Wb
	9rHYjCV30qeJat53iZOrtIfU5JYbn3oWfbRJv1La5eW0o1X5ZgduqcmFpl42ChvdYt9S93
	F14q4y9eJKuEhY76nZZFr8Oo+2d6EruRoBMRW3uzf2nsOud+/s0SR11EQwtR8Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] migration-guides/migration-5.3.rst: add note on *FLAGS behavior change
Date: Fri, 13 Feb 2026 10:06:48 +0100
Message-ID: <177097354671.48715.1340539356018446728.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211-note-on-flags-var-v1-1-81bdce729333@bootlin.com>
References: <20260211-note-on-flags-var-v1-1-81bdce729333@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8910

Applied, thanks!

[1/1] migration-guides/migration-5.3.rst: add note on *FLAGS behavior cha=
nge
      commit: 98840d241c681c5bd4080db57b3bd9d9f0740b94


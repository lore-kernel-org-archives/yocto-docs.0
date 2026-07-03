Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B70DC44508
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90612.1783079100522064833
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ozmM3liD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D75DC49F4C
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8723560300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:44:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB1BC104C94A6;
	Fri,  3 Jul 2026 13:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a6g5DP5eF9aoqXFAW7fsPVYu1t6SRDrpuR5BAsNUMOs=;
	b=ozmM3liDcefcuJeiw27XILu4l3N10Itw/vrKbofu7/ckabRwI0skRPe2dGP0utRTtw5jjI
	VJpBX03dIUoTzg2bsStnRIRO5AKt21p16pq3LnjAxjcyQs6S+AtBuOulC8k6e05tVZCjq/
	MYUYV7VcirtAuw/F6yir6GXeNSxXYNQr9iLdfX6OGEOFW5EAZNgFg9FhMkXYh0ty9mPQoR
	mI3nZxaJcelAu3nxhMTM2n1dnqr03gPLjmMRSHX/5rYs90vAy55jBGJs3luNX3n+r8e5/2
	RjgUUHkqRqshcmiYgmhTIZ0L0M03F+L3A4uABZGqsf6Rg7rQ3tAFSsw5mYdRjw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] Drop support for Fedora 42
Date: Fri,  3 Jul 2026 13:43:32 +0200
Message-ID: <178307887479.248663.324219268237116552.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
References: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10020

Applied, thanks!

[1/2] ref-manual/system-requirements.rst: drop Fedora 42 support
      commit: d36d204850530237b097ae736ea16435eee65875
[2/2] tools/build-docs-container: drop Fedora 42 support
      commit: 7389f7f5b055dc0a9939bf3ada16cb23bfa20432


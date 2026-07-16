Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F3CC44516
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8695.1784193176309943136
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=lkHuQJHd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DA064E40E07
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3477C602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB26511BD3C9B;
	Thu, 16 Jul 2026 11:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AxL8UxHq9073urH8YBqPO2HBxnlKIXJ+OhqFbULU2Us=;
	b=lkHuQJHdhPh0WJE51IdEOPaxW5jKmjLM1IL74StT4tNn4eNJR3XlxqdvaK+DUBdkbDtA2f
	X6mlYNAYNeIUXUNjeyAB8lsHMQGiKEWYu8rwSE742YUJ6kW3zG+S1wAaNvMviV3GPLeM4S
	1Use45vKBsrj1Rw5cqiJM+82Qnar19818vsnwPExNgezkL4LuHM4W0MzAPWsFOBJmgxzMN
	tVqVjcKr5cDGLodwEIHjjNz7uOW3LsL40ycp8YNexP1dKWp5I7xbiisvcasp3mJI8iLW+t
	GQy/Q9NrWVug0LoV8lvLbOgCTyw7HzukOp3bWN3ZBYVq7pl+oYV8oMiKdyScwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs
Date: Thu, 16 Jul 2026 11:12:15 +0200
Message-ID: <178419298531.94913.8246369515741527598.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710-bitbake-setup-refresh-v1-1-18ea82f38ef3@bootlin.com>
References: <20260710-bitbake-setup-refresh-v1-1-18ea82f38ef3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10081

Applied, thanks!

[1/1] brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs
      commit: 34eafb89b1e4d6116fbcc622dc852a7c15996c6d


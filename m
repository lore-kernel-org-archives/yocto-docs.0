Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E1EC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32898.1782720318465591854
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=AMBPGGuQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC2A04E40B5D;
	Mon, 29 Jun 2026 08:05:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92D4A5FF96;
	Mon, 29 Jun 2026 08:05:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F387106F157C;
	Mon, 29 Jun 2026 10:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5Tvb9rxIwW3yU4FKhNzMGa6BlEGJNA7MAqDQiz4A74=;
	b=AMBPGGuQanMV7YniJs43vCw2Ah0D7+nMUF5+nr6UFRwLrGTneqGWvASGLPPf+jGjT+IQ0j
	bLefoztwjLPYEyLkLxDqdpC9Jiwbpr8j6RpoMuD/eKsUm7vchUWhJc28HfdUUI6lhB7CbH
	c4q/B7lGspjehfufQFjWVMmcxoQ3uYTC4TiUroywyCyUQ9d8S9eWODWCt2HLEOvLfZx5bU
	apefcJvaKQYbPeV2RbacSGb8NLucU0L97q6A5zMPqQxWjhZJLVwtsz2fQJZzWdreAx7bnE
	dSZUrsQkhiLc9eoQG5MfZjVfV7PyjZpVRmqx5MYAghYFmSKMf8e0e1sRckLOOQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] dev-manual: explain how to properly call "bitbake-layers"
Date: Mon, 29 Jun 2026 10:03:22 +0200
Message-ID: <178272012372.45179.1224006343682510991.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <73ed5f17-6d21-1a7c-9c32-e1badd3a4007@crashcourse.ca>
References: <73ed5f17-6d21-1a7c-9c32-e1badd3a4007@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9952

Applied, thanks!

[1/1] dev-manual: explain how to properly call "bitbake-layers"
      commit: 7505f0af029ac708e38eea40a6d002ae85b89404


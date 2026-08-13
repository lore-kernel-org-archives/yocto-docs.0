Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD857C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17361.1786622556347720431
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=meVAclPm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA8E54E411F1
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 812BB602B8
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE34211C4DE66;
	Thu, 13 Aug 2026 14:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8WlxctYWLhvYxLk6VakvxhtnV7S1vrl/ALN+IuGZU08=;
	b=meVAclPmVmKsNBw9mNXO4MY2XnKDcSrw4qDMQIQNyy8nNzD6ja6JVV0L12t5CWyWCNh32l
	yytDHlZD6UWsMDivYVcX757VW+Shj7scSDQ/me2vYHjQXon6fUfF4yZowKIhvJKZXYadTF
	VTf9viAdxOOriRZNJuBpStfohCsZ8i3chtKuTHjFDsORDUO74ZaBGSR5d/SbDJh37tXtTo
	Lmg9Uu+5zW2RMZSapZ0pQk1v5aj6ZT+IDM1+DmriMjDXtZ1vV/bQCpyJdCU9F3rRrdrHSs
	te56T/z5jN4EoJa9q7QsFPgTXbKhF0oupVamhXjzEcqgeAfzyLLVIb1syU1rNg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/2] Quick Build: use pip for bitbake-setup (and a typo fix)
Date: Thu, 13 Aug 2026 14:01:38 +0200
Message-ID: <178662237162.775933.15763146386266575796.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
References: <20260811-bitbake-setup-pip-v2-0-3e8ffed354f2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10279

Applied, thanks!

[1/2] brief-yoctoprojectqs/index.rst: use pip to install bitbake-setup
      commit: 096ccbf3fc53b6562e2ebe4aef4908b6e8c34d9e
[2/2] brief-yoctoprojectqs/index.rst: fix a replacement typo
      commit: 3660b8085a5e790c1ea8bf75236fff4b216fe19c


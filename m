Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE8ECD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31075.1779347235401185904
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=OUwIb781;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 478E51A3659
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15ED160495;
	Thu, 21 May 2026 07:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3A3F107EA6C4;
	Thu, 21 May 2026 09:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347232; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BAUJwyR0O9HOr3ouFIX2NUAOIty5YXP/H2cVYG/gXz0=;
	b=OUwIb781538jvplyykTNYiznJdhgCsLYXq0OS4Wn/3osjm5wyvEnxm9Wp/8yZE/5wPg4/z
	sT5tH7b6ZY3k006Y1gBTT+OM0B1eTqLUAnTEltsyOMfKF88BzearvcxY/46QBaVQaIDMP8
	SGt2djTOva726TF+TgHZQCO+44kQWsA3uFT22uPU5Y9FNZ7aaJ4dqKOyEI7cVquwF42UTK
	jRSbAJkl6bsMv7yqhRLDoKR3KUu9qYEa64Klyb/4lmQfNb9GDQ8PaGd8sMTAlrehIOy54g
	jjn8CzvUmG85t7jzg4EZJ/5gyFdj5//Ta0STTruuuk6poXqARUQ3yGnXXF9g/g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/4] release-note-6.0: update downloads section
Date: Thu, 21 May 2026 09:06:19 +0200
Message-ID: <177934712552.33890.8436031022971429176.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519011715.972400-1-chee.yang.lee@intel.com>
References: <20260519011715.972400-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9499

Applied, thanks!

[1/4] release-note-6.0: update downloads section
      commit: 4d51b6dd45369f49ae79d8d61e5e7febc8a544d2
[2/4] release-note-6.0: update several section
      commit: 4b6e843942a81e2423e958da7683d5e4a794924d
[3/4] migration-guide: add release notes for 4.0.35
      commit: 39ef57628b4fb262857d8bf55abe3e6fe7ff01f1
[4/4] migration-guide: add release notes for 5.3.4
      commit: c7166b77da6fa3772e1e8dda0ef4a4d7137c0aef


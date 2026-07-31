Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27993C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3042.1785490628642099416
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=yzMJlU2w;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 030761A1352;
	Fri, 31 Jul 2026 09:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FF66039A;
	Fri, 31 Jul 2026 09:37:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65C7D11C1660F;
	Fri, 31 Jul 2026 11:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ylGs4BqOh8WQIOIFJimCF7pqQG3LG46wkbcxLSoqpXM=;
	b=yzMJlU2wUW//jBKRb0i2gsFGOF+P2epQvaNXmZqa/Fi+wuGG37mKc6rj4c4olOqiiCem7h
	i/NlILrG5ZseTHGEtsNPL7X0oKD5aaGVlJnyrU3IqywkqAulNNxdOBiW1fxXGkF1swnFgs
	J0DWzZELgxmjs8obLaSxy+N94T5hXZBxyYezydZXX9hylYo02BaTzz68S+r3twwKFFyXZj
	zp3vYlgy9trKjs2vaiSu9VB0l3v5xxw+JnZIJxXSFXExhhgCq4ZRmCSKvKtU881ayBEikm
	Re0VkMvwb7gZfAbLRX6Lc0nGwFz50MAnoOOHj5hvz2BzOh/X3ek1yX7qUy/a/A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guide: add release notes for 5.0.19
Date: Fri, 31 Jul 2026 11:36:21 +0200
Message-ID: <178548999937.2379643.12169749379929139127.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723094505.628062-1-chee.yang.lee@intel.com>
References: <20260723094505.628062-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10219

Applied, thanks!

[1/2] migration-guide: add release notes for 5.0.19
      commit: 95b59a99896052ef7547a54e376d827bf64da43f
[2/2] migration-guide: add release notes for 6.0.2
      commit: b582bce709470abe2415fe5bf0fb11624b6de5c2


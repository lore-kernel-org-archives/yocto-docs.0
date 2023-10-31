Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973EC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:39:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.182215.1698745139638588248
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fZaRw2s4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4EDA1C000D;
	Tue, 31 Oct 2023 09:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qO8GpoTpUsnpEKvA45PHI17Fx7LoidLierdmejbbWFI=;
	b=fZaRw2s4Z+S7TG/FXBb0Ib3uRJ3J87ovIRLY6h1eSdf4DzrDykX9r2H04mthhtTG3OwV51
	lOarg7emE4uirKXS85s8KtI37tsa/CUEx4vTolS1/sAFUWixROJyMOPmcAvGmFhRW21lfd
	5DaZ9NQhpVKv/3tYjRvBBozeOmD+jfAXg7dHDpvcAH9jx7p0JZxmgzsBLYilT908yrGPNf
	wKshnYJ9jD4568iGuRQS2v2Rk62AD6958xEtD0Y41E2Y4gZWG7Lm0Do7YqdtZakjI8DR3t
	xFMTy9A99FeBT8QQruvY0SwCzlySxcJt/a8idaEh5OdDi2+u6WLs8FwJalQjwQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 0/3] mickledore backports
Date: Tue, 31 Oct 2023 10:38:51 +0100
Message-Id: <20231031093854.1792471-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4534

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From relevant commits in master

Marta Rybczynska (1):
  dev-manual: add security team processes

Michael Opdenacker (2):
  manuals: correct "yocto-linux" by "linux-yocto"
  test-manual: reproducible-builds: stop mentioning LTO bug

 documentation/bsp-guide/bsp.rst               |   2 +-
 documentation/dev-manual/index.rst            |   1 +
 .../dev-manual/security-subjects.rst          | 189 ++++++++++++++++++
 documentation/kernel-dev/common.rst           |   2 +-
 .../test-manual/reproducible-builds.rst       |  11 -
 5 files changed, 192 insertions(+), 13 deletions(-)
 create mode 100644 documentation/dev-manual/security-subjects.rst

-- 
2.34.1



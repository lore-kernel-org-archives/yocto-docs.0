Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B12FC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:37:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.182202.1698745042986667839
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I1n5cjIS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F6F340006;
	Tue, 31 Oct 2023 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698745041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qO8GpoTpUsnpEKvA45PHI17Fx7LoidLierdmejbbWFI=;
	b=I1n5cjIScxJp7HbpfxKxg7Dbbvi0Ft3zf7dXcqn/7gdcMmCvpxHrbz1flqdoBvLWKXj1aZ
	TPrHJ0WGKMR7wUOVXR1L6WSV5dLrqjHd1ZZbs3MPrk49xG1Qg4L6yuEw6oIYdkF7kOCKc0
	+ZXs38FvLrSB1MU+lGXEs2ASi9XO0xkl8+uSIwoimPIsAvgZH7jP76bIFGzNBIZ/M4doUR
	FmzSPeMQccTv/+4ghgkbv3UzBr5Pbyy5t16B5xUf5jejWW6iuW3W3ef+PzGgtWstn6jQ+i
	HYijhYhWKnUfAlj+hBatYWHMiuXKF5p31x3369BlGJOMR9UZ9hLZ5K//omn7Kw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/3] kirkstone backports
Date: Tue, 31 Oct 2023 10:37:13 +0100
Message-Id: <20231031093716.1792379-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4530

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



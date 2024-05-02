Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94E8C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:55:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7639.1714632932797329334
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vwa3JNkJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E238A20004;
	Thu,  2 May 2024 06:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714632931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/P/jbvkVqTmEHHN4dpryJyGukwdL72U72Pv2kJLu3k0=;
	b=Vwa3JNkJ8CLBjpHfVGLjbss8inq6Sr4DAy0Ihld2NY/RE8EITErLJ0aKra5lEjEetLUC8P
	1mhCNWCoHMPtBZis8LIBeVYh5Mc8WPPW+Q7cNLC9+g0VZ/sicLF7EZmcmM+IF52DGGJwdB
	2dgPSDBVcrf1yDXfe3UIpwOZA/1otd0CTibGJbV73Lr2AM2d7OoCamiADxFWIyX+RezM8x
	esCqNUunRSY39Nq03V99eGJqRkB6j8lFX/U5sSJP1Mwh5T/ndBi4jm0djaOwOfKvZxQfnb
	iS7uLmD18INTChTAL8AsZP95EXgOUmRz1Yre+mookjn5PdskCOLqZiYORhg8lw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [scarthgap][PATCH 0/5] documentation backports
Date: Thu,  2 May 2024 08:55:23 +0200
Message-Id: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5186

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Alexander Kanavin (1):
  documentation/poky.yaml.in: drop mesa/sdl from essential host packages

Lee Chee Yang (2):
  migration-notes: add release notes for 4.0.18
  release-notes-5.0: update Repositories / Downloads section

Michael Halstead (1):
  docs: add support for scarthgap 5.0 release

Michael Opdenacker (1):
  ref-manual: update releases.svg

 .../migration-guides/release-4.0.rst          |   1 +
 .../migration-guides/release-notes-4.0.18.rst | 191 ++++++++++++++++++
 .../migration-guides/release-notes-5.0.rst    |  55 +++++
 documentation/poky.yaml.in                    |  26 +--
 documentation/ref-manual/svg/releases.svg     |  99 +++++----
 documentation/set_versions.py                 |   8 +-
 6 files changed, 326 insertions(+), 54 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.18.rst

-- 
2.34.1



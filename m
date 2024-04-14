Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC11C001CC
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3484.1713118826794208904
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fhgsiy8k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7E7D1C0002;
	Sun, 14 Apr 2024 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H1IA4y2OL+vuc3Z40ImvsJrQfnpisMLyhJeK+TuhCyQ=;
	b=fhgsiy8k4Y1fCo3JE0piAD7sMc0/Ugxrn195v3oN1zfwpL73WM3qb3sE0wQI+rwIXKY2WO
	Eytmo7QkUx2WT6g11U8x8FhsZ620Hh6FvwmX1ZRQxGUrynN+xEQn/Q5DjPJ5UHl9+rCfk3
	SW9fzd0CKSUUP9x1hiF1KIMcnCjQZpToIY+/JsXVGgtOiD4PNTT9Ex388r8Nrz95lrIz9w
	o3H3tyyjhJb0kX+X2B99wISATDBW9ZljQluFoLXms97bppe0wDwQptLcZBdBTMTVNuYrM3
	V0/qV/JuYxzy9l3Egq0BjZ0KZqgG19NTm0JDrGceeEOSzn6m2Qw83hcMTtaaPw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/9] documentation backports
Date: Sun, 14 Apr 2024 20:20:02 +0200
Message-Id: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5124

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Picking changes from the "master" branch when applicable.

Jörg Sommer (1):
  kernel-dev: join mkdir commands with -p

Lee Chee Yang (1):
  release-notes-4.0.17: reorder CVEs

Michael Opdenacker (5):
  manuals: fix duplicate "stylecheck" target
  manuals: add initial sphinx-lint support
  manuals: fix trailing spaces
  manuals: fix incorrect double backticks
  manuals: remove tab characters

Quentin Schulz (2):
  docs: conf.py: properly escape backslashes for latex_elements
  manuals: refer to new yocto-patches mailing list wherever appropriate

 documentation/Makefile                        |   5 +-
 documentation/README                          |  14 +++
 documentation/conf.py                         |   4 +-
 .../contributor-guide/submit-changes.rst      |   2 +-
 documentation/dev-manual/init-manager.rst     |   2 +-
 documentation/dev-manual/layers.rst           |  16 +--
 documentation/dev-manual/start.rst            |  12 +-
 documentation/dev-manual/wic.rst              |  56 ++++-----
 documentation/kernel-dev/advanced.rst         |   4 +-
 documentation/kernel-dev/common.rst           |  14 +--
 .../migration-guides/migration-4.0.rst        |  20 +--
 .../migration-guides/release-notes-4.0.17.rst |  12 +-
 .../migration-guides/release-notes-4.0.5.rst  |   2 +-
 .../migration-guides/release-notes-4.0.rst    |  17 ++-
 documentation/overview-manual/intro.rst       |   2 +-
 documentation/profile-manual/usage.rst        | 116 +++++++++---------
 documentation/ref-manual/classes.rst          |   2 +-
 documentation/ref-manual/resources.rst        |   3 +
 documentation/ref-manual/tasks.rst            |   2 +-
 documentation/ref-manual/terms.rst            |  10 +-
 documentation/ref-manual/variables.rst        |   2 +-
 documentation/sdk-manual/working-projects.rst |  10 +-
 22 files changed, 170 insertions(+), 157 deletions(-)

-- 
2.34.1



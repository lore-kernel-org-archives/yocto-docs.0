Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B6CCE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.32322.1695197763933591033
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YnBbb2hf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C77E24000C;
	Wed, 20 Sep 2023 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3tGneiBSEfArT4yVJZy8nDYcbO3gFWJhtNMWbnlwN7c=;
	b=YnBbb2hfKIHaxZq1DUaP++GcRkjnrAF/KpDPtYroWrJpOowGuPM+XvLkKfOAy9reuYDizF
	wEirrxIl686ySjBjbVEpd0eLEW9/Vjmj7YUxZo6iH2i0QqEc3sAkhu+6PsyLtWfrJ8VHhk
	eT2txoaQCdMG3o4la/wbECnITLR5FtIY+piC58XFhAb+zfAqvf3ljGl36JuvfSELCusum1
	+3aQg/Z6tE5g4UKWexEl2gRtv5AIggeCNClRYIreE+0zTIcco5OQmOa4a12vnkeKXsVdHr
	ic7F3887tfhds2u8Mva6BXO8UBmnmGqYaVpNpeq8lvOJfEMkDHmvtJZ2BTNF4w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 00/10] kirkstone backports
Date: Wed, 20 Sep 2023 10:15:34 +0200
Message-Id: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4247

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From now on, will apply such backports more systematically,
in a single branch rather than individually, and only after changes are merged
in master, though exceptions for urgent cases could still be made.

Michael Opdenacker (9):
  sdk-manual: extensible.rst: align with master branch
  dev-manual: disk-space: improve wording for obsolete sstate cache
    files
  documentation/README: align with master
  dev-manual: new-recipe.rst fix inconsistency with contributor guide
  contributor-guide: recipe-style-guide: add Upstream-Status
  dev-manual: licenses: mention SPDX for license compliance
  ref-manual: qa-checks: align with master
  manuals: document "mime-xdg" class and MIME_XDG_PACKAGES
  dev-manual: licenses: update license manifest location

Roland Hieber (1):
  template: fix typo in section header

 documentation/README                          |  43 +-
 .../contributor-guide/recipe-style-guide.rst  |  81 ++++
 documentation/dev-manual/disk-space.rst       |   8 +-
 documentation/dev-manual/licenses.rst         |  35 +-
 documentation/dev-manual/new-recipe.rst       |  13 +-
 .../migration-guides/migration-3.1.rst        |   2 +-
 documentation/ref-manual/classes.rst          |  21 +
 documentation/ref-manual/qa-checks.rst        |  87 ++--
 documentation/ref-manual/variables.rst        |   7 +
 documentation/sdk-manual/extensible.rst       | 389 +++++++++---------
 documentation/template/template.svg           |   2 +-
 11 files changed, 448 insertions(+), 240 deletions(-)

-- 
2.34.1



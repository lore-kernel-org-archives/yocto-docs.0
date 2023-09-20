Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3916CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.32056.1695197281351723576
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Uey3zQ+0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 818674000F;
	Wed, 20 Sep 2023 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8HzHwcNRquzGaMzwxmtNJlxpKgSVASuqd//6gUwk3SI=;
	b=Uey3zQ+0wRth9shfcK77XTdrCE0BzJLBXtI63mBF5OPO3U005uPjB6nxq78HTF25ByHKML
	DJK9VIR07nQRYB/BethElRwvsjrOWOMpiY1898UpLK8RCmt1IQTxs5fKEprOwX1MAzzHz/
	rBtge053avjMSGg+FaMvfnZLhI5/0fhAC2Y+pPikoC4rTlAJByGSnnp08buMzt5FzrADTb
	niuLqxP61qZ0wkiiXlzcqRdUQ5136hir5EKGBNvYY3SDn5J+Ba7P8cOde2jAH/228XibJd
	HgEzbUnT3L+AFlxtTy5vxzKc+uJf3kaeZBG4vW39w05bFd/16N2cjQmy69K7/g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 0/7] mickledore backports
Date: Wed, 20 Sep 2023 10:07:47 +0200
Message-Id: <20230920080754.1225508-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:08:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4239

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From now on, will apply such backports more systematically,
in a single branch rather than individually, and only after changes are merged
in master, though exceptions for urgent cases could still be made.

Michael Opdenacker (5):
  sdk-manual: extensible.rst: fix multiple formatting issues
  dev-manual: disk-space: improve wording for obsolete sstate cache
    files
  dev-manual: new-recipe.rst fix inconsistency with contributor guide
  contributor-guide: recipe-style-guide: add Upstream-Status
  dev-manual: licenses: mention SPDX for license compliance

Roland Hieber (2):
  template: fix typo in section header
  ref-manual: point outdated link to the new location

 .../contributor-guide/recipe-style-guide.rst  |  81 ++++++
 documentation/dev-manual/disk-space.rst       |   8 +-
 documentation/dev-manual/licenses.rst         |  30 ++-
 documentation/dev-manual/new-recipe.rst       |  13 +-
 documentation/ref-manual/qa-checks.rst        |  10 +-
 documentation/sdk-manual/extensible.rst       | 254 ++++++++----------
 documentation/template/template.svg           |   2 +-
 7 files changed, 228 insertions(+), 170 deletions(-)

-- 
2.34.1



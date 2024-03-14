Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE018C5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:15:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8370.1710407716740582058
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KP1gLa7+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D30020002;
	Thu, 14 Mar 2024 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GW4aORKeZsnGcLAJtlDciKE1IvwsGmPXNCoQZT4h/HE=;
	b=KP1gLa7+WyuXiFGh6zFvAa5WCzvfkWwXGR61f5AmIePkpwDqDK0xBLe6Q+nPUiY/DUMOo0
	nON9gmg06OFXJF9VTMRo6ZNqLFOBcCdSKXxqqTT4gGMUdLvKx50nXSyXMviBINkfBXrT4i
	8U8JE5RfsvBrJDWmC3hHnd30jUXn/v8fFWGLIXAZEW0Pvn7zHf3VP5IP02rCO45WmXCJFX
	suI8vCIshiSFGcyZjcvJUoZTPexbDWqN/elm37XhAk2XbjZJVjnN4FxfET2cf+l1ZOflnm
	6z26QnYwqxC2p1FGQAHy/C+WhvFRIKrg8sXgiPeckVERcxpN9XhvKpbSNWIwzA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield][PATCH 0/7] documentation backports
Date: Thu, 14 Mar 2024 10:15:01 +0100
Message-Id: <20240314091508.84166-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4968

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Apply relevant patches from the "master" branch.

Geoff Parker (1):
  ref-manual: variables: adding multiple groups in GROUPADD_PARAM

Johan Bezem (1):
  ref-manual: variables: correct sdk installation default path

Luca Ceresoli (2):
  ref-manual: tasks: do_cleanall: recommend using '-f' instead
  ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a
    shared sstate

Michael Opdenacker (2):
  dev-manual: packages: fix capitalization
  manuals: document VIRTUAL-RUNTIME variables

Simone Weiß (1):
  contributor-guide: add notes for tests

 .../contributor-guide/submit-changes.rst      | 37 +++++++++++++-
 documentation/dev-manual/device-manager.rst   |  8 +--
 documentation/dev-manual/packages.rst         |  2 +-
 documentation/overview-manual/concepts.rst    |  2 +-
 documentation/ref-manual/tasks.rst            | 38 ++++++++++++--
 documentation/ref-manual/variables.rst        | 51 ++++++++++++++++---
 6 files changed, 121 insertions(+), 17 deletions(-)

-- 
2.34.1



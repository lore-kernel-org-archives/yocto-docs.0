Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC01CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:26:01 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.44834.1697217957018305771
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hkRZiMYp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9D00C0004;
	Fri, 13 Oct 2023 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697217954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i/DIzIgD+BfEeMY4cayD1wa3SWPZ5YznNANM97f+oX8=;
	b=hkRZiMYp8YW7KyndnuZ0DzLNOEwOJVL1+uiP1w+qTN9vACY0WsGbB1iH4W8XfRe0FZpuh9
	J8cQJYn42nIRzjiJWLbXpTTG1D0Ub2pWLJ1ncdq4Anlep+9bxo+GnoYqVUqObpTgt2a+bL
	SDvmfAL5+WbFcQd+QpthdJWOfuZ+edsQmckjQdKWgDBSPi++qHgj83W/ZXtOWOFb88jqps
	Oahg+PcG2V9qNJkGiNiEhU46cModr0i8jHJ3/nCau37RTOHqVJFuJQPfz2KYckswqlTUIw
	gU0QxGY3wwJ9UVyB+PWaChd23UZkIbfolvch+aAXHAh01s6wQOAp74rWSTZYhA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/5] Update supported machines
Date: Fri, 13 Oct 2023 19:25:42 +0200
Message-Id: <20231013172547.82195-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Oct 2023 17:26:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4365

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This started by realizing that the EdgeRouter MIPS
system should no longer be mentioned as it is no
longer supported in Poky.

Removing it drew other updates to the documents
mentioning it.

Michael Opdenacker (5):
  manuals: update linux-yocto append examples
  dev-manual: wic: update "wic list images" output
  sdk-manual: appendix-obtain: improve and update descriptions
  manuals: update list of supported machines
  bsp-guide: bsp: skip Intel machines no longer supported in Poky

 documentation/bsp-guide/bsp.rst              | 52 ++++++--------------
 documentation/dev-manual/runtime-testing.rst |  8 +--
 documentation/dev-manual/wic.rst             | 28 ++++++-----
 documentation/kernel-dev/advanced.rst        |  3 +-
 documentation/kernel-dev/common.rst          | 40 +++++++--------
 documentation/ref-manual/variables.rst       | 14 +++---
 documentation/sdk-manual/appendix-obtain.rst | 50 +++++++------------
 7 files changed, 75 insertions(+), 120 deletions(-)

-- 
2.34.1



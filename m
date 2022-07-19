Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C708AC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 18:40:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.44422.1658256021212581345
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 11:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nFbIcc4W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EF5D4240005;
	Tue, 19 Jul 2022 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658256019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=np29NvcIjJ6PdLiP6/3Mx9rsWNJjnyynd8NFd1sCGX8=;
	b=nFbIcc4WCzhWOFx4NkvvRiRSgxFUsssYrsFsOXyXGc60zJSTbZSbQmBc+RfTWKJenE45Ds
	DwihtEeNRE7efdZ7e7+nZcgJAvaW1EUISgtMje0B9V7MeznimhnJLD/LgOi736ESIYDhH3
	Kzr5eIfxnJdQNDkr0onEdoUUTs1Y+BEgKiZA+wOS0S/pv+g/vCIbUNtFDaR7AmOuJ13HgZ
	KWIIxfI9muOMQ8gFYExFJl743OAgCwCi/LZRp47NJH5ie4B12iK1OTWm9NDrMO8jWHCjtE
	TzrscE00eO5z27N2dQWvd/5TCjFTWF4UvH3lYVrSG5HCFNnAWLeFNltsb1MqEg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] dunfell: ref-manual: variables: remove sphinx directive from
 literal block
Date: Tue, 19 Jul 2022 20:40:09 +0200
Message-Id: <20220719184009.511995-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Jul 2022 18:40:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3071

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Literal blocks make sphinx take their text verbatim. This means that
directives cannot be used in literal blocks. This means :term:`S` was
printed as-is, without actually creating a link to the S variable
definition as would be expected outside of literal blocks.

Initially contributed to the master branch by Quentin Schulz.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Quentin Schulz <foss@0leil.net>
---
 documentation/ref-manual/ref-variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index e184608d19..b8d56a082b 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -7542,7 +7542,7 @@ system and gives an overview of their function and contents.
       ``SYSTEMD_BOOT_CFG`` as follows:
       ::
 
-         SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
+         SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
 
       For information on Systemd-boot, see the `Systemd-boot
       documentation <http://www.freedesktop.org/wiki/Software/systemd/systemd-boot/>`__.
-- 
2.34.1



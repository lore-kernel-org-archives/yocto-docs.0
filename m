Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0F7C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.20782.1703242606954681624
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Dec 2023 02:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ftCORfcc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95CF040008;
	Fri, 22 Dec 2023 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703242604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qzefQJWPxHnXbx3UfzF4H/ntdQU53Hq60XFmPQ/zqs0=;
	b=ftCORfccB3UZcTgt0fv+4ekhlPmzRMxS7J1sbNUFu+UVb7P71V8/fj34sfRmvc+w0NUmoY
	WO+7HTFsK8P0dwkmzJPNkLm3R8vObwDFyQNydFkd9laMLKx/U4XfImNdP71D649/NFChDO
	Ps6JdzswqbwUZ0OblQgWWFzkbwPit/p/FHlRfpm784FBY0J19rOwZPdAnOMB3sjmRLUIV5
	eE+HVx8EwIblo9YWQzScBXQwf9EllUYwUuhQGxQ9LBC87Is7HYcOhEoPhZ5mUf77rMAG2X
	Qk/sqGQA53J6zdvpttW0y4G9YlBGHdeEFGVdUjfUayreZvQdK74uQcMg9DrDCg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH v2] ref-manual: update tested and supported distros
Date: Fri, 22 Dec 2023 11:56:42 +0100
Message-Id: <20231222105642.805072-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Dec 2023 10:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4735

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

According to currently active workers
https://autobuilder.yoctoproject.org/typhoon/#/workers
and to the "workers_prev_releases" definition
in https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py

Also correct the text saying that SANITY_TESTED_DISTROS
lists currently tested distros.

Also replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9,
as we update our workers anyway.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
Changes in V2:
- Replace AlmaLinux 8.8 and 9.2 by just AlmaLinux 8 and 9
---
 .../ref-manual/system-requirements.rst        | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 2527b5bdb6..274781a903 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,20 +41,17 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
--  Fedora 37
+-  Fedora 38
 
 -  Debian GNU/Linux 11.x (Bullseye)
 
--  AlmaLinux 8.8
+-  AlmaLinux 8
 
-The following distribution versions are still tested (being listed
-in :term:`SANITY_TESTED_DISTROS`), even though the organizations
-publishing them no longer make updates publicly available:
+The following distribution versions are still tested, even though the
+organizations publishing them no longer make updates publicly available:
 
 -  Ubuntu 18.04 (LTS)
 
--  OpenSUSE Leap 15.3
-
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
 limited value if you have access to such updates.
@@ -72,18 +69,18 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
 
 -  Fedora 36
 
+-  Fedora 37
+
 -  CentOS 7.x
 
 -  CentOS 8.x
 
--  AlmaLinux 8.5
-
--  AlmaLinux 8.7
-
 -  Debian GNU/Linux 9.x (Stretch)
 
 -  Debian GNU/Linux 10.x (Buster)
 
+-  OpenSUSE Leap 15.3
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.34.1



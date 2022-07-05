Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27372CCA47C
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 09:42:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.82422.1657014165250408412
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 02:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id E26C920003;
	Tue,  5 Jul 2022 09:42:42 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: conf.py: bump minimum Sphinx version requirement
Date: Tue,  5 Jul 2022 11:42:12 +0200
Message-Id: <20220705094213.68263-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Jul 2022 09:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3049

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

extlinks captions support using %s substitution but only from sphinx
4.0 onwards. Anything before does not support the %s substitution.
However, this will be a requirement in sphinx 6.0 and later, and sphinx
5.0 already shows a warning telling us that.

Since the build is made with -W flag which fails it if any warning is
printed, a fix is required.

Sphinx 4.0.0 was released two years ago. Unfortunately, Debian packages
are out-of-date and only the latest Ubuntu has recent enough packages.
Therefore, pip installation should be recommended now instead and the
minimum version for building the docs bumped to 4.0.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index baf550e3e..8a9cbc972 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -53,7 +53,7 @@ author = 'The Linux Foundation'
 # -- General configuration ---------------------------------------------------
 
 # Prevent building with an outdated version of sphinx
-needs_sphinx = "3.1"
+needs_sphinx = "4.0"
 
 # to load local extension from the folder 'sphinx'
 sys.path.insert(0, os.path.abspath('sphinx'))
-- 
2.36.1



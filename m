Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26806C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 09:42:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.82240.1657014165776215949
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 02:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id E172A2000B;
	Tue,  5 Jul 2022 09:42:43 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] Revert "docs: conf.py: fix cve extlinks caption for
 sphinx <4.0"
Date: Tue,  5 Jul 2022 11:42:13 +0200
Message-Id: <20220705094213.68263-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705094213.68263-1-foss+yocto@0leil.net>
References: <20220705094213.68263-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Jul 2022 09:42:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3050

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This reverts commit c9922076f5c1285d9cfd6aff8ce5b6635d88222f.

Since the minimum version required to build the docs has been bumped in
the previous commit to 4.0, this commit is not required. Moreover, since
Sphinx 5.0 triggers a warning when extlinks captions are not using %s
substitution and Sphinx 6.0 will fail to build without the substitution
characters, this revert is now required to be able to build the docs.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 8a9cbc972..2a017569f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,7 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-'),
+    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.36.1



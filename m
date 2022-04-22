Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FEC49ED8
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.7909.1650630344010066743
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 6A10B20000C;
	Fri, 22 Apr 2022 12:25:40 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: conf.py: fix cve extlinks caption for sphinx <4.0
Date: Fri, 22 Apr 2022 14:25:12 +0200
Message-Id: <20220422122512.279804-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2848

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

extlinks captions support using %s substitution but only from sphinx 4.0
onwards.
c.f. https://www.sphinx-doc.org/en/master/usage/extensions/extlinks.html#confval-extlinks

Weirdly enough, on older sphinx versions, the caption is just a prefix
to the actual text passed to the extlink. Therefore, in that specific
case, CVE- or CVE-%s are identical in meaning for sphinx >=4.0 and since
only CVE- caption works on sphinx <4.0, let's go with CVE- caption
prefix.

Fixes: b311070d866cf "manuals: add 3.4 and 3.4.1 release notes after migration information"
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index a5d7c0cd8..a7cdf415f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,7 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
+    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.35.1



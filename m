Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7A4C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.10474.1649936034378035396
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 04:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 3F68F40006;
	Thu, 14 Apr 2022 11:33:51 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/3] docs: sphinx-static: switchers.js.in: remove duplicate
 for outdated versions
Date: Thu, 14 Apr 2022 13:33:25 +0200
Message-Id: <20220414113327.176534-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2767

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit f2b069be8c307 "set_versions: Various improvements", an
outdated version will always appear in all_versions, meaning there'll
always be an exact match in the loop (just above the git context of this
patch) so there's no need to add the current_version to the dropdown
menu manually.

This issue showed up only for outdated versions of obsolete releases,
e.g. 3.2.3. In that case, 3.2.4 (latest version of the obsolete release)
will appear in the all_versions array in addition to 3.2.3, which means
the check on release series (3.2) will be matched twice, and 3.2.3 will
be printed once in the 3.2.4 loop because version != current_version and
once in the 3.2.3 because it is an exact match to an entry in
all_versions.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 5d3a4d793..e7ef2ce5f 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -72,9 +72,6 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
             buf.push('<option value="' + version + '" selected="selected">' + title + '</option>');
         else
             buf.push('<option value="' + version + '">' + title + '</option>');
-
-        if (version != current_version)
-            buf.push('<option value="' + current_version + '" selected="selected">' + current_version + '</option>');
       } else {
         buf.push('<option value="' + version + '">' + title + '</option>');
       }
-- 
2.35.1



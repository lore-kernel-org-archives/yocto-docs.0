Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06824C63706
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.8869.1650467102560198651
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 08:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 5993460002;
	Wed, 20 Apr 2022 15:04:58 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 1/4] docs: set_versions.py: mark as obsolete only branches
 and old tags from obsolete releases
Date: Wed, 20 Apr 2022 17:04:41 +0200
Message-Id: <20220420150444.174380-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2809

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Branches are identified by their .999 version suffix which means they
will never be matched in the forloop above this git context. Therefore,
branches will match the condition. However, branches are not necessarily
obsolete (e.g. dunfell, honister and kirkstone today), so let's mark as
obsolete the branches which are from obsolete releases.

Old tags of currently supported releases are not defined as obsolete but
outdated, therefore using the series to which they belong like it is
done for branches is enough for obsolescence detection.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2:
 - commit log rephrased

 documentation/set_versions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 0086e9bea..fc179ee19 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -218,7 +218,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                 versions.append(version)
                 w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch not in activereleases).lower()))
             if ourversion not in versions and ourseries != devbranch:
-                w.write("    '%s': {'title': '%s', 'obsolete': true,},\n" % (ourversion, ourversion))
+                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (ourversion, ourversion, str(ourseries not in activereleases).lower()))
         else:
             w.write(line)
 
-- 
2.35.1



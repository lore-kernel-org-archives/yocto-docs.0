Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C17BC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.836.1650382263961906028
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 08:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 2D0F2C0009;
	Tue, 19 Apr 2022 15:31:00 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 1/2] docs: set_versions.py: fix latest release of a branch
 being shown twice in switchers.js
Date: Tue, 19 Apr 2022 17:30:47 +0200
Message-Id: <20220419153048.104600-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2787

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

versions array is supposed to store the latest version of all active
releases. However, in the loop it is reassigned and therefore, the check
on whether our version is already in the versions array will always
return false (except for the latest version of the last active release)
and write our version again in the list.

By using a local variable for the logic instead of versions array, the
check now works properly.

Fixes: f2b069be8c307 "set_versions: Various improvements"
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 0fcbb993b..4114ae573 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -211,13 +211,13 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
             for branch in activereleases:
                 if branch == devbranch:
                     continue
-                versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, capture_output=True, text=True).stdout.split()
-                versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" +  release_series[branch], "0") for v in versions], key=int)
-                if not versions:
+                branch_versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, capture_output=True, text=True).stdout.split()
+                branch_versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" +  release_series[branch], "0") for v in branch_versions], key=int)
+                if not branch_versions:
                     continue
                 version = release_series[branch]
-                if versions[-1] != "0":
-                    version = version + "." + versions[-1]
+                if branch_versions[-1] != "0":
+                    version = version + "." + branch_versions[-1]
                 versions.append(version)
                 w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch == ourseries).lower()))
             if ourversion not in versions and ourseries != devbranch:
-- 
2.35.1



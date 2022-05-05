Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7010BC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 10:43:26 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9219.1651747398584212654
 for <docs@lists.yoctoproject.org>;
 Thu, 05 May 2022 03:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 4AFB7240003;
	Thu,  5 May 2022 10:43:15 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] docs: set_versions.py: show release name in switchers.js
Date: Thu,  5 May 2022 12:43:00 +0200
Message-Id: <20220505104300.446038-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 May 2022 10:43:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2922

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Also show release names in the dropdown menu so that people have
knowledge of both the version number and release name of whatever
they're using or planning to use or upgrade to.

This patch will make the dropdown menu show the following entries:
Unstable (dev)
Kirkstone (4.0)
Honister (3.4.3)

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index cd02cc739..733e1aa1a 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -211,7 +211,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
             w.write(str(list(release_series.keys())))
             continue
         if "VERSIONS_PLACEHOLDER" in line:
-            w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
+            w.write("    'dev': { 'title': 'Unstable (dev)', 'obsolete': false,},\n")
             for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
                 if branch == devbranch:
                     continue
@@ -223,9 +223,9 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                 if branch_versions[-1] != "0":
                     version = version + "." + branch_versions[-1]
                 versions.append(version)
-                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch not in activereleases).lower()))
+                w.write("    '%s': {'title': '%s (%s)', 'obsolete': %s,},\n" % (version, branch.capitalize(), version, str(branch not in activereleases).lower()))
             if ourversion not in versions and ourseries != devbranch:
-                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (ourversion, ourversion, str(ourseries not in activereleases).lower()))
+                w.write("    '%s': {'title': '%s (%s)', 'obsolete': %s,},\n" % (ourversion, ourseries.capitalize(), ourversion, str(ourseries not in activereleases).lower()))
         else:
             w.write(line)
 
-- 
2.35.1



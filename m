Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9852DC433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.6544.1650454207477569048
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E8D640009;
	Wed, 20 Apr 2022 11:30:03 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [RFC PATCH] docs: sphinx-static: switchers.js.in: do not mark
 branches as outdated
Date: Wed, 20 Apr 2022 13:29:53 +0200
Message-Id: <20220420112953.152555-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2803

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Branches can never be outdated so let's check the release is not a
branch (branches end with .999).

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

RFC: because this cannot be tested until we get
https://git.yoctoproject.org/yocto-docs/commit/?h=wip&id=a828e6d91c110d77deb8568b9bb31e894c1446fe
or patches in all branches to adapt conf.py to take info from poky.yaml
to have release set to X.Y.999 for branches.

 documentation/sphinx-static/switchers.js.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 2bc18160d..774d87cf8 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -235,7 +235,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
       $.each(switcher_versions, function(version, vers_data) {
         var series = version.substr(0, 3);
         if (series == current_series) {
-          if (version != release) {
+          if (version != release && release.endsWith('.999') == false) {
             $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
             $('#outdated-warning').css('padding', '.5em');
             return false;
-- 
2.35.1



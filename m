Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003C3C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 10:52:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.6110.1645613541889323507
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 02:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.201,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id F15071BF216;
	Wed, 23 Feb 2022 10:52:19 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/2] docs: point to renamed BB_BASEHASH_IGNORE_VARS variable
Date: Wed, 23 Feb 2022 11:52:06 +0100
Message-Id: <20220223105206.2766014-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105206.2766014-1-foss+yocto@0leil.net>
References: <20220223105206.2766014-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 10:52:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2490

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit 98b3ed1b2e11 "meta/scripts: Handle bitbake variable
renaming", the new name of the variable is BB_BASEHASH_IGNORE_VARS
so let's update it so that Sphinx can resolve the Bitbake reference.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 documentation/ref-manual/variables.rst    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index fd394c3ae..c111355cc 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -9474,7 +9474,7 @@ BitBake has determined by doing the following:
 
    The output of ``bitbake-dumpsig`` also includes the value each
    variable had, a list of dependencies for each variable, and
-   :term:`BB_HASHBASE_WHITELIST`
+   :term:`BB_BASEHASH_IGNORE_VARS`
    information.
 
 There is also a ``bitbake-diffsigs`` command for comparing two
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 25a874f83..ecb2b60c7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -763,7 +763,7 @@ system and gives an overview of their function and contents.
 
          export BBSERVER=localhost:$port
 
-      By default, :term:`BBSERVER` also appears in :term:`BB_HASHBASE_WHITELIST`.
+      By default, :term:`BBSERVER` also appears in :term:`BB_BASEHASH_IGNORE_VARS`.
       Consequently, :term:`BBSERVER` is excluded from checksum and dependency
       data.
 
-- 
2.35.1



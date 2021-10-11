Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB49C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.7224.1633924684178330429
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=OYzjy0kL;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 0B4A320B87E7; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0B4A320B87E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924683;
	bh=unE1L/6voOX1IVSRjqBTxb53k8DRCsYHHuaihMDyqdI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OYzjy0kLZzlQbOhYhJ8/GNxHSOWpN+n58nbM2FmmWot677SgI2U5uAWsVgUJipNsv
	 ikXF41L6YSqCHfThH0N859zQNlxzklZATxIArtjksi4qUzFFTNjUyGQfhaynYV3s2+
	 gwC/iNZvOv5FpBY3pj4lPyaVqFYZx0/C7iq7QuRU=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/5] migration: tweak introduction section
Date: Sun, 10 Oct 2021 20:57:57 -0700
Message-Id: 
 <7adfadc7a2fbb09f3c6c0dd49ab8d7dee05c0c68.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1984

From: Paul Eggleton <paul.eggleton@microsoft.com>

Ensure we have a brief introductory section and tweak the general
migration considerations a little.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../migration-guides/migration-general.rst         | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-general.rst b/documentation/migration-guides/migration-general.rst
index 182482e..9eecf69 100644
--- a/documentation/migration-guides/migration-general.rst
+++ b/documentation/migration-guides/migration-general.rst
@@ -1,5 +1,17 @@
+Introduction
+============
+
+This guide provides a list of the backwards-incompatible changes you
+might need to adapt to in your existing Yocto Project configuration
+when upgrading to a new release.
+
+If you are upgrading over multiple releases, you will need to follow
+the sections from the version following the one you were previously
+using up to the new version you are upgrading to.
+
+
 General Migration Considerations
-================================
+--------------------------------
 
 Some considerations are not tied to a specific Yocto Project release.
 This section presents information you should consider when migrating to
@@ -26,16 +38,17 @@ any new Yocto Project release.
 
    The better solution (where practical) is to use append files
    (``*.bbappend``) to capture any customizations you want to make to a
-   recipe. Doing so, isolates your changes from the main recipe making
+   recipe. Doing so isolates your changes from the main recipe, making
    them much more manageable. However, sometimes it is not practical to
    use an append file. A good example of this is when introducing a
    newer or older version of a recipe in another layer.
 
+
 -  *Updating Append Files*:
 
-   Since append files generally only contain
+   Since append (``.bbappend``) files generally only contain
    your customizations, they often do not need to be adjusted for new
-   releases. However, if the ``.bbappend`` file is specific to a
+   releases. However, if the append file is specific to a
    particular version of the recipe (i.e. its name does not use the %
    wildcard) and the version of the recipe to which it is appending has
    changed, then you will at a minimum need to rename the append file to
@@ -50,5 +63,10 @@ any new Yocto Project release.
    this is the case and assuming the patch is still needed, you must
    modify the patch file so that it does apply.
 
+ .. tip::
+
+   You can list all append files used in your configuration by running:
+
+     bitbake-layers show-appends
 
 
-- 
1.8.3.1



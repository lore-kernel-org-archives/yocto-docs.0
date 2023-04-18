Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2613C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 14:42:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10752.1681828939203949594
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 07:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lv8f6DJr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 753D4C000A;
	Tue, 18 Apr 2023 14:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681828936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pYufJoykioYnPuVZQTXc6rXu8tYKgd3JkQNYmeq4yUI=;
	b=lv8f6DJrH0ASNmo4Es1XJUxphBYpCS61sNgCiALUuwf37FCsREd8MrwItZvE+Igr/SiwO1
	sr/RTNfAB+OVHqRFj7cbvw2R5GrtFKA+1T+OSxay6kHdSI7cesOX1RYFCu3xaCW2ipNL/A
	QXKgHJt1Pz9/MEwSzG01EQEowLhNK0RbBd55doqIq59GCyd84V9i46BWIHW0SvOxImslg8
	1HogblbrODyR2S/CKov6BypC/3mi/i9jKx1pr0PfQ+TJShLaBU3TNafSwi05MD9qXMwWmK
	Eot21gcnOxi2ntN65hjN4El8kVevyDMF7vgQikaqM+EwGd47z40COs7cN7dK4g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: add "Mixin Layer" term
Date: Tue, 18 Apr 2023 16:42:13 +0200
Message-Id: <20230418144213.1312004-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 14:42:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3846

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also add a target (and use) a target
for the "Long Term Support Release" section.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 8 +++++---
 documentation/ref-manual/terms.rst           | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 170565f9bc..2ffbd935c7 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -87,6 +87,8 @@ stable release.
    exception to this policy occurs when there is a strong reason such as
    the fix happens to also be the preferred upstream approach.
 
+.. _ref-long-term-support-releases:
+
 Long Term Support Releases
 ==========================
 
@@ -120,16 +122,16 @@ of stable and :term:`LTS` releases.
 
    In some circumstances, a layer can be created by the community in order to
    add a specific feature or support a new version of some package for an :term:`LTS`
-   release.  This is called a "mixin" layer. These are thin and specific
+   release.  This is called a :term:`Mixin` layer. These are thin and specific
    purpose layers which can be stacked with an :term:`LTS` release to "mix" a specific
    feature into that build. These are created on an as-needed basis and
    maintained by the people who need them.
 
    Policies on testing these layers depend on how widespread their usage is and
-   determined on a case-by-case basis. You can find some "mixin" layers in the
+   determined on a case-by-case basis. You can find some :term:`Mixin` layers in the
    :yocto_git:`meta-lts-mixins </meta-lts-mixins>` repository. While the Yocto
    Project provides hosting for those repositories, it does not provides
-   testing on them. Other "mixin" layers may be released elsewhere by the wider
+   testing on them. Other :term:`Mixin` layers may be released elsewhere by the wider
    community.
 
 Testing and Quality Assurance
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 5a7363acad..7673507887 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -231,7 +231,7 @@ universal, the list includes them just in case:
       This term means "Long Term Support", and in the context of the Yocto
       Project, it corresponds to selected stable releases for which bug and
       security fixes are provided for at least two years. See
-      ":doc:`/ref-manual/release-process`" for details.
+      the :ref:`ref-long-term-support-releases` section for details.
 
    :term:`Metadata`
       A key element of the Yocto Project is the Metadata that
@@ -252,6 +252,12 @@ universal, the list includes them just in case:
       :yocto_git:`yocto-kernel-cache </yocto-kernel-cache>`
       Git repository.
 
+   :term:`Mixin`
+      A :term:`Mixin` layer is a layer which can be created by the community to
+      add a specific feature or support a new version of some package for an
+      :term:`LTS` release. See the :ref:`ref-long-term-support-releases`
+      section for details.
+
    :term:`OpenEmbedded-Core (OE-Core)`
       OE-Core is metadata comprised of
       foundational recipes, classes, and associated files that are meant to
-- 
2.34.1



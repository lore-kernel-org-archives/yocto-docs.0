Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B93C47085
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4276.1665393876831008722
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=QsSbOprZ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 1303C20EC324; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1303C20EC324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=v5YLCUaDihK6PcujxWwq718CsOx4O/5TqT9h5hrmQIs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QsSbOprZi/FR7BrMzoBJV8aa7jdVa/KxlyEBZWiB2mzv5HmvWGlJKTxlPM+fcMcAc
	 DY+yp45fWgN2bEpS1/eMEXSWC35LdsUlPR+r+LX++aFfu+hj/Q2ntSdzZxFBogTCaV
	 2h6fV4/D+WAiCHlWSfXgT5nk5VD7QjUx00BJxM4U=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 06/34] ref-manual: document new github-releases class
Date: Mon, 10 Oct 2022 02:23:52 -0700
Message-Id: 
 <36af195be9a0425aafd1b8a81a336b5dfd278f42.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3310

From: Paul Eggleton <paul.eggleton@microsoft.com>

Newly added class in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst   | 14 ++++++++++++++
 documentation/ref-manual/variables.rst |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cc0d212..6c60d41 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -659,6 +659,20 @@ the GNU ``gettext`` internationalization and localization system. All
 recipes building software that use ``gettext`` should inherit this
 class.
 
+.. _ref-classes-github-releases:
+
+``github-releases``
+===================
+
+For recipes that fetch release tarballs from github, the ``github-releases``
+class sets up a standard way for checking available upstream versions
+(to support ``devtool upgrade`` and the Automated Upgrade Helper (AUH)).
+
+To use it, add ``github-releases`` to the inherit line in the recipe,
+and if the default value of :term:`GITHUB_BASE_URI` is not suitable,
+then set your own value in the recipe. You should then use ``${GITHUB_BASE_URI}``
+in the value you set for :term:`SRC_URI` within the recipe.
+
 .. _ref-classes-gnomebase:
 
 ``gnomebase.bbclass``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 81a4ab1..bdc8e3b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2768,6 +2768,13 @@ system and gives an overview of their function and contents.
       The directory in which a local copy of a Git repository is stored
       when it is cloned.
 
+   :term:`GITHUB_BASE_URI`
+      When inheriting the :ref:`github-releases <ref-classes-github-releases>`
+      class, specifies the base URL for fetching releases for the github
+      project you wish to fetch sources from. The default value is as follows::
+
+         GITHUB_BASE_URI ?= "https://github.com/${BPN}/${BPN}/releases/"
+
    :term:`GLIBC_GENERATE_LOCALES`
       Specifies the list of GLIBC locales to generate should you not wish
       to generate all LIBC locals, which can be time consuming.
-- 
1.8.3.1



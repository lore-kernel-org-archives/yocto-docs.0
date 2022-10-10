Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32BEC07E9D
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4429.1665393876866145098
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=CGpakpXn;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 038A520F0681; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 038A520F0681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393877;
	bh=1Xihw42T4dWOcdQP2wi9Zo6woX10yhkqVn2iOvLVxf0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CGpakpXn+U19EaV9jlJ9Gn1OBVbail/oV6gfJIQYmuTxBVARJq1eIKU3+4uefXDpE
	 c2s4tq/Q2QMW+xfQbtqwns7cCWHm3dVsN2U5dPw1EfjP7GlDR4J0yDLMxiHV+Om3lQ
	 VDhMwJ/SFAis5l+veQvipiNH5uWJDNicgvgXg7BI=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 25/34] ref-manual: remove reference to largefile in
 DISTRO_FEATURES
Date: Mon, 10 Oct 2022 02:24:11 -0700
Message-Id: 
 <245aeebb726389fc4945dffb480a1a9a0cc24641.1665392836.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3328

From: Paul Eggleton <paul.eggleton@microsoft.com>

This no longer does anything in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/features.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 9dc73db..dad871d 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -152,9 +152,6 @@ metadata, as extra layers can define their own:
 -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
    during boot).
 
--  *largefile:* Enable building applications with
-   `argefile support <https://en.wikipedia.org/wiki/Large-file_support>`__.
-
 -  *multiarch:* Enable building applications with multiple architecture
    support.
 
-- 
1.8.3.1



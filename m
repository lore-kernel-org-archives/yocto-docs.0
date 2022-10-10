Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE21C4707E
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4269.1665393877199265444
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=jE6ei06p;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8BCB920EC30B; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8BCB920EC30B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=4ZAfpyAYe5cZ6YE0bsuZCYIxmuREiaZLKA01PBMro6I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jE6ei06pcjXGfr9yWnuxPzy795vIzcrwwQi1LMWwnQFBp1houRtPR6onV2zj+I0lf
	 G13XwW1C7t7spMYhxsVsqMZa/kuxybEvjwcrsgkLViEymmO4JhD5cGQLWCZyeiaDKq
	 Dbb32jIdfYzGc3CDJpFU7gzUxCUxblNbA4C4sZU0=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 16/34] ref-manual: add CVE_CHECK_SHOW_WARNINGS
Date: Mon, 10 Oct 2022 02:24:02 -0700
Message-Id: 
 <e1277d4cbf71153fba9f56516864f23262c06ed1.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3320

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 885641a..c226b92 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1508,6 +1508,13 @@ system and gives an overview of their function and contents.
          # This is windows only issue.
          CVE_CHECK_IGNORE += "CVE-2020-15523"
 
+   :term:`CVE_CHECK_SHOW_WARNINGS`
+      Specifies whether or not the :ref:`pypi <ref-classes-cve-check>` class
+      should generate warning messages on the console when unpatched CVEs
+      are found. The default is "1", but you may wish to set it to "0" if you
+      are already examining/processing the logs after the build has completed
+      and thus do not need the warning messages.
+
    :term:`CVE_CHECK_SKIP_RECIPE`
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
-- 
1.8.3.1



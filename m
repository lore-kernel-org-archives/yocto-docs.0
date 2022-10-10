Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E107CC4707F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.4252.1665393876771167138
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JJh9h6qU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id AF49C20EC31D; Mon, 10 Oct 2022 02:24:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AF49C20EC31D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=xinpLhPKlmzBH0BrDJxs+82BJwGf7VXkjr6qxiEcrVM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JJh9h6qUePTDY3XqC8HNyn4GEYmsnOoA2Tc8TlJBhgYTAFZTQPB2i7mTE5nYsZh1j
	 4Sc6upwCIg0muss+FhG9sS99ceVZlFlOdAnP3cwXmeCuVqoXw4flVO5SuvW28LNgXI
	 tKOVXnDaCm3sSsWFbfOpqygeLobsJ26kcBVqJjAU=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 19/34] ref-manual: add CVE_DB_UPDATE_INTERVAL
Date: Mon, 10 Oct 2022 02:24:05 -0700
Message-Id: 
 <b8dce7c7e84587655cad3b378e16e9e365b09979.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3322

From: Paul Eggleton <paul.eggleton@microsoft.com>

New variable in 4.1.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3848d86..124eb59 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1519,6 +1519,13 @@ system and gives an overview of their function and contents.
       The list of package names (:term:`PN`) for which
       CVEs (Common Vulnerabilities and Exposures) are ignored.
 
+   :term:`CVE_DB_UPDATE_INTERVAL`
+      Specifies the CVE database update interval in seconds, as used by
+      ``cve-update-db-native``. The default value is "86400" i.e. once a day
+      (24*60*60). If the value is set to "0" then the update will be forced
+      every time. Alternatively, a negative value e.g. "-1" will disable
+      updates entirely.
+
    :term:`CVE_PRODUCT`
       In a recipe, defines the name used to match the recipe name
       against the name in the upstream `NIST CVE database <https://nvd.nist.gov/>`__.
-- 
1.8.3.1



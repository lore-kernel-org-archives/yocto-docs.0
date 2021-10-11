Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF455C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.7233.1633924683720786099
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JYe7Rmz/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DEDE820B85FC; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DEDE820B85FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924682;
	bh=oMvoqagk71esG0ufYF4bNoN9DBAlxyo9kaOyrGmFVMs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JYe7Rmz/Uunvu1TtjgzWU/N3yZ5bOqnHfIhY8MSWFG+VAkVeXaYMvA5i4HHV5rj2d
	 0N4V8zpesn7beAFr/zsaIsAIp6UNSg9iVZGSaVdsyD3G+A5rrhsd4/jcJGANpXuyHX
	 aCx1l42KgeVGDSTctabrbszPhFUhy+i1rTVy7GN0=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/5] ref-manual: remove meta class
Date: Sun, 10 Oct 2021 20:57:54 -0700
Message-Id: 
 <3018b6c33744d2a422ef2c3d2dc6e4a57a461ca1.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1981

From: Paul Eggleton <paul.eggleton@microsoft.com>

This was recently removed so remove the reference to it.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/classes.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index ffaad9b..79af45a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1494,15 +1494,6 @@ messages for various BitBake severity levels (i.e. ``bbplain``,
 This class is enabled by default since it is inherited by the ``base``
 class.
 
-.. _ref-classes-meta:
-
-``meta.bbclass``
-================
-
-The ``meta`` class is inherited by recipes that do not build any output
-packages themselves, but act as a "meta" target for building other
-recipes.
-
 .. _ref-classes-metadata_scm:
 
 ``metadata_scm.bbclass``
-- 
1.8.3.1



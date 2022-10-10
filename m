Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B49C3A59E
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:24:44 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.4266.1665393876804569002
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=nbghevwx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2B6BB20EC32C; Mon, 10 Oct 2022 02:24:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2B6BB20EC32C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665393876;
	bh=WPBkYS+bp5MJBIwSTgtOQPbpkT4PR2/VmWMp7cCioNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nbghevwxqgnaPz2BJxeFzo6yHmSF2aZxsTO3EFGuD9+pMJlN4kYpJv8peX34WjBp8
	 xIIjwGozpw8vA+w8U7ybuTHOXW5g/oBNuqibG1Gj1knDyLmDnMKRZdCWmtJWiCTTfm
	 9w3zXv1XFbCGAkV7YVAYfAmwpP3mybIlco1ESCUg=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 08/34] ref-manual: sync supported distro list with code
Date: Mon, 10 Oct 2022 02:23:54 -0700
Message-Id: 
 <4b9ba55459a5f02d5f72aa907b5cee128558f557.1665392835.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3308

From: Paul Eggleton <paul.eggleton@microsoft.com>

We were missing Ubuntu 21.10.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index acc97c9..014c9a5 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,6 +41,8 @@ distributions:
 
 -  Ubuntu 20.04 (LTS)
 
+-  Ubuntu 21.10
+
 -  Ubuntu 22.04 (LTS)
 
 -  Fedora 34
-- 
1.8.3.1



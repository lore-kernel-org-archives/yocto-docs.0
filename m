Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26930C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 19:39:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3567.1684957150426086701
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 12:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oVTnTmFM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7D477C0002;
	Wed, 24 May 2023 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684957147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cJvIPJYH0doLVzgWJmLZjYBj8q+TgKI3ZbjD8vERLuA=;
	b=oVTnTmFMDo/99kcGwmga+T9BG8YG9VUOBYvOhUUzDPpMMEPhXaff9GBBreDGuQTAoYqmf4
	lob+TA9LtTqLeVxCM/ictBqyCqsEOyxTt0rIuLfmuz61SGebd56pp1JE4LnkrjFP6kpOl1
	saw4yCSlKEHHxXWaP5a/7pl/brWbKKPuvL65sNcyLDhTQmQbnN02JYyGXaV5leZhwKbVMT
	4JZ/HsL5mcXVQzR8rWVCaeIFrJdsEWyuSnk5xOPqJcSAgMmO0zxr/mpfZoIWhlddQqzS/0
	3z0/qnv9nJGRBJjEcumsvPgVARkAiTLRenqS+CwgK+StVff4fXavLQOHfZfEyg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/4] [kirstone] Revert "docs: conf.py: fix cve extlinks caption for sphinx <4.0"
Date: Wed, 24 May 2023 21:39:00 +0200
Message-Id: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 19:39:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3962

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This reverts commit c9922076f5c1285d9cfd6aff8ce5b6635d88222f.

Since the minimum version required to build the docs has been bumped in
the previous commit to 4.0, this commit is not required. Moreover, since
Sphinx 5.0 triggers a warning when extlinks captions are not using %s
substitution and Sphinx 6.0 will fail to build without the substitution
characters, this revert is now required to be able to build the docs.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 203b85dc7e..097115276f 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,7 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
-    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-'),
+    'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.34.1



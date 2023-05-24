Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04330C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 19:39:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3569.1684957153583188749
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 12:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VdCmUyc1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 860EB1BF204;
	Wed, 24 May 2023 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684957151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSHEF4XlWIO6hGMXYKawy7HZLAyz/uz21ezmjqUps7Q=;
	b=VdCmUyc1wyh2UzuP4vw5KljdrS1yJ2kge+j+QBP6HFhHwSlbrY38gYq68lsTbTXZ4uxY+1
	/XTq4iXuQ4sZQ27oDl+F4bYAFaz4qOw977cECoQVVeo4vZSnDui/qlI8Yi4Sy0M52xKTWT
	avRauhp9H0ZHo16aoA041C0078thXsEKCEWGYLowcYlXHVEZyr/lraOxN/5pe9qiLnGoaM
	0zBf06sV4kcRqOHPDL/HxOKv9yQFZndQQVoQVi/HQbMovQRZQI+jYVCGPQvEk3lbUn6Nx/
	JHYRgxVdte0fWxdVHNMS952sg6oweu4/+0JrJ0aCXb5JTPumNlpfbcsjOQ6Gew==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/4] [kirkstone] conf.py: add macro for Mitre CVE links
Date: Wed, 24 May 2023 21:39:01 +0200
Message-Id: <20230524193903.3113544-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
References: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 19:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3963

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

New cve_mitre macro for CVEs that are not found (yet) on https://nvd.nist.gov/

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 097115276f..5ff5ec8655 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -91,6 +91,7 @@ rst_prolog = """
 # external links and substitutions
 extlinks = {
     'cve': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
+    'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),
     'yocto_wiki': ('https://wiki.yoctoproject.org/wiki%s', None),
     'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
-- 
2.34.1



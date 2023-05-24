Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E7BC7EE2D
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:27:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.139.1684949251631068752
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 10:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BBTKkauT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7975F1C0004;
	Wed, 24 May 2023 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684949249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0aRFsZZmROZ1iq0ez0sZ47XwJs+7WdFKhnzsCW+/mE=;
	b=BBTKkauTxW+WTLY+j3m8dXoq9AMXjBH3QVvpEdnJfuX+9laTJSbEU8eeI76dk/XxrCJR2X
	8yXl00U5oDjshddfa43ieowDWPX4WjQEvHcnsd+3BJHqZCB4v6i/wwV0ZUunQnIUpP8gqy
	HsvzEaJALmMsxCV9bZgqgYd8HCX96ikXSLkqhD9lKrVmWC2RrkMgmcx/9ACG1ft29E0Oak
	fJ+KJ9SvEmPslEheGlVnnPjvTiQ3GBx5gbpSQeFqUuGJsilo1gkj/nzrCUJsCoH+3+6xCg
	oryVGg4Mi2UoY1bbR0z29kS2CL4SC+vT4iJYepPkK10aJO6DbunHBJnQmxaoJg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] migration-guides: use new cve_mitre macro
Date: Wed, 24 May 2023 19:27:24 +0200
Message-Id: <20230524172724.393781-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524172724.393781-1-michael.opdenacker@bootlin.com>
References: <20230524172724.393781-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 17:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3960

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.7.rst | 4 ++--
 documentation/migration-guides/release-notes-4.1.3.rst | 4 ++--
 documentation/migration-guides/release-notes-4.2.rst   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.0.7.rst b/documentation/migration-guides/release-notes-4.0.7.rst
index 9e8ad51a0c..c3885d9e0e 100644
--- a/documentation/migration-guides/release-notes-4.0.7.rst
+++ b/documentation/migration-guides/release-notes-4.0.7.rst
@@ -7,7 +7,7 @@ Security Fixes in Yocto-4.0.7
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 -  binutils: Fix :cve:`2022-4285`
--  curl: Fix :cve:`2022-43551` and `CVE-2022-43552 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-43552>`__
+-  curl: Fix :cve:`2022-43551` and :cve_mitre:`2022-43552`
 -  ffmpeg: Fix :cve:`2022-3109` and :cve:`2022-3341`
 -  go: Fix :cve:`2022-41715` and :cve:`2022-41717`
 -  libX11: Fix :cve:`2022-3554` and :cve:`2022-3555`
@@ -24,7 +24,7 @@ Security Fixes in Yocto-4.0.7
 -  sqlite: Fix :cve:`2022-46908`
 -  systemd: Fix :cve:`2022-45873`
 -  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054` and :cve:`2023-0088`
--  webkitgtk: Fix :cve:`2022-32886`, `CVE-2022-32891 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-32891>`__ and :cve:`2022-32912`
+-  webkitgtk: Fix :cve:`2022-32886`, :cve_mitre:`2022-32891` and :cve:`2022-32912`
 
 
 Fixes in Yocto-4.0.7
diff --git a/documentation/migration-guides/release-notes-4.1.3.rst b/documentation/migration-guides/release-notes-4.1.3.rst
index 16e0a40426..d8474cda68 100644
--- a/documentation/migration-guides/release-notes-4.1.3.rst
+++ b/documentation/migration-guides/release-notes-4.1.3.rst
@@ -24,8 +24,8 @@ Security Fixes in Yocto-4.1.3
 -  sudo: Fix :cve:`2023-22809`
 -  tar: Fix :cve:`2022-48303`
 -  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054`, :cve:`2023-0288`, :cve:`2023-0433` and :cve:`2023-0512`
--  xserver-xorg: Fix `CVE-2023-0494 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0494>`__
--  xwayland: Fix `CVE-2023-0494 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-0494>`__
+-  xserver-xorg: Fix :cve_mitre:`2023-0494`
+-  xwayland: Fix :cve_mitre:`2023-0494`
 
 
 Fixes in Yocto-4.1.3
diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
index 27d51a574a..653602f152 100644
--- a/documentation/migration-guides/release-notes-4.2.rst
+++ b/documentation/migration-guides/release-notes-4.2.rst
@@ -348,7 +348,7 @@ The following corrections have been made to the :term:`LICENSE` values set by re
 Security Fixes in 4.2
 ~~~~~~~~~~~~~~~~~~~~~
 
-- binutils: :cve:`2022-4285`, `CVE-2023-25586 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-25586>`__
+- binutils: :cve:`2022-4285`, :cve_mitre:`2023-25586`
 - curl: :cve:`2022-32221`, :cve:`2022-35260`, :cve:`2022-42915`, :cve:`2022-42916`
 - epiphany: :cve:`2023-26081`
 - expat: :cve:`2022-43680`
@@ -356,7 +356,7 @@ Security Fixes in 4.2
 - git: :cve:`2022-39260`, :cve:`2022-41903`, :cve:`2022-23521`, :cve:`2022-41953` (ignored)
 - glibc: :cve:`2023-25139` (ignored)
 - go: :cve:`2023-24532`, :cve:`2023-24537`
-- grub2: :cve:`2022-2601`, :cve:`2022-3775`, `CVE-2022-28736 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-28736>`__
+- grub2: :cve:`2022-2601`, :cve:`2022-3775`, :cve_mitre:`2022-28736`
 - inetutils: :cve:`2019-0053`
 - less: :cve:`2022-46663`
 - libarchive: :cve:`2022-36227`
@@ -368,7 +368,7 @@ Security Fixes in 4.2
 - openssl: :cve:`2022-3358`, :cve:`2022-3786`, :cve:`2022-3602`, :cve:`2022-3996`, :cve:`2023-0286`, :cve:`2022-4304`, :cve:`2022-4203`, :cve:`2023-0215`, :cve:`2022-4450`, :cve:`2023-0216`, :cve:`2023-0217`, :cve:`2023-0401`, :cve:`2023-0464`
 - ppp: :cve:`2022-4603`
 - python3-cryptography{-vectors}: :cve:`2022-3602`, :cve:`2022-3786`, :cve:`2023-23931`
-- python3: `CVE-2022-37460 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-37460>`__
+- python3: :cve_mitre:`2022-37460`
 - qemu: :cve:`2022-3165`
 - rust: :cve:`2022-46176`
 - rxvt-unicode: :cve:`2022-4170`
-- 
2.34.1



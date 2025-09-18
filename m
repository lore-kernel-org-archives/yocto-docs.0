Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE11CCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:56:50 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.web11.9388.1758185808779853600
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 01:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cS8dW3g7xzk9t;
	Thu, 18 Sep 2025 10:56:47 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cS8dW0zLvzx1L;
	Thu, 18 Sep 2025 10:56:47 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 10:56:35 +0200
Subject: [PATCH 2/2] remove Debian 11 Bullseye from supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-dev-supported-distros-v1-2-aa1dc6b54c30@cherry.de>
References: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
In-Reply-To: <20250918-dev-supported-distros-v1-0-aa1dc6b54c30@cherry.de>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7541

From: Quentin Schulz <quentin.schulz@cherry.de>

Mirrors a change made to poky recently justified by the fact that
Bullseye has ended normal support and enters LTS support which is
best-effort and only by the LTS community.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 documentation/ref-manual/system-requirements.rst | 1 -
 documentation/tools/build-docs-container         | 2 --
 2 files changed, 3 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0ea52ae951e9c72bd876fc139b861b343282ebbe..bc458ce9f1986452380ed3d614a1adfd473b1507 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -65,7 +65,6 @@ supported on the following distributions:
 -  AlmaLinux 8
 -  AlmaLinux 9
 -  CentOS Stream 9
--  Debian GNU/Linux 11 (Bullseye)
 -  Debian GNU/Linux 12 (Bookworm)
 -  Fedora 39
 -  Fedora 40
diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 108809838e53a70bb79b7de46314fa42928f6a50..70b3226ce2b2a93db17ef46347f25b2f4748656a 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -77,8 +77,6 @@ main ()
     #   docs_pdf=almalinux_docs_pdf.sh
     #   pip3=pip3_docs.sh
     #   ;;
-    # Missing python3-saneyaml
-    # "debian:11"*|\
     "debian:12"*)
       containerfile=Containerfile.debian
       docs=ubuntu_docs.sh

-- 
2.51.0



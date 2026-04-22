Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C6F9EDE6
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:22:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83816.1776867779012151015
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=txSa+tQE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DA8BC5B1AC
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88F1E5FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B849F104609BF;
	Wed, 22 Apr 2026 16:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MWTq4hvcJGtMWj3y91cLsWXwvqTRJg/B9aP6KKKw9/s=;
	b=txSa+tQELKB9ChvgcE+6R++Rhj+/NpWhZb19k30mUOIXcHcUr/A5SQD9r7fhtSwSJ7aq0U
	HXjEc0O2KHFxbPbzpa+QLTKNyjSwUgbxu5YTRZdQFmwxLVVIPDI8BC5Ga9zHqtot8QLzIp
	rh67zLRKAnm/4j+n4VNhaXRSuRsNIiueO5Gu5CpUvrnnZcf7O1Y8PUZ8Ad1wcbqI0RnDiH
	k8tt49YkqMAAcpoXSZ/7mTAWrGwk7vvgKMPENEoJxpybt92mcslzhbqFaaeYMv2W6snjA/
	So+dSdky6Q5MUhXvkIh4I/X3+2lwih8Ix5og2RYopKqeLMtK2oG5B+Gz5jQI8w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:38 +0200
Subject: [PATCH 05/16] tools/build-docs-container: add CentOS 10 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-5-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/8EvO30rwwguCJ0XPHXvdnKjSGV1Ho7Um0yxc/+0iOc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm43bxcpMhbyYYmgZDDiuWieviF1kX5DLUMg
 Yrke6C3YDSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuAAKCRDRgEFAKaOo
 NjGHD/9JicBBAVQtIDUsZX2avv61TN+gYkd2wurUNbesz2J5sftyHS36a1BbIQ9ThbnKjrlUxEm
 2zF7fxkbpNMwPPNrrMCfwp5GN087/DC7b1TDRFCldlZ5Y9ixuSpPFRxxcequ5ZRZEHc9RXIhc7W
 /qASSn0K9pic+tYmoCgmZ9yKzYkRiEFtw1VtlqLAFJFKytWCOT7yYoq/HaOpjfsJClbiA5/q+Ut
 7V4UZRjGKbQ8EhxT8jKa3xzg5I+Y8M0HWTv/lKHIwlq6lw3Ggd7ljYog246iLFYbCU3DnSWdKVx
 UMq1gTltpShxsQCj7fZQqp8N9ANr6+w3COgDJjYkHO+qUkn4cw693bJ5vAJBa+wCb8AAj+GKUwT
 i6KVn3j4zdGma2kRbOt0ikHnedK3eaPjVO5ekJLyleuNWLWIsCfIEMwLI7TJxnndIbtQz6TurF0
 G+1sa9PUWRUtHX619OlbQ91vMF7r7o+xYoEUKMaZLLgNakVaiKjOrpm4Swhr9NVewu4/9U2D7zZ
 mA50yccDILFOcWdoUe3LCIpxqwFsY+4FuK6iDeAdT1KbxF3jrhq0cGVGssYs8jofWWU+/48BJDI
 Ty5ZEI2JKrIJJYt9ag80hqoZGsvgRYPNk3fSSf56XfbtpYeyombXdTb8/NKb6hwri9Uz4l5TaJs
 OiCBFIe2eZm+kRA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9314

No issue building the documentation, and including the packages from the
essential list (INCLUDE_ESSENTIAL_PACKAGES=1).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index ab8314901..37d3d2bb6 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -36,6 +36,7 @@ $0 OCI_IMAGE [make arguments...]
      - almalinux:8
      - almalinux:9
      - centos:stream9
+     - centos:stream10
      - debian:12
      - debian:13
      - fedora:42
@@ -98,7 +99,8 @@ main ()
       docs_pdf=tlmgr_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "centos:stream9"*)
+    "centos:stream9"*|\
+    "centos:stream10"*)
       containerfile=Containerfile.stream
       essential=centosstream_essential.sh
       docs=centosstream_docs.sh

-- 
2.53.0



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4A2E99071
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:48:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152538.1775814494454404272
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lUTAEiz+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 04E2FC5C1A3
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2C57603F0
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BBC7104507D9;
	Fri, 10 Apr 2026 11:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775814492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sb5QWRAqCf0O+NpmvdLkUtqBiuVZRN5q4N6Oe9Fef7o=;
	b=lUTAEiz+J0zYEUfjZffvNVVz6cq5ii+Lnzbve9TL/kvJ8QADuv7UeSVrrnzDFVURAgQm46
	bnAaV+s+dGq842PKaTg5aO/1+fw8btmJIJ18tnuGWlXhat0+qeoRydKjTNvOsa2MCKxxZe
	1Mv7ubq1FegahfByyjFVfOch1S90YOz6FXjqkaRjpt75vNNL/43iX77dGljTCgnh4Qwt7t
	PeqgTlsHn4/5iQ73BTxgV+yIgfHc6M9yvZti8clD0G3I7eT1X+ztshQU5qY3jBfht+QJMO
	UpiW8yu2atxElRQ2esaR1jtVyVtvNrgzxWzbx2ePWvqaGEUvxrRKcnfg9I7AjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 11:48:03 +0200
Subject: [PATCH 4/5] tools/build-docs-container: drop support for OpenSUSE
 Leap 15.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-update-new-supported-releases-v1-4-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=884;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DqL5EuvKKUglfEK+71dLAE5JHlQ9kRrUKzF/Bnh5Oy8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2MdY5re86UG+kDYCro4CuAW7N/N9b0j14cPQx
 R3gzaI0n82JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadjHWAAKCRDRgEFAKaOo
 Nl5nEADBRYqn8NgZU1upQoOhhKTj+GGODP4ny9XE/xRcLsTRd80qAcy1gNesnZ+MfkRDT/sFLx3
 9T9yuPoCyR7mJkiwkEOa3O40xisu3++2kq6Ue6SZ8zxUUIPqq6Tsms2cnwqdmjeKjWhhK35KJwo
 58nW294VApsbAwKQ5jG9jyj4pDMfhML9l0iSy3RAdgqRWTKgkvc7XQaaMWRO5xA5gxz9McnTCXc
 L0LvhO9HbfajpUy+uDtM8aE1j0M++PQfruEZZAl+QMr+e3xGYPqINvJF2BaWKdLbxG46ZU8JZXr
 Qxr+p7m+7a1wYjtz++jOdkNOMjjDbUCEMzxxZLoWSRW9StNgXbwKo748FISqORHkUtPkffnBqnc
 rejfUa0qXfT8zxxFK8SWdnQTiCfSAKMg78ce7k6yMH6okIYz8DEoZBW798i1gtDeSaCQah3YdBz
 hHli7ge0IMxS//pG+EEB1bO9wa2zPjTmRW1jl+1dLq0IXQSdBdoGW4moTokdLtRpuPFd1scD93R
 pblhFMWmKUMJQNf1cxmRtowbzAoR/agZRgleB0Eg0avFWlCxCMy7fH94yvJHKkmmp3BQeDdSeD7
 /9ATtcYkBulMOVJiix8zJTUUK0tRN9gKo5W1zVMwuF7F52K1hwELh39ZoIkaqyh4lm4eb10U5Oi
 F5mZ3Ub85AUQ8MQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 09:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9218

After bff5329a82ba ("poky: Update SANITY_TESTED_DISTROS") on meta-yocto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 2 --
 1 file changed, 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 9cad3de49..4fe0cba63 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -40,7 +40,6 @@ $0 OCI_IMAGE [make arguments...]
      - debian:13
      - fedora:42
      - fedora:43
-     - leap:15.5
      - leap:15.6
      - rockylinux:8
      - rockylinux:9
@@ -124,7 +123,6 @@ main ()
       docs_pdf=fedora_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    "leap:15.5"*|\
     "leap:15.6"*)
       image=opensuse/leap:$version
       containerfile=Containerfile.zypper

-- 
2.53.0



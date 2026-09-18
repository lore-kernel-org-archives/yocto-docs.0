Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19480C982DF
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11763.1789739653310458004
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=L/Htm7FG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7F2E1A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C80960649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A491E1032901E;
	Fri, 18 Sep 2026 15:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NA/F5FjHXbuLPDiIhw8YKlovWIvFD8lsG2wJAhTMTks=;
	b=L/Htm7FG4E+/rxGYnslPttXbXOGjSXU4vTnG8Fe5m9w8Emwkx1DXbYuDISv8m7GVsog8Le
	mZmPhvYKqYL33MGgxXWzLSW9msI7NNPI04CJDKuj53L0ByY7gDwWM1E9siy5L2TQ1QYK9Y
	gmvTUhGUbDhR7WSOegdvLgQepu1QHXShJYrwLA1Y0TULBrAm6HW7uNDcKr7U2EWDjfWVgh
	1HMjH3s3nHIKtPeJB0xoA8YamhTpnZ6c2G9ugwSGHrXZBRZ5t1J1JARF2qeXcKnraI57L0
	PlcpV31+jLJD9rBk2RJB/a5LLf7Ha52vaEauYDLaPKxRgHfixqfCWK3ukYQ3lA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:35 +0200
Subject: [PATCH 05/20] ref-manual,dev-manual: remove srpm mode archiver
 class mentions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-5-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2004;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3EhYB6XhqPnxpAib0nRzEVULMpXoAO59pMe8mnZTy6w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJjXbPuHEvE5zvt0BDdGk5zeItE6BaVI0rqj
 HcpCaL1ELKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYwAKCRDRgEFAKaOo
 Ntv5EACIDJypsKQ5BvbKhlDu5/nVcccgm3OZIjGI8X29MtELsp07QB3urjIwlIMXSS/c7VMrP0D
 u/miDEe8hxCXAWBkyyVVnMjrAbhg2ZJDvjMwFSJnwPOYuorohygPjWDHJ6rwWEhwi6o7iR9xDsf
 xOWHz3n/XETdxxp648X6TU8yEUnolKXydE30HGPtV554MXTQLtb6ENenBy1ppotpfi2viW7NbnP
 V2Ggpctjhu9PiNnBbDJ/rf2diwrxuuFaA/ZskfE6fIDKBG8qOJ6W80NmJ26qYN2NYq8OZTbvtqi
 UoX8xkNTBq8J0xVwfdelFrfrHxd2SYAlPt5NjpTlAy/DntcQLb34Z5iNcEQWAiGw3c0ERQ1pNSF
 OfZX95WSwqK7srdeio58g4ZAEtxM84jOjR/xPOrfgfUiymrJ2htKYetTGIexSPzJHodtknsuxHI
 MgxJM1/k+QLbN8ffzJBfuZiWQgRpID+k9FQ2RjNR4X32tZaxi2z6+1GA//NDlBv9nLnqyblG6H2
 IQbTemSPnD9MOcgVlBxpyDrhk4xcMi6wLaz7uXNM+MW36FNdTygX5dYwLAMpFVaoilVft7o3D7o
 GLPUQxZ1d2gcF4Uhz6VBaoG0s4ExEQbzfijP5V+Hr1tJVoKZUxhcvhMQpJbFdi78RxKB/nkT3Ma
 uAQ5hTwbx0VS2hw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10537

This was removed with 69ce7593e8ed ("classes/archiver: remove SRPM
mode") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/licenses.rst  | 4 +---
 documentation/ref-manual/variables.rst | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index fc23871c8..46a5a69dd 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -355,9 +355,7 @@ accidental release of proprietary software. The Yocto Project provides
 an :ref:`ref-classes-archiver` class to help avoid some of these concerns.
 
 Before you employ :term:`DL_DIR` or the :ref:`ref-classes-archiver` class, you
-need to decide how you choose to provide source. The source
-:ref:`ref-classes-archiver` class can generate tarballs and SRPMs and can
-create them with various levels of compliance in mind.
+need to decide how you choose to provide source.
 
 One way of doing this (but certainly not the only way) is to release
 just the source as a tarball. You can do this by adding the following to
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5a7ab5396..780bde3f1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -165,7 +165,6 @@ system and gives an overview of their function and contents.
          ARCHIVER_MODE[diff-exclude] ?= "file file ..."    # Lists files and directories to exclude from diff.
          ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
          ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
-         ARCHIVER_MODE[srpm] = "1"                         # Uses RPM package files.
 
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core

-- 
2.55.0



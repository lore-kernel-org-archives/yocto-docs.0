Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD07F459EF
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:43:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157878.1775832229401550064
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I5sSOGVZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7ECF4C5C1AB
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA13860435
	for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E336D10450073;
	Fri, 10 Apr 2026 16:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775832221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OqtC1HsUrDna8CY+VUo1kP6QBbG/uO3UflopJXwmx9k=;
	b=I5sSOGVZcXirJiRkwUBY+6drZBexWROm/GSkHXswVnLhO+8dftHYsPnUaaHaJ1aWKu/s2m
	0SUuIJdoJVja9LJo2O3BIuANoX47hhkU63DOMpBeYKng26SHuxwVIltVxWGEZ20Bnl72BR
	Wl4sjhAbmhLrsMuvfFWCCKHFomZkcZ9SPBt3UFDVgUuKdneNE1F6FmMptpHn98TZgPbwb8
	O93SdlEpb5ZsionRxO8m8LYQqV2YkPdL3o/ZRDwYqn82KoEgQhOlxEkJD5H9eRrkjS8Uck
	CICOVOhKUFQMRTOR5TQ6lubEf81R/n3rPeynl5fo062i+GIXAB+b/rZjvUIHqA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Apr 2026 16:43:29 +0200
Subject: [PATCH 05/18] ref-manual/variables.rst: document the
 UKI_DEVICETREE variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-second-release-notes-6-0-v1-5-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UM+7G0hiqQgbsVD67s0h4w8xdy9GQshKxawN7u+LWZQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp2QyXj7ve/rJpFZuhja25o76VEmzNiHyZCG44O
 p622xnZhx2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadkMlwAKCRDRgEFAKaOo
 NvjhD/9B0/yZUh+SFf1lnoY5t7wtYampsFD4FlX6kW+/wuJozgiay9BhLMEUOtuTkC6GhrEf1Zh
 z8VFrCWr3KhYR4pJEPYd8YcMYm3NEDlS+1/q6Rf4PPtde3VgK/YQyLPPL6/sMYPu4oNtSo5YEHM
 NpN3cmLle/YwrL7u2qBrbyfWuLScYddHM1gt9OUTdWOzfvxiHVu/38KjCgQe6cPFl8mipjgLQqL
 CPtpqTZxpT0scaEL406lJZxszxOHymx6Ijyo3+qCsxOCb4P6v6YlmZqhV9s2rz3p0nXfg/T/RiA
 aogvncTG1+ORb4u2BYAAOvjtoHN/gwAV4rQv1ghi+uHrcWbcVMu/4HciVsbGz0SiCbEcc7IqgFB
 +dwFYnkYetDNDpI0Zj4QM9jWWU3c3QIMT+3VzeSj3l5qDFXvKYhaiBwECWc0QmrCklwU0GrCTi7
 40Mmdw+IbohAVw6ECjReIv3wTjqEd9vjX+NsIgp9nvdD6Pt1uI7uCxTir5Ge41jq2oUD6EiYrEv
 2MkvNtC/ZRifqQ3VfUg+ZtzxKCpahnoNZ9sfCBgU3OK01IZmVn54k3d4MLp6WI1fVhFtvgY73uf
 UeHZITe4f+5V5o68k0bBveY3uSFYpBjEoYLVAtiNNrnYrlLKfWtKVUkgtNTtCOTG2lymlxrLkky
 QLtbjZchEvfepJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 14:43:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9236

Added by commit 56aeb7ff4e23 ("uki.bbclass: make DTB packaging
optional") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst   | 1 +
 documentation/ref-manual/variables.rst | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index acdbe9935..38b16c0f9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3559,6 +3559,7 @@ The variables used by this class are:
 -  :term:`UKI_SB_CERT`: optional UEFI secureboot certificate matching the
    private key
 -  :term:`UKI_SB_KEY`: optional UEFI secureboot private key to sign UKI with
+-  :term:`UKI_DEVICETREE`: list of device tree blobs to include to the UKI
 
 For examples on how to use this class see oeqa selftest
 :oe_git:`meta/lib/oeqa/selftest/cases/uki.py
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 20e4893d6..7606d7a42 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11899,6 +11899,11 @@ system and gives an overview of their function and contents.
       <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__
       command.
 
+   :term:`UKI_DEVICETREE`
+      When inheriting the :ref:`ref-classes-uki` class, the :term:`UKI_DEVICETREE`
+      variable holds the list of device tree blobs to include to the `Unified
+      Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
+
    :term:`UKI_FILENAME`
       When inheriting the :ref:`ref-classes-uki` class, the output file name
       for the generated `Unified Kernel Image (UKI)

-- 
2.53.0



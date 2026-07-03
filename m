Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2FDC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:35:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90486.1783078514289108008
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CrSr6s5G;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5781FC49F56
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FF9460300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:35:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB514104C95A5;
	Fri,  3 Jul 2026 13:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kg9Rfngcw3Zg5CK3yPxmhEUHsppcmos5VCjExI2dKpQ=;
	b=CrSr6s5G7Yc11A4vtaA+a98IsEwKWCq6ViLv4Eh8aOBVK91P1O0+Hzt6RLmvq/rQ+0I1PG
	HyvfyL3xqcMnNLidWB9C9otj+N+q5BobVwH5ob+MlNm6gY2D61ILQvfzIUrxX/WY09OlqV
	L8E0r+2OclbQ8Vf+KNotnW/kKOhuh1wO1eCh6qzgpJR2o+mzwOC7u2QLeIiw785CSkdlBi
	rHahhhr+tls6eXCVjhsaJK4pArWFFDDwm4XYwaNrJC9gC5ofmiVpMNrCWZNPxNv2tUXWq0
	Qji1L0mlmM3PG//MX4yovgt3E4PZNWd35679ZM1nieNw9HljF1xhupbobrC9HA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 03 Jul 2026 13:31:26 +0200
Subject: [PATCH v2 3/3] Add a pre-commit hook to check the glossaries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pre-commit-v2-3-a9a391299c28@bootlin.com>
References: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
In-Reply-To: <20260703-pre-commit-v2-0-a9a391299c28@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gez5RWOk281Ue/x5ps+DoRbAN2Aa3hdHdUUqCLKNsBI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqR55tK/dWGMJK943tFHsE7X9Vq+kGLfb1nSlsQ
 xelLWxJbfGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakeebQAKCRDRgEFAKaOo
 No7bD/43+QYFKHOZ6EZ7Fo2GSa/mQjzvToMfvZmiaHeZyt4d/QzIAD8VNUOWqHSEdd37O6kY+3G
 Gi/lD7C8HwVmTykmLTAolTnKfuebvIbJH/laj7tjlbdd5duu2zrtz9wWfU7GHh/hxHsKxSDAfYH
 nmdbBHEZTr8LatfePNz2tMZAXbXK843+BTPseqZ1r1Pabi6r/n3p+g48eNkfMOzntLJGK5HJIK9
 i1ZzpbH6EESxVMtqQWtonst7lX7aTTxq/KfH1x6HWYirvDEPewAZ/AK4rNGMpD2WxoQr1jrf+n6
 26N2cH6mKBh4JjKuX6RRjF8dGWUjefK5uLwX+Rca/2WYJA6yoHFPZSM7JYQyMGRJrPDg/WRkBl6
 YumH+F4lVfljucjZFFqU3KRlf71SDrYB+Uoch6VfxYGpeuTwDdEVNqHtbY2vTGrOUK+QridCZCT
 NAiAe5BQnuzW24j7wr37OpXgt63FjrksOYVeXS5nZjCb2tfDmOeb+Gtbb+QmNEGgZGN7jfa9MNC
 DVN24pJQAeCAhgzz4pa9dFRPQDoF5GfnLjlOYIz8VXuodXAUa/B62Wq4jLi1KQIpeO+07VAZqqH
 tRE2pvJx2P8T8S0Z++iCYj+NWVadpKLQBS4L0csK7TxOXBrORVqd+JnIN61f0r6wqehrqM1hNNh
 dKy3Sqc0B+YRVUw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10017

It is easy to badly order the glossaries or forget to update the list at
the beginning of the variables.rst file. Add a pre-commit hook that does
it for us, and update the README to mention to enable it.

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .pre-commit-config.yaml |  8 ++++++++
 documentation/README    | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
new file mode 100644
index 000000000..f2b73a481
--- /dev/null
+++ b/.pre-commit-config.yaml
@@ -0,0 +1,8 @@
+repos:
+  - repo: local
+    hooks:
+      - id: check-glossaries
+        name: Check glossaries alphabetical order
+        entry: ./documentation/tools/check-glossaries
+        language: python
+        pass_filenames: false
diff --git a/documentation/README b/documentation/README
index 7c4472c73..326930932 100644
--- a/documentation/README
+++ b/documentation/README
@@ -89,6 +89,16 @@ generated with DocBook.
 How to build the Yocto Project documentation
 ============================================
 
+If possible, install pre-commit hooks to make sure you did not miss any
+updates that are run automatically:
+
+  $ pre-commit install
+
+The pre-commit project can be installed on your host using your package manager,
+usually under the name "pre-commit", e.g.:
+
+  $ sudo apt-get install pre-commit
+
 To build the documentation, you need Sphinx and a few other packages,
 which depend on your host GNU/Linux distribution. Such packages are listed on
 https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#required-packages-for-the-build-host

-- 
2.54.0



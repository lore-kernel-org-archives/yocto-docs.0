Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178FBC982E4
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11769.1789739657570955797
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kY9sxDmi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E70BD1A098F
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC77160649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8BDC10329029;
	Fri, 18 Sep 2026 15:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yiCZR6dwVqHmpeGFSqVrj9CCVMwgax1SJa8BtJqXy6Q=;
	b=kY9sxDmif5DfnBkvXz19033HAHBvHkEfeuvkSAvSMqNXLqGRYJDZiNMeqkNpPZorsey9FY
	T+zgLxNP4eYWNtaNHbMmLSf51SxbKCGzegzQmsJD4xllsq67XPUQRIUrmazL0TXegRDeJN
	qRhSGeFh+rqX4Errluk55msJ3Y7gVXlN4zsRYEPSGoJ/AyOznKnwU0n6stBc4GZjiqds6R
	nYp6R5p1dOZ7qYGnD60dDAsMjA85TLdOxP7aPdPjKEoxdBsqQqHx2sf5oWNN7oJT9d0wB6
	HMX/zeADmpZde+iVgq/5WJLbvHjiWTW+1u2I5gaxtkm6bfU4ntbowo5dGai45w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:41 +0200
Subject: [PATCH 11/20] ref-manual/variables.rst: drop documentation for
 SDK_TOOLCHAIN_LANGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-11-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4078;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UWRlyU1GAPlGc4zamMb6bMNfPNOIHqp9vZ+xSSmxAdg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJkXo8xbZ1ZtXtNQDmasP4MwQZULTeu/a8AU
 6qJ/7zyLC2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZAAKCRDRgEFAKaOo
 NhUOEADNnhjGedX1bJTy/3KoY/QoiZ0jrmuM1A724PpgOxB9Cii0NV/MWp0VfbH6bXRln1+lkcH
 aCNA+VeHnurwNQzkm4VJx2f1TOCBRJzI7gdkgp/3I5aeYY/oLkl4AFkueZhD9LHwz0AytPzJM3s
 TOQdviReY0RJWe4/PJK39UMWA2D1IdmaJv+kmOEYxBvXJzZbvZ2EpuNWMjoNdH1EUZ/T48P02xv
 HjlGNL0xwLLjqgtz3+u3Jeab6oInIhzRF4wqGx9p1KfCEKQ2FxCGFgTP58rbbIu3qT7sVopgFRp
 2kbzcFnmVQLhTw8Zy2x0RhRFwkwlZekka+gWF3ueZt866jB80E+4oWX3gF1qqrb8lXRzwzQh/zl
 hZUQAkvluJPgiE73zrlUq7AehDZeyWaaUw5bp34xQsQj3eUX5gFSBwhYNVCJTdtFvWmpI/wB9zH
 J6UHgBnpI9sO+Z0386m6tLbTyB+VTY7zbsyL9cK+MIQYXuRMGM89ucbtA1/g5PDggmoVjoDktRe
 V/L1vX8d1MaAYyUSmnya3tZ4hEt0Wi2p+gSUiVMn6wpyg+fPV7lztD3mJ3Z5n9EyicXSWJT5aEk
 TI/5kD9QPJZozMtjMVh82cxGxaCu2EFtxkzLWalUE4TJ5uaOzMeM73jQDZJPyPVzDeD76NKX0Nt
 aieF5M5xKfYXTRQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10543

Now part of SDK_FEATURES after OE-Core commit 933981a21e58 ("sdk: fold
SDK_TOOLCHAIN_LANGS into SDK_FEATURES").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-4.1.1.rst | 2 +-
 documentation/migration-guides/release-notes-4.1.rst   | 2 +-
 documentation/migration-guides/release-notes-5.3.rst   | 4 ++--
 documentation/ref-manual/variables.rst                 | 4 ----
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.1.1.rst b/documentation/migration-guides/release-notes-4.1.1.rst
index 23ea4727c..ca3f079ad 100644
--- a/documentation/migration-guides/release-notes-4.1.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.1.rst
@@ -144,7 +144,7 @@ Fixes in Yocto-4.1.1
 -  ref-manual: add :term:`OVERLAYFS_QA_SKIP`
 -  ref-manual: add previous overlayfs-etc variables
 -  ref-manual: add pypi class
--  ref-manual: add :term:`SDK_TOOLCHAIN_LANGS`
+-  ref-manual: add ``SDK_TOOLCHAIN_LANGS``
 -  ref-manual: add section for create-spdx class
 -  ref-manual: add serial-autologin-root to :term:`IMAGE_FEATURES` documentation
 -  ref-manual: add :term:`UBOOT_MKIMAGE_KERNEL_TYPE`
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documentation/migration-guides/release-notes-4.1.rst
index 4a3fb0d2c..b7e1224ac 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -100,7 +100,7 @@ New Features / Enhancements in 4.1
 
    - :ref:`Support for using the regular build system as an SDK <sdk-manual/extensible:Setting up the Extensible SDK environment directly in a Yocto build>`
    - :ref:`ref-classes-image-buildinfo` class now also writes build information to SDKs
-   - New :term:`SDK_TOOLCHAIN_LANGS` variable to control support of rust / go in SDK
+   - New ``SDK_TOOLCHAIN_LANGS`` variable to control support of rust / go in SDK
    - rust-llvm: enabled :ref:`ref-classes-nativesdk` variant
    - python3-pluggy: enabled for :ref:`ref-classes-native` / :ref:`ref-classes-nativesdk`
 
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index ee9df424e..8a564716f 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -570,7 +570,7 @@ New Features / Enhancements in |yocto-ver|
    -  Include additional information about Meson setting in the SDK environment
       setup script (host system, CPU family, etc.).
 
-   -  Add Go to :term:`SDK_TOOLCHAIN_LANGS`, except for the following
+   -  Add Go to ``SDK_TOOLCHAIN_LANGS``, except for the following
       architecture on which this is not supported:
 
       -  RISC-V 32 bits (``rv32``)
@@ -648,7 +648,7 @@ New Features / Enhancements in |yocto-ver|
          OOM kills.
 
       -  A new SDK test is now running for Go after ``go`` was added to
-         :term:`SDK_TOOLCHAIN_LANGS`.
+         ``SDK_TOOLCHAIN_LANGS``.
 
       -  Commands sent over SSH (using the ``OESSHTarget`` class) will now error
          when an SSH failure occurs. It is possible to ignore these errors by
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 880bf9069..3fb8d8a65 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9174,10 +9174,6 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Application Development and the
       Extensible Software Development Kit (eSDK) manual.
 
-   :term:`SDK_TOOLCHAIN_LANGS`
-      Specifies programming languages to support in the SDK, as a
-      space-separated list. Currently supported items are ``rust`` and ``go``.
-
    :term:`SDK_UPDATE_URL`
       An optional URL for an update server for the extensible SDK. If set,
       the value is used as the default update server when running

-- 
2.55.0



Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E889C79FA1
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 16:02:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67347.1767628928335330722
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 08:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YuMLAXIh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A1FA1A2667
	for <docs@lists.yoctoproject.org>; Mon,  5 Jan 2026 16:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2CE60726;
	Mon,  5 Jan 2026 16:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18A48103C858A;
	Mon,  5 Jan 2026 17:02:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767628925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dt3Rx66WyyYRCj56EYGV37LB6fX1W6GW/HeonGfNts4=;
	b=YuMLAXIho5AS19LFF0hsN8VWfIuLXYBNxUom5tlRb2t48tK68RWrAO7A52VXNulqPA2Hu7
	7iQA+3IA+9RFeAWX6c6IJgzEpwEZfgoMQlEZfFpBJltYvmPWZU9/kX3e88tbmcdznMlsTX
	FxTxeqW8IL6Kupx6X+RGTQEAqqNHjqXkFnRQPnozi8qCJTxeOmEoxj3p3oX9rP7JsDm+0b
	6XSMoC9fUFEDX7YHuu4N/IVPu7gLJ7m9YcPDfpYTsECsHxaw8hWLZP26yRVba02rwJf+8G
	pKGKToJtwMl6FwKHoYTW7QkTuw8KJhLNNRfSBLXcZip/c7KfWYOqIvciqfWCPQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 05 Jan 2026 17:00:59 +0100
Subject: [PATCH] ref-manual/release-process.rst: add a "Development Cycle"
 section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-release-process-v1-1-6b84d409718c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADrgW2kC/yXMQQqDQAxG4atI1h0Ygwr2KqWLcfzViKgkbRHEu
 zvW5bd4byeDCoye2U6Kn5gsc0L+yCgOYe7hpE0m9lzmzOwUE4LBrbpEmLkiIHpfV23HBaVqVXS
 y/Y+v9237NiPi59rQcZxQk1qgcwAAAA==
X-Change-ID: 20251222-release-process-4aec0096df24
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=q7+GaNiovWAT4drMGZDdZ8udLzTlYkNzMG6Ja7QC3tE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpW+B7vkAw2jt6Q1iI2ln6bhBA2VDlYHp89MyVy
 3FBHle1XFSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaVvgewAKCRDRgEFAKaOo
 NtXoD/9ZkEahOqFaA0yGFM/vqJRovNlgbeLQEDaqtEWrD/IlZu2AXSNlU6TzJxs10v9pWHsdmzU
 PM6XqodzlbMQQn4DSZshLPwZefCGHL4KioV/UFblagOp6M/+N8IFeVs+Pd9hwC3/R9bReW40bzJ
 t1pWaX+rgoNcbPy2Nf+mjvaXytG7sGvSAnNnztYuJUmJydA8AKfOC6LeUbkrmbbMMmDUdXbFssl
 GFR1MQA2P4GQ2Pw4TqkPh8E70RzPhvN8KjTMJBFYrYqEETH8N1A96ziYzfWyM0Cogu13SmP9Gk1
 E+o561mwXj45xvPEnnIgKk/4LOviHyzxoyZXDXhkQoZKSpVNOXI+34DNdxAL2LTY1SS5O52wjvd
 CtbFYcP8/CZnS3G49dGR5qSy2hMZVRsZB3TgkfhqsdFRptgg3eO6kNoY74F0PqSg0M+3+9aK03D
 781CZYzHrpngQRvHH0nl/uwIi7QOhIDVRDQkvsl/Nvq3D6rRLBLhcCoKMALVTpT/cQziAkolJQv
 DPfQPQGbYx2MAU/eO9HAlMlBIEAAlZ/nsmWeU1bd/EQCtrB9WJPAocqTywSeggB7AMulc7Oyq2G
 YuTm4/tC4Nza/sObcp8W+tsiCuoD6RL2LyTIPawq2GnpYinc9Me7FAEivVlq7vnnjh/m5ySNK8D
 EreLPFTGNgx6uQQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Jan 2026 16:02:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8389

Add a new section to release-process.rst to document the development
cycle of each release and namely the milestones and feature freeze
occuring after M3.

Fixes [YOCTO #15979]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 826354844..165dfb86d 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -45,6 +45,45 @@ release process validates the content of the new branch.
    Realize that there can be patches merged onto the stable release
    branches as and when they become available.
 
+.. _ref-yp-development-cycle:
+
+Development Cycle
+=================
+
+As explained in the previous :ref:`ref-manual/release-process:Major and Minor
+Release Cadence` section, a new release comes out every six months.
+
+During this six-months period of time, the Yocto Project releases four
+"Milestone" releases which represent distinct points of time. The milestone
+releases are tested through the :ref:`ref-manual/release-process:Testing and
+Quality Assurance` process and helps spotting issues before the actual release
+is out.
+
+The time span between milestone releases can vary, but they are in general
+evenly spaced out during this six-months period of time.
+
+These milestone releases are tagged with a capital "M" after the future release
+tag name. For example, the milestone tags "&DISTRO_RELEASE_SERIES;M1",
+"&DISTRO_RELEASE_SERIES;M2", and "&DISTRO_RELEASE_SERIES;M3" are released before
+the actual "&DISTRO_RELEASE_SERIES;" release.
+
+.. note::
+
+   The fourth milestone (M4) is not actually released and announced, but
+   represents a point of time for the Quality Assurance team to start the
+   :ref:`ref-manual/release-process:Testing and Quality Assurance` process
+   before tagging and delivering the final release.
+
+After the third milestone release (M3), the Yocto Project enters **Feature
+Freeze**. This means that the maintainers of :term:`OpenEmbedded-Core
+(OE-Core)`, :term:`BitBake` and other core repositories stop accepting
+significant changes on the "master" branch. Changes that may be accepted are
+minor upgrades to core components and security/bug fixes.
+
+During feature freeze, a new branch is created and maintained separately to
+test new features and enhancements received from contributors, but these changes
+will only make it to the master branch after the release is out.
+
 Major Release Codenames
 =======================
 

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20251222-release-process-4aec0096df24



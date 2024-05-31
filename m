Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CE3C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 22:10:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.25676.1717193426076954254
 for <docs@lists.yoctoproject.org>;
 Fri, 31 May 2024 15:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uGFmeDnX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VMAPoc111494
	for <docs@lists.yoctoproject.org>; Fri, 31 May 2024 17:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717193425;
	bh=oHgvrxxtXSH8pxnWoFMH1DZ1n7nI47X0zTL9dQMytr0=;
	h=From:To:Subject:Date;
	b=uGFmeDnXfpxdXnlMvPXEOIme7+BiQGIjGTxtWOdWnO7Sl3gtsMD5olBicUEcU5/72
	 HkrbqR8qiYnlehQjhBamDr6EXLfNi3xYXD1d5Y86DRPRG8jA2XMwZO7nMgqTehnFks
	 QnKMPmbf9hSU10W0iDqQJkJpa5rH799oU8PK4bP8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VMAPYQ083158
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <docs@lists.yoctoproject.org>; Fri, 31 May 2024 17:10:25 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 17:10:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 17:10:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VMAPwt121029
	for <docs@lists.yoctoproject.org>; Fri, 31 May 2024 17:10:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sDAS9-00034f-3w
	for docs@lists.yoctoproject.org; Fri, 31 May 2024 17:10:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <docs@lists.yoctoproject.org>
Subject: [master][PATCH] docs: Document the GO_SRCURI_DESTSUFFIX variable
Date: Fri, 31 May 2024 17:10:25 -0500
Message-ID: <20240531221025.11778-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 May 2024 22:10:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5268

Add the needed entries for the GO_SRCURI_DESTSUFFIX variable and why it
is needed.  Also update the go.class and 5,1 migration file with the same
information.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 documentation/migration-guides/migration-5.1.rst |  5 +++++
 documentation/ref-manual/classes.rst             |  6 ++++++
 documentation/ref-manual/variables.rst           | 12 ++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b43fecc2d..453c9fcc0 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -94,6 +94,11 @@ See :ref:`all supported distributions <system-requirements-supported-distros>`.
 
 Go language changes
 ~~~~~~~~~~~~~~~~~~~
+The :term:`SRC_URI` for your Go module recipe must include setting the
+destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build
+correctly with the new :term:`UNPACKDIR` methodology::
+
+   SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}" 
 
 .. _migration-5.1-systemd-changes:
 
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9520d0bf7..e1854814a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -932,6 +932,12 @@ The :ref:`ref-classes-go` class supports building Go programs. The behavior of
 this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
 by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
 
+The :term:`SRC_URI` for your Go module recipe must include setting the
+destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build
+correctly with the new :term:`UNPACKDIR` methodology::
+
+   SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}" 
+
 To build a Go program with the Yocto Project, you can use the
 :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
 recipe as an example.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07b5b6f95..9e9b5449a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3228,6 +3228,18 @@ system and gives an overview of their function and contents.
       packages, but it can be overridden by a recipe to filter out other
       subdirectories if needed.
 
+   :term:`GO_SRCURI_DESTSUFFIX`
+      The :term:`SRC_URI` for your Go module recipe must include setting the
+      destsuffix parameter to :term:`GO_SRCURI_DESTSUFFIX` in order to build
+      correctly with the new :term:`UNPACKDIR` methodology::
+
+         SRC_URI = "...;destsuffix=${GO_SRCURI_DESTSUFFIX}" 
+
+      You should not need to set GO_SRCURI_DESTSUFFIX yourself.  By default,
+      :term:`GO_SRCURI_DESTSUFFIX` is defined as::
+
+         GO_SRCURI_DESTSUFFIX = "${S}/src/${GO_IMPORT}/"
+
    :term:`GO_WORKDIR`
       When using Go Modules, the current working directory must be the directory
       containing the ``go.mod`` file, or one of its subdirectories. When the
-- 
2.17.1



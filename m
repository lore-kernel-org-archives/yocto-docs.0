Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8048C76195
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 17:31:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.25833.1679074309429319135
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 10:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZVbAcE3b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B68FE240004;
	Fri, 17 Mar 2023 17:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679074307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V45v+VyW9DtR9/fkytFdRq0UJovHHxzhlLIB/YN4Jug=;
	b=ZVbAcE3bWbrIHmv21BJVWfoAUGUhGP+1ak5broM9pBzsHB8i1MKqitEtTI6GQq6oHjzl+6
	U36Ag7bHI9t+hWT1NPYYjIzSDBtYijcEms3o/3ToXHTi3wkHgDErpcBJHqirzIqAxyhZtA
	k8TO0VB84xSj7yq42yUw8iGcd9N36PLOaWhoe6UyG5d/UmLLt/2QPMNHO5aRYPfU99IfLm
	pQ+IVQ9BRSxJDouQYYR3ioI/zmP+eWmhvORVeGVzVvUzc7KqSu4Y6GZGxp5Wo2JTeyKO96
	MHj19gRf9x7cwLJkwovPeO11tnxBuhS6gtaFPpAQSiJoeClEpMKjvE2f+ARbcA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 1/3] manuals: update disk space requirements
Date: Fri, 17 Mar 2023 18:31:28 +0100
Message-Id: <20230317173130.36268-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317173130.36268-1-michael.opdenacker@bootlin.com>
References: <174D0151E4C65905.10271@lists.yoctoproject.org>
 <20230317173130.36268-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Mar 2023 17:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3805

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Tests made on Poky master on March 16, 2023.

Add a "Free Disk Space" section to the "System Requirements" document.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/brief-yoctoprojectqs/index.rst     |  4 +++-
 documentation/poky.yaml.in                       |  2 ++
 documentation/ref-manual/system-requirements.rst | 11 +++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7b8baf233a..07e95ee85c 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -40,7 +40,9 @@ Compatible Linux Distribution
 Make sure your :term:`Build Host` meets the
 following requirements:
 
--  50 Gbytes of free disk space
+-  At least &MIN_DISK_SPACE; Gbytes of free disk space, though
+   much more will help to run multiple builds and increase
+   performance by reusing build artifacts.
 
 -  Runs a supported Linux distribution (i.e. recent releases of Fedora,
    openSUSE, CentOS, Debian, or Ubuntu). For a list of Linux
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 30e1050824..7810b8d2a5 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -41,3 +41,5 @@ MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "7.5"
 MIN_MAKE_VERSION : "4.0"
+# Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on Ubuntu 22.04 (x86-64), rounded up from 87
+MIN_DISK_SPACE : "90"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0fbe3f12c8..bf50fc510a 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -31,6 +31,17 @@ and conceptual information in the :doc:`/overview-manual/index`.
 
 .. _detailed-supported-distros:
 
+Minimum Free Disk Space
+=======================
+
+To build an image such as ``core-image-sato`` for the ``qemux86-64`` machine,
+you need a system with at least &MIN_DISK_SPACE; Gbytes of free disk space.
+However, much more disk space will be necessary to build more complex images,
+to run multiple builds and to cache build artifacts, improving build efficiency.
+
+If you have a shortage of disk space, see the ":doc:`/dev-manual/disk-space`"
+section of the Development Tasks Manual.
+
 Supported Linux Distributions
 =============================
 
-- 
2.34.1



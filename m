Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A33C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 09:54:21 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.4818.1678787656381420564
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Mar 2023 02:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FbSH3NMh;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9ECFE240013;
	Tue, 14 Mar 2023 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678787654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ouw8UcndKaf4e9W62n0vRSJvFhHKpo/Bv4cccmmTBXA=;
	b=FbSH3NMhB/H3oaMaFxKLUWRVtMh+TPTaf63X2XyRlXP5o6myBtiknB4Ufs3dZe84qUvAER
	Jm3ebtjrWT1QvtGAT477R7NUe2edyQWsP9BBSK0uU8eo+NZcFDdbmRcZHaJ412vk7IgNZ7
	g1QtzDGFfwhgDIccGUVKJaLVzIZsMc5GLShbJ8s8BASnNggPLcH5ODMOKgMhnc8FpGW+ED
	tKHM8JfQH8r5+qs22nYx+6epy0AliJFZZRUOg3NRWzy8eHoyg5eemiZ70Uw5mqmRWddCJr
	58Hv4+pQSJf5Yszf9gXYXsTxYWutDPV4Z0niv35WVZoURTI2r+63t4DCKO8fyQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] Documentation: add pygments package for generating docs
Date: Tue, 14 Mar 2023 10:54:01 +0100
Message-Id: <20230314095401.13264-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <174C3D672BA632EA.1180@lists.yoctoproject.org>
References: <174C3D672BA632EA.1180@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Mar 2023 09:54:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3791

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To the packages required to build docs

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Changes in V2:
  - Had "pygments" to PIP3_HOST_PACKAGES_DOC in documentation/poky.yaml.in too
---
 documentation/README       | 4 ++--
 documentation/poky.yaml.in | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/README b/documentation/README
index e8aed86eb4..117f4be409 100644
--- a/documentation/README
+++ b/documentation/README
@@ -118,12 +118,12 @@ and of its required dependencies is to use the Python Package Index (pip).
 
 To install all required packages run:
 
- $ pip3 install sphinx sphinx_rtd_theme pyyaml
+ $ pip3 install sphinx sphinx_rtd_theme pyyaml pygments
 
 To make sure you always have the latest versions of such packages, you
 should regularly run the same command with an added "--upgrade" option:
 
- $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
+ $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml pygments
 
 Also install the "inkscape" package from your distribution.
 Inkscape is need to convert SVG graphics to PNG (for EPUB
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index cdccf6f3ca..0f8b5c0139 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -40,7 +40,7 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
      rpcgen mesa-libGL-devel zstd lz4"
-PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
+PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml pygments"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
-- 
2.34.1



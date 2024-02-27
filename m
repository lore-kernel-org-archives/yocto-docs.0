Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70CCC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12668.1709042503113617671
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rhfwq3K+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97D781C0004;
	Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNQpFvv9TXMwF8IpH0Auph33zThEGXgds6Zy19ovh58=;
	b=Rhfwq3K+oXGEuIMcYaCGhMBJ2tbr7Mk5YKcEpuq8Iq/pXOW75a7ESrmtARFunfiCfzyG9U
	zvvoaSBbI2Utv/dwx3dl6lpcQzQHKTkw50RgOx6w4S1POYjcs/vP/gb8Wdq6tXgab8H04F
	k2xMDPrq6710/NtXuUh0J/BBxDRlMYHqnGks8Dv5ZXc6n19Z6E+K4knaCfFyHfOS9Bv3jM
	V86kzQWVESDXBvB0KpKylZlxA/1vZHfkkx/9/UrE/YL2g+I20jtmqDn5lrQneQDae8aKxN
	n7uoIiSflNGWBVuxIBW0L296pCIKCdQ7qNqkPx1Ygl7OTKrGiyupqYd2vmvqpA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	mhagans@skyviewsat.com
Subject: [kirkstone][PATCH 14/16] ref-manual: system-requirements: update packages to build docs
Date: Tue, 27 Feb 2024 15:01:26 +0100
Message-Id: <20240227140128.481522-15-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4905

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- "git" is now required to run "set_versions.py"

- Fix Ubuntu / Debian packages.
  The previous instructions didn't run on Debian 12
  Tested on Ubuntu 22.04 and Debian 12.

  Reported on https://lists.yoctoproject.org/g/docs/message/4789

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: <mhagans@skyviewsat.com>
---
 documentation/ref-manual/system-requirements.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index c5fe4da036..391ba95c42 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -172,8 +172,8 @@ with a supported Ubuntu or Debian Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo apt install make python3-pip inkscape texlive-latex-extra
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo apt install git make inkscape texlive-latex-extra
+   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
 
    .. note::
 
@@ -191,7 +191,7 @@ with a supported Fedora Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
@@ -204,7 +204,7 @@ with a supported openSUSE distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo zypper install make python3-pip which inkscape texlive-fncychap
+   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 
@@ -231,7 +231,7 @@ with a supported AlmaLinux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
-- 
2.34.1



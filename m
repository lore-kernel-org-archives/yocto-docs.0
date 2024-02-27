Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33327C54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 13:58:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.12757.1709042327612235781
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 05:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ws8GCGuL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4F9D240007;
	Tue, 27 Feb 2024 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3dClKKEVq9UKu3CcN7AH2Ci2pOmuHylxyyQLaLvMQI=;
	b=Ws8GCGuL8aVhxwZ5UW8nvbid+X6G8suLQYfUNfcUp/s+uoPBzCbhNI/WHLt4YGDLDj/a0b
	9DHDf7m7sjNNqEv2r76J+PZPl4Kx2oeYDGuM9lbg9ib0zUQYnnY45qPEp79DHsMmOZxsfW
	0kwNcH5GMLQNmsiL9fsvE/6b4sACdfg6ELoxpr+RMPUWb0oEgrrfuO+2Ga1tAPg9Xeac5t
	5EbslAcA40P9di/NI8St3SUJQfybj1WD/DbmCbms7pRPsUooEUC5aG4u72+bCQkRnj/DPm
	afonKwBzYhLL7jIEC5lR5Pnl0Yv0GcqqWaEnQIMC7bsrmb2FqfJ6DPpsOve3TQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	mhagans@skyviewsat.com
Subject: [nanbield][PATCH 2/6] ref-manual: system-requirements: update packages to build docs
Date: Tue, 27 Feb 2024 14:58:26 +0100
Message-Id: <20240227135830.481147-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
References: <20240227135830.481147-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 13:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4886

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
index 9dee24a1fa..bcca42e36e 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -168,8 +168,8 @@ with a supported Ubuntu or Debian Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo apt install make python3-pip inkscape texlive-latex-extra
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo apt install git make inkscape texlive-latex-extra
+   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
 
 Fedora Packages
 ---------------
@@ -181,7 +181,7 @@ with a supported Fedora Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
@@ -194,7 +194,7 @@ with a supported openSUSE distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo zypper install make python3-pip which inkscape texlive-fncychap
+   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 
@@ -221,7 +221,7 @@ with a supported AlmaLinux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
-- 
2.34.1



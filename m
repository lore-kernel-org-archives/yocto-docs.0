Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AD6C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 10:21:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8547.1707474065719438945
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 02:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C+of0TYj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A5654000E;
	Fri,  9 Feb 2024 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707474063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ruOuIIBHESp0IsPwp0ILInQbHbAjDFK6Bos9FFZM8vQ=;
	b=C+of0TYjcrp0IZUIUwHHLEGtr0f5Gfzjksvcc2k7uN5/GpwDioiN2vJjpkZ2EIrev5IbeL
	Ot6WLT2YTLi11dlWW3Eai6Jd7iaftQoyHZWj0D4uPsWxuellq0qh5Ocb+tRw2k8NeF1pWG
	3aGwMeblSqjQ0+0GOSEnqxpawS3nkVhZVyrwa7hiFh/dtfvqBPQzvvKkZ/zw4+82x/RxeR
	jSVB9tVrz+0JqHCrCsIyh/ckyOvgaCwRomLNZ9g+BN2gzwOjKKUrxxljRumi746r/i/5SR
	4tWMn/XJ+L8ve+wDAiZ0uzm1rYhYZGoOcm6XwoLfBDSy4U2vXq7wZbPdvQ5MCQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	mhagans@skyviewsat.com
Subject: [PATCH] ref-manual: system-requirements: update packages to build docs
Date: Fri,  9 Feb 2024 11:20:55 +0100
Message-Id: <20240209102055.1345588-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Feb 2024 10:21:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4826

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
index 9e2dd532f9..0fc92550a5 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -164,8 +164,8 @@ with a supported Ubuntu or Debian Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo apt install make python3-pip inkscape texlive-latex-extra
-   &PIP3_HOST_PACKAGES_DOC;
+   $ sudo apt install git make inkscape texlive-latex-extra
+   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
 
 Fedora Packages
 ---------------
@@ -177,7 +177,7 @@ with a supported Fedora Linux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
@@ -190,7 +190,7 @@ with a supported openSUSE distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo zypper install make python3-pip which inkscape texlive-fncychap
+   $ sudo zypper install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 
@@ -217,7 +217,7 @@ with a supported AlmaLinux distribution::
 
 Here are the packages needed to build Project documentation manuals::
 
-   $ sudo dnf install make python3-pip which inkscape texlive-fncychap
+   $ sudo dnf install git make python3-pip which inkscape texlive-fncychap
    &PIP3_HOST_PACKAGES_DOC;
 
 .. _system-requirements-buildtools:
-- 
2.34.1



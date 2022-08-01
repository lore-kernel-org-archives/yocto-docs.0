Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29E0C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 10:35:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.23024.1659350148555632708
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 03:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.198,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 79664C0011;
	Mon,  1 Aug 2022 10:35:46 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 4/4] docs: ref-manual: system-requirements: add missing
 packages
Date: Mon,  1 Aug 2022 12:35:29 +0200
Message-Id: <20220801103529.2053164-4-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801103529.2053164-1-foss+yocto@0leil.net>
References: <20220801103529.2053164-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Aug 2022 10:35:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3098

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

inkscape and the package providing fncychap.sty TeX font were missing
from the packages to install to be able to build the documentation, so
let's add them to the list.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/ref-manual/system-requirements.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 6cf88f2a9..310ee4561 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -133,7 +133,7 @@ supported Ubuntu or Debian Linux distribution:
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo apt install make python3-pip
+      $ sudo apt install make python3-pip inkscape texlive-latex-extra
       &PIP3_HOST_PACKAGES_DOC;
 
    .. note::
@@ -156,7 +156,7 @@ supported Fedora Linux distribution:
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo dnf install make python3-pip which
+      $ sudo dnf install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
 openSUSE Packages
@@ -173,7 +173,7 @@ supported openSUSE Linux distribution:
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo zypper install make python3-pip which
+      $ sudo zypper install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
 
@@ -201,7 +201,7 @@ supported CentOS-7 Linux distribution:
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo yum install make python3-pip which
+      $ sudo yum install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
 CentOS-8 Packages
@@ -231,7 +231,7 @@ supported CentOS-8 Linux distribution:
 -  *Documentation:* Packages needed if you are going to build out the
    Yocto Project documentation manuals::
 
-      $ sudo dnf install make python3-pip which
+      $ sudo dnf install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
 Required Git, tar, Python, make and gcc Versions
-- 
2.37.1



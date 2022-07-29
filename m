Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FFBC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 18:04:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.138.1659117880102048606
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 11:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=elDwpFU6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5AFEF1C0002;
	Fri, 29 Jul 2022 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659117877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDQPT/xomrQe7cpZqPTivJa8dsVt6ambtt4JVcPf5gs=;
	b=elDwpFU6DC5EZCvxqY45VuSylNbNBNPrH13eOz5gioGO6h7g5DySZ9MxHBkz0f8/zCd8oj
	0lBdIpJ5RJBXmXrZeNlzSsaRbp0qImJj3QhNToVdVSN/iTfXaODA0sU/jzL711ir2QwNPC
	PhB4j5eEufBB4Unx+y2418p74PgOuI2SlEQ+YBML1dBpsClXk7dPj4Yqppf+RJBYjYTQJQ
	My64kxRLUlz9uzS1oGIeRgZ5uDDXfRSQZSJp+fQyTh6jSuwDvFoL3QYlRhCcnj7vhZwZsc
	4KFFkqMa7eMOixtSpXGi//w8bTiuHOFxCtSHrhSacPgQ0XDcE2V5CxqYhIiOSw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [PATCH v2] system-requirements.rst: remove EOL and Centos7 hosts
Date: Fri, 29 Jul 2022 20:04:33 +0200
Message-Id: <20220729180433.68165-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <17065ECCA0C06FCA.29169@lists.yoctoproject.org>
References: <17065ECCA0C06FCA.29169@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Jul 2022 18:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3094

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Armin Kuster <akuster808@gmail.com>

Commit https://git.yoctoproject.org/poky/commit/?id=d08e47312741a18e7be505d22762b90528253ac9
removed some EOL and CentOS7 from list hos supported hosts. Sync docs with Poky
Replace CentOS with AlmaLinux.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:

- Fix an underline issue in AlmaLinux section title
- Remove remaining sections about Debian 8
---
 .../ref-manual/system-requirements.rst        | 51 ++-----------------
 1 file changed, 3 insertions(+), 48 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 6cf88f2a98..ad98c1397a 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -45,14 +45,8 @@ distributions:
 
 -  Fedora 35
 
--  CentOS 7.x
-
--  CentOS 8.x
-
 -  AlmaLinux 8.5
 
--  Debian GNU/Linux 9.x (Stretch)
-
 -  Debian GNU/Linux 10.x (Buster)
 
 -  Debian GNU/Linux 11.x (Bullseye)
@@ -120,12 +114,6 @@ supported Ubuntu or Debian Linux distribution:
          $ sudo apt build-dep qemu
          $ sudo apt remove oss4-dev
 
-   -  For Debian-8, ``python3-git`` and ``pylint3`` are no longer
-      available via ``apt``.
-      ::
-
-         $ sudo pip3 install GitPython pylint==1.9.5
-
 -  *Essentials:* Packages needed to build an image on a headless system::
 
       $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
@@ -136,12 +124,6 @@ supported Ubuntu or Debian Linux distribution:
       $ sudo apt install make python3-pip
       &PIP3_HOST_PACKAGES_DOC;
 
-   .. note::
-
-      It is currently not possible to build out documentation from Debian 8
-      (Jessie) because of outdated ``pip3`` and ``python3``. ``python3-sphinx``
-      is too outdated.
-
 Fedora Packages
 ---------------
 
@@ -177,38 +159,11 @@ supported openSUSE Linux distribution:
       &PIP3_HOST_PACKAGES_DOC;
 
 
-CentOS-7 Packages
------------------
-
-Here are the required packages by function given a
-supported CentOS-7 Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
-
-      $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
-
-   .. note::
-
-      -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
-         a collection of packages from Fedora built on RHEL/CentOS for
-         easy installation of packages not included in enterprise Linux
-         by default. You need to install these packages separately.
-
-      -  The ``makecache`` command consumes additional Metadata from
-         ``epel-release``.
-
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo yum install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
-
-CentOS-8 Packages
------------------
+AlmaLinux-8 Packages
+--------------------
 
 Here are the required packages by function given a
-supported CentOS-8 Linux distribution:
+supported AlmaLinux-8 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
    system::
-- 
2.34.1



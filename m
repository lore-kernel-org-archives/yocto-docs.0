Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996FFC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 08:22:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.3839.1637569321242308022
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 00:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 31F7EC000E;
	Mon, 22 Nov 2021 08:21:58 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove newline string in PREMIRRORS
Date: Mon, 22 Nov 2021 09:21:47 +0100
Message-Id: <20211122082147.2006491-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Nov 2021 08:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2178

According to the syntax simplification brought by
https://git.openembedded.org/bitbake/commit/?id=044fb04d

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/faq.rst       | 16 ++++++++--------
 documentation/ref-manual/variables.rst |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 6f2970df23..e06dfd972b 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -302,10 +302,10 @@ attempt before any others by adding something like the following to the
 ``local.conf`` configuration file::
 
    PREMIRRORS:prepend = "\
-       git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n"
+       git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
 
 These changes cause the build system to intercept Git, FTP, HTTP, and
 HTTPS requests and direct them to the ``http://`` sources mirror. You
@@ -342,10 +342,10 @@ You could make the following changes to the ``local.conf`` configuration
 file as long as the :term:`PREMIRRORS` server is current::
 
    PREMIRRORS:prepend = "\
-       git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n"
+       git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
    BB_FETCH_PREMIRRORONLY = "1"
 
 These changes would cause the build system to successfully fetch source
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 26b56e145c..6cf771fb22 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5857,10 +5857,10 @@ system and gives an overview of their function and contents.
       :term:`Build Directory`::
 
          PREMIRRORS:prepend = "\
-             git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-             ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-             http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n \
-             https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \n"
+             git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+             ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+             http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+             https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
 
       These changes cause the
       build system to intercept Git, FTP, HTTP, and HTTPS requests and
-- 
2.25.1



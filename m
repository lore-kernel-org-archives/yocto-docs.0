Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.2243.1631646288735419879
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 12:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9A0A620002;
	Tue, 14 Sep 2021 19:04:40 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] manuals: replace Freenode by Libera Chat as IRC host
Date: Tue, 14 Sep 2021 21:04:32 +0200
Message-Id: <20210914190432.2045216-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #14546]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/boilerplate.rst          | 2 +-
 documentation/ref-manual/resources.rst | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
index baccc9fe40..9b64d91efd 100644
--- a/documentation/boilerplate.rst
+++ b/documentation/boilerplate.rst
@@ -14,5 +14,5 @@ Commons.
 To report any inaccuracies or problems with this (or any other Yocto Project)
 manual, or to send additions or changes, please send email/patches to the Yocto
 Project documentation mailing list at ``docs@lists.yoctoproject.org`` or
-log into the Freenode ``#yocto`` channel.
+log into the `Libera Chat <https://libera.chat/>`__ ``#yocto`` channel.
 
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 5ffd2b3991..f34ab8a53d 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -90,8 +90,8 @@ For more Yocto Project-related mailing lists, see the
 Internet Relay Chat (IRC)
 =========================
 
-Two IRC channels on Freenode are available for the Yocto Project and
-Poky discussions:
+Two IRC channels on `Libera Chat <https://libera.chat/>`__
+are available for the Yocto Project and Poky discussions:
 
 -  ``#yocto``
 
@@ -187,7 +187,8 @@ Here is a list of resources you might find helpful:
    implementation of Bugzilla for logging and tracking Yocto Project
    defects.
 
--  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
+-  *Internet Relay Chat (IRC):* Two IRC channels on
+   `Libera Chat <https://libera.chat/>`__ are
    available for Yocto Project and Poky discussions: ``#yocto`` and
    ``#poky``, respectively.
 
-- 
2.25.1


Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4077.1631688527346332655
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 23:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 978292000C;
	Wed, 15 Sep 2021 06:48:45 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] manuals: replace Freenode by Libera Chat as IRC host
Date: Wed, 15 Sep 2021 08:48:30 +0200
Message-Id: <20210915064830.2191396-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
References: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #14546]
This also replaces the "#poky" channel (inactive)
by "#oe", which is more actively used.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/boilerplate.rst          |  2 +-
 documentation/ref-manual/resources.rst | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

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
index 5ffd2b3991..c942384662 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -90,12 +90,12 @@ For more Yocto Project-related mailing lists, see the
 Internet Relay Chat (IRC)
 =========================
 
-Two IRC channels on Freenode are available for the Yocto Project and
-Poky discussions:
+Two IRC channels on `Libera Chat <https://libera.chat/>`__
+are available for the Yocto Project and OpenEmbedded discussions:
 
 -  ``#yocto``
 
--  ``#poky``
+-  ``#oe``
 
 .. _resources-links-and-related-documentation:
 
@@ -187,9 +187,10 @@ Here is a list of resources you might find helpful:
    implementation of Bugzilla for logging and tracking Yocto Project
    defects.
 
--  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
-   available for Yocto Project and Poky discussions: ``#yocto`` and
-   ``#poky``, respectively.
+-  *Internet Relay Chat (IRC):* Two IRC channels on
+   `Libera Chat <https://libera.chat/>`__ are
+   available for Yocto Project and OpenEmbeddded discussions: ``#yocto`` and
+   ``#oe``, respectively.
 
 -  `Quick EMUlator (QEMU) <https://wiki.qemu.org/Index.html>`__\ *:* An
    open-source machine emulator and virtualizer.
-- 
2.25.1


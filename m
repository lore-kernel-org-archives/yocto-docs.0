Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C1EC7EE3A
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.84.1692378637182932716
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iE0c2U4U;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A7BB240003;
	Fri, 18 Aug 2023 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIUsFLqe59fH18WAGj2qw1pJ/WJS8xNh/bIqL02Ob08=;
	b=iE0c2U4UBFmrDU71Wzz9WLNHITAFDM6MQPIwCSjpZe69hyhveB6Gem/P9q3vLIcv7VQMld
	uutIyBfSgzVZkl7ySLw04J8VrnwAEcw7St+YXIEyPCI8Hq5XsOHHDM/ND0PfGkhUvq30Vi
	DFbkcJzggnjDW8o9VKl1AU1MbQTVCGh5ut8rbtI80SAqbQSg7yfPWrjJYPzpMdE9JRDBOw
	UK5wNsmnEgE8E/ql/U8r3lOc/0zOQgUmKVbVWvzeaikiHXYfPaOhmWSoeItW+cv9lSeVaj
	BSlP6tY+lHimbgq2Mk6q00kO8wIs32wpbvwmKeLlF9MjA0/4fud0IZqRQYVEFA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 06/10] manuals: README: update list of manuals
Date: Fri, 18 Aug 2023 19:10:01 +0200
Message-Id: <20230818171005.92381-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
References: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4171

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README                          |  8 ++--
 .../contributor-guide/submit-changes.rst      | 48 +++++++++++++++----
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/documentation/README b/documentation/README
index e8aed86eb4..4d31036e69 100644
--- a/documentation/README
+++ b/documentation/README
@@ -34,16 +34,18 @@ Manual Organization
 
 Here the folders corresponding to individual manuals:
 
+* brief-yoctoprojectqs - Yocto Project Quick Start
 * overview-manual      - Yocto Project Overview and Concepts Manual
-* sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
+* contributor-guide    - Yocto Project and OpenEmbedded Contributor Guide
+* ref-manual           - Yocto Project Reference Manual
 * bsp-guide            - Yocto Project Board Support Package (BSP) Developer's Guide
 * dev-manual           - Yocto Project Development Tasks Manual
 * kernel-dev           - Yocto Project Linux Kernel Development Manual
-* ref-manual           - Yocto Project Reference Manual
-* brief-yoctoprojectqs - Yocto Project Quick Start
 * profile-manual       - Yocto Project Profiling and Tracing Manual
+* sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
 * toaster-manual       - Toaster User Manual
 * test-manual          - Yocto Project Test Environment Manual
+* migration-guides     - Yocto Project Release and Migration Notes
 
 Each folder is self-contained regarding content and figures.
 
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index afed30717b..aeef2cc90a 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -349,16 +349,48 @@ introduces. The maintainer that receives your patches needs to be able
 to save and apply them directly from your emails, using the ``git am``
 command.
 
-Using the ``git send-email`` command is the only error-proof way of
-sending your patches using email since there is no risk of compromising
-whitespace in the body of the message, which can occur when you use
-your own mail client. It will also properly include your patches
-as inline attachments, which is not easy to do with standard e-mail
-clients without breaking lines.
+Using the ``git send-email`` command is the only error-proof way of sending
+your patches using email since there is no risk of compromising whitespace
+in the body of the message, which can occur when you use your own mail
+client. It will also properly include your patches as *inline attachments*,
+which is not easy to do with standard e-mail clients without breaking lines.
+If you used your regular e-mail client and shared your patches as regular
+attachments, reviewers wouldn't be able to quote specific sections of your
+changes and make comments about them.
 
 Setting up Git to Send Email
 ----------------------------
 
+The ``git send-email`` command can send email by using a local or remote
+Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
+through a direct SMTP configuration in your Git ``~/.gitconfig`` file.
+
+Here are the settings for letting ``git send-email`` send e-mail through your
+regular STMP server, using a Google Mail account as an example::
+
+   git config --global sendemail.smtpserver smtp.gmail.com
+   git config --global sendemail.smtpserverport 587
+   git config --global sendemail.smtpencryption tls
+   git config --global sendemail.smtpuser ada.lovelace@gmail.com
+   git config --global sendemail.smtppass = XXXXXXXX
+
+These settings will appear in the ``.gitconfig`` file in your home directory.
+
+If you neither can use a local MTA nor SMTP,  make sure you use an email client
+that does not touch the message (turning spaces in tabs, wrapping lines, etc.).
+A good mail client to do so is Pine (or Alpine) or Mutt. For more
+information about suitable clients, see `Email clients info for Linux
+<https://www.kernel.org/doc/html/latest/process/email-clients.html>`__
+in the Linux kernel sources.
+
+If you use such clients, just include the patch in the body of your email.
+
+Subscribing to Mailing Lists
+----------------------------
+
+Sending Patches via Email
+-------------------------
+
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
 see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
@@ -367,10 +399,6 @@ section above.
 #. *Send the patches via email:* Send the patches to the recipients and
    relevant mailing lists by using the ``git send-email`` command.
 
-   The ``git send-email`` command sends email by using a local or remote
-   Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
-   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`` file.
-
    The ``git send-email`` command is the preferred method for sending
    your patches using email since there is no risk of compromising
    whitespace in the body of the message, which can occur when you use
-- 
2.34.1



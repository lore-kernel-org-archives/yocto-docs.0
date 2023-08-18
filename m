Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF97C7EE31
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.80.1692378634866086132
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NJDchDXZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3461620005;
	Fri, 18 Aug 2023 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27FEB14je1CohoaO1hZI2qByOKZ7JF9mWdHYQBQrtF4=;
	b=NJDchDXZpMUzdSXPDya4cM363aZphOnFXgrF3KC5pFOV0s47fjEmpzMoWdKLCP/2JFdzUt
	aePIHZqb3skKVkClGXxZu3nJL7wAXheaXpnEkW/Pz8iQuNQSh6/gC4z0JrP6QzU0DzZKVJ
	JezwHXnH6YwBfbksbkpZiBu2nJ8Os7/ZZ/X9+V7RQugzu9s7gLWgb9d0GP3Zw0qfG9PWyY
	2It/sRoGu94v7BgSKK531aiO5FU5EUos+nSVeGHK1o1+wBc9VVyymEiEaVoL4wS/SmJtxB
	aQ/9NJf4KWW6O+UY6Q87u9m46V09AqELFMPSjs7ToXQF3P8AzK59dyRNdEfJ0g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 05/10] contributor-guide: submit-changes: develop sending patches section
Date: Fri, 18 Aug 2023 19:10:00 +0200
Message-Id: <20230818171005.92381-6-michael.opdenacker@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4170

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../contributor-guide/submit-changes.rst      | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 314b41bb63..afed30717b 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -340,6 +340,25 @@ Here is the general procedure on how to create patches to be sent through email:
 Sending the Patches via Email
 =============================
 
+Using Git to Send Patches
+-------------------------
+
+To submit patches through email, it is very important that you send them
+without any whitespace or HTML formatting that either you or your mailer
+introduces. The maintainer that receives your patches needs to be able
+to save and apply them directly from your emails, using the ``git am``
+command.
+
+Using the ``git send-email`` command is the only error-proof way of
+sending your patches using email since there is no risk of compromising
+whitespace in the body of the message, which can occur when you use
+your own mail client. It will also properly include your patches
+as inline attachments, which is not easy to do with standard e-mail
+clients without breaking lines.
+
+Setting up Git to Send Email
+----------------------------
+
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
 see the ":ref:`contributor-guide/submit-changes:finding a suitable mailing list`"
@@ -350,15 +369,7 @@ section above.
 
    The ``git send-email`` command sends email by using a local or remote
    Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
-   through a direct ``smtp`` configuration in your Git ``~/.gitconfig``
-   file. If you are submitting patches through email only, it is very
-   important that you submit them without any whitespace or HTML
-   formatting that either you or your mailer introduces. The maintainer
-   that receives your patches needs to be able to save and apply them
-   directly from your emails. A good way to verify that what you are
-   sending will be applicable by the maintainer is to do a dry run and
-   send them to yourself and then save and apply them as the maintainer
-   would.
+   through a direct ``smtp`` configuration in your Git ``~/.gitconfig`` file.
 
    The ``git send-email`` command is the preferred method for sending
    your patches using email since there is no risk of compromising
-- 
2.34.1



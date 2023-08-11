Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85527EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:55:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.49358.1691776540916388957
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 10:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X0k/8zDe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDA04C0003;
	Fri, 11 Aug 2023 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691776539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSyK8BZJUG1g24H28CiNTDpgAZfD/fIowBfBDprj4KU=;
	b=X0k/8zDeoxzOYIXhlM7gPp5FlKYGwJ5bpX48ZClF/FhfHtXP0W1yHtDLlrRCONvppmQ8Op
	wmNUC/vHUICiH5P+MK2UfyV7pWrXQcEPSwknWrjL1AelbglbpDkOQmshFKq+ZA6E7pndyD
	Tgf4EqYmkqCIVcoFZmradHLZsKnizLcmMYdMI/5xfpqS0nEo8h59Bbj0wEhkNmLC34FHrs
	GprsY4PepLrewBO0HDRnckjJQWsRoZueNVoGToVYuOLGlkk7iN29qfI/KGex84DG+/NtiK
	upJCdYX0JWXzD2OxZxkVXb9Jz9/ALWQu/Wcun0c+dCtQAYEcOWt8pxoyRHkn0w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/5] contributor guide: remove unnecessary information about mailing lists
Date: Fri, 11 Aug 2023 19:55:25 +0200
Message-Id: <20230811175527.1116864-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
References: <20230811175527.1116864-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Aug 2023 17:55:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4148

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The mailing lists for sending code are sufficient!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-change.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-change.rst
index 1327b2854c..3fd2b049cf 100644
--- a/documentation/contributor-guide/submit-change.rst
+++ b/documentation/contributor-guide/submit-change.rst
@@ -226,9 +226,7 @@ Using Email to Submit a Patch
 Depending on the components changed, you need to submit the email to a
 specific mailing list. For some guidance on which mailing list to use,
 see the ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
-section above. For a description of all the available
-mailing lists, see the ":ref:`Mailing Lists <resources-mailinglist>`" section in the
-Yocto Project Reference Manual.
+section above.
 
 Here is the general procedure on how to submit a patch through email
 without using the scripts once the steps in
@@ -369,10 +367,9 @@ have been followed:
       you can see who is responsible for the bulk of the changes against
       the file.
 
-   -  *Examine the List of Mailing Lists:* For a list of the Yocto
-      Project and related mailing lists, see the ":ref:`Mailing
-      lists <resources-mailinglist>`" section in
-      the Yocto Project Reference Manual.
+   -  *Find the Mailing List to Use:* See the
+      ":ref:`contributor-guide/submit-change:finding a suitable mailing list`"
+      section above.
 
 #. *Make a Pull Request:* Notify the maintainer or the mailing list that
    you have pushed a change by making a pull request.
-- 
2.34.1



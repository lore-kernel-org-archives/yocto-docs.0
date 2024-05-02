Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4B4C25B75
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:57:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.7641.1714633047292184269
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SJiLKwYs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65089C000B;
	Thu,  2 May 2024 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714633045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvasX5/tvIn+Bm3o8D05jNo7Pi/AvUSiYXvBswAcIDw=;
	b=SJiLKwYsR7resPWPMTnuXPg6HhkmNXpFJtoqc4jjEcrSjRQP2eltDCiG5w8VEZVdt+vAEE
	YcK6DPvpPcFd320UeG5bxdNZzytHtUAN8FkLBJbwLhi0Yls3oD4wiwRgiH1M7f5B67mmdo
	dFIeKzqpTvSPGuxyLv9KXqujM9NMxnt/2egitsgHhq3VBgzpF0gRbngHEhtASX11jFloL8
	ru79yepUBGsk1YuYg2SVikBCEPSiRAs/2I9XnJQmY5+r7De8yqO/LJCmuUW4DzA+8lypQV
	8Tu0GjUQDZfNEyuIrAydiQ4/DL3ZPk/g57KGMd4/ftWgNeAhsGPk1y5XnHcMTg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 3/6] documentation: standards.md: align with master branch
Date: Thu,  2 May 2024 08:57:18 +0200
Message-Id: <20240502065721.22607-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
References: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5195

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/standards.md | 97 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index d3b25adfab..bc403e393e 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -22,7 +22,92 @@ what Wikipedia or the project defining this word uses.
 
 ## Text standards
 
-This section has not been filled yet
+### Bulleted lists
+
+Though Sphinx supports both the ``*`` and ``-`` characters
+for introducing bulleted lists, we have chosen to use
+only ``-`` for this purpose.
+
+Though not strictly required by Sphinx, we have also chosen
+to use two space characters after ``-`` to introduce each
+list item:
+
+    -  Paragraph 1
+
+    -  Paragraph 2
+
+As shown in the above example, there should also be an empty
+line between each list item.
+
+An exception to this rule is when the list items are just made
+of a few words, instead of entire paragraphs:
+
+    -  Item 1
+    -  Item 2
+
+This is again a matter of style, not syntax.
+
+### Line wrapping
+
+Source code for the documentation shouldn't have lines
+wider than 80 characters. This makes patch lines more
+readable and code easier to quote in e-mail clients.
+
+If you have to include long commands or lines in configuration
+files, provided the syntax makes this possible, split them
+into multiple lines, using the ``\`` character.
+
+Here is an example:
+
+    $ scripts/install-buildtools \
+      --without-extended-buildtools \
+      --base-url https://downloads.yoctoproject.org/releases/yocto \
+      --release yocto-4.0.1 \
+      --installer-version 4.0.1
+
+Exceptions are granted for file contents whose lines
+cannot be split without infringing syntactic rules
+or reducing readability, as well as for command output
+which should be kept unmodified.
+
+### File, tool and command names
+
+File, tool, command and package names should be double tick-quoted.
+For example, ``` ``conf/local.conf`` ``` is preferred over
+`"conf/local.conf"`.
+
+### Project names
+
+Project names should be introduced with single quotes, to have them rendered
+with an italic font and make them easier to distinguish from command names
+(double tick-quoted) and from regular English words.
+
+An exception is when project names appear in hyperlinks, as nested markup
+is not supported by Sphinx yet.
+
+Project names should also be capitalized (or not) in the same way they are on
+Wikipedia, or on their own project pages if they are not described on
+Wikipedia. If a project name isn't capitalized, it should remain so even
+at the beginning of a sentence.
+
+For example:
+
+* ``` `BitBake` ```
+* ``` `ftrace` ```
+
+### Variables
+
+Every variable should be mentioned with:
+
+    :term:`VARIABLE`
+
+This assumes that `VARIABLE` is described either
+in the Yocto Project documentation variable index (`ref-manual/variables.rst`)
+or in the BitBake User Manual
+(`doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst`)
+
+If it is not described yet, the variable should be added to the
+glossary before or in the same patch it is used, so that `:term:` can be used.
 
 ## ReStructured Text Syntax standards
 
@@ -41,8 +126,14 @@ To include a screenshot in PNG format:
     .. image:: figures/user-configuration.png
        :align: center
 
-Depending on the size of the image, you may also shrink it
-to prevent it from filling the whole page width:
+A diagram with many details usually needs to use
+the whole page width to be readable on all media.
+In this case, the `:align:` directive is unnecessary:
+
+       :scale: 100%
+
+Conversely, you may also shrink some images to
+to prevent them from filling the whole page width:
 
        :scale: 50%
 
-- 
2.34.1



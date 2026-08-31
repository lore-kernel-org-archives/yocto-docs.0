Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0163C61DF0
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 03:14:59 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21900.1788146091009805306
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 20:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g9fK1kiO;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9384cb251fbso137062985a.2
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 20:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788146090; x=1788750890; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3qld+8w/IZVgjPjWx14n99ySoyUmzgosZgtpW8SFds=;
        b=g9fK1kiOVy8wWcIKXUniqTSQYH3vP4MEkEkXIQGd2AL4qa2ZlPHeb3faHujG3XsWSr
         SeHV1WdOOFFarAZMKm9H9PQnAl5M/tJloBrnOVMDSNO8lZcPkyU5J2qlPVWtB8IDxY4g
         HTQj7Wzy1STUhPh4dc38od+cf47nvjK7G8JQZr0uDOMIlVlO051jEMnbtCnB6C8Z+P81
         r+17mVdcV/yBqeGn8Kt2haIVKiLAI/JMmGhhy4t6GNKO1RMQhZH6G2nFygiw4R1EHoAm
         LgidpmHaMjyiksfxEqtn5ym1jdo1dDAOJN3Br+Bi3QefRY7dHXPejJq6kIsBbQ+RGtp1
         12Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146090; x=1788750890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3qld+8w/IZVgjPjWx14n99ySoyUmzgosZgtpW8SFds=;
        b=ranZoCRQl6NBDFTc4pkrjk63jW2gYIwLg+wqtcrzaiSh2/qQn9SVd93VVZjnNS3J8S
         ZC8MiTcZbaqPCh1+di0QWxw4OGqRvxPlA3evy8ZrOuMLAGYRyhI1f0egZCb2y9eTgWCy
         FXkyGhMau13G5rqoS/CxnAYs2BOPc4GevGe6j+V/4n+fmSI0dgDUE86CmYlKhVbpD6FG
         TBgDM2EcL6HtQQh6HFOHMHfya1aW059iOpUAl4RD1asCENdLMeBRPFPTR1B/SK7pbir5
         Xdc6Wl92dWeYTTLFY2HzpmEhDTfXWGxSd45JKHAwDntLpjtrvpFAbp+tK2G1XSu0hNlE
         XViA==
X-Gm-Message-State: AFuF++nhzv31WWm+L6Gxo2D7cVVheeNbpD0Wc4rElaLwmod8VKRcg9mn
	2lgXJeA+2HLCM7euIZuPyoKG9xV3Oe7rj+nX9LuE3aZNAQ7rQFV8Qvlem3CtXHTr
X-Gm-Gg: AR+sD11DpV7rOvN0Y7mGT1wt/Na3EyW1iWv7HrTWRBhp0pYOQ0ajvwUTH3/cr+aqjPX
	Cq91EGPBPzGV5Yjnz5oU6htO0JLgIgAJR4hAyTytwEDlwhHVQyNPZe8rp08SGkvdtHKZdWZnHL5
	DqJtTIoZDi8jN0nF2T0CiYIP/jajUfvElkrGC6smA6c2KQ1hfXTjY6R4gXpp73d8ekqC3mz0+E+
	yoILfFi09nWr7MvVFwmmUM1hrVdtIDMtWOY7CVEJdAPCJ5MKKnuO3C7qSjYdc/FhG0mwZkyD9wg
	JQnn5sAAOabp0lEcFd7cK5HEK0X9NDnnfVyc1K2Aj7lV8QseIFkdAR/RU+TDUzF/oWyEXAi5RGs
	mX/c1CgJIl/jB6gtF3uFGnx4jCvD/gS2jUy8H8bBO05KP5e740hgJBDX7ezGn+ERE4FrUkykHgV
	96BP8+TGRrlsFUkpbolg+LdzyKSKSd3nfH8PHk2MtkP8rRY5p+b8NdVnb4PDmzdEfo94T97w7i+
	Y1O16yiz4IcnAWubXpk/bhQzQo62Q==
X-Received: by 2002:a05:620a:3197:b0:937:2d64:57ae with SMTP id af79cd13be357-93913517ff1mr2606918085a.0.1788146089719;
        Sun, 30 Aug 2026 20:14:49 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93922e5278fsm510791785a.14.2026.08.30.20.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:14:48 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH] doc: document the conventions used in the manual
Date: Sun, 30 Aug 2026 23:14:44 -0400
Message-ID: <20260831031444.4070152-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 03:14:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10411

The manual uses angle brackets for placeholders and a prompt to mark a
command, and says so nowhere. A reader can only infer both.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 doc/conventions.rst | 53 +++++++++++++++++++++++++++++++++++++++++++++
 doc/index.rst       |  2 ++
 2 files changed, 55 insertions(+)
 create mode 100644 doc/conventions.rst

diff --git a/doc/conventions.rst b/doc/conventions.rst
new file mode 100644
index 000000000000..ab020113d046
--- /dev/null
+++ b/doc/conventions.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=================================
+Conventions used in this document
+=================================
+
+Placeholders
+============
+
+Text enclosed in angle brackets is a placeholder. Replace it, including the
+brackets, with a value of your own:
+
+.. code-block:: none
+
+   SRCREV:pn-<recipe> = "${AUTOREV}"
+
+Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
+never text to be copied as it stands, and an example containing one will
+not work until every placeholder in it has been replaced.
+
+Commands and prompts
+====================
+
+Commands are shown with the prompt that runs them, and the prompt is not
+part of the command. Do not type it.
+
+A ``$`` introduces a command you run as your normal user:
+
+.. code-block:: console
+
+   $ bitbake core-image-minimal
+
+Where a command needs administrative privileges on your build host, it is
+shown with ``sudo`` rather than with a root prompt:
+
+.. code-block:: console
+
+   $ sudo apt install gawk
+
+A full prompt ending in ``#`` introduces a command run as ``root``, usually
+on a target machine rather than on your build host:
+
+.. code-block:: console
+
+   root@qemux86-64:~# gdb /bin/cat
+
+Within an example, a line beginning with ``#`` is a comment rather than a
+command:
+
+.. code-block:: console
+
+   # This is a comment, not a command to run as root.
+   $ bitbake core-image-minimal
diff --git a/doc/index.rst b/doc/index.rst
index 9f2a9067d385..d9547e1c723d 100644
--- a/doc/index.rst
+++ b/doc/index.rst
@@ -29,6 +29,8 @@ BitBake User Manual
 
 ----
 
+.. include:: /conventions.rst
+
 .. include:: <xhtml1-lat1.txt>
 
 | BitBake Community
-- 
2.50.0.173.g8b6f19ccfc3a



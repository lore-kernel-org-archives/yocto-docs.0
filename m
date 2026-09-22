Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B6DC982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:06:36 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8533.1790078787903923164
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S6dgs+M5;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9df1so47874181cf.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078786; x=1790683586; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQsCDWGzvYZxtG6ZosXAxxhmUhg9EGOo/svp6KJQ6ks=;
        b=S6dgs+M5PspShwqFvQJjsTPjmt9ThooWlh4hS2/gVLRSkjSmiDsYRu3iEOcZkAlLV9
         04n6jnQLt1jclmNKBakaZGPAN+4RhkAW7uOUvWBZF3Kr7h6pf72MunkqzxweD7zxOwtf
         dfFnSFac4tBQbXQh0XYA05+87GUKrCrlG8nT8Mj0KWcSCQ+Hd4RR5P5lLS9/ELSau7sR
         2g9RQs3Rp8mdVKOz/1PF/yveN6AvgID3gvFiH2C7yfVNN65W+rFfAFipwt0UOwD/6pi8
         Yz8ztjUIT/YzJSh+KfrJJRFD8DvHxqSffOxH0+qwZNnV7iyCsYSf7H8z8Z77Ge1f6TEK
         k8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078786; x=1790683586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dQsCDWGzvYZxtG6ZosXAxxhmUhg9EGOo/svp6KJQ6ks=;
        b=IijpaJM5CEmCBMdOg/dQm/v5Ywg6ArNYH7eXQIkTRa2qbAuA9HeoI7n/mBanzc3Fl1
         SMT0xlWkmWiWtfgcd+KtgHg4JRUzdoYSF5wvA5sOAQVlhsMaYMvP5wxQVN3kToKhiE5m
         wQyqgcZl5YK0vmuuAEvfvvOfYNh5n628R2U42HljMONanWQr0qyQ0O4F92h8jOUPsom7
         diO5k7kEedi53bxJsnzi+yrgXJEVWCYpvkVNpumQMETW7cgxwaFp3E7sDForfPs/xjaa
         y7d8R5bCtYq1cASIkvvAO5dEucqaj6xQhr3ORBeyYAIBet0zDnrZ2Xj3JD6oD9OUoCMY
         o2yw==
X-Gm-Message-State: AFuF++k9CAOvFfjYufRPs4QOmRWucbzuDPxTYkA/3IyPCJ/9UyGmGNM8
	OeaoGWMKZiYK0jkCZv2w3uQjDHn4lN0sJYSMC+b27mxhKe9ZZ8lg5xICvXeL2w==
X-Gm-Gg: AYBFou0JvNqmL7orwg3cQ49T0X3Kn9p1+fEgD7JNIr3hPO7uBRquf9FoYxgAtF/cK19
	F97kKVaYFj8VC+m4F9h9pXirq+ITqo1OBByC0oprpEVme+sfr1f4NZOXl+rLWcxBzsB+968Be3d
	QzPiHGtimvWZiC5YEm0rjKcHt/wzQwK30Ro/lkHz1AetLXLPYpsCpsu8uovfHTiffu8IM8j4D6d
	fLw+ddcDOUjqXfRWVH44kVpvgINrkcnE/LtasF9/uVmOn/tPzSbYA1L3WRXIqG9NdzFgO3WS5BG
	ea773L3ouBCwbqoIadVGDrgy6+cuy+pof6STEuU4mRayCK7gTMstmHKQQL5o1Go3RuBrHY3wWuS
	iOSZGpg1FM9oF5jw1/hnNtsa0AkM5C6Tcd1OQ1HZDMr989j7mgv6VNcwC8iJ6fZhRrDagKYsbHy
	6b/d7iA+5xcUxcqJZ+FDpgv5/IKy3avXEqeNnd15ZcuGPvLOSqBrM0AQOTJ+VQHcXS0e7iE4pP4
	CuN77943VYCeDvGQ6UD55xkk/jmFPrrzkC3wxHc
X-Received: by 2002:a05:620a:63c6:b0:93b:d79f:d94d with SMTP id af79cd13be357-93c15eebe76mr524971385a.66.1790078786122;
        Tue, 22 Sep 2026 05:06:26 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1caf3fc2sm130307885a.0.2026.09.22.05.06.23
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:06:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3] docs: document the conventions used in the manuals
Date: Tue, 22 Sep 2026 08:06:20 -0400
Message-ID: <20260922120620.2386763-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:06:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10578

The manuals use angle brackets for placeholders and a prompt to mark a
command, and say so nowhere. A reader can only infer both, and one
example reads as advice to paste a line that will not parse.

Add a page stating them, in the sidebar beside the other top-level
entries, so it is reachable from every manual.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
Applies to: yocto-docs, on top of master. Paths under documentation/.
In reply to: <20260922013912.55583-1-twoerner@gmail.com>

Changes in v3, all from Antonin's review:
- :term:`build host` for both mentions of the build host.
- The root prompt example uses a generic "root@machine:~#" rather than a
  real board, as a default for generic target examples.
- The comment example stays tagged text, in answer to the question about
  shell. shell reads the "#" line as a comment but stops reading "$" as a
  prompt; console does the reverse. A lexer change and a re-tagging
  patch, neither sent yet, fix both together, so text is the right tag
  until those land and the best one if they never do.

Changes in v2:
- The page is a document in its own right, reached from a toctree in
  documentation/index.rst, rather than included into each manual's index.
  This is Antonin's suggestion and it is the better shape: the page
  appears in the sidebar of every manual, so a reader meets it wherever
  they are, and the diff touches two files rather than fifteen.
- Retitled "Documentation Conventions", which is short enough for the
  sidebar and matches "Documentation Downloads" beside it. The old title
  said "this document", which no longer describes a standalone page.
- The example showing that a leading "#" is a comment is tagged text
  rather than console. Pygments' console lexer reads a leading "#" as a
  root prompt and lexes the rest of the line as bash, so v1 rendered that
  line as a prompt running a command, with the word "command" coloured as
  a shell builtin - the opposite of what the sentence above it says.
- Added an opening sentence saying the conventions apply throughout the
  documentation, since the page is now landed on directly rather than
  read at the end of a manual.

This page says that commands carry a prompt and that a "#" line is a
comment. Neither is quite true of the manuals yet, so the docs-fixes
series does want to land first:
https://lore.kernel.org/r/20260922020339.481929-1-twoerner@gmail.com

 documentation/conventions.rst | 56 +++++++++++++++++++++++++++++++++++
 documentation/index.rst       |  7 +++++
 2 files changed, 63 insertions(+)
 create mode 100644 documentation/conventions.rst

diff --git a/documentation/conventions.rst b/documentation/conventions.rst
new file mode 100644
index 000000000000..3bba4223aee0
--- /dev/null
+++ b/documentation/conventions.rst
@@ -0,0 +1,56 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=========================
+Documentation Conventions
+=========================
+
+These conventions apply throughout the Yocto Project documentation.
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
+Where a command needs administrative privileges on your
+:term:`build host`, it is shown with ``sudo`` rather than with a root
+prompt:
+
+.. code-block:: console
+
+   $ sudo apt install gawk
+
+A full prompt ending in ``#`` introduces a command run as ``root``, usually
+on a target machine rather than on your :term:`build host`:
+
+.. code-block:: console
+
+   root@machine:~# gdb /bin/cat
+
+Within an example, a line beginning with ``#`` is a comment rather than a
+command:
+
+.. code-block:: text
+
+   # This is a comment, not a command to run as root.
+   $ bitbake core-image-minimal
diff --git a/documentation/index.rst b/documentation/index.rst
index 4bfc40bef070..72e51a4454d7 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -116,3 +116,10 @@ Release notes and migration guides for the different Yocto Project releases.
    :hidden:
 
    downloads
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Documentation Conventions
+   :hidden:
+
+   conventions
-- 
2.50.0.173.g8b6f19ccfc3a



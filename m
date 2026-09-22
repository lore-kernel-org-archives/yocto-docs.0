Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AEAC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 01:39:23 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.963.1790041158060415459
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 18:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fQc5aUTf;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-53122c5bbb4so2060741cf.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 18:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790041157; x=1790645957; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNX2FEq+SaOVLFIx3Jl9+j8gGFeC+peXHOvzpdt55rQ=;
        b=fQc5aUTf/mkQ1fr5V8fWgvmEP0z+bDebIn+jdDYm1axqySYJDn0Nr8DBYvg0KSVEyv
         4UcJWM5awJFagLXjM9bk7jJm3MCdmNyj1dvZtvsSIExF1NuOViQ//jaXHL84TSPDZR/+
         iJviNZFl400jz8LdjoN+i/gMKY7YB7QNPImJ/CUFLaWtspLcnFwGeXQbEY0zZG8NLCVO
         ViU2vMGgPXcpI+TrE/iLR8jc7UnS6B1Tp1uuBzwidlJzSM71rUPIikrCjbEBmop/e/mF
         M1FJdq+oVn5ul1I48ACE4E0cNAK/m9WIbiagBLTFfKFhyGRHXMgtb/WuTPzRGBrjU6yA
         0gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790041157; x=1790645957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eNX2FEq+SaOVLFIx3Jl9+j8gGFeC+peXHOvzpdt55rQ=;
        b=YWqxf+5/ZdaJTOPcO/kxuCplXRG4qCVDVo7/J4Ro5XXQgW+4VBuTBxKhPH368A82tX
         smWF/7gOSmHULspNdyYQ3ORX9jXax0InDRGrByksRLmc1J2tfkA1LM0ZITkHui3CcywG
         LHuG8ePN2bpz2vf0Knipp5uIHN87MgBKq1mftNZqZu4JSitmJoGSQMA4Ai4wddoK/RDK
         LWKPikUcXHLobsavFtZ5zMB5ghnBV4Ei1thxhfA3nl3xxZfYQuMxbDig6RUwtXofB2O3
         V/F8It9ydEx0oAkBDvhNz9hL6EmWqBjEl6WOgOKu/KKnexQUpSFZ3Ujr33USxJj3esIP
         4MFA==
X-Gm-Message-State: AFuF++lQbuEpi8lmjOBQ4XUjBbrMTaWWPaGntjsSSNiSf8Tk9EgwIvRf
	ZpkK0P8lbznoixdu6lC5t6jvuhms3Vn5FQuGJBzMuPwxXA7Hrs9abYxxumDIAg==
X-Gm-Gg: AYBFou1v0wZj8GCgp6rwLky0wo/Pl9IS9GqaeyXmv47PxsYsVi/vQN7Biwajft/3yJG
	l+1DmPywmkvmLSUZZ1wUbXkcART2HwXXgkmAJMXTO0zW6M+ukQ1OnOLHylEGdxMO//mcD2IPc+2
	SPanWtRBatwHnujBb0V0QkX9XVHsA/y/PjxMt7tIKzC6oZvKGg5kwGuVi7LEsrZcuog1igmmhIp
	DSTAax14scxgatvUf3Qqh5XTqVXRmd9rh5DBe9DfhYEWnzrDoXf+URRA82Bbun6hzO7APWaiTg5
	tnswyWbps27zM7ItTdKzzN7pB30bgdKP7lbGgYkBmbfGfZCvN/zAHrZtjT47TJ1pV1+VmEil1dK
	a9YA6AQfW9Fb3CCYFjEBFolBKgWfFGlZO+IhojQyvTTRDEl1UdpLy/qmn4A1NYz+ndreTLJik0X
	m0BAueMV5SKbZ0yfi+WfYvo4hg27JDZCHsFb/lmVIhiRmYx8oTbaf7YezC2V+DqfHfgviRSWHPm
	MFNRYFZ3Tl9G8GPWloY1whX+QyvOVk5xcs5w8hb
X-Received: by 2002:a05:622a:17c5:b0:532:9add:cdc8 with SMTP id d75a77b69052e-532d8e96dc7mr37074601cf.64.1790041156846;
        Mon, 21 Sep 2026 18:39:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91402535ce1sm3682306d6.48.2026.09.21.18.39.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:39:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] docs: document the conventions used in the manuals
Date: Mon, 21 Sep 2026 21:39:12 -0400
Message-ID: <20260922013912.55583-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 01:39:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10557

The manuals use angle brackets for placeholders and a prompt to mark a
command, and say so nowhere. A reader can only infer both, and one
example reads as advice to paste a line that will not parse.

Add a page stating them, in the sidebar beside the other top-level
entries, so it is reachable from every manual.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
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

The wording of both sections is unchanged.

 documentation/conventions.rst | 55 +++++++++++++++++++++++++++++++++++
 documentation/index.rst       |  7 +++++
 2 files changed, 62 insertions(+)
 create mode 100644 documentation/conventions.rst

diff --git a/documentation/conventions.rst b/documentation/conventions.rst
new file mode 100644
index 000000000000..469ad5879b51
--- /dev/null
+++ b/documentation/conventions.rst
@@ -0,0 +1,55 @@
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



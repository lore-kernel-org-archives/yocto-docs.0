Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D9BC982FD
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 01:55:33 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1251.1790042125817859017
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 18:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jgdby4u4;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939eb3249c1so302177285a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 18:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042125; x=1790646925; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG+YLcqc+7OwaxKT514qpY39673hQTRd2VcCszc0FQQ=;
        b=Jgdby4u4R3BnPftYAFC3Lo2OOAAK3NZZJ9W2B8/BKlLperNwsOUS022F74I5bR9b7B
         nvqgWXHhDl2EQ24e0og7dRFc2UjkXAwHiRvG5/Xn57IEhhTVV8yM7vg2nDYoqxElZl/p
         adurMdSGOrM4ZBhwIx8E7DmrYj6y0r0NYU3BVGEHuET44aDSV0+rC6O+MRPd9+Qf2bYH
         MTrMAOOJtSdyfBrjGXRMesy6bRakrW1Pej7BB26yZDsiiPOneS3JdztpOgHL6ixTN6wB
         /utX0Nxjo0xX57/0Od3YCFFTLTqQIuLgax6c4xyZDlkSLeChtRLv4Yz9qzIeLD5mziQm
         V4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042125; x=1790646925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG+YLcqc+7OwaxKT514qpY39673hQTRd2VcCszc0FQQ=;
        b=gKsSdtiNd2yz36l3DuMH6FHjYMubfiuubJASYU/YVYe3BwwRbIAHgzPcgjOTHQANrl
         vKw0XwYrCaMSKt9AG5F6mBJCFOolVwr8ufuiKrCJYIswryPacnFnxyGFh1+7LQy/C1Cr
         ceuh7+qp2XTZyWu7s+rvgt29NGZ0wqQn/3jA+bRGxmItCh2hhmMJYBO5xEBE03AJBbEC
         crOmXRn/L00qVohMxKQIw8UQhyjzbKeuIO8YZajAlZj+ZILWq51zm6APdQ7pwAi1DqQp
         xr97kcubtMq32uem9JP2NwnmwNDK6Om3dHh8dgBpQl+B5DndDc9UqkVC7HKSwBcwAu7N
         JyBQ==
X-Gm-Message-State: AFuF++lGT7lzFwmYA5fBLBs/Me9Es21eNY6cuMli5it1UOuYd0EXa8Lj
	Z/aGtmtfBpURNLAcerjTyHnYNXmbVJ72OyscPUnVb5xuX5UMkABTjJxI+ildVw==
X-Gm-Gg: AYBFou1nwOqA4Jj5wZxzgRqfY+4siS1fvpIjaK7oZBBLFEaCaB5DFgcit3fZAdrJEvr
	YsvGoa8MRL1Afmy7FXmLO+AcywqozSP7NSGDdmnG4+txq/GjYZo2BDOv3OpxSI4lLOEg46xp5C9
	E8Aq1/qg8e07flzL8Vu6ebicDS2n9rBsFd2ARFRlEn2JGdbo9ffgGrfBvePLNmy37Ow/kXA+hrJ
	Pl+zGvoRXsSBNIEP5UV/J79U3eayYkAW6vDXB+yVkT+dz/YA0cnRBeIzo/kIKQfcSyrYKqTxIzB
	KHIZee1aMc4Mo6H/GKe5QmIcpcOQJAiAfD7V1LaP16qS3WfQbz/q6My1eQ61jQqPosLwEbu9Xn8
	AQmBMo88p+ory0jGDe/LUyyzBSCc5OziSsQqugBHexCjLJ68XEdkK5jJC8LyZ+egwqCR04W1jHG
	KBa9XHnwjr9w6h5JIc+pXNkMAqHvrgt8OeTv5X2tH4qjD7jLrfZ8hI4ZDpJ0a70qi2H7uhMRgec
	L/40Z7sXgwzerLtEis/MpVx9ATUwAOoA2Ks9joe
X-Received: by 2002:a05:620a:2611:b0:939:57ca:7e08 with SMTP id af79cd13be357-93c15d7632emr352987085a.2.1790042124610;
        Mon, 21 Sep 2026 18:55:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d03b170sm16640985a.16.2026.09.21.18.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:55:23 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH v2] doc: document the conventions used in the manual
Date: Mon, 21 Sep 2026 21:55:19 -0400
Message-ID: <20260922015519.313312-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 01:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10558

The manual uses angle brackets for placeholders and a prompt to mark a
command, and says so nowhere. A reader can only infer both.

Add a page stating them, in the sidebar beside the other top-level
entries, so it is reachable from any page of the manual.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
Applies to: bitbake, on top of master. Paths under doc/.
Destination: bitbake-devel@lists.openembedded.org
In reply to: <20260831031444.4070152-1-twoerner@gmail.com>

Changes in v2:
- The page is a document in its own right, reached from a toctree in
  doc/index.rst, rather than included at the foot of the main page. That
  was the part you objected to, and the sidebar entry means a reader meets
  it from any page rather than only from the front one.
- Retitled "Documentation Conventions", short enough for the sidebar.
- The examples are the manual's own. v1 shared a file with the yocto-docs
  patch and so illustrated itself with core-image-minimal, "sudo apt
  install gawk" and a root prompt on a qemux86-64 target, none of which
  this manual contains or is about. The placeholder example is now the
  <machine> already used in BB_PRESSURE_MAX_* , and the command example is
  a bitbake invocation.
- The root prompt and sudo sections are gone. Measured over the manual:
  every console block prompts with "$", there are no root prompts at all,
  and "sudo" appears once. Documenting a convention the manual does not
  use is what "not related to BitBake itself" looked like in practice.

 doc/conventions.rst | 36 ++++++++++++++++++++++++++++++++++++
 doc/index.rst       |  7 +++++++
 2 files changed, 43 insertions(+)
 create mode 100644 doc/conventions.rst

diff --git a/doc/conventions.rst b/doc/conventions.rst
new file mode 100644
index 000000000000..a10795d456b3
--- /dev/null
+++ b/doc/conventions.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: CC-BY-2.5
+
+=========================
+Documentation Conventions
+=========================
+
+These conventions apply throughout this manual.
+
+Placeholders
+============
+
+Text enclosed in angle brackets is a placeholder. Replace it, including the
+brackets, with a value of your own:
+
+.. code-block:: console
+
+   $ tail -F tmp/log/cooker/<machine>/console-latest.log
+
+Here, ``<machine>`` stands for the machine you are building for. A
+placeholder is never text to be copied as it stands, and an example
+containing one will not work until every placeholder in it has been
+replaced.
+
+Commands
+========
+
+A command you run at a shell is shown with the ``$`` prompt that runs it.
+The prompt is not part of the command; do not type it:
+
+.. code-block:: console
+
+   $ bitbake -c clean foo
+
+Where a command is shown with its output, the prompt is what separates the
+two: the prompted line is what you type and the rest is what BitBake
+printed.
diff --git a/doc/index.rst b/doc/index.rst
index 9f2a9067d385..0a2bd9ce2ecf 100644
--- a/doc/index.rst
+++ b/doc/index.rst
@@ -27,6 +27,13 @@ BitBake User Manual
    genindex
    releases
 
+.. toctree::
+   :maxdepth: 1
+   :caption: Documentation Conventions
+   :hidden:
+
+   conventions
+
 ----
 
 .. include:: <xhtml1-lat1.txt>
-- 
2.50.0.173.g8b6f19ccfc3a



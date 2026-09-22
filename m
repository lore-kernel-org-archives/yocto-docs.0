Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9742CC98306
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:03:54 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1395.1790042633347659536
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U8R8Twzb;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so292069685a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042632; x=1790647432; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d4snL4+CpZ6DeK+71rmhrEXdxw8ACRjDlxZBx5lCIE4=;
        b=U8R8TwzbRIsoy/PJB8WHh9EUXpFywSiHrctK6X7xYyUM1t/iJlAVuSS9JF2mfpOQKg
         A+yNuase76s15+0Ck94fb9ig9kSWahAHWn17/1ixjB0DKjSz13nBUr6PFWVgkaLlutw8
         B8nLeaci2Dom99VtckFFA5kS4UjSQ11z22SjFK7OyaExLWcYLHS1qSAjpQdlCG6+hHCD
         nddpFhSaAp1dYG6oO1+2GYsDOXCeT+1KPmTABjtJmPuDpxFFd22I2wVA5eTa6zVEYQjD
         Z0DeFns48HbB8VNm/xFLX+Poftek56Wv+ABl9B9C8npQgGkcmSAIpxAgjkuwp3lBjhTi
         x/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042632; x=1790647432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d4snL4+CpZ6DeK+71rmhrEXdxw8ACRjDlxZBx5lCIE4=;
        b=2bjcIWdzetSbKsmApZ+n0ymRH6amjIxpP/6K6gTxtgUQeyEC4Is8OBcYihjG2x6tUL
         /vTYd4WcVxidX65rG96hh6cvQ02VKk+S0zxV9Hl1YNYk1b3qm8aEVfNEjQ8ZZ7swkDSF
         RAoRREIF4fou+dgofPO2e0YDaUNuc8U5eLtEyT/W37kJnvsCnQS44Sl1HUAUXHshdK0H
         ptDSBqUrO7mg5I+ANIXTO7ohVKDC7H4l325JHiFS4AKlWMuOKh7+fgowbYebQTRRLFvc
         1cM6h29xEWJVtKscyHn+lOWQdMx32mPmqZIBNKd7iWgA43YcmFFFt5WhuqiR4VoXfQrO
         uWxA==
X-Gm-Message-State: AFuF++l+tsqnYaI4d+IGsU7+1uuRiPqHd+tDh7INI7rPfRBiwsaiL0uv
	CXUP7BduiLJOC1vCjSyZREqX+j52Zbqq1oysgcOP3LIa/0BTywyfk3sBkpzQuw==
X-Gm-Gg: AYBFou161ctG/5SWjfF6/3fsQ17o1WTGiSRwXMWlTp3jVb7QjezmZhOeDwwLu+7UYNS
	hLM/niXP30dE7oHnMwqMxshEikZi6LldYjKrFmDY+2AC9JqOriZNJaXn4lm2NdnNQXqSyNEQg24
	mzlqHAnfj3GuEzyCbmhNOb3ahneQ/CNGM5dI8bBIMYA/R3xFnxo+/oKCexp/JjCfJG4NNJk8iAT
	qvriI0sqt1zi9cd2VksBUZsCff0IVAvRlyqt2NNn51pfdXYVZ7A9d6cwv4K6O9VuBKWsZF3wxub
	TD/L6XdS7ojJxOwwWGQdIPsrDBoaQyO3QYGLWGC7Nsz89z51UNjgKgPRRI3nHai6PFH7nkibSla
	qA6peTAi93Dt7i3byK2J7D0MbINcDABjKhllp2upNicUXZvCCygd+ANIvx7c3nV+4F14o4IuyMn
	60DX7XWUODj2PXAIQ+pONGE/luHAe8a/DuuiPSaJxtKqs2OTqMmH7A7MEgAYMvMvw5S7wQJFnmk
	WZlGMT0ozChHC2oWO1C3vJZ+H8T+bYcopjDwR6s
X-Received: by 2002:a05:620a:4554:b0:939:8c80:669 with SMTP id af79cd13be357-93c15e43d2fmr350177585a.42.1790042632037;
        Mon, 21 Sep 2026 19:03:52 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 05/10] docs: mark the placeholders in examples
Date: Mon, 21 Sep 2026 22:03:34 -0400
Message-ID: <20260922020339.481929-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10564

Values the reader is expected to replace are written as though they were
literal. "arch-gdb" reads like a command that exists, a Git SRC_URI
example reads like a URL and a pair of revisions worth copying, and the
git-config examples give an account name and address that are somebody
else's. Put them in the angle brackets the manuals already use for the
purpose.

Two corrections go with them: the directory placeholder in the GDB
example described itself at length rather than naming the thing, and the
smtppass example carried a stray "=". Since git config takes a name and
then a value, that "=" was the value, and the password behind it an
argument git config reads as a pattern.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../contributor-guide/submit-changes.rst         | 12 ++++++------
 documentation/dev-manual/debugging.rst           |  8 ++++----
 documentation/migration-guides/migration-5.2.rst | 16 ++++++++--------
 documentation/ref-manual/devtool-reference.rst   |  2 +-
 documentation/ref-manual/variables.rst           |  2 +-
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index e60f8ca7ace3..a283eb734768 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -62,8 +62,8 @@ on Debian and Ubuntu::
 Then, you need to set a name and e-mail address that Git will
 use to identify your commits::
 
-   $ git config --global user.name "Ada Lovelace"
-   $ git config --global user.email "ada.lovelace@gmail.com"
+   $ git config --global user.name "<name>"
+   $ git config --global user.email "<email>"
 
 By default, Git adds a signature line at the end of patches containing the Git
 version. We suggest to remove it as it doesn't add useful information.
@@ -399,8 +399,8 @@ regular STMP server, using a Google Mail account as an example::
    $ git config --global sendemail.smtpserver smtp.gmail.com
    $ git config --global sendemail.smtpserverport 587
    $ git config --global sendemail.smtpencryption tls
-   $ git config --global sendemail.smtpuser ada.lovelace@gmail.com
-   $ git config --global sendemail.smtppass = XXXXXXXX
+   $ git config --global sendemail.smtpuser <email>
+   $ git config --global sendemail.smtppass <password>
 
 These settings will appear in the ``.gitconfig`` file in your home directory.
 
@@ -509,7 +509,7 @@ We have a frequent issue with contributors whose patches are received through
 a ``From`` field which doesn't match the ``Signed-off-by`` information. Here is
 a typical example for people sending from a domain name with :wikipedia:`DMARC`::
 
-   From: "Linus Torvalds via lists.openembedded.org <linus.torvalds=kernel.org@lists.openembedded.org>"
+   From: "xxx via lists.openembedded.org <xxx@lists.openembedded.org>"
 
 This ``From`` field is used by ``git am`` to recreate commits with the right
 author name. The following will ensure that your e-mails have an additional
@@ -517,7 +517,7 @@ author name. The following will ensure that your e-mails have an additional
 maintainers accepting your patches don't have to fix commit author information
 manually::
 
-   $ git config --global sendemail.from "linus.torvalds@kernel.org"
+   $ git config --global sendemail.from "<email>"
 
 The ``sendemail.from`` should match your ``user.email`` setting,
 which appears in the ``Signed-off-by`` line of your commits.
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 0f6e9d1d7e85..8412c997a51e 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -810,7 +810,7 @@ be visible. In this case, there is a missing dependency for the ``neard``
 Makefile target. Here is some abbreviated, sample output with the
 missing dependency clearly visible at the end::
 
-   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/scott-lenovo/......
+   i586-poky-linux-gcc  -m32 -march=i586 --sysroot=<path/to/sysroot>
       .
       .
       .
@@ -1114,11 +1114,11 @@ debugger.
    After running gdbserver on the target, you need to run Gdb on the
    host and configure it and connect to the target. Use these commands::
 
-      $ cd directory-holding-the-debugfs-directory
-      $ arch-gdb
+      $ cd <debugfs-directory>
+      $ <arch>-gdb
       (gdb) set sysroot debugfs
       (gdb) set substitute-path /usr/src/debug debugfs/usr/src/debug
-      (gdb) target remote IP-of-target:1234
+      (gdb) target remote <IP-of-target>:1234
 
    At this
    point, everything should automatically load (i.e. matching binaries,
diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 77a11fe27047..48f9e7485d93 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -193,9 +193,9 @@ The support for having multiple Git revisions per URL in :term:`SRC_URI` was
 removed from BitBake, which means the following syntax is not supported
 anymore::
 
-   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
-   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
-   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
+   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>,<branchY>;name=<nameX>,<nameY>"
+   SRCREV_<nameX> = "<revisionX>"
+   SRCREV_<nameY> = "<revisionY>"
 
 This was rarely used in the core repositories because it would only ever make
 sense for bare clones (the ``bareclone=1`` :term:`SRC_URI` option) where recipes
@@ -205,10 +205,10 @@ places.
 If one of your recipes is using this mechanism, you can split the code source
 fetching into two separate entries::
 
-   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX;name=nameX \
-              git://some.host/somepath;bareclone=1;branch=branchY;name=nameY"
-   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
-   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
+   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>;name=<nameX> \
+              git://<some.host>/<somepath>;bareclone=1;branch=<branchY>;name=<nameY>"
+   SRCREV_<nameX> = "<revisionX>"
+   SRCREV_<nameY> = "<revisionY>"
 
 Git fetcher: Branch parameter now required in :term:`SRC_URI`
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -216,7 +216,7 @@ Git fetcher: Branch parameter now required in :term:`SRC_URI`
 The ``branch`` parameter is now required when specifying a Git repository in
 :term:`SRC_URI`, for example::
 
-   SRC_URI = "git://some.host/somepath;branch=branchX"
+   SRC_URI = "git://<some.host>/<somepath>;branch=<branchX>"
 
 A missing ``branch`` parameter used to produce a warning, and will now produce
 an error.
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation/ref-manual/devtool-reference.rst
index 4aa95d8e0499..62c3b707b9ff 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -474,7 +474,7 @@ This is roughly equivalent to the ``devtool update-recipe`` command followed by
 the ``devtool reset`` command. The changes must have been committed to the git
 repository created by ``devtool``. Here is an example::
 
-  $ devtool finish recipe /path/to/custom/layer
+  $ devtool finish <recipe> <path/to/custom/layer>
 
 .. _devtool-building-your-recipe:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 93173957d012..9c18b33c035b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -162,7 +162,7 @@ system and gives an overview of their function and contents.
          ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
          ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
          ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
-         ARCHIVER_MODE[diff-exclude] ?= "file file ..."    # Lists files and directories to exclude from diff.
+         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
          ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
          ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
          ARCHIVER_MODE[srpm] = "1"                         # Uses RPM package files.
-- 
2.50.0.173.g8b6f19ccfc3a



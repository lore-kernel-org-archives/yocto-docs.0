Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7175C98318
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:08 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3765.1790270946992049748
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cQpsgABJ;
 spf=pass (domain: gmail.com, ip: 74.125.227.40, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a4fb331cc0so17413137.3
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270946; x=1790875746; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8piAVNbFI4weeWMl9dePku3OBx9p3UPVq2N3oGVUVNA=;
        b=cQpsgABJKz5LN7UFditIwvho/RJQvQNvwSXkDxZ+CuWeNrySl/scKyvvfc2Fyv+NEM
         5ci8RnPaEtkrYK2d31fNLyD7Gywx9x/BBoL3owqNrJNCGs+YEqJXMbClWJ09g4fStiJS
         3624zt/8kqnCTYDEvjQokJn3eFWwO1IRqM4htlfEpdm8mBr4eIiki/5fkubaENKJkhkg
         /IPEx5+FmMl/A5yQ0K7fwds9zxHRSZCkjR48/4M6axyo1iHwAmi02hAgfUKHw+O/L/pY
         rQJeilaRoEDkIRX8LAY75W9bzU2uNTqWp7eh8imoq3WqolqwvrJn8H795n3c0lLStH+s
         x9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270946; x=1790875746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8piAVNbFI4weeWMl9dePku3OBx9p3UPVq2N3oGVUVNA=;
        b=N225B3fo2Rfo+znQP+WumXqY12UmhjFWdtBGmpDOKvV+nn3LgydvGzIVWS9/moPW/l
         dEQlnSGnx5IeNbhqT2P5PSoiIFv3dOwDDNODNOzfiZbz0ywRhGZEjYGhWYqb3LlJgEfT
         zVJDccOveqPRmE2Fnpbe1+famgX1wOgR3rN6J/5rPSYG/uv0illlwKT8IcmSM8mR2NjB
         r05YuNt1UBqgblcSah6UE+Hhh+e3g45XLKA6TVCgx/aJfwI2dB1kCHy1AAvNONVxOlhh
         vSIg67L19uCEhedyeFsdSWKPfBOAFaWo5tt6n/tXprBpIlHlSEmRGCo1eS4qrumZgCsI
         exEw==
X-Gm-Message-State: AFuF++nipFicSIHi5rA6HjlfKjGnkEgNZLhji4JOvk/lIdjNV0l1BKek
	5Y0f1YwqMdx/5kvXrk1Cct06f8yRbw9+8FwV+430goUS+3OusmGMx6kfPrZhrw==
X-Gm-Gg: AYBFou3TFM40sJdUxFgVbMgI9we/i0BltD077L9LjyexIRYfdBhA+ISfhraULBGOU8o
	OQE6nybJjB3Y+tO7E3qRmqaol95pnWPBPHV5pVaQh93uoZnk13d16takykTdmmlD5ufGZbK2ItN
	xX/UPxR0TEpOwZWDVNYgzTmevPujcqQ9K1VG0xdPfOCEZHpv2S5DihHPbA7l8Mpv2qInfso8flj
	fa1nivT9yDnc5SQzPDkHYJv7PCwRwaMptkzDim8PDYITzFucEmaIhmhaEba2cVAOU+z3m+MdRNN
	K0TyDaMkeeK5H0C5r83wRONFFtVx5634pkvUcjnN9oP2SN74LLS94kP58gCvjFn2fcD4I1kOJbU
	gftMPyMR2IbVH7I0y2iWi500IvbqihzUn7+bwGBhSboXecQYGv8ZCYEnDnQQ4HvLOYLPaOaqosI
	W7jxshNchAwcT1Hg+Q3nqFFxx7ALtG2hJlfCLJzpBhNKbJPDBUpv2HFtD/57sAcEiipoIVx9fqL
	T+XCJrgITGt02ztPslTgJ6p+g==
X-Received: by 2002:a05:6102:26c8:b0:7a1:f7d2:e846 with SMTP id ada2fe7eead31-7af1e9f25f2mr1385274137.22.1790270945709;
        Thu, 24 Sep 2026 10:29:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 05/10] docs: mark the placeholders in examples
Date: Thu, 24 Sep 2026 13:28:48 -0400
Message-ID: <20260924172853.2665062-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10628

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
changes in v3:
- the DMARC From: header is left as it was; nothing in it is for the
  reader to replace
- the git config name is written <firstname> <lastname>
- the SRCREV values say they are commit SHAs
- the SMTP server is a placeholder too, and the prose names
  smtp.gmail.com as the Google Mail value rather than the block

changes in v2:
- rebased on master-next; no other change
---
 .../contributor-guide/submit-changes.rst         | 15 ++++++++-------
 documentation/dev-manual/debugging.rst           |  8 ++++----
 documentation/migration-guides/migration-5.2.rst | 16 ++++++++--------
 documentation/ref-manual/devtool-reference.rst   |  2 +-
 documentation/ref-manual/variables.rst           |  2 +-
 5 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index e60f8ca7ace3..589545074907 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -62,8 +62,8 @@ on Debian and Ubuntu::
 Then, you need to set a name and e-mail address that Git will
 use to identify your commits::
 
-   $ git config --global user.name "Ada Lovelace"
-   $ git config --global user.email "ada.lovelace@gmail.com"
+   $ git config --global user.name "<firstname> <lastname>"
+   $ git config --global user.email "<email>"
 
 By default, Git adds a signature line at the end of patches containing the Git
 version. We suggest to remove it as it doesn't add useful information.
@@ -394,13 +394,14 @@ Mail Transport Agent (MTA) such as ``msmtp``, ``sendmail``, or
 through a direct SMTP configuration in your Git ``~/.gitconfig`` file.
 
 Here are the settings for letting ``git send-email`` send e-mail through your
-regular STMP server, using a Google Mail account as an example::
+regular STMP server, such as ``smtp.gmail.com`` for a Google Mail
+account::
 
-   $ git config --global sendemail.smtpserver smtp.gmail.com
+   $ git config --global sendemail.smtpserver <smtp server>
    $ git config --global sendemail.smtpserverport 587
    $ git config --global sendemail.smtpencryption tls
-   $ git config --global sendemail.smtpuser ada.lovelace@gmail.com
-   $ git config --global sendemail.smtppass = XXXXXXXX
+   $ git config --global sendemail.smtpuser <email>
+   $ git config --global sendemail.smtppass <password>
 
 These settings will appear in the ``.gitconfig`` file in your home directory.
 
@@ -517,7 +518,7 @@ author name. The following will ensure that your e-mails have an additional
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
index 77a11fe27047..0c888136494e 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -193,9 +193,9 @@ The support for having multiple Git revisions per URL in :term:`SRC_URI` was
 removed from BitBake, which means the following syntax is not supported
 anymore::
 
-   SRC_URI = "git://some.host/somepath;bareclone=1;branch=branchX,branchY;name=nameX,nameY"
-   SRCREV_nameX = "xxxxxxxxxxxxxxxxxxxx"
-   SRCREV_nameY = "yyyyyyyyyyyyyyyyyyyy"
+   SRC_URI = "git://<some.host>/<somepath>;bareclone=1;branch=<branchX>,<branchY>;name=<nameX>,<nameY>"
+   SRCREV_<nameX> = "<revision SHA for nameX>"
+   SRCREV_<nameY> = "<revision SHA for nameY>"
 
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
+   SRCREV_<nameX> = "<revision SHA for nameX>"
+   SRCREV_<nameY> = "<revision SHA for nameY>"
 
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
index c050c422bffc..7ba5c48fd8ed 100644
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
 
-- 
2.50.0.173.g8b6f19ccfc3a



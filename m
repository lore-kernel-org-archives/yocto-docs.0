Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E0DC98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:06 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3035.1790101984518768301
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LcX3vp7R;
 spf=pass (domain: gmail.com, ip: 74.125.230.234, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so1499291cf.0
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101983; x=1790706783; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DxNKvjqHqWMgZbjnv5D9Cs2TmUM9432PL1908eq8I9E=;
        b=LcX3vp7RYYF196l/RpV1TkqXdVN5rAVS626vznbPby5G8/nQ4iwpfToYSAuz9ywEEt
         TRRoB2OHDY21PRQLQwaDYcl1UxTSqC7gkXLEJK1Zw0DPUg4X99eo1j3AvDd1ZmidNmLo
         cGsgycsS//VjhhyyZ46rfuvwN3WG10GA7rLPL9kqdQYrBNKauHu1Rw+lHPlHBiR1KohB
         M+aMzLmy+sPvwE+pn/dXb0fIMZg4AC1Fc32QOyDCBdJ+arEGb0g0VNS1ON9bRXyF69AM
         y+8egtmFY0ek728rzg9OTDARS5eSpQ/932xNRXdrDdwnLJ8h+prHR6FfgzU84g/7SyjR
         PTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101983; x=1790706783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DxNKvjqHqWMgZbjnv5D9Cs2TmUM9432PL1908eq8I9E=;
        b=U7AqR/sSrIY3HjODf0eVIDjEQTQB/k6xzErwDcSaK0CPeRnXkuhyMF4azlZWEzyZp3
         40HtXNaj7vObB8I0EXsu2tjYqCGyEIUadONGHnaMlmK+PCC+tPG1lRwg/o5/uD7AgdS9
         aL2iZPpFEYq8cgEc+NYFqak3LMmBT0Jos/BqhO7fYG6VcAjYU3kovnJh8nvP7Yv6qQW3
         5RR910dDWXQhyJYm1iHg/JruT1XNDlM+vJI053DUCfFupBKcwZSoxn4vC7bU5u+5fxXZ
         BgZA6mMVwTpFNCgUXsgc0nkING/Pi7kVD6OTrJBYjVHkuvR6Iiq/ms3Y2x6hCKYkIZ0n
         4yOA==
X-Gm-Message-State: AFuF++kc+aCvsfe35YL+Pw5TFwblKwPiph15Ap0nemriy2spLuNnvehr
	Mc0dkGjjMJyjA4BNRa+trj2h7DN2Ahyee67s67Pq/QwUrDZWETM6/pLeGazEug==
X-Gm-Gg: AYBFou0/rhf4S/HVMchpPzzKuPgIK5cs1L3Vsbow0vNnN9t2G4QgHi7rIwpiENgphWK
	eJOQTp54r7aNF+WVd/U8gPeW1kj64ETHfI1Jbb/T9IVXFufLMLqTDQqKigs6RVRlojkyBpxo+th
	/HZ2/p55P/HVQtJgl+QH8pmPSRYXH59VtFRADxp3m1cWeHeD3ytkBW/jtxclIvkYSVMRTu+NG9J
	x1Q+D0ZK0JA7N+gjQj+ZM0D4E+0rmmTS2m2ZRQel3NdPcI4xJCsSMXw/C1pkh9bNcwWDOpDguNd
	BKW9VBs8YSM1KFbCVEAEBLCIwwAf4FwWNMYYE+Scq3YLK0g+1JDpM63kyCqkyxz2a9IGiJ99+Oe
	9KyCMAAKqe31cSTIHJp9bncfRTRlWH/pvoOV9nyRxiVdATEVHoEfRw/4irLfBUZvgZD4NvKvhDi
	Z1qLoUZZ8139o+ZzqvZwjJLcZcn2zE2htHfVv/frA6XBl+Aqm32kOrP7niqJmnGXQ+d30A/RN8d
	qPwmRbyCk0D8enz32IxkI4r1m5lsiOHmvZNRwNBrsnYWKm11a4=
X-Received: by 2002:a05:622a:1789:b0:531:475:4cf0 with SMTP id d75a77b69052e-532eac63387mr7533151cf.29.1790101983098;
        Tue, 22 Sep 2026 11:33:03 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.32.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:32:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 5/8] docs: mark the placeholders in examples
Date: Tue, 22 Sep 2026 14:32:46 -0400
Message-ID: <20260922183249.2433345-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10594

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
changes in v2:
- rebased on master-next; no other change
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
index 3c921c3f8087..0072992b8597 100644
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



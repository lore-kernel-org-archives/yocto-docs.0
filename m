Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D247FC61DB9
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:30:41 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3413.1787707832686566501
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TxLsHjmR;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso3123316d6.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707831; x=1788312631; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjKXHBAxYDU+xhu4za0IorNFPpb7a/gTy6e5e5NM2Dc=;
        b=TxLsHjmRDZMaaTIwGYc08LwnsJmOGGboalaz+FkTXORofMfNanuO3/8Nyi0H/rdu8Q
         ow8XEvnQhJKdw7ehe506pvx7TqS6aLhVuaqZeUmb2vmGCQS4MN3ZpGgtXfQD4pdgWsNM
         VP4YfWW4a13Jc7GS3LsJGxpVw2GRCVYdcFOR58EYnp7KGj6nlihZx9G02sXt9+th7JZ1
         44uCw3DEc8Jjj3DTdUG6SBboOMee09xy1A6B0ecr11N7naPpCNXhCT0ApSiUz4641HYK
         GUglbcJeRTOsT1GcsEbKTxSoAxMqcLOHmp3Ai0odC5wk6xqAtaqyVs8uIr+V7TQahpyA
         p0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707831; x=1788312631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CjKXHBAxYDU+xhu4za0IorNFPpb7a/gTy6e5e5NM2Dc=;
        b=rGWfQCUD8za/hrdktymn2dZTADkISKJZasDO9hVBuHh027oKNoV+VlGVWd1/m1gvXI
         E3fnNmU9R1C4sufwCyCJDkN1cNMELpDifXjKTyXjBmRw9WxGOZzaTPvIhKuwq3ag/lTf
         dZhdFzziQZ/0OvGonQKyhQCQu4x4iC+L7t1XZYJACc2qmbWyH5AmdAkdaioLaJAxiECS
         ClEfNH9cMNzuWq9fLA5vxxfjEmDtIGzgk3RDjIN6wmUUWrT1uF93ydVvon5onNQvBOZP
         WZyHXJl3FLSngnR38851FpLWfnsg3W/bmjQ0UoXaGm4nKaGBNWM/HHz7Fyd0heGN8Qd+
         5ofg==
X-Gm-Message-State: AFuF++kV2RvMZPKLoTpQ1qTh+NTRUOimppMJfPnmak7C/81Ma/4XQ+gK
	hqOco+hSIJ5KdBteEEElmNxrBJ8XzLv3LcV5HeZhx/XN/pPUVATG1eDdyJk48ooz
X-Gm-Gg: AR+sD123QpmT6qgHnjSgMw6+oEPjX3hEjz74e64KZMlniFu/JwqTU/aXlQMC93K7j/a
	yGXfKQZORKner1G0WD8oR5nBKUfMmriEihNC6duQK6YKNRFvJFvIiagSrahnahKl3n0ltIBFSqS
	NhgHETvE3C4pt1kU8M3lFbugPHhTMXbX/PjMZg8/ma1Isyucd12OYfnPZQUOWt2Vfhe2q5jAEfT
	71LI18QLHp80p+ft7nx/LDw0vxtMfYxS5C6SpjE5DsDs4CHhf+Pr6Uxoe4LL26/UtP5Gq/+LYC2
	ahk/e6okA6AcM+PzyR9kdntB6vEdht7Utr1GVFC4GHJ6OT1DcxXTPZNbijfh3ReION/7OtRQ5PM
	F4s2B9QbcxdluJv7FWUHLfU84VUunASAk0sElioZMO5mL2z3uiiFw445gQU9FP6DU21qZIVg2cq
	TTsiOA0InHX1RuaXEn5XrRtsaClazwhIbYZKt4XuA5LUcl12aiyu3+W3Ggt8nXtSuu9UIu+ybXt
	87BUjQsPMKzK7Ii8nHhbYQOpHF39iYlbB/O0ks5WQ==
X-Received: by 2002:a05:620a:13e1:b0:937:5aaf:8c7b with SMTP id af79cd13be357-9378015d753mr229102585a.14.1787707831062;
        Tue, 25 Aug 2026 18:30:31 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30f097sm106654585a.1.2026.08.25.18.30.27
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: state the language of nine literal blocks explicitly
Date: Tue, 25 Aug 2026 21:30:18 -0400
Message-ID: <20260826013018.2673213-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10343

Nine blocks carry no language, so Sphinx falls back to "default". That is
not the same as being unhighlighted, and not the same as being right
either: "default" is the Python lexer, and when it raises, the block is
dropped silently to "none" where a named language would warn.

  except ErrorToken as err:
      if lang == 'default':
          lang = 'none'   # automatic highlighting failed.
      else:
          logger.warning('Lexing literal_block %r as "%s" resulted in
                          an error at token: %r ...')

So a block that happens to be valid Python is highlighted by accident,
and stops being highlighted the moment an edit makes it not-quite-valid,
with nothing to say so. Naming the language turns that silence into a
warning, which -W surfaces to whoever made the edit.

Two of the three cases also render differently right away:

  ref-manual/variables.rst       three U-Boot Image Tree Source blocks,
                                 introduced as "the following FIT
                                 source". This is device-tree syntax;
                                 guessing Python finds roughly two
                                 thirds of the tokens.
  overview-manual/concepts.rst   a Makefile, introduced as "the contents
                                 of sayhello/Makefile". Guessing Python
                                 raises, so today it renders with no
                                 highlighting at all.
  test-manual/intro.rst          five unittest classes quoted from
                                 bitbake/lib/bb/tests/data.py and
                                 meta/lib/oeqa/. They use BitBake's own
                                 API, but they are Python source files
                                 rather than metadata, and they already
                                 render correctly; the change is that
                                 they now say so.

Each language was chosen by lexing the block and comparing the result,
not by eye. Two plausible alternatives were rejected on that evidence:
yaml renders the FIT blocks as one flat scalar run, and make emits
per-character error tokens on kernel .scc syntax, so the .scc blocks are
left alone here.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/overview-manual/concepts.rst |  4 +++-
 documentation/ref-manual/variables.rst     | 12 +++++++++---
 documentation/test-manual/intro.rst        | 20 +++++++++++++++-----
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 73a24d8d301b..d4530e97fed9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2296,7 +2296,9 @@ The contents of ``libhello/hellolib.c`` are::
       puts("Hello from a Yocto demo \n");
    }
 
-The contents of ``sayhello/Makefile`` are::
+The contents of ``sayhello/Makefile`` are:
+
+.. code-block:: make
 
    EXEC=sayhello
    LDFLAGS += -lhello
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fa0dfdfb87f2..646a77982646 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3667,7 +3667,9 @@ system and gives an overview of their function and contents.
          FIT_LOADABLE_OS[tee] = "tee"
          FIT_LOADABLE_LOADADDRESS[tee] = "0x96000000"
 
-      and will be converted to the following FIT source::
+      and will be converted to the following FIT source:
+
+      .. code-block:: devicetree
 
          images {
                  atf {
@@ -11745,7 +11747,9 @@ system and gives an overview of their function and contents.
       https://fitspec.osfw.foundation/\ .
 
       The original content of the U-Boot Image Tree Source (ITS) is as
-      follows::
+      follows:
+
+      .. code-block:: devicetree
 
          images {
              uboot {
@@ -11782,7 +11786,9 @@ system and gives an overview of their function and contents.
       ``\n``.
 
       The generated content of the U-Boot Image Tree Source (ITS) is as
-      follows::
+      follows:
+
+      .. code-block:: devicetree
 
          images {
              uboot {
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 0868abe8c3c4..4ddc9851f824 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -325,7 +325,9 @@ This section provides example tests for each of the tests listed in the
 ``bitbake-selftest``
 --------------------
 
-A simple test example from ``bitbake/lib/bb/tests/data.py`` is::
+A simple test example from ``bitbake/lib/bb/tests/data.py`` is:
+
+.. code-block:: python
 
    class DataExpansions(unittest.TestCase):
       def setUp(self):
@@ -358,7 +360,9 @@ for full builds. Rather than directly using `Python unittest
 <https://docs.python.org/3/library/unittest.html>`__, the code
 wraps most of the standard objects. The tests can be simple, such as
 testing a command from within the OE build environment using the
-following example::
+following example:
+
+.. code-block:: python
 
    class BitbakeLayers(OESelftestTestCase):
       def test_bitbakelayers_showcrossdepends(self):
@@ -401,7 +405,9 @@ These tests are run once an image is up and running, either on target
 hardware or under QEMU. As a result, they are assumed to be running in a
 target image environment, as opposed to in a host build environment. A
 simple example from ``meta/lib/oeqa/runtime/cases/python.py`` contains
-the following::
+the following:
+
+.. code-block:: python
 
    class PythonTest(OERuntimeTestCase):
       @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -427,7 +433,9 @@ the image.
 
 These tests are run against built extensible SDKs (eSDKs). The tests can
 assume that the eSDK environment has already been set up. An example from
-``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following::
+``meta/lib/oeqa/sdk/cases/devtool.py`` contains the following:
+
+.. code-block:: python
 
    class DevtoolTest(OESDKExtTestCase):
       @classmethod def setUpClass(cls):
@@ -460,7 +468,9 @@ the ``devtool build`` command within the eSDK.
 These tests are run against built SDKs. The tests can assume that an SDK
 has already been extracted and its environment file has been sourced. A
 simple example from ``meta/lib/oeqa/sdk/cases/python.py`` contains the
-following::
+following:
+
+.. code-block:: python
 
    class Python3Test(OESDKTestCase):
       def setUp(self):


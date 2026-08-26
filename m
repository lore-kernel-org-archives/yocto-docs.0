Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5027C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:31:21 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3423.1787707878854519976
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XUmE+Lj6;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e65e18969so35756385a.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707878; x=1788312678; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYedTuHIpyrsWrzGe833NzqIravMuWMM7NgdSj5Afdc=;
        b=XUmE+Lj6b1gxWmpCV1P/SgTIY52xulHoOvXk4ocSj0LbLGQ9psvdOX002i12FtPLG8
         k87ojOj0mU3O7cBDHQZ/I8zCMZmssdiGZL/gWQTHr5kgF8976MMpMQ0noMFNFnCk970Q
         fFAZDzTcZmltjWZGcFyAnaPMJJUJp2JJeeGa/3B0WDc+W4R2lXcRShVb8DymwuMkwx3h
         AW4/F7JnZ4h4pB/GBUgnwHqS8FeP9NNrhfWhw1nkJ8zjEliMdvAnucWxFCXTC2d7W/xr
         7/jfqQzvitt+QsNaM3HzqdB6phM1W8jVCs9PZl6p0IViqsB3Q45IXtgBEB/OQkcW4s08
         Dc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707878; x=1788312678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYedTuHIpyrsWrzGe833NzqIravMuWMM7NgdSj5Afdc=;
        b=W74OyxbcsaOlT2OI1DRKNmLGw3Jcef6UFKb14gbNO6MtNe2Sf4ClCrEOd0MO7F95I5
         /uTTqCDrfFpC62WLXBvu7VuyqCeDLnPMGbYbup1WCQ62BDMyWA7KSopvyd1zR9KFgdSZ
         UpNQkq4BJy66A7m1H3QWodq3lGIvwsYZP3W5CcR/gt1HmzC5fY+9mynRPz730XjHFoz+
         YVc++yFPNCbQP7Y+OC87E0j8VVq8R4nZtiTdtAwMfzO1NTGB+kzD5J3ajLU0wsdYhZMW
         EcawaPoidfwRLQGmuI/VMNyx3Rq+riqXWjhT/BTW0nC8A8g9MsSasEYzIKBUhN6nKCGU
         2heg==
X-Gm-Message-State: AFuF++l/68llS8aOQK5DvYKjcBeqa1Aom0NXnlDrOqO2Q1Tdaht5ZRvh
	DKR3b+zPc8tdKDMJ4diRZ8qUYEjSTp2ZHz8OJ1/2Q+Zvvst39oTosLKh7XT8ieq9
X-Gm-Gg: AR+sD12jwjoiovP7829q/sAKr5ZvWX0j+bbwYnEXgaOXMT7spp0u41DejROtm7NyQEH
	DH1wtEyN3FXE7p+XcYXlvNc85FrV6E2hYM4x8RvSKAyhb31Q2e8FzW4yIIr3p/9oQjr+o7NJ2Ye
	fVEhgG5yiFIVHxccNH8bc8B5ejimHC4sVrz7ASu5mw9D+Z82ISwQ5CEHAIaqCNoT9BD4XVr7Jjf
	em6HaOwTDZVz+6cthWQdYiOByOHHwrM2Mps09zh84yEk8F5i9QExNmIEvfRPQ8kQPL8y5Sk6fxC
	NS9s6B/mkDdUC6D8DQe2cPLUgKt1MhybWQar3gLBa6NvVhsWWTm3JsoUXmOh2w1BVFpCOLZllxZ
	G+BD9B8Z41gphVuz1sUjdQvMpG7MqsYviWfLyy2G1AJ1YWk2C5MHb31WCR0mmkJ10aUGjrDg23F
	22DLW2uDIPYz/tj3/GTJNXu3xJJ6rDFlv2UTOBvRl4Z4qsu0Wywqfh1JYDA9xNgrSghhvhc282l
	56DATaQtt92s8Lk8K6gkSG47b4/KG0=
X-Received: by 2002:a05:620a:700c:b0:937:783f:4fa5 with SMTP id af79cd13be357-937783f54e3mr702291585a.19.1787707876878;
        Tue, 25 Aug 2026 18:31:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36879asm105857785a.17.2026.08.25.18.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:31:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH] doc: state the language of six Python blocks explicitly
Date: Tue, 25 Aug 2026 21:31:13 -0400
Message-ID: <20260826013113.2673355-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10344

Six blocks show BitBake datastore and library calls - d.getVar,
d.getVarFlags, bb.fetch2.Fetch, bb.fatal - written in Python, and carry
no language:

  fetching.rst              "the code to execute the first part of this
                            process", the fetcher instantiation and the
                            two unpack calls
  metadata.rst              the BB_ORIGENV datastore example and the
                            getVarFlags/setVarFlags pair
  library-functions.rst     the f-string example, introduced with
                            "Python f-strings may also be used"

These are BitBake snippets, but "bitbake" is the wrong language for
them. In a recipe this code lives inside a python task, and the BitBake
lexer hands task bodies to the Python lexer; wrapping each of these in a
python task and comparing tokens by offset gives a result identical to
lexing it as Python directly. Presented as a bare block instead, the
BitBake lexer reads each line as a variable assignment at column 0 and
renders d.getVar( as part of a string value. BitBake's own parser agrees
it is not an assignment: there is no quoted value, so it would be a
parse error. So "python" is what the BitBake lexer itself produces for
this code in the context where it belongs.

Nothing renders differently today. Sphinx maps an untagged block to
"default", which is the Python lexer, so these are already highlighted -
by accident. The difference is what happens when that lexer raises:

  except ErrorToken as err:
      if lang == 'default':
          lang = 'none'   # automatic highlighting failed.
      else:
          logger.warning('Lexing literal_block %r as "%s" resulted in
                          an error at token: %r ...')

"default" is dropped silently to "none"; a named language warns, and -W
puts that in front of whoever made the edit. Naming the language turns a
guess that happens to be right into a statement that stays checked.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../bitbake-user-manual-fetching.rst                 | 12 +++++++++---
 .../bitbake-user-manual-library-functions.rst        |  4 +++-
 .../bitbake-user-manual-metadata.rst                 |  8 ++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst b/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
index b96018a4edcf..2993eda49439 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
@@ -27,7 +27,9 @@ and unpacking the files is often optionally followed by patching.
 Patching, however, is not covered by this module.
 
 The code to execute the first part of this process, a fetch, looks
-something like the following::
+something like the following:
+
+.. code-block:: python
 
    src_uri = (d.getVar('SRC_URI') or "").split()
    fetcher = bb.fetch2.Fetch(src_uri, d)
@@ -37,7 +39,9 @@ This code sets up an instance of the fetch class. The instance uses a
 space-separated list of URLs from the :term:`SRC_URI`
 variable and then calls the ``download`` method to download the files.
 
-The instantiation of the fetch class is usually followed by::
+The instantiation of the fetch class is usually followed by:
+
+.. code-block:: python
 
    rootdir = l.getVar('UNPACKDIR')
    fetcher.unpack(rootdir)
@@ -203,7 +207,9 @@ that updates an existing checkout *in place* rather than removing and
 re-cloning it. This is useful when the target directory may contain
 local commits that should be preserved across updates.
 
-The code to call the non-destructive update looks like the following::
+The code to call the non-destructive update looks like the following:
+
+.. code-block:: python
 
    rootdir = l.getVar('UNPACKDIR')
    fetcher.unpack_update(rootdir)
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-library-functions.rst b/doc/bitbake-user-manual/bitbake-user-manual-library-functions.rst
index 09e353945bb6..8c9d9003dd7b 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-library-functions.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-library-functions.rst
@@ -29,7 +29,9 @@ Formatted string can also be used directly::
 
    bb.error("%s, we have a %s" % ("Houston", "big problem"))
 
-Python f-strings may also be used::
+Python f-strings may also be used:
+
+.. code-block:: python
 
    h = "Houston"
    bb.fatal(f"{h}, we have a critical problem")
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index b0535b5dd459..a146b897c884 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -1719,7 +1719,9 @@ environment into a special variable named :term:`BB_ORIGENV`.
 The :term:`BB_ORIGENV` variable returns a datastore object that can be
 queried using the standard datastore operators such as
 ``getVar(, False)``. The datastore object is useful, for example, to
-find the original ``DISPLAY`` variable. Here is an example::
+find the original ``DISPLAY`` variable. Here is an example:
+
+.. code-block:: python
 
    origenv = d.getVar("BB_ORIGENV", False)
    bar = origenv.getVar("BAR", False)
@@ -1732,7 +1734,9 @@ Variable Flags
 
 Variable flags (varflags) help control a task's functionality and
 dependencies. BitBake reads and writes varflags to the datastore using
-the following command forms::
+the following command forms:
+
+.. code-block:: python
 
    variable = d.getVarFlags("variable")
    self.d.setVarFlags("FOO", {"func": True})


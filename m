Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0681FC61DB9
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:37:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3439.1787708238523878100
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G8nzP48E;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92edb12cdf2so23193685a.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708237; x=1788313037; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbjsmoITrXfjFHpfm5qFd1hErsqmf2LKciPriJErvkc=;
        b=G8nzP48Ee0mnVe02t4TrPIh6jC9KkZcVwtE44Vee+gIMztXFpLvQ6ZflcK4UgVs+nO
         jW6gQkPOCKPdhN6BrToqvaBGgCpqMpE7wTyJXC36lFbHbevaYKYAvhWIMcqCZ9cm1FHG
         F2w3lN2+qQhPNgVRL6cv2UJrGTC3ciu0OHxcSYNRcBuGZuu+KskQtrWWGVwRkczhPR0y
         B+9x/SRTx9/dgY9hNXcAZxFhIruei0443UysV79yh/suMbCNbBdAw4W3BVsOIv/IOZdE
         1A4idpM11ehCns9JdjKm2+F2DOTpeKGcZd4YOeJYIIkE9MhhGsmneNBobj/7PfmS9VXk
         ty3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708237; x=1788313037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbjsmoITrXfjFHpfm5qFd1hErsqmf2LKciPriJErvkc=;
        b=DEXRBlh4QylsYZyupTg3EbZO0IRvFVL2aWThnliyVUcTt+3mxRhOsDAKT6Hjx4y4rv
         T5EuRjTu4+CFF8OPF9Kl9lcnVY+6NqNX5YNUCQsvWZCVcVfyT/ocJVWHD/fMZ1iSfYL7
         qF9Okp3ac1LSdpYEN7VzGiu7gqu/jAIHNMRintrA7i0A/NZaC3xvR/tQo6ryyY3JMLnD
         NBww+lgajlPqe7JNYj3mJNTOmbuT0SDZApdHHEejuIOj2O/ThMKt4qcRvpRJ/s/WkKLT
         WpRyrvihz659I/pZToQjol99+XT8BmAdwZSKDgGnbCQdW4LLRTdm9fgofm5bs3SMLKrV
         57UQ==
X-Gm-Message-State: AFuF++mgL/rN8Z/pfmIxCw4JgofMFzE3uuL/ImRHEoAz/6ETbWLbuMyb
	o6pbC+sQicmSX8zblWlzwED91U4piJgDEu+gB4H9XxYaNQyvJ8O6rUTPSUzsggUd
X-Gm-Gg: AR+sD10lUZgIlDC8Aff30PD7/tfG77ztgDdnDsAEEUBY84W6pL2NyehR0JgT0q0VBOg
	2ZjgyBSVw9XgTHTstMxj32BkaYMHWLs3Z5UH9oBCCgTQx+Sfg+kDA4Aukd9myA6U6jw68Hm91Ya
	yq9ov9zeHNok3F8rvm6+5qvyZQJnp9iZW+lMr79SsiBOWrP+KNA8UwkzdgJB8Q4ZZ3P7k2iS/YH
	w6CkBx3cfbr3jrYbUC4gdF3dIei7mqrM82XawKFGHxNRc/Bt6A2rNPnCVt9eOmbdM5PgV1cTMFR
	jyqkBjvQP2DbVGqQYrtIVAOucjlrMxKvTazBpTg2tSaDLLeu0/nH/RIBjNewyj2Ox6aT8m29Q8L
	0KkdSF2WOIMjGI4d+ONH1h2GuniTnEElIDoccOksFjsagCi/KiSD+jiuNGoDsLrcbtvZ5LnmyGV
	UIyjXkCyod2bqIeSEBC9W8ZjUhOo1KXn8mvarecQJVGrCPhmLZmonvFcJ0/iIbhC0131LAXf+HB
	MBTXAmSiUzm3QnUuSe2D5VqVFt2d7b4
X-Received: by 2002:a05:620a:2945:b0:936:695a:185a with SMTP id af79cd13be357-9378046b550mr243111185a.44.1787708237162;
        Tue, 25 Aug 2026 18:37:17 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c50esm103863685a.37.2026.08.25.18.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:37:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH 4/4] doc: use the bitbake code-block language in the remaining chapters
Date: Tue, 25 Aug 2026 21:37:03 -0400
Message-ID: <20260826013703.2674786-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013703.2674786-1-twoerner@gmail.com>
References: <20260826013703.2674786-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10359

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 28 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../bitbake-user-manual-execution.rst         | 44 ++++++++++++++-----
 .../bitbake-user-manual-hello.rst             | 20 ++++++---
 .../bitbake-user-manual-intro.rst             | 24 +++++++---
 3 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst b/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
index 1638a8f5cc01..b24d1e283685 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -155,7 +155,9 @@ execution environment.
    pair of curly braces in a shell function, the closing curly brace
    must not be located at the start of the line without leading spaces.
 
-   Here is an example that causes BitBake to produce a parsing error::
+   Here is an example that causes BitBake to produce a parsing error:
+
+   .. code-block:: bitbake
 
       fakeroot create_shar() {
          cat << "EOF" > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
@@ -185,7 +187,9 @@ During the configuration phase, BitBake will have set
 :term:`BBFILES`. BitBake now uses it to construct a
 list of recipes to parse, along with any append files (``.bbappend``) to
 apply. :term:`BBFILES` is a space-separated list of available files and
-supports wildcards. An example would be::
+supports wildcards. An example would be:
+
+.. code-block:: bitbake
 
   BBFILES = "/path/to/bbfiles/*.bb /path/to/appends/*.bbappend"
 
@@ -206,7 +210,9 @@ parses in order any append files found in :term:`BBFILES`.
 One common convention is to use the recipe filename to define pieces of
 metadata. For example, in ``bitbake.conf`` the recipe name and version
 are used to set the variables :term:`PN` and
-:term:`PV`::
+:term:`PV`:
+
+.. code-block:: bitbake
 
    PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
    PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
@@ -238,7 +244,9 @@ Recipe file collections exist to allow the user to have multiple
 repositories of ``.bb`` files that contain the same exact package. For
 example, one could easily use them to make one's own local copy of an
 upstream repository, but with custom modifications that one does not
-want upstream. Here is an example::
+want upstream. Here is an example:
+
+.. code-block:: bitbake
 
   BBFILES = "/stuff/openembedded/*/*.bb /stuff/openembedded.modified/*/*.bb"
   BBFILE_COLLECTIONS = "upstream local"
@@ -270,7 +278,9 @@ variable, which is optional.
 When a recipe uses :term:`PROVIDES`, that recipe's functionality can be
 found under an alternative name or names other than the implicit :term:`PN`
 name. As an example, suppose a recipe named ``keyboard_1.0.bb``
-contained the following::
+contained the following:
+
+.. code-block:: bitbake
 
   PROVIDES += "fullkeyboard"
 
@@ -331,7 +341,9 @@ If the first recipe is named ``a_1.1.bb``, then the
 
 Thus, if a recipe named ``a_1.2.bb`` exists, BitBake will choose 1.2 by
 default. However, if you define the following variable in a ``.conf``
-file that BitBake parses, you can change that preference::
+file that BitBake parses, you can change that preference:
+
+.. code-block:: bitbake
 
   PREFERRED_VERSION_a = "1.1"
 
@@ -499,7 +511,9 @@ to the task.
 
 Like the working directory case, situations exist where dependencies
 should be ignored. For these cases, you can instruct the build process
-to ignore a dependency by using a line like the following::
+to ignore a dependency by using a line like the following:
+
+.. code-block:: bitbake
 
   PACKAGE_ARCHS[vardepsexclude] = "MACHINE"
 
@@ -509,7 +523,9 @@ even if it does reference it.
 
 Equally, there are cases where we need to add dependencies BitBake is
 not able to find. You can accomplish this by using a line like the
-following::
+following:
+
+.. code-block:: bitbake
 
   PACKAGE_ARCHS[vardeps] = "MACHINE"
 
@@ -537,7 +553,9 @@ configuration file, we can give BitBake some extra information to help
 it construct the basehash. The following statement effectively results
 in a list of global variable dependency excludes --- variables never
 included in any checksum. This example uses variables from OpenEmbedded
-to help illustrate the concept::
+to help illustrate the concept:
+
+.. code-block:: bitbake
 
    BB_BASEHASH_IGNORE_VARS ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
        SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
@@ -558,7 +576,9 @@ OpenEmbedded-Core uses: "OEBasicHash". By default, there
 is a dummy "noop" signature handler enabled in BitBake. This means that
 behavior is unchanged from previous versions. ``OE-Core`` uses the
 "OEBasicHash" signature handler by default through this setting in the
-``bitbake.conf`` file::
+``bitbake.conf`` file:
+
+.. code-block:: bitbake
 
   BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
@@ -724,7 +744,9 @@ or higher priority to a file called ``hashequiv.log``::
        }
    }
 
-Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``::
+Then set the :term:`BB_LOGCONFIG` variable in ``conf/local.conf``:
+
+.. code-block:: bitbake
 
    BB_LOGCONFIG = "hashequiv.json"
 
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-hello.rst b/doc/bitbake-user-manual/bitbake-user-manual-hello.rst
index 654196ca24d3..015cf907eb25 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-hello.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-hello.rst
@@ -197,7 +197,9 @@ Following is the complete "Hello World" example.
 
     From within the ``conf`` directory,
     use some editor to create the ``bitbake.conf`` so that it contains
-    the following::
+    the following:
+
+    .. code-block:: bitbake
 
        PN  = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
 
@@ -263,7 +265,9 @@ Following is the complete "Hello World" example.
       $ mkdir classes
 
     Move to the ``classes`` directory and then create the
-    ``base.bbclass`` file by inserting this single line::
+    ``base.bbclass`` file by inserting this single line:
+
+    .. code-block:: bitbake
 
       addtask build
 
@@ -304,7 +308,9 @@ Following is the complete "Hello World" example.
        $ mkdir conf
 
     Move to the ``conf`` directory and create a ``layer.conf`` file that has the
-    following::
+    following:
+
+    .. code-block:: bitbake
 
       BBPATH .= ":${LAYERDIR}"
       BBFILES += "${LAYERDIR}/*.bb"
@@ -326,7 +332,9 @@ Following is the complete "Hello World" example.
 
     You need to create the recipe file next. Inside your layer at the
     top-level, use an editor and create a recipe file named
-    ``printhello.bb`` that has the following::
+    ``printhello.bb`` that has the following:
+
+    .. code-block:: bitbake
 
        DESCRIPTION = "Prints Hello World"
        PN = 'printhello'
@@ -367,7 +375,9 @@ Following is the complete "Hello World" example.
     ``hello/conf`` for this example).
 
     Set your working directory to the ``hello/conf`` directory and then
-    create the ``bblayers.conf`` file so that it contains the following::
+    create the ``bblayers.conf`` file so that it contains the following:
+
+    .. code-block:: bitbake
 
        BBLAYERS ?= " \
            /home/<you>/mylayer \
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
index 6801323e2fb9..d83050d45ca2 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
@@ -215,7 +215,9 @@ BitBake supports class files installed in three different directories:
    :term:`INHERIT` variable in a :ref:`configuration file
    <bitbake-user-manual/bitbake-user-manual-intro:Configuration Files>`. These
    classes are included for every recipe being built. For example, you would use
-   the global class named ``myclass`` like so::
+   the global class named ``myclass`` like so:
+
+   .. code-block:: bitbake
 
       INHERIT += "myclass"
 
@@ -223,7 +225,9 @@ BitBake supports class files installed in three different directories:
    :ref:`inherit <ref-bitbake-user-manual-metadata-inherit>` or
    :ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>`
    directive. They do not support being inherited globally. For example, you
-   would use the recipe class named ``myclass`` like so::
+   would use the recipe class named ``myclass`` like so:
+
+   .. code-block:: bitbake
 
       inherit myclass
 
@@ -673,7 +677,9 @@ accomplished by setting the
 configuration files for ``target1`` and ``target2`` defined in the build
 directory. The following statement in the ``local.conf`` file both
 enables BitBake to perform multiple configuration builds and specifies
-the two extra multiconfigs::
+the two extra multiconfigs:
+
+.. code-block:: bitbake
 
   BBMULTICONFIG = "target1 target2"
 
@@ -704,12 +710,16 @@ multiconfig.
 
 To enable dependencies in a multiple configuration build, you must
 declare the dependencies in the recipe using the following statement
-form::
+form:
+
+.. code-block:: bitbake
 
   task_or_package[mcdepends] = "mc:from_multiconfig:to_multiconfig:recipe_name:task_on_which_to_depend"
 
 To better show how to use this statement, consider an example with two
-multiconfigs: ``target1`` and ``target2``::
+multiconfigs: ``target1`` and ``target2``:
+
+.. code-block:: bitbake
 
   image_task[mcdepends] = "mc:target1:target2:image2:rootfs_task"
 
@@ -730,7 +740,9 @@ the ``rootfs_task`` for the "target2" multiconfig build.
 
 Having a recipe depend on the root filesystem of another build might not
 seem that useful. Consider this change to the statement in the image1
-recipe::
+recipe:
+
+.. code-block:: bitbake
 
   image_task[mcdepends] = "mc:target1:target2:image2:image_task"
 


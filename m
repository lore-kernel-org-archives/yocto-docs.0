Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02C6ECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 17:26:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.732.1662917188936843468
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jFk0Y2cc;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so9346204wma.2
        for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4q9cr1ormIySkZtVrHc60trTjmu6fnVqn+AjPBNSSgg=;
        b=jFk0Y2ccqccNxaY9X4jC6tX9kx4zpwpmsM7G0Qr+r4rlSCxZKA7ZcrUQdur5SXG5lI
         Q2wjef2gs9pRmKmqTeY/MqvNQvbovyOdSPSHbIA8wCya2FtV6zFSekGskEe0gl4bnqQZ
         XBNMSwgjS7t6kr175Vxxu31jkN9Eb3Zd/8CQ0aqF+NRqnOkhHlRkg/jZpMKjgEszoGI8
         IaVQlE805kQXVkB6ubYsGtVxR2M59APkAMQlh0FYxvi4e7KoZQ5KqmZqS4H3XlQbC0IU
         6ErQksyUDm1ufBOKUIIdSZd6cCcs2MuRquZwbW94S05S9WEmlIkiYd9BwICFz0h0PNNI
         rZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4q9cr1ormIySkZtVrHc60trTjmu6fnVqn+AjPBNSSgg=;
        b=sVGArxU4/SsZPapE6Ceo8/N29NmIsSdO9Rmg84Cb7MRTByuWKJz1o00iULoBTVXzY1
         APUFPagzdPLHtOpByITc2Q31ndySTqcYPBx6WNOK+oszCKBBH7/cTmA5hN7hRQPyiabY
         oIxBr2a1FVFmST7IgeF0lHylUNzYI377//VHKdsLWgR1SoEMnE5xoC7itoa4BGsnIndc
         sBoYQjidyFA/9fLh2+0np6FaOzKUx5Ohs/XEDtjoQGea5BTVSzQSsxBL23hZwgS8W5KP
         uvaUeLKxwaCKQKQsRAUBu7zPVs/7PuexXnaloXtSd0aiRe1UmtVVqOk8VJxkCKyHCuxQ
         /sLw==
X-Gm-Message-State: ACgBeo2w+svgjk+dvhFyUFrRkIofAH6bYWJt2XwwZyW5EbHwbReYFRsx
	+SpYv4q4ek5rpe8INamjPiQQuX6+c6Q=
X-Google-Smtp-Source: 
 AA6agR5lJz+sJ+1cQfWzqoAeGioNEBhoCjMvYnlWyPHk8bvExjV0wgL5q0wRsgeFJccKLVhauFIOXA==
X-Received: by 2002:a05:600c:358f:b0:3b4:8602:7c43 with SMTP id
 p15-20020a05600c358f00b003b486027c43mr1323564wmq.60.1662917187199;
        Sun, 11 Sep 2022 10:26:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5280395wrq.12.2022.09.11.10.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:26:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/5] common-tasks.rst: rewrite the section about configuration
 templates
Date: Sun, 11 Sep 2022 19:26:08 +0200
Message-Id: <20220911172608.2542076-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220911172608.2542076-1-alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 11 Sep 2022 17:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3151

This now includes a description about how to create a template
with the newly added tooling, and drops the description
of .templateconf as a way to point to a custom template
(which is not correct: .templateconf is used only to point to a default
template in poky or core when TEMPLATECONF is not specified).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 92 +++++++++--------------
 1 file changed, 36 insertions(+), 56 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 6c2df9aa6..eab5648fd 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -6463,71 +6463,51 @@ Creating a Custom Template Configuration Directory
 ==================================================
 
 If you are producing your own customized version of the build system for
-use by other users, you might want to customize the message shown by the
-setup script or you might want to change the template configuration
-files (i.e. ``local.conf`` and ``bblayers.conf``) that are created in a
-new build directory.
+use by other users, you might want to provide a custom build configuration
+that includes all the necessary settings and layers (i.e. ``local.conf`` and
+``bblayers.conf`` that are created in a new build directory) and a custom
+message that is shown when setting up the build. This can be done by
+creating one or more template configuration directories in your
+custom distribution layer.
 
-The OpenEmbedded build system uses the environment variable
-:term:`TEMPLATECONF` to locate the directory from which it gathers
-configuration information that ultimately ends up in the
-:term:`Build Directory` ``conf`` directory.
-By default, :term:`TEMPLATECONF` is set as follows in the ``poky``
-repository::
+This can be done by using ``bitbake-layers save-build-conf``:
 
-   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf}
-
-This is the
-directory used by the build system to find templates from which to build
-some key configuration files. If you look at this directory, you will
-see the ``bblayers.conf.sample``, ``local.conf.sample``, and
-``conf-notes.txt`` files. The build system uses these files to form the
-respective ``bblayers.conf`` file, ``local.conf`` file, and display the
-list of BitBake targets when running the setup script.
-
-To override these default configuration files with configurations you
-want used within every new Build Directory, simply set the
-:term:`TEMPLATECONF` variable to your directory. The :term:`TEMPLATECONF`
-variable is set in the ``.templateconf`` file, which is in the top-level
-:term:`Source Directory` folder
-(e.g. ``poky``). Edit the ``.templateconf`` so that it can locate your
-directory.
+   $ bitbake-layers save-build-conf ../../meta-alex/ test-1
+   NOTE: Starting bitbake server...
+   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
+   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
+   You can try out the configuration with
+   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
 
-Best practices dictate that you should keep your template configuration
-directory in your custom distribution layer. For example, suppose you
-have a layer named ``meta-mylayer`` located in your home directory and
-you want your template configuration directory named ``myconf``.
-Changing the ``.templateconf`` as follows causes the OpenEmbedded build
-system to look in your directory and base its configuration files on the
-``*.sample`` configuration files it finds. The final configuration files
-(i.e. ``local.conf`` and ``bblayers.conf`` ultimately still end up in
-your Build Directory, but they are based on your ``*.sample`` files.
-::
+The above command takes the config files from the currently active build directory under ``conf\``,
+replaces site-specific paths in bblayers.conf with ##OECORE##-relative paths, and copies
+the config files into a specified layer under a specified template name.
 
-   TEMPLATECONF=${TEMPLATECONF:-meta-mylayer/myconf}
+To use those saved templates as a starting point for a build, users should point
+to one of them with :term:`TEMPLATECONF` environment variable:
 
-Aside from the ``*.sample`` configuration files, the ``conf-notes.txt``
-also resides in the default ``meta-poky/conf`` directory. The script
-that sets up the build environment (i.e.
-:ref:`structure-core-script`) uses this file to
-display BitBake targets as part of the script output. Customizing this
-``conf-notes.txt`` file is a good way to make sure your list of custom
-targets appears as part of the script's output.
+   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
 
-Here is the default list of targets displayed as a result of running
-either of the setup scripts::
+The OpenEmbedded build system uses the environment variable
+:term:`TEMPLATECONF` to locate the directory from which it gathers
+configuration information that ultimately ends up in the
+:term:`Build Directory` ``conf`` directory.
 
-   You can now run 'bitbake <target>'
+If :term:`TEMPLATECONF` is not set, the default value is obtained
+from ```.templateconf`` file that is read from the same directory as
+`oe-init-build-env` script. For ``poky`` reference distribution this
+would be::
 
-   Common targets are:
-       core-image-minimal
-       core-image-sato
-       meta-toolchain
-       meta-ide-support
+   TEMPLATECONF=${TEMPLATECONF:-meta-poky/conf/templates/default}
 
-Changing the listed common targets is as easy as editing your version of
-``conf-notes.txt`` in your custom template configuration directory and
-making sure you have :term:`TEMPLATECONF` set to your directory.
+If you look at a configuration template directory, you will
+see the ``bblayers.conf.sample``, ``local.conf.sample``, and
+``conf-notes.txt`` files. The build system uses these files to form the
+respective ``bblayers.conf`` file, ``local.conf`` file, and show
+users a note about the build they're setting up
+when running the ``oe-init-build-env`` setup script. These can be
+edited further if needed to improve or change the build configurations
+available to the users.
 
 Conserving Disk Space
 =====================
-- 
2.30.2



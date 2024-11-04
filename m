Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8897D111AF
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:55:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.61085.1730735705349608803
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xWievNTs;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so34383625e9.1
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735704; x=1731340504; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPhJ384V1J7YcpxdGGmctwR+UKLpONZAGnjEv0MnwCM=;
        b=xWievNTsE7fXZrLWPy1VoJ0kMY2BlmH6xKAE9Cx1PBR1syOCGz0LVhHCj3keqkNUlX
         uhp77hJ9f/aAs4caLUGkyxjJS9KRVl895QrDLs1SK/g03+dO5hDM7AkrS7Pnf7rnKuLt
         g/zr6OroPMFiGRz0y5adrHz8if4Yaos/ttxcx+fRArcHuYL3HI9EJQxeerxF2olUgXv/
         VuMrC5jwRCRGwcXpP2sDUWTcqpcynX/8lmjMc+C5mnL20qc5haWWQ22dPzh7rEG5D7bI
         pV3Qwr2U/OrdwG4U0bE25ft4sae5f6RygrBne62QonOKZaFMZnB7hAIVG++CbXlETfX9
         GS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735704; x=1731340504;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPhJ384V1J7YcpxdGGmctwR+UKLpONZAGnjEv0MnwCM=;
        b=NHTWDNINFTNF3XpPyv8BNWS5R+1wy4hMcCXWdN+F+WVC4HyL/rlwWeqpyEICl3aENX
         DZDh3d2yKmDVtogjIrlrVCcBHLdhsETGAhA3j88/37dWS9KllOQFB5G933bXRusmuw0M
         XBSn7O8iC0+1YEeV9UnahNuH8HGApFsLoP0DYeXDhPMV4zUClLBdaSKx031W+DH2hYeO
         GwqK7G+K+n5rhDetbJP+MWeMsif9TLbnXswPd18dBg4treuRKsy/9k52P44nCejIJzEE
         iWK0c32v5XIlVOgNOw01j5DOfKbeTYwD4U3D55WE1AfMVYVQBExvykrVFDWQxNWEA1Sc
         saRA==
X-Gm-Message-State: AOJu0YzwGkmVKuMOrIzTYUo7OeRToQX307ol0h8zy+cQPArMz95laowK
	meDkhRSCGdUMx5BlJjvgoPh9KRPdzQJds2G4/lHzIlI3O4ySCHpsm+naPF1nHYqoQYyiWDhiFX2
	sgiQ=
X-Google-Smtp-Source: AGHT+IEWvlJouV3YjX4AXEhUVb/mxCm6gz235DQmnF9Q5sEeXrV7Arbvm2dKe8iS4yzLAOu8Q2hQlQ==
X-Received: by 2002:a5d:4d03:0:b0:37c:d225:6d33 with SMTP id ffacd0b85a97d-381b710f718mr13902928f8f.55.1730735703680;
        Mon, 04 Nov 2024 07:55:03 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13472315f8f.100.2024.11.04.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:55:03 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 04 Nov 2024 16:55:01 +0100
Subject: [PATCH v2 3/3] dev-manual: add bblock documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-add-bblock-documentation-v2-3-0704e4d59929@baylibre.com>
References: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5666

bblock is a helper tool to lock/unlock tasks and recipes to specific
signatures. Add a documentation page for it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/dev-manual/bblock.rst    | 129 +++++++++++++++++++++++++++++++++
 documentation/dev-manual/index.rst     |   1 +
 documentation/ref-manual/structure.rst |   8 ++
 documentation/ref-manual/variables.rst |   3 +
 4 files changed, 141 insertions(+)

diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manual/bblock.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e114bd34673e7b9853d6871b04863f2d741dc6ca
--- /dev/null
+++ b/documentation/dev-manual/bblock.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Locking and Unlocking Recipes Using ``bblock``
+**********************************************
+
+By design, the OpenEmbedded build system builds everything from scratch
+unless BitBake determines that specific tasks do not require rebuilding.
+At startup, it computes a signature for each tasks, based on the task's input.
+Then, it compares these signatures with the ones from the sstate (if they
+exist). Any changes cause the task to rerun.
+
+During development, changes might trigger BitBake to rebuild certain
+recipes, even when we know they do not require rebuilding at that stage.
+For example, modifying a recipe can lead to the rebuilding of its native
+counterpart, which might proves unnecessary. Editing the ``python3`` recipe,
+for instance, can prompt BitBake to rebuild ``python3-native`` along with any
+recipes that depend on it.
+
+To prevent this, use ``bblock`` to lock specific tasks or recipes to
+specific signatures, forcing BitBake to use the sstate cache for them.
+
+.. attention::
+
+   Use ``bblock`` only during the development phase.
+
+   Forcing BitBake to use sstate cache, regardless of input changes, means
+   the recipe metadata no longer directly reflect the output. Use this feature
+   with caution. If you do not understand why signatures change, see the section
+   on :yocto_wiki:`understanding what changed </TipsAndTricks/Understanding_what_changed_(diffsigs_etc)>`.
+
+
+Locking tasks and recipes
+-------------------------
+
+To lock a recipe, use::
+
+   $ bblock recipe
+
+You can also use a space-separated list of recipes to lock multiple recipes::
+
+   $ bblock recipe1 recipe2
+
+Locking a recipe means locking all tasks of the recipe. If you need to
+lock only particular tasks, use the `-t` option with a comma-separated
+list of tasks::
+
+  $ bblock -t task1,task2 recipe
+
+
+Unlocking tasks and recipes
+---------------------------
+
+To unlock a recipe, use the ``-r`` option::
+
+   $ bblock -r recipe
+
+You can also use a space-separated list of recipes to unlock multiple recipes::
+
+   $ bblock -r recipe1 recipe2
+
+Unlocking a recipe means unlocking all tasks of the recipe. If you need to
+unlock only particular tasks use the ``-t`` option with a comma-separated
+list of tasks::
+
+  $ bblock -r -t task1,task2 recipe
+
+To unlock all recipes, do not specify any recipe::
+
+  $ bblock -r
+
+
+Configuration file
+------------------
+
+``bblock`` will dump the signatures in the ``build/conf/bblock.conf`` file,
+included by default in :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
+To dump the file, use the ``-d`` option::
+
+  $ bblock -d
+
+
+Locking mechanism
+-----------------
+
+``bblock`` computes the signature(s) of the task(s) and sets the 3 following
+variables: :term:`SIGGEN_LOCKEDSIGS`, :term:`SIGGEN_LOCKEDSIGS_TYPES`
+and :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`.
+
+In particular, ``bblock`` sets::
+
+  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "info"
+  SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
+
+  SIGGEN_LOCKEDSIGS_<package_arch> += "<recipe>:<task>:<signature>"
+
+This produces architecture specific locks and reminds user that some tasks
+have locked signatures.
+
+Example
+-------
+
+When working on the ``python3`` recipe, we can lock ``python3-native`` with
+the following::
+
+  $ bblock python3-native
+  $ bblock -d
+  # Generated by bblock
+  SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "info"
+  SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
+
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_patch:865859c27e603ba42025b7bb766c3cd4c0f477e4962cfd39128c0619d695fce7"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_populate_sysroot:f8fa5d3194cef638416000252b959e86d0a19f6b7898e1f56b643c588cdd8605"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_prepare_recipe_sysroot:fe295ac505d9d1143313424b201c6f3f2a0a90da40a13a905b86b874705f226a"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_fetch:1b6e4728fee631bc7a8a7006855c5b8182a8224579e32e3d0a2db77c26459f25"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_unpack:2ad74d6f865ef75c35c0e6bbe3f9a90923a6b2c62c18a3ddef514ea31fbc588f"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_deploy_source_date_epoch:15f89b8483c1ad7507480f337619bb98c26e231227785eb3543db163593e7b42"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_configure:7960c13d23270fdb12b3a7c426ce1da0d2f5c7cf5e5d3f5bdce5fa330eb7d482"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_compile:012e1d4a63f1a78fc2143bd90d704dbcf5865c5257d6272aa7540ec1cd3063d9"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_install:d3401cc2afa4c996beb154beaad3e45fa0272b9c56fb86e9db14ec3544c68f9d"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_build:fa88bb7afb9046c0417c24a3fa98a058653805a8b00eda2c2d7fea68fc42f882"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_collect_spdx_deps:cc9c53ba7c495567e9a38ec4801830c425c0d1f895aa2fc66930a2edd510d9b4"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_create_spdx:766a1d09368438b7b5a1a8e2a8f823b2b731db44b57e67d8b3196de91966f9c5"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_create_package_spdx:46f80faeab25575e9977ba3bf14c819489c3d489432ae5145255635108c21020"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_recipe_qa:cb960cdb074e7944e894958db58f3dc2a0436ecf87c247feb3e095e214fec0e4"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_populate_lic:15657441621ee83f15c2e650e7edbb036870b56f55e72e046c6142da3c5783fd"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_create_manifest:24f0abbec221d27bbb2909b6e846288b12cab419f1faf9f5006ed80423d37e28"
+  SIGGEN_LOCKEDSIGS_x86_64 += "python3-native:do_addto_recipe_sysroot:bcb6a1905f113128de3f88d702b706befd6a786267c045ee82532759a7c214d7"
+
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 9ccf60f7012ea344612298e77ebabed84ad6de3e..7afd0d820e94d56cb2145962b9b1a976c7951936 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -48,5 +48,6 @@ Yocto Project Development Tasks Manual
    error-reporting-tool
    wayland
    qemu
+   bblock
 
 .. include:: /boilerplate.rst
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index bbeda78c791d430faa55356a3209f5eeb1402837..339ee2fbd77b1264e62b9b70381ff970b816d728 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -335,6 +335,14 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
    version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/templates/default``
    directory.
 
+.. _structure-build-conf-bblock.conf:
+
+``build/conf/bblock.conf``
+--------------------------
+
+This configuration file is generated by :doc:`bblock </dev-manual/bblock>` and
+contains the signatures locked by ``bblock``.
+
 .. _structure-build-downloads:
 
 ``build/downloads/``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b24286813eafaa562f4ebd070190f1e97e0cf23c..3d2d3f95695c98e583377ef5392fdfe7fa0ab28e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7901,6 +7901,9 @@ system and gives an overview of their function and contents.
      Then you can look at files in ``build/stamps/<arch>/bc`` and search for the
      file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
 
+     Alternatively, you can also use :doc:`bblock </dev-manual/bblock>` to
+     generate this line for you.
+
    :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
      Specifies the debug level of task signature check. 3 levels are supported:
 

-- 
2.47.0



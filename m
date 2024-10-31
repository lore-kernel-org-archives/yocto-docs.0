Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA8AD767EA
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17363.1730393794412022404
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=SO1XJ0+s;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so684991f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393793; x=1730998593; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2bmk2W1jR1mc81TNupqjZ2musUGBv8KQurM6E5a/8Y=;
        b=SO1XJ0+s5IErHly2z/IO5IY1PDilRQTvFEltAuo5gnIm0L5mSLt5/8VyYMQAeajyu+
         RxjkTWQ4BxSqAKzFC7zaLLItF2Uze7TY3+jMuhFPUV5uBJ+Rasf098NeMeUDsxxJ8jGE
         l33gHXNKl5K0ft6UfEkyspbTOTI+KiptRcSBxhpCRCMT/HXVRE1ZbRTA8IbLrI2NBNc6
         C+TjpCAtz0TpqNm9r8cdTOiL8ZviM8u425UP+3EKfGyiSDgukIdOEKWRr6XX3GRAs1g1
         f/z5WNOsUuCXuW48ahp/+5MO+jP24pLhbSjzpZqMWd0mLMLKls+xkBZGCfJm06Az/wLP
         srrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393793; x=1730998593;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2bmk2W1jR1mc81TNupqjZ2musUGBv8KQurM6E5a/8Y=;
        b=ro74rYIhcETeAPDthTR9xBADfUPL2SpquvCtNfp4ifDjpxysfnTotDFNZzUKFOBEeR
         sEl2NMDfyJnomRS2qsR9GBTfgvfGlgtow6YTfLs71mlnkT52V6U1/MmtFk6oaYEJEQCJ
         0Ben9VjEh4xLDuLxFJAlmwVsc9EYjz10Q9H6tqphY4Ayxth+XzBqqJjtRqErBGbpYxLy
         q4sDn+m4o7l1fRncyLBxM2o5xvc5TFcPN4e/+/jQdl9Wtv2WRXrOL9Erpf/SswhKX4WD
         ZPhps3eY5RvNQqRDBi07xlef70yAz4T3majoC5Ea+ZOX5wkMjUzHDawoC/6er4bLK/KF
         lk4g==
X-Gm-Message-State: AOJu0YxuDes1f1FigwbQn521DNDkszTWMmQlDuEzZHY8I9Q/2+AjrXga
	9BAwEQKQksoaq0z0jaxk/aAwQHgyB64MDqJauFd+W9XCfa7pIuG/e6o4KNXVoca73fLGcVil8Ps
	b0/0=
X-Google-Smtp-Source: AGHT+IEk/RSUJNaY3ZC3BZNgAMt0qP5ek73EsToSIm753lKDC2jZVi+KyJjXLMETVWsqc4CAHNdxfw==
X-Received: by 2002:adf:a2d2:0:b0:37d:4647:154e with SMTP id ffacd0b85a97d-380610f264fmr13788988f8f.9.1730393792707;
        Thu, 31 Oct 2024 09:56:32 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:31 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:56:20 +0100
Subject: [PATCH 5/5] dev-manual: add bblock documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-add-bblock-documentation-v1-5-32b89093bbda@baylibre.com>
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5641

bblock is a helper tool to lock/unlock tasks and recipes to specific
signatures. Add a documentation page for it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/dev-manual/bblock.rst | 129 ++++++++++++++++++++++++++++++++++++
 documentation/dev-manual/index.rst  |   1 +
 2 files changed, 130 insertions(+)

diff --git a/documentation/dev-manual/bblock.rst b/documentation/dev-manual/bblock.rst
new file mode 100644
index 0000000000000000000000000000000000000000..3df75799aa638d173764607df191bd99612034cf
--- /dev/null
+++ b/documentation/dev-manual/bblock.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Locking and Unlocking Recipes Using ``bblock``
+**********************************************
+
+By design, the OpenEmbedded build system builds everything from scratch
+unless BitBake determines that specific parts do not require rebuilding.
+At startup, it computes a signature for each tasks, based on the task's input.
+Then, it compares these signatures with the ones from sstate (if exist). Any
+changes cause the task to rerun.
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
+   on `understanding what changed <https://wiki.yoctoproject.org/wiki/TipsAndTricks/Understanding_what_changed_(diffsigs_etc)>`__.
+
+
+Locking tasks and recipes
+-------------------------
+
+To lock a recipe, use::
+
+   $ bblock recipe
+
+You can also use a space-separated list of recipes to lock many recipes::
+
+   $ bblock recipe1 recipe2
+
+Locking a recipe, means locking all tasks of the recipe. If you need to
+lock only particular tasks use the `-t` switch with a comma-separated
+list of tasks::
+
+  $ bblock -t task1,task2 recipe
+
+
+Unlocking tasks and recipes
+---------------------------
+
+To unlock a recipe, use::
+
+   $ bblock -r recipe
+
+You can also use a space-separated list of recipes to unlock many recipes::
+
+   $ bblock -r recipe1 recipe2
+
+Unlocking a recipe, means unlocking all tasks of the recipe. If you need to
+unlock only particular tasks use the `-t` switch with a comma-separated
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
+included by default in ``poky/meta/conf/bitbake.conf``.
+
+To dump it, use::
+
+  $ bblock -d
+
+
+Locking mechanism
+-----------------
+
+``bblock`` computes the signature(s) of the task(s) then uses the 3 following
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
+When working on ``python3`` recipe, we can lock ``pyton3-native`` with the
+following::
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

-- 
2.47.0



Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9EBC00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:24:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.14860.1690982642106840638
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 06:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L88qiu+1;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31765aee31bso6100601f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 06:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690982640; x=1691587440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojvjh4dFtbvFMc+hhQJJBMCVu08GY8Qe/TXT6WNZwI4=;
        b=L88qiu+1xTXzyXsaB34YaABKxMpN1eKqvOZAWZaXvBMfavWKDVCcQYDpZrbaGXGY0T
         kNT3nx43wwpkfk8fnEXKA84UCdpIOjvM3ODXPpKqzh21A616O5f5TwWZC28/yQV2wU5r
         gD2Y/2ZTohxtrp6d1C8tBHQKmBx4EFHFMdH29ZfMcAx1Aglat2T5wFG/Fb1g2tIp4v6G
         +PtpuknLR18H1zSVYCCjuW4KHiw6J2igVkZxNnQoNhOiRezF4BIFCNdDHdwl1hAPAbaG
         BxEZnNSCElGnqjQ3j30Bs1yfrT+eEG9EScokzLgl5DqfCWwTEXN6aP/piZ58fV6bL2Dp
         QNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690982640; x=1691587440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojvjh4dFtbvFMc+hhQJJBMCVu08GY8Qe/TXT6WNZwI4=;
        b=NYX5cD+X2q+TYPoFsC2L9IkhPtrEwv5U69cAgzTcv1kSxfrRvs1JMlBI0b6mjm6VGg
         LvGtxdvcliPzW8k7Wb6dM+I9RZACs5gsip1Ni+Jo0+IQqJUe1DRrTJljaNGbINLsSFhS
         mO/lzbS+DdlWsFnIQ81OmiD+c41tBHMM3l9CsFsHEtF0kivat6Y6JqeXHsALDMgIRh9u
         t+n8tzdaQyP2ZZuIZNJsyTAB47BrxrTiYbc7h9/FNUc48VNBhxEcZ/fTTEcKanB7EPyB
         VvnLmkgmOaBof8qGoi08/ikHCqNZUIvu3rP3xK6WTCm+AzZpvTBickLeZqPa9g1CFhOa
         f7sg==
X-Gm-Message-State: ABy/qLZxKAaKsTtKAqBUvZHqKcETUk7VjrK2JoHz5kuk2M2021mCX6ON
	nMaaexvcms6WAcJafW+ACBnTM0EgWgQ=
X-Google-Smtp-Source: APBJJlG7qQcD1HEW8rdbiJEbNc7YqYC4TRcpCFIyTBZL52PlNTSmHLmDRJpfATt9jPSlZPkijkjQ7w==
X-Received: by 2002:adf:fecd:0:b0:317:5d3d:d395 with SMTP id q13-20020adffecd000000b003175d3dd395mr4960163wrs.26.1690982639751;
        Wed, 02 Aug 2023 06:23:59 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:ab32:1451:bfe8:2a0f])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d6906000000b0031760af2331sm18829403wru.100.2023.08.02.06.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 06:23:59 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: docs@lists.yoctoproject.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [PATCH] ref-manual: classes.rst: suppress rust-hello-world reference and ptest-cargo class
Date: Wed,  2 Aug 2023 15:23:52 +0200
Message-Id: <20230802132352.95244-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Aug 2023 13:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4096

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 documentation/ref-manual/classes.rst | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index e555a80b5..950231f40 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -266,12 +266,15 @@ manager, allowing to fetch package dependencies and build your program.
 Using this class makes it very easy to build Rust programs. All you need
 is to use the :term:`SRC_URI` variable to point to a source repository
 which can be built by Cargo, typically one that was created by the
-``cargo new`` command, containing a ``Cargo.toml`` file and a ``src``
+``cargo new`` command, containing a ``Cargo.toml`` file, a ``Cargo.lock`` file and a ``src``
 subdirectory.
 
-You will find a simple example in the
-:oe_git:`rust-hello-world_git.bb </openembedded-core/tree/meta/recipes-extended/rust-example/rust-hello-world_git.bb>`
-recipe. A more complex example, with package dependencies, is the
+If you want to build and package tests of the program, replace :ref:`ref-classes-cargo`
+inheritance by :ref:`ref-classes-ptest-cargo` one.
+
+You will find an example (that show also how to handle possible git source dependencies) in the
+:oe_git:`zvariant_3.12.0.bb </openembedded-core/tree/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb>`
+recipe. Another example, with only crates dependencies, is the
 :oe_git:`uutils-coreutils </meta-openembedded/tree/meta-oe/recipes-core/uutils-coreutils>`
 recipe, which was generated by the `cargo-bitbake <https://crates.io/crates/cargo-bitbake>`__
 tool.
@@ -290,6 +293,15 @@ An exception is the "rust" recipe, to build the Rust compiler and runtime
 library, which is built by Cargo but cannot use the :ref:`ref-classes-cargo`
 class. This is why this class was introduced.
 
+.. _ref-classes-ptest-cargo:
+
+``ptest_cargo``
+===============
+
+The :ref:`ref-classes-ptest-cargo` class is a class which extend :ref:`ref-classes-cargo`
+and add a compile_ptest_cargo/install_ptest_cargo steps to respectively build and install
+test suites defined in ``Cargo.toml`` file in a dedicate -ptest package.
+
 .. _ref-classes-ccache:
 
 .. _ref-classes-cargo-update-recipe-crates:
-- 
2.34.1



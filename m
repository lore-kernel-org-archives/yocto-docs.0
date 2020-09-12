Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.25679.1599943849502463126
 for <docs@lists.yoctoproject.org>;
 Sat, 12 Sep 2020 13:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZcbICJcT;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id jw11so3355602pjb.0
        for <docs@lists.yoctoproject.org>; Sat, 12 Sep 2020 13:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=jRxM/95RMlhWYNNKl/5/FhVnDdVSkWtjt00tz9orkzM=;
        b=ZcbICJcTxuinGQlRvQJKvTQ6ZoHOtKzCxDUsS5hxSig2YsVt6e+bP0bIVaVzjXbgQq
         wbOOzIIaWZvsj6IZjlvCuigP11AFkjnxz/nfvVI6xZ6u55XiunvgP2KPvhe/qfScIWB0
         qhRRMHbirzPWA4Rq9sJiib9Bca1XdqbF/wN0bdaPTejozncI1RvQmrQyMpuG3UCMWs/p
         ylTiQa6uXW98M0//d9Xc0Z6Lf+b/M/MO6OhJbqOw4yTHGEExZPtuKijFbbdD7LiIlYFY
         Q96Oobxn3mN7AZByDgqFZjzAUYPBqpjitd8QtC1QUyAR9B0JIYmh1dwOYoYkF8htP6K5
         AHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=jRxM/95RMlhWYNNKl/5/FhVnDdVSkWtjt00tz9orkzM=;
        b=CO043GvfxCe2PELDTHd2L/K/EnDufC3GdqpUSsV72T5oHXNN6fqPR6iX1CkTbyLWDu
         4fbgxQGoIYZXaADLesmz/lADfaxFVqrrX9rzZak5ExKQspjPlxe0yB0oOclaMmWUgUAq
         a6IyMMVpqbZejjA0r1Pk1VhWTTgJEm8w8ftLsFDyOUJwhlyAN2L2LU8YBIaNsEGq6SD/
         qMTdEufquAv+UPh/HTBzhwmDsX7T/bf6H/kaVcxJ6WmPFKs/gM02goHq0DQ8k6KFYE16
         vfU/ghqH6AJ7mv4jAJSHiLFDwI64Rk6E5Q2sxsw9CEtYGzmF1VLT227nN9PSlrNUQYQn
         vKDQ==
X-Gm-Message-State: AOAM531JH6Jyv+L1Ub1iXIUAN4Fys/30yTZ7av7m7nWqX0DU+DRc9kGY
	zX5na1To0rLcPulMU3zk/CFVfptmjj0=
X-Google-Smtp-Source: ABdhPJxx2emOTCL+mKsc1kl/V0lUrZeN8xqvhaLbp9qA3suzAyaEw7hzYQ/G71CGPHd9K1GQQB37VA==
X-Received: by 2002:a17:902:ff12:: with SMTP id f18mr7506645plj.118.1599943848611;
        Sat, 12 Sep 2020 13:50:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1aa:69c3:1411:f726])
        by smtp.gmail.com with ESMTPSA id t15sm6080330pfl.175.2020.09.12.13.50.47
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 13:50:48 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [sphinx][PATCH] overview-manual: Clean up warnings for sphinx
Date: Sat, 12 Sep 2020 13:50:47 -0700
Message-Id: <20200912205047.21516-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../overview-manual/overview-manual-concepts.rst    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 7f8f735b3..c7a34f649 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -251,7 +251,7 @@ if versions do not already exist in the Build Directory at the time you
 source the build environment setup script.
 
 Because the Poky repository is fundamentally an aggregation of existing
-repositories, some users might be familiar with running the ```` script
+repositories, some users might be familiar with running the "script"
 in the context of separate
 :term:`OpenEmbedded-Core (OE-Core)` and BitBake
 repositories rather than a single Poky repository. This discussion
@@ -382,10 +382,10 @@ In general, three types of layer input exists. You can see them below
 the "User Configuration" box in the `general workflow
 figure <#general-workflow-figure>`__:
 
--  *Metadata (``.bb`` + Patches):* Software layers containing
+-  *Metadata (".bb" + Patches):* Software layers containing
    user-supplied recipe files, patches, and append files. A good example
    of a software layer might be the
-   ```meta-qt5`https://github.com/meta-qt5/meta-qt5 layer from
+   `meta-qt5`https://github.com/meta-qt5/meta-qt5 layer from
    the `OpenEmbedded Layer
    Index <http://layers.openembedded.org/layerindex/branch/master/layers/>`__.
    This layer is for version 5.0 of the popular
@@ -704,8 +704,7 @@ architecture are placed in ``build/tmp/deploy/ipk/qemux86``.
 
 .. _bitbake-dev-environment:
 
-BitBake
--------
+=, BitBake
 
 The OpenEmbedded build system uses
 :term:`BitBake` to produce images and
@@ -1143,9 +1142,9 @@ the extensible SDK (eSDK):
 
 Like image generation, the SDK script process consists of several stages
 and depends on many variables. The
-:ref:`ref-tasks-populate_sdk`
+`ref-tasks-populate_sdk`
 and
-:ref:`ref-tasks-populate_sdk_ext`
+`ref-tasks-populate_sdk_ext`
 tasks use these key variables to help create the list of packages to
 actually install. For information on the variables listed in the figure,
 see the "`Application Development SDK <#sdk-dev-environment>`__"
-- 
2.17.1


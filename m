Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB73C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:40:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.8650.1654767647995373871
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 02:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnHNFAhz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id e5so5313696wma.0
        for <docs@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gB7P4ud2TTTU/bM76SeRwKEnzXb7kEDCYAAF1Z+gAas=;
        b=RnHNFAhz/BpZAG5twZdNPUP2C+iEwN7pT9/Hm5kH0NhcT+AKa7Xk/EHvOtq5W9iOBS
         k5yjbC/SmVygcI0gMTb+kqJmxNmXHpfQCyCRzTFjE6m8fu8q3Z/yP5NLHEm9YOfb5ozD
         5XgAaTL59ysnk9f7mtbbWt84Su/uw7lXeMJTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gB7P4ud2TTTU/bM76SeRwKEnzXb7kEDCYAAF1Z+gAas=;
        b=SQLamF6Ejeqwb+K3F7grDCJiCwGQu6Ipvlc+KMU2o3KhLE/KesH8OzbP3GRBbb+upw
         bTCZauDlC4os+2IylKzLxZZPI8cqz3xUMOcXcIJtOqcnmnGeTzfh8+/LOtjvbRSDgRu3
         cbn+wxjuwdrOiLggwYxkhieLhuQtdZxhUKUT4U8OCLIgE6mFDOOQG3uqZTC1uK86co36
         7+A+s57wg20a7sDU8rlJ5U1d8g/xnaxjMZIyoawyWHsnHyTDveu1rvL7P+0epW6tSuVp
         JGJvH/5TGoY49yHH1fljIGfa6Cmzxoa0bkZebYZrWRH42RwTzwhqmDeLLb5ZKHNX/DeM
         x1UQ==
X-Gm-Message-State: AOAM530zBVeaPr4Cct5N//htfRwc+5dwR++8JO7FQ8gYf6CD8umvqMGS
	dlrBxXY6mNzOukR3bSAu2Em4sJUyBt3HpQ==
X-Google-Smtp-Source: 
 ABdhPJwlLVHjh5nBWhNgDy348aHlK6gMbWDB6tisHWjwtOmjf+5KAGKspxbKZxp0tK3QyLzmAbiluw==
X-Received: by 2002:a05:600c:3c90:b0:39c:1f14:d2ba with SMTP id
 bg16-20020a05600c3c9000b0039c1f14d2bamr2397349wmb.43.1654767645975;
        Thu, 09 Jun 2022 02:40:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 w16-20020adff9d0000000b002103de97455sm23405301wrr.69.2022.06.09.02.40.45
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 02:40:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref/dev-manual: Update multiconfig documentation
Date: Thu,  9 Jun 2022 10:40:44 +0100
Message-Id: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jun 2022 09:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2975

Multiconfigs now work from layers. Update the documentation to match this change.
Also fix a incorrect reference to different distros working within the same TMPDIR,
that is incorrect.

[YOCTO #13566]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/common-tasks.rst | 31 ++++++++++++-----------
 documentation/ref-manual/variables.rst    |  9 ++++---
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index ca6d59438..7d17f8d65 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -3704,7 +3704,7 @@ Setting Up and Running a Multiple Configuration Build
 
 To accomplish a multiple configuration build, you must define each
 target's configuration separately using a parallel configuration file in
-the :term:`Build Directory`, and you
+the :term:`Build Directory` or configuration directory within a layer, and you
 must follow a required file hierarchy. Additionally, you must enable the
 multiple configuration builds in your ``local.conf`` file.
 
@@ -3712,16 +3712,19 @@ Follow these steps to set up and execute multiple configuration builds:
 
 -  *Create Separate Configuration Files*: You need to create a single
    configuration file for each build target (each multiconfig).
-   Minimally, each configuration file must define the machine and the
-   temporary directory BitBake uses for the build. Suggested practice
-   dictates that you do not overlap the temporary directories used
-   during the builds. However, it is possible that you can share the
-   temporary directory
-   (:term:`TMPDIR`). For example,
-   consider a scenario with two different multiconfigs for the same
+   The configuration definitions are implmentation dependency but often
+   each configuration file will define the machine and the
+   temporary directory BitBake uses for the build. Whether the same
+   temporary directory (:term:`TMPDIR`) can be shared will depend on what is
+   similar and what is different between the configurations. Multiple MACHINE
+   targets can share the same (:term:`TMPDIR`) as long as the rest of the
+   configuration is the same, multiple DISTRO settings would need separate
+   (:term:`TMPDIR`) directories.
+
+   For example, consider a scenario with two different multiconfigs for the same
    :term:`MACHINE`: "qemux86" built
    for two distributions such as "poky" and "poky-lsb". In this case,
-   you might want to use the same :term:`TMPDIR`.
+   you would need to use the different :term:`TMPDIR`.
 
    Here is an example showing the minimal statements needed in a
    configuration file for a "qemux86" target whose temporary build
@@ -3732,18 +3735,16 @@ Follow these steps to set up and execute multiple configuration builds:
 
    The location for these multiconfig configuration files is specific.
    They must reside in the current build directory in a sub-directory of
-   ``conf`` named ``multiconfig``. Following is an example that defines
+   ``conf`` named ``multiconfig`` or within a layer's ``conf`` directory
+   under a directory named ``multiconfig``. Following is an example that defines
    two configuration files for the "x86" and "arm" multiconfigs:
 
    .. image:: figures/multiconfig_files.png
       :align: center
       :width: 50%
 
-   The reason for this required file hierarchy is because the :term:`BBPATH`
-   variable is not constructed until the layers are parsed.
-   Consequently, using the configuration file as a pre-configuration
-   file is not possible unless it is located in the current working
-   directory.
+   The usual :term:`BBPATH` search path is used to locate multiconfig files in
+   a similar way to other conf files.
 
 -  *Add the BitBake Multi-configuration Variable to the Local
    Configuration File*: Use the
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 367b4674e..76437d456 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -718,10 +718,11 @@ system and gives an overview of their function and contents.
 
          BBMULTICONFIG = "configA configB configC"
 
-      Each configuration file you
-      use must reside in the :term:`Build Directory`
-      ``conf/multiconfig`` directory (e.g.
-      ``build_directory/conf/multiconfig/configA.conf``).
+      Each configuration file you use must reside in a ``multiconfig``
+      subdirectory of a configuration directory within a layer, or
+      within the :term:`Build Directory` (e.g.
+      ``build_directory/conf/multiconfig/configA.conf`` or
+      ``mylayer/conf/multiconfig/configB.conf``).
 
       For information on how to use :term:`BBMULTICONFIG` in an environment
       that supports building targets with multiple configurations, see the
-- 
2.34.1



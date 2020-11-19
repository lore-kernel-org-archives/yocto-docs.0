Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6955.1605779940275744073
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nVdvmafd;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id 10so6561420wml.2
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aeq9uBs8U4/EpjAiiTEhDN5RMEYjtl2xsFbVBqnk8l8=;
        b=nVdvmafdNNGR8vmdWAZ4xs9ec+kG9jFA+aG4payPffT88QlyH1xOnSvZXGQkqDM5kX
         Fk1iuNZ9lE6qRy7P5Eor63Yq2eFqL8ucylVuFT2pygohB0WWmIYpTD0v+SaBYdIULEIM
         FUqqJgYWl8G4PkTQoUUZmCNpiKxsVMPPVXuR9ca6ufKx6+gcEzYVwt9i90k3BtAcNQ5l
         9EjqxPWqXxoq4Tem5KuBPqJaus92HURjNrl1buehlPCRJbHhtRZDzc84yq1ijbe9+oYr
         LU4I4ypSC/lj2Mt3tPqd39Yo1dQLi3PjFfh2+QlaX3Zjgakc2ZZT/ycdeWWqIRzKrSGg
         USpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aeq9uBs8U4/EpjAiiTEhDN5RMEYjtl2xsFbVBqnk8l8=;
        b=pdpb741Hs+rua0nhV41ejHYHrNQfIpAv7EwwiI0ukSb/EiGEm+D4Cm2PkmkuwMZIZI
         EDTQEEz7aDHtxJxfbBVtsHP0XH7DNCQHPVHequcRS3OqisEZPKDtJVcG5hNyeO3xnYgw
         JJ8L65iCH0y0FMpVRIxh9l3g8kLXmtARRv5vTMudlxclYQosGUAnGO3MsPwGMqpqpb02
         prqX07ZouP07ZoGDoRC9tfoSJ/snC0Eo6n/Akukzo+Sd1dvCnA7RNEXRYerCqeqLqfg+
         wtQNVfshkyLsmaVL46jDb2cnmcVifk34Qw6gG8OeKtvrUgMf2nz5873H+l1QHB2Y3b9A
         Xjrw==
X-Gm-Message-State: AOAM530Qj3tgwu9DE0XxJnh02AK2kBKLHn5TZsgUFmg8IxoRm1dfi4hn
	u8/y3CBUa6m0Pdk5bhZzL49Opc0ww/4PrcyF
X-Google-Smtp-Source: ABdhPJyAdk4oSsLWn82Nupvd/MX3GgErKwXSft5xHbG3VIS3++Hi5w7Ok68/4F7mN7iHWXR55psvGA==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr3665326wmj.77.1605779935260;
        Thu, 19 Nov 2020 01:58:55 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:54 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 06/11] test-manual: remove unused labels
Date: Thu, 19 Nov 2020 10:58:29 +0100
Message-Id: <20201119095834.284864-7-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
References: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../test-manual/test-manual-intro.rst         | 22 -------------------
 .../test-manual/test-manual-test-process.rst  |  2 --
 .../test-manual-understand-autobuilder.rst    | 20 -----------------
 3 files changed, 44 deletions(-)

diff --git a/documentation/test-manual/test-manual-intro.rst b/documentation/test-manual/test-manual-intro.rst
index 25b79f7a0..b6d130591 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -4,8 +4,6 @@
 The Yocto Project Test Environment Manual
 *****************************************
 
-.. _test-welcome:
-
 Welcome
 =======
 
@@ -45,8 +43,6 @@ engineers:
    Jenkins, or others. This repository has a branch per release of the
    project defining the tests to run on a per release basis.
 
-.. _test-yocto-project-autobuilder-overview:
-
 Yocto Project Autobuilder Overview
 ==================================
 
@@ -88,8 +84,6 @@ topology that includes a controller and a cluster of workers:
 .. image:: figures/ab-test-cluster.png
    :align: center
 
-.. _test-project-tests:
-
 Yocto Project Tests - Types of Testing Overview
 ===============================================
 
@@ -169,8 +163,6 @@ thefollowing types of tests:
    those new versions. If so, this target emails the maintainers with a
    patch to let them know this is possible.
 
-.. _test-test-mapping:
-
 How Tests Map to Areas of Code
 ==============================
 
@@ -326,8 +318,6 @@ directory at ``meta/lib/oeqa/selftest/cases`` directory.
 For oe-selftest. bitbake testcases reside in the ``lib/bb/tests/``
 directory.
 
-.. _bitbake-selftest-example:
-
 ``bitbake-selftest``
 --------------------
 
@@ -354,8 +344,6 @@ Bitbake selftests are straightforward python unittest. Refer to the
 Python unittest documentation for additional information on writing
 these tests at: https://docs.python.org/3/library/unittest.html.
 
-.. _oe-selftest-example:
-
 ``oe-selftest``
 ---------------
 
@@ -399,8 +387,6 @@ builds. There is no data store available for these tests since the tests
 launch the ``bitbake`` command and exist outside of its context. As a
 result, common bitbake library functions (bb.\*) are also unavailable.
 
-.. _testimage-example:
-
 ``testimage``
 -------------
 
@@ -429,8 +415,6 @@ To ensure certain test or package dependencies are met, you can use the
 in this example would only make sense if python3-core is installed in
 the image.
 
-.. _testsdk_ext-example:
-
 ``testsdk_ext``
 ---------------
 
@@ -463,8 +447,6 @@ In this example, the ``devtool``
 command is tested to see whether a sample application can be built with
 the ``devtool build`` command within the eSDK.
 
-.. _testsdk-example:
-
 ``testsdk``
 -----------
 
@@ -488,8 +470,6 @@ In this example, if nativesdk-python3-core has been installed into the SDK, the
 the python3 interpreter with a basic command to check it is working
 correctly. The test would only run if python3 is installed in the SDK.
 
-.. _oe-build-perf-test-example:
-
 ``oe-build-perf-test``
 ----------------------
 
@@ -517,8 +497,6 @@ This example shows how three specific parsing timings are
 measured, with and without various caches, to show how BitBake's parsing
 performance trends over time.
 
-.. _test-writing-considerations:
-
 Considerations When Writing Tests
 =================================
 
diff --git a/documentation/test-manual/test-manual-test-process.rst b/documentation/test-manual/test-manual-test-process.rst
index b0817b091..82b9bb441 100644
--- a/documentation/test-manual/test-manual-test-process.rst
+++ b/documentation/test-manual/test-manual-test-process.rst
@@ -4,8 +4,6 @@
 Project Testing and Release Process
 ***********************************
 
-.. _test-daily-devel:
-
 Day to Day Development
 ======================
 
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index 244433376..698a266ee 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -73,8 +73,6 @@ The ``config.json`` file is processed by the scripts in the Helper
 repository in the ``scripts`` directory. The following section details
 how this works.
 
-.. _test-autobuilder-target-exec-overview:
-
 Autobuilder Target Execution Overview
 =====================================
 
@@ -135,16 +133,12 @@ roughly consist of:
    This is another call into the Helper scripts where its expected that
    the main functionality of this target will be executed.
 
-.. _test-autobuilder-tech:
-
 Autobuilder Technology
 ======================
 
 The Autobuilder has Yocto Project-specific functionality to allow builds
 to operate with increased efficiency and speed.
 
-.. _test-clobberdir:
-
 clobberdir
 ----------
 
@@ -155,8 +149,6 @@ which is run under ``ionice -c 3``. For example, the deletion only
 happens when there is idle IO capacity on the Worker. The Autobuilder
 Worker Janitor runs this deletion. See :ref:`test-manual/test-manual-understand-autobuilder:Autobuilder Worker Janitor`.
 
-.. _test-autobuilder-clone-cache:
-
 Autobuilder Clone Cache
 -----------------------
 
@@ -167,8 +159,6 @@ during clones first, then "topped up" with later revisions from any
 upstream when necessary. The cache is maintained by the Autobuilder
 Worker Janitor. See :ref:`test-manual/test-manual-understand-autobuilder:Autobuilder Worker Janitor`.
 
-.. _test-autobuilder-worker-janitor:
-
 Autobuilder Worker Janitor
 --------------------------
 
@@ -177,8 +167,6 @@ operations, including background file deletion at IO idle (see :ref:`test-manual
 maintainenance of a cache of cloned repositories to improve the speed
 the system can checkout repositories.
 
-.. _test-shared-dl-dir:
-
 Shared DL_DIR
 -------------
 
@@ -187,8 +175,6 @@ between them. This reduces network accesses from the system and allows
 the build to be sped up. Usage of the directory within the build system
 is designed to be able to be shared over NFS.
 
-.. _test-shared-sstate-cache:
-
 Shared SSTATE_DIR
 -----------------
 
@@ -197,8 +183,6 @@ directory to be shared between them. This means once a Worker has built
 an artifact, all the others can benefit from it. Usage of the directory
 within the directory is designed for sharing over NFS.
 
-.. _test-resulttool:
-
 Resulttool
 ----------
 
@@ -213,8 +197,6 @@ reports of the test results and compare different result files.
 
 For details, see :yocto_wiki:`/wiki/Resulttool`.
 
-.. _test-run-config-tgt-execution:
-
 run-config Target Execution
 ===========================
 
@@ -264,8 +246,6 @@ of post-build steps, including:
    :ref:`test-manual/test-manual-understand-autobuilder:clobberdir` if the build was successful,
    else rename it to "build-renamed" for potential future debugging.
 
-.. _test-deploying-yp-autobuilder:
-
 Deploying Yocto Autobuilder
 ===========================
 
-- 
2.29.2


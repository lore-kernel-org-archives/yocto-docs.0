Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44118C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 15:49:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.222339.1704037757461326192
 for <docs@lists.yoctoproject.org>;
 Sun, 31 Dec 2023 07:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PMJHft53;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7c76897dso5149458e87.2
        for <docs@lists.yoctoproject.org>; Sun, 31 Dec 2023 07:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704037755; x=1704642555; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LHw1qL2oUt6Xcfp6JmMcUAVWnht4T5ZmoNESrLCAcrI=;
        b=PMJHft53na9bywpmLuhFpWBNMpTuZoyikc137VBu91dWzrrf+faVR/8d3gmiOAU/SG
         Qu5me8myTi0hr/hQh/n7d132zFpa2Nykz6gi0WBOc+9dGSc+ll7NII/ZocVdOydfrmkj
         pzHlDrneg7gk+uBQxvQQmUcZK5azLIOFGvDKJv7PiaHiHWS0SszU1nFRRPwnCurc8gKo
         xN7NFPPbSApEEDirh6G22J+eFVc5cVTMmDr5aCh3cOqi/VxZ08sPLdbb7an7qF+WDKGl
         C8ddqL+cO8Z7cJ2nEBASG/FgyVS9CitCrN5k4UmK1NlAZ9leYJt1Jf8BcuB0TVgLFjGD
         LVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704037755; x=1704642555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHw1qL2oUt6Xcfp6JmMcUAVWnht4T5ZmoNESrLCAcrI=;
        b=JBhMPjXa0UbaT60F+xX71aitEXY1OhvUKvJgM6qc/lCoM+HAfHHMCFbOFj+OQDwh4l
         oKpYEQys1AaP4cie8TWtnkkXpAfq8ZCqcDKbclmd/4aIfTS+eeuHMs5BdTVXd6+vngQn
         NRN4qZHT7ByuzKRYYPscvXsXgLYCUlp6QwclLMEezjzjhsfxa6BFSO7MBQyqmSWX+wI1
         pgtphFeDsMOSL7+/7HXO2693A7r57RB0v/awC7tQm3KqvHhEIkHwu4X7ZkR4kJy/xxTm
         FpG/5qD5CSUMPCGO49pRXBodG8YWqmUsMARoQg9juQydaUzmdKwM1/zAECKYQjNeE8lh
         HXpw==
X-Gm-Message-State: AOJu0Yy6cDEu9Dr57xlTcSam0Eq7vuwy8jazGLYHakfIFM8fiTizcjg7
	i3bZILmnxy9ey1LFAKzygGfAvGBp4Zs=
X-Google-Smtp-Source: AGHT+IFni31o/8kLoBq+LdkCz73w+lOabqSrdsbylRxra1uK+zKfjAP0QtYItATLtyxu/DfYJP4uxQ==
X-Received: by 2002:a05:6512:400d:b0:50e:62b7:153b with SMTP id br13-20020a056512400d00b0050e62b7153bmr3872385lfb.184.1704037754975;
        Sun, 31 Dec 2023 07:49:14 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906a29300b00a26988c8772sm10143619ejz.214.2023.12.31.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 07:49:14 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual: document cmake-qemu class
Date: Sun, 31 Dec 2023 16:48:43 +0100
Message-ID: <20231231154843.1418654-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 31 Dec 2023 15:49:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4740

(From yocto-docs rev: d7c05e4eed4ed436f2ce961df46f9654af83ffec)

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/classes.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a8afe9f2dcb..c9bc0f08c6c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -377,6 +377,33 @@ If you need to install custom CMake toolchain files supplied by the application
 being built, you should install them (during :ref:`ref-tasks-install`) to the
 preferred CMake Module directory: ``${D}${datadir}/cmake/modules/``.
 
+.. _ref-classes-cmake-qemu:
+
+``cmake-qemu``
+==============
+
+The :ref:`ref-classes-cmake-qemu` class might be used instead of the
+:ref:`ref-classes-cmake` class. In addition to the features provided by the
+:ref:`ref-classes-cmake` class the :ref:`ref-classes-cmake-qemu` class passes
+the ``CMAKE_CROSSCOMPILING_EMULATOR`` setting to ``cmake``. This allows to use
+qemu-usermode for the execution of cross-compiled binaries on the host machine.
+For more information about ``CMAKE_CROSSCOMPILING_EMULATOR`` please refer to
+the `related section of the CMake documentation <https://cmake.org/cmake/help/latest/variable/CMAKE_CROSSCOMPILING_EMULATOR.html>`__.
+
+Not all platforms are supported by Qemu. This class only works for machines with
+the ``qemu-usermode`` in the :ref:`ref-features-machine`. Using qemu-usermode therefore
+involves a certain risk, which is also the reason why this feature is not part of
+the main cmake class by default.
+
+One use case is the execution of cross-compiled unit tests with CTest on the build
+machine. If ``CMAKE_CROSSCOMPILING_EMULATOR`` is configured::
+
+   cmake --build --target test
+
+works transparently with qemu-usermode.
+If the CMake project is developed with this use case in mind this works very nicely
+also out of an IDE configured to use cmake-native for cross compiling.
+
 .. _ref-classes-cml1:
 
 ``cml1``
-- 
2.43.0



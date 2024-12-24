Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C8AE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 22:16:46 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.42144.1735078596392609146
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 14:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xfgJtgyh;
 spf=pass (domain: linaro.org, ip: 209.85.221.175, mailfrom: javier.tia@linaro.org)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5162571e761so1691060e0c.2
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735078595; x=1735683395; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbGQhRm5iFAmQ382XZFzAAahskpIU/SILgqF0v+9Z6I=;
        b=xfgJtgyh+ZsMwH9Y3pDw5eRNQ1XS/mlDe1+3jEijTSEkYXyI/XUbxDOjByTaSmrTA5
         RFJ2GhZqusr9RDezglLaPyIhrvSWekrm4zCsXJHBTMDY2I4n6U1xDOxNr/NAoZ8B18Oc
         g44LvzzrMGFz++Ad/FMiA6yr68bqH/L9N3MD3Wnnxd80ooH2um/IbWGn22vKQS24GdSa
         4D6peRPnLtRdSMog8ia29HZeeBgWV5iAXubBL48pmcszd+aKOlNFgLvcVK6TD6MWLmpl
         SLRvh8l1G4xHdVPIkLuMiP3Q3XfGDpkpjlwsdkOAM0zJQrrxn0DSG/O/VDXNz2m47U+r
         B0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735078595; x=1735683395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbGQhRm5iFAmQ382XZFzAAahskpIU/SILgqF0v+9Z6I=;
        b=CGnNBtfaucKW5UPlVw/J7F12Qxp2Sbkhn/UbDRvlskeKd6a/rFeJW4aVjXhGZrGqSW
         ntqRVhnDBdB16XqjqUyu3HDzqfHD3lNbeccSgzTBXkeXv9HRXJ5IpYCjL4d6fDJGfasK
         mvUJbqnsf+JFp2Faw3unUkrLp26H10Qpr1cJUMktIyu+N8fx6GwgoUF6tcoseiXKR7Je
         nXzd65MdlTefW4MjvV1Zz8XAxHFGvGZKHICsqfeh31kbLpC450LSmtTUQVOSrOaTgyDf
         sKNOz/Uy+c6L3CrPvug8bZvXZvOBxHqTGBWa1dcJZOMVcwYCxcwxmlB6RbrbVwRdkG/z
         IVXQ==
X-Gm-Message-State: AOJu0Yxlg4G36W7qndvka/JbCGZMMihuoPYcgiCiFCvUvXJRVsdxiJQb
	QG2aNP5DDLJN3RJulRQG3Jpl0qeUgCM3a38J2oXZUKQxfIRW0Vg8i5n/yJPrwSR+VecvY6MB0JX
	z
X-Gm-Gg: ASbGncs4ZTxVK58y/GpmqprFOUy6ZiPhssn/twn4NWo/HlPEc1IbnVFvObV42aE+rXo
	E5Yp8L04ssQdEFaNirqwOtk8FJBbefZmnC2/yfcoIBiZtbX8HqkOHffRhXqsKeZ7STPbBBo+FTm
	CwHnZvZeEf8RTx0ByjVS+NLt14p0u56Lr+WtStt8qXBPJbja2YC9OTySx4od2slU56Q6/RiRN0M
	BEn0p2Uy1s6xDYBqH+BD5xICvbOS3lgm5XOp3oOwoKnuclL4FBGNSaxLyXfS0n2l4yXLL0tHjQS
	NCefcseMaZc=
X-Google-Smtp-Source: AGHT+IFOQxxI1tjDJj8JBu5LdoZcIfOIbSBN2d+p0Qv0WfbXJ89oWRarSkjt+V7Koo/WK5W46LAixg==
X-Received: by 2002:a05:6122:198f:b0:509:e7d:b7b2 with SMTP id 71dfb90a1353d-51b75c42df5mr16270199e0c.2.1735078595115;
        Tue, 24 Dec 2024 14:16:35 -0800 (PST)
Received: from localhost.localdomain ([170.246.157.153])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bad5c5sm1278103e0c.13.2024.12.24.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 14:16:34 -0800 (PST)
From: Javier Tia <javier.tia@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH] Set max supported Python version
Date: Tue, 24 Dec 2024 16:16:25 -0600
Message-ID: <20241224221625.4092917-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 22:16:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6025

When Bitbake is used with Python 3.13, it generates numerous build
issues that do not occur with Python 3.12. The documentation is clear
for the supported Linux distributions, but not for the supported Python
versions.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 documentation/brief-yoctoprojectqs/index.rst     | 2 +-
 documentation/dev-manual/start.rst               | 6 +++---
 documentation/poky.yaml.in                       | 1 +
 documentation/ref-manual/system-requirements.rst | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 3d249eefa..ed40f93d2 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -61,7 +61,7 @@ following requirements:
 
    -  Git &MIN_GIT_VERSION; or greater
    -  tar &MIN_TAR_VERSION; or greater
-   -  Python &MIN_PYTHON_VERSION; or greater.
+   -  Python &MIN_PYTHON_VERSION; - &MAX_PYTHON_VERSION;
    -  gcc &MIN_GCC_VERSION; or greater.
    -  GNU make &MIN_MAKE_VERSION; or greater
 
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 05827610b..877d51f1b 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -304,7 +304,7 @@ Project Build Host:
 
    -  tar &MIN_TAR_VERSION; or greater
 
-   -  Python &MIN_PYTHON_VERSION; or greater.
+   -  Python &MIN_PYTHON_VERSION; - &MAX_PYTHON_VERSION;
 
    -  gcc &MIN_GCC_VERSION; or greater.
 
@@ -860,7 +860,7 @@ Initializing the Build Environment
 Before you can use Yocto you need to setup the build environment.
 From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
 setup script to define Yocto Project's build environment on your build host::
-    
-    $ source oe-init-build-env 
+
+    $ source oe-init-build-env
 
 Note, that this step will have to be repeated every time you open a new shell.
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 0933cbbd3..7532d8138 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -15,6 +15,7 @@ YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.8.0"
+MAX_PYTHON_VERSION : "3.12.z"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
 MIN_GCC_VERSION : "8.0"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b087d374d..1f5918e89 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -290,7 +290,7 @@ the following version requirements for Git, tar, and Python:
 
 -  tar &MIN_TAR_VERSION; or greater
 
--  Python &MIN_PYTHON_VERSION; or greater
+-  Python &MIN_PYTHON_VERSION; - &MAX_PYTHON_VERSION;
 
 -  GNU make &MIN_MAKE_VERSION; or greater
 
-- 
2.47.1



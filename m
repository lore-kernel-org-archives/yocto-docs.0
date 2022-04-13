Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2E9C47082
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.1697.1649872414257802110
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 10:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q1xAIbQU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i20so3684615wrb.13
        for <docs@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPWK76BS2Ngwj54IrJ9VFf2HziMD1lpyuZwuHovpV4s=;
        b=Q1xAIbQU0trU1Opw3fMvcJao7k8N8C005sr8HBo6TpI9wJVlHZAA8+4tqpulOcoxWo
         9Ly81SuAJv+g3pg6CkyA27a8nDKKN7ku1fUfuPbl3uStGURYl4pDPa37qES8lZwkPHEL
         fbTwAoE8HoX49J5AW38tCKfOTzZeeQAXLkOkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPWK76BS2Ngwj54IrJ9VFf2HziMD1lpyuZwuHovpV4s=;
        b=AfE3+UIfMFkwIUL5/3BEsIUdzrtSVVU9JUq23PfD7cb7WbwNqyStee9LJABUElooC6
         0E0+QeFP79lCXHZXGF5TXCbzoaUpSX/JDpDO7Px/TzRzuIvQjkmgPa/ey48ZTRGiZmRk
         v7TOzw3ZEyoYyHoKOGZgFF/WmkkqdFV6gxybB+tJP1vkB3+I6uQATlECWbu+y+8VT1ah
         T/QrgIoDaKDJn4hqbUMrUidzQ+Dq/ixN9iwseOFJanf4v+RFk4P+EvCOTsrtFl+LNyWb
         TNYJHT93cqHbgDGiE8ez1tfPqWRLUUBTg6NMzTRqoxIHLMlI1eiSG421Y0Nin2oEfKf6
         urcA==
X-Gm-Message-State: AOAM5301F9HICZ5yN4LaAEljLGJlyBUl7CTubRSPuxZuNP/UhzKL1UyA
	17kQHK7gYLSvkDqehDVHlMJKoHRc+24LgA==
X-Google-Smtp-Source: 
 ABdhPJyTLnhqm7SGvKgzMokkaH2ly2S3gTyYyfdBZEP/TfeBEuZuR7jAxPcwiur01bpFY3k1KUEdNw==
X-Received: by 2002:a5d:47a1:0:b0:204:9a7:22cd with SMTP id
 1-20020a5d47a1000000b0020409a722cdmr69015wrb.186.1649872412072;
        Wed, 13 Apr 2022 10:53:32 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a5d4529000000b00207a5b7f613sm8938394wra.69.2022.04.13.10.53.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:53:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH][transition] transition: Update urls to
 https://docs.yoctoproject.org/
Date: Wed, 13 Apr 2022 18:53:30 +0100
Message-Id: <20220413175330.2187450-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2764

We now use docs.yoctoproject.org so update the urls to point there
instead of at a redirect.

grep https://www.yoctoproject.org/docs/ * -lrZ | xargs -0 -l sed -i -e 's#https://www.yoctoproject.org/docs/#https://docs.yoctoproject.org/#g'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/transition/index-0.9.rst   |  4 ++--
 documentation/transition/index-1.0.1.rst | 10 +++++-----
 documentation/transition/index-1.0.rst   | 10 +++++-----
 documentation/transition/index-1.1.rst   | 12 ++++++------
 documentation/transition/index-1.3.rst   | 14 +++++++-------
 documentation/transition/index-1.4.rst   | 16 ++++++++--------
 documentation/transition/index-1.6.rst   | 18 +++++++++---------
 documentation/transition/index-1.8.rst   | 20 ++++++++++----------
 documentation/transition/index-2.1.rst   | 20 ++++++++++----------
 documentation/transition/index-2.5.rst   | 22 +++++++++++-----------
 10 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/documentation/transition/index-0.9.rst b/documentation/transition/index-0.9.rst
index 5a107e480..a58b0748c 100644
--- a/documentation/transition/index-0.9.rst
+++ b/documentation/transition/index-0.9.rst
@@ -9,11 +9,11 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-quick-start/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-quick-start/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/poky-ref-manual/poky-ref-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/poky-ref-manual/poky-ref-manual.html>
 
diff --git a/documentation/transition/index-1.0.1.rst b/documentation/transition/index-1.0.1.rst
index f21ed1511..bd5882ed5 100644
--- a/documentation/transition/index-1.0.1.rst
+++ b/documentation/transition/index-1.0.1.rst
@@ -9,14 +9,14 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/poky-ref-manual/poky-ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/poky-ref-manual/poky-ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
 
diff --git a/documentation/transition/index-1.0.rst b/documentation/transition/index-1.0.rst
index 99dfae6b5..a94388d55 100644
--- a/documentation/transition/index-1.0.rst
+++ b/documentation/transition/index-1.0.rst
@@ -9,14 +9,14 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-quick-start/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-quick-start/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/poky-ref-manual/poky-ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/poky-ref-manual/poky-ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
 
diff --git a/documentation/transition/index-1.1.rst b/documentation/transition/index-1.1.rst
index 730343628..4b5cd62e7 100644
--- a/documentation/transition/index-1.1.rst
+++ b/documentation/transition/index-1.1.rst
@@ -9,15 +9,15 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/poky-ref-manual/poky-ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/poky-ref-manual/poky-ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
 
diff --git a/documentation/transition/index-1.3.rst b/documentation/transition/index-1.3.rst
index 36b6ff2ab..7c9afa178 100644
--- a/documentation/transition/index-1.3.rst
+++ b/documentation/transition/index-1.3.rst
@@ -9,21 +9,21 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/poky-ref-manual/poky-ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/poky-ref-manual/poky-ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
diff --git a/documentation/transition/index-1.4.rst b/documentation/transition/index-1.4.rst
index 00680dbb8..9176ed2d7 100644
--- a/documentation/transition/index-1.4.rst
+++ b/documentation/transition/index-1.4.rst
@@ -9,22 +9,22 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/ref-manual/ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Profile and Tracing Manual <https://www.yoctoproject.org/docs/@VER@/profile-manual/profile-manual.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/ref-manual/ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Profile and Tracing Manual <https://docs.yoctoproject.org/@VER@/profile-manual/profile-manual.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
diff --git a/documentation/transition/index-1.6.rst b/documentation/transition/index-1.6.rst
index a93f25f42..020d60659 100644
--- a/documentation/transition/index-1.6.rst
+++ b/documentation/transition/index-1.6.rst
@@ -9,23 +9,23 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/ref-manual/ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Profile and Tracing Manual <https://www.yoctoproject.org/docs/@VER@/profile-manual/profile-manual.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
-   Bitbake User Manual <https://www.yoctoproject.org/docs/@VER@/bitbake-user-manual/bitbake-user-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/ref-manual/ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Profile and Tracing Manual <https://docs.yoctoproject.org/@VER@/profile-manual/profile-manual.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
+   Bitbake User Manual <https://docs.yoctoproject.org/@VER@/bitbake-user-manual/bitbake-user-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
diff --git a/documentation/transition/index-1.8.rst b/documentation/transition/index-1.8.rst
index 703374cfc..52e771b4b 100644
--- a/documentation/transition/index-1.8.rst
+++ b/documentation/transition/index-1.8.rst
@@ -9,24 +9,24 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/ref-manual/ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Profile and Tracing Manual <https://www.yoctoproject.org/docs/@VER@/profile-manual/profile-manual.html>
-   Application Development Toolkit <https://www.yoctoproject.org/docs/@VER@/adt-manual/adt-manual.html>
-   Toaster Manual <https://www.yoctoproject.org/docs/@VER@/toaster-manual/toaster-manual.html>
-   Bitbake User Manual <https://www.yoctoproject.org/docs/@VER@/bitbake-user-manual/bitbake-user-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/ref-manual/ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Profile and Tracing Manual <https://docs.yoctoproject.org/@VER@/profile-manual/profile-manual.html>
+   Application Development Toolkit <https://docs.yoctoproject.org/@VER@/adt-manual/adt-manual.html>
+   Toaster Manual <https://docs.yoctoproject.org/@VER@/toaster-manual/toaster-manual.html>
+   Bitbake User Manual <https://docs.yoctoproject.org/@VER@/bitbake-user-manual/bitbake-user-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
diff --git a/documentation/transition/index-2.1.rst b/documentation/transition/index-2.1.rst
index 67460aa5f..e594455ef 100644
--- a/documentation/transition/index-2.1.rst
+++ b/documentation/transition/index-2.1.rst
@@ -9,24 +9,24 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Start Guide <https://www.yoctoproject.org/docs/@VER@/yocto-project-qs/yocto-project-qs.html>
+   Quick Start Guide <https://docs.yoctoproject.org/@VER@/yocto-project-qs/yocto-project-qs.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/ref-manual/ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Profile and Tracing Manual <https://www.yoctoproject.org/docs/@VER@/profile-manual/profile-manual.html>
-   Application Development and the Extensible SDK (eSDK) <https://www.yoctoproject.org/docs/@VER@/sdk-manual/sdk-manual.html>
-   Toaster Manual <https://www.yoctoproject.org/docs/@VER@/toaster-manual/toaster-manual.html>
-   Bitbake User Manual <https://www.yoctoproject.org/docs/@VER@/bitbake-user-manual/bitbake-user-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/ref-manual/ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Profile and Tracing Manual <https://docs.yoctoproject.org/@VER@/profile-manual/profile-manual.html>
+   Application Development and the Extensible SDK (eSDK) <https://docs.yoctoproject.org/@VER@/sdk-manual/sdk-manual.html>
+   Toaster Manual <https://docs.yoctoproject.org/@VER@/toaster-manual/toaster-manual.html>
+   Bitbake User Manual <https://docs.yoctoproject.org/@VER@/bitbake-user-manual/bitbake-user-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
diff --git a/documentation/transition/index-2.5.rst b/documentation/transition/index-2.5.rst
index 316545a9c..c38a5b485 100644
--- a/documentation/transition/index-2.5.rst
+++ b/documentation/transition/index-2.5.rst
@@ -9,25 +9,25 @@ Yocto Project @VER@ Documentation
    :maxdepth: 1
    :caption: Introduction and Overview
 
-   Quick Build <https://www.yoctoproject.org/docs/@VER@/brief-yoctoprojectqs/brief-yoctoprojectqs.html>
-   Overview and Concepts <https://www.yoctoproject.org/docs/@VER@/overview-manual/overview-manual.html>
+   Quick Build <https://docs.yoctoproject.org/@VER@/brief-yoctoprojectqs/brief-yoctoprojectqs.html>
+   Overview and Concepts <https://docs.yoctoproject.org/@VER@/overview-manual/overview-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: Manuals
 
-   Reference Manual <https://www.yoctoproject.org/docs/@VER@/ref-manual/ref-manual.html>
-   Board Support Package (BSP) Developer's guide <https://www.yoctoproject.org/docs/@VER@/bsp-guide/bsp-guide.html>
-   Development Tasks Manual <https://www.yoctoproject.org/docs/@VER@/dev-manual/dev-manual.html>
-   Linux Kernel Development Manual <https://www.yoctoproject.org/docs/@VER@/kernel-dev/kernel-dev.html>
-   Profile and Tracing Manual <https://www.yoctoproject.org/docs/@VER@/profile-manual/profile-manual.html>
-   Application Development and the Extensible SDK (eSDK) <https://www.yoctoproject.org/docs/@VER@/sdk-manual/sdk-manual.html>
-   Toaster Manual <https://www.yoctoproject.org/docs/@VER@/toaster-manual/toaster-manual.html>
-   Bitbake User Manual <https://www.yoctoproject.org/docs/@VER@/bitbake-user-manual/bitbake-user-manual.html>
+   Reference Manual <https://docs.yoctoproject.org/@VER@/ref-manual/ref-manual.html>
+   Board Support Package (BSP) Developer's guide <https://docs.yoctoproject.org/@VER@/bsp-guide/bsp-guide.html>
+   Development Tasks Manual <https://docs.yoctoproject.org/@VER@/dev-manual/dev-manual.html>
+   Linux Kernel Development Manual <https://docs.yoctoproject.org/@VER@/kernel-dev/kernel-dev.html>
+   Profile and Tracing Manual <https://docs.yoctoproject.org/@VER@/profile-manual/profile-manual.html>
+   Application Development and the Extensible SDK (eSDK) <https://docs.yoctoproject.org/@VER@/sdk-manual/sdk-manual.html>
+   Toaster Manual <https://docs.yoctoproject.org/@VER@/toaster-manual/toaster-manual.html>
+   Bitbake User Manual <https://docs.yoctoproject.org/@VER@/bitbake-user-manual/bitbake-user-manual.html>
 
 .. toctree::
    :maxdepth: 1
    :caption: 'Mega' Manual
 
-   All-in-one 'Mega' Manual <https://www.yoctoproject.org/docs/@VER@/mega-manual/mega-manual.html>
+   All-in-one 'Mega' Manual <https://docs.yoctoproject.org/@VER@/mega-manual/mega-manual.html>
 
-- 
2.32.0



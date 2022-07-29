Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C79C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:26:54 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.8556.1659104810649248642
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 07:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dv4UJ6uJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so7187952pjz.1
        for <docs@lists.yoctoproject.org>;
 Fri, 29 Jul 2022 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jw9ORTQmHQ6Wnv298gKicE2H/qW5xpAagOrekhPSpBI=;
        b=Dv4UJ6uJgU0ESL81eH+3e/gs2KwfBi82j1kqouY1apwddXpZ8ECM+pURUq5FcrBVmT
         3mIew8BwHm0DGqLcFvkskKgo2TIhDQ/WiyjcfP8j4y2FV8mPBGC/9Yk1w7she07rsDOt
         VUDKKuqpMXGrTsu/0sFguDdWITA3O7pW6Qww7tSmFxtiMvbUTZz/NWCoB9oEYG5fK6yQ
         5/kuwVp+gQDiXXpTXx2ztvnE23evcapO5QyHP8SHNLZkVTFWGG6dPCHWgS4P7SzvEdwT
         wGBxWcln5sYd9Kn/gxhEQons7+eaNFdfbfBkMbSt7nf3jhtZnCFWnw61yfDdrbtkG/Bx
         0i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jw9ORTQmHQ6Wnv298gKicE2H/qW5xpAagOrekhPSpBI=;
        b=gZ1z+HLJlNZxTtb6EtwbnT/Atr2r8kxtHMtZhB7RXynG+xeulVdcHGWlO2Uv8IXwG7
         Bai9ZH6rmMgtRbVnvqpzXntY4syh6Va2lw1sjGI0RLHEu4Z6pPvP3piXmYmYYgFQ9Dwi
         d+pStcvhvjaSNRv0lfx3SpQ9f68cvQCAaNvvlON9I8gWInB3TZoyn7KkRyp97Tr1iONb
         Y7+xKYsXaqbz8peTOsJM1nJPxIbVrFcVFx/t5IFkLGCfzAlum20ShRbuSB/zsYtpS1jk
         5cnhWyV24KAhbCDxeATQryKHA7qCIgFksN4oenYZw+KSTf7ds+7I88+uPmqT3gyDWBh8
         VXNQ==
X-Gm-Message-State: ACgBeo2U2dWfD4tkGZq9+N3zGxt4wEbRe2pXuN4E1TeFrmpacjfKNj2G
	sifC/648AWyVMNKC621nODjdELS8F2k=
X-Google-Smtp-Source: 
 AA6agR7pMKU9S/y0PDEvwTjcXhdMbyPosr5Nt08JED/iaxFdwN18l6Z0wWEzuIhoez2Wis8PbpipiQ==
X-Received: by 2002:a17:902:c405:b0:16d:762d:8885 with SMTP id
 k5-20020a170902c40500b0016d762d8885mr4157684plk.115.1659104809415;
        Fri, 29 Jul 2022 07:26:49 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a170902e74600b0016d02acb57fsm3639260plf.217.2022.07.29.07.26.48
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:26:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] system-requirements.rst: remove EOL and Centos7 hosts
Date: Fri, 29 Jul 2022 07:24:47 -0700
Message-Id: <20220729142447.100641-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Jul 2022 14:26:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3092

Commit https://git.yoctoproject.org/poky/commit/?id=d08e47312741a18e7be505d22762b90528253ac9
removed some EOL and CentOS7 from list hos supported hosts. Sync docs with Poky
Replace CentOS with AlmaLinux.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ref-manual/system-requirements.rst        | 37 +------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 6cf88f2a9..614f25c21 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -45,14 +45,8 @@ distributions:
 
 -  Fedora 35
 
--  CentOS 7.x
-
--  CentOS 8.x
-
 -  AlmaLinux 8.5
 
--  Debian GNU/Linux 9.x (Stretch)
-
 -  Debian GNU/Linux 10.x (Buster)
 
 -  Debian GNU/Linux 11.x (Bullseye)
@@ -177,38 +171,11 @@ supported openSUSE Linux distribution:
       &PIP3_HOST_PACKAGES_DOC;
 
 
-CentOS-7 Packages
------------------
-
-Here are the required packages by function given a
-supported CentOS-7 Linux distribution:
-
--  *Essentials:* Packages needed to build an image for a headless
-   system::
-
-      $ sudo yum install &CENTOS7_HOST_PACKAGES_ESSENTIAL;
-
-   .. note::
-
-      -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
-         a collection of packages from Fedora built on RHEL/CentOS for
-         easy installation of packages not included in enterprise Linux
-         by default. You need to install these packages separately.
-
-      -  The ``makecache`` command consumes additional Metadata from
-         ``epel-release``.
-
--  *Documentation:* Packages needed if you are going to build out the
-   Yocto Project documentation manuals::
-
-      $ sudo yum install make python3-pip which
-      &PIP3_HOST_PACKAGES_DOC;
-
-CentOS-8 Packages
+AlmaLinux-8 Packages
 -----------------
 
 Here are the required packages by function given a
-supported CentOS-8 Linux distribution:
+supported AlmaLinux-8 Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
    system::
-- 
2.25.1



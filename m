Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A770FA1FE7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 18:54:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90118.1776884056367845459
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 11:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=quvdOueI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso76033785e9.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 11:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776884054; x=1777488854; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7f1YJsiSAiSndHDMbhngTPAqdPKg+Bsj/kCSX8qgcW4=;
        b=quvdOueIZZArsKe93Bx2gxMT5Tv0+/Ls1GwnCHZoyqjSpj/P8BUVl2jiHwxNRXab8L
         6rCKHxCkj4/s1NDVB7FE9XVJaAEAS+3p5nxcqQZ9TzhOQ3uqa+E43fjcmVVTANNT1M3R
         on1qPZN6aJfNMO4R+MJvokAOQ/F/xfN5bkVaybrMKu6B9Qi+pO2pdRq6LIh/Nzc2Ax5D
         XiLdzddCQyFyjrR7CmjqzWpFKBawunXdCmbANRJ3hHp+NBroUetsIGeI8hp2jaQ6pDNF
         4o1ZsgGU0ImZ+Km+Zrjt3qAk/zTLxlS6zyTPZWv9JXJRjqIAcF+X29VkEPRSBngkoK3h
         87xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776884054; x=1777488854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f1YJsiSAiSndHDMbhngTPAqdPKg+Bsj/kCSX8qgcW4=;
        b=ITy7UdlIBDA7bMhi96wJCyRLQumJcD/fQSHRDk+59hWRDmtaKP8V0zBP6niqdQhDWh
         BEDI0ZyH4MB+ynATu8YSH0ms2SdC6agltAerbWSp71MJfu4chVEUOsuhOKyYN90CM2Vm
         4WppFTTERTQYs0nQ1oej+vNBrpVi71JI97jmwNrGSh/86kSfuBKhOJunJzIuWjWQPtaN
         eRXcWfpl6pqbg9iFIsIe58h28lNVwjilGelaatck30p8j4Ku6RlVGE6Aqau3jVeNK9Yq
         I0DyDsZ0r0mYtzE5p7JJcFKbrH64muE0/KBkcjboCa410ADXUhNbsPtxRQKDMhA+qKNm
         QDMg==
X-Gm-Message-State: AOJu0Ywn2ji07G42Udg3PsgtaaTXAadQriVTgQAyCQKFy7ur+M6B302a
	CdlQPvl8JEO71D1HzP6qG87C756rwFK5A3guecVK76qvO3XbR5kRFTOGpcYcvMMz
X-Gm-Gg: AeBDievozbQnnEHtc4cVdB4VM9fwu9hK9mUOX2WnjSLdmBSewq1/zye9bAaVYqSNb7J
	Blmvs4mhThUo3tPpScho70F+aYHThodS01f8hEp/ZG9V0+LYjFAexcapxrTf2Co5PfoSu3E7FP6
	K8xqA0WFHn5NzWq28XHrtFBEY3R4BzKUxqsV/fZSpYAyKwrQtaQ7dOVVvpVyZXaxj1rPJSwYox2
	5RNtBNAmnbL8++cRl9XygDMXZjLk7TumREbuiXKTCDuLp0y3quPfR1WSbh7cWAdm8sk47FVbpLz
	GGOPNfPd21XTu+UH70XMuJOb6oSuzcNYcO4lP7CxNrc2FcWNA8uxYzrEptjC7B/D0us4Zc3OUka
	iP4CcIDKHELQHDqSCxRWVGGvg8AadnJeKAuRdk7J0sXek4wGSZLLdgYtDk8nICBgiNWaDsIZ1Qq
	7TLnVBVWiaufRowJ8tzsbCoudCUsOpZXCsXLHi06z2Ivh5u7otjyYfmYMvIjlWO20lW7OPdwsPY
	1Y9N6zJgJRwCx/H9hAyFHto8oAEVRbYkdqsCWOesQz+D9EK2OvRZxT0A6SPOhua
X-Received: by 2002:adf:f2c7:0:b0:43f:e44a:f276 with SMTP id ffacd0b85a97d-43fe44b01a5mr26672429f8f.3.1776884054165;
        Wed, 22 Apr 2026 11:54:14 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:be87:d3d1:1570:9b73])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm52686494f8f.37.2026.04.22.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:54:13 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH] overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task description
Date: Wed, 22 Apr 2026 20:54:04 +0200
Message-ID: <20260422185404.14111-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 18:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9328

The description incorrectly stated that the sysroots are set up for
use during the packaging phase. In fact, do_prepare_recipe_sysroot
runs before do_configure, and the sysroots are consumed by
do_configure and do_compile.

Reword to refer to subsequent tasks in the recipe and call out
do_configure and do_compile explicitly.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 documentation/overview-manual/concepts.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1faa790f3..e4a8c60f7 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -782,12 +782,12 @@ This step in the build process consists of the following tasks:
    This task sets up the two sysroots in
    ``${``\ :term:`WORKDIR`\ ``}``
    (i.e. ``recipe-sysroot`` and ``recipe-sysroot-native``) so that
-   during the packaging phase the sysroots can contain the contents of
-   the
+   subsequent tasks in the recipe (notably :ref:`ref-tasks-configure`
+   and :ref:`ref-tasks-compile`) can access the contents of the
    :ref:`ref-tasks-populate_sysroot`
-   tasks of the recipes on which the recipe containing the tasks
-   depends. A sysroot exists for both the target and for the native
-   binaries, which run on the host system.
+   tasks of the recipes on which the recipe depends. A sysroot
+   exists for both the target and for the native binaries, which
+   run on the host system.
 
 -  *do_configure*: This task configures the source by enabling and
    disabling any build-time and configuration options for the software
-- 
2.48.1



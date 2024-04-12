Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078C7C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 18:55:56 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.55489.1712948147490195864
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 11:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T2nxZpkw;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: geoffhp@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso8508515ad.2
        for <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712948147; x=1713552947; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZs4vy6F4K16eVEM3e8IwMVMQj8g9YN9QhaXkEMy+Xs=;
        b=T2nxZpkwuzqmyem85TCKL0wcrGOm+kZp9sMwnM+JBy1DzRmfmIucZifIPK9Oww7bdB
         aJbWrb9xVwYQ7fGB76jbkVc2YfsKyhjzhllznPF9P5rd2YBSFeKPItTmWIxH9C/jBDEn
         1sWesAyMYvodEj9tG7GdT5HbPOvM3dc8kCk9ed+Yf5fTDGbBw7BLEvQ8inRbwqynZqNE
         ZcttcWa3g7KeEIhvbkME4oMdDHS/70iQhEtRrQSqEPSsoLISqR/Vc7NfISXmm9n/Rk3L
         YfgxoWWEG3xKN9RGMLlZDDyZoi7n/IhuJnT8xqjPHwZPm+ZPiNixXf79iONLlE/Hgj6r
         1foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712948147; x=1713552947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZs4vy6F4K16eVEM3e8IwMVMQj8g9YN9QhaXkEMy+Xs=;
        b=oDkRBAdTuOJeGhuMtl07s+ONH3DgEQ0FKykVzHPz0gxC0w9fJ1dUsMVe7Nuf8QwZ9E
         mbemaaJQ4pq7fH1+He829n+oqRQCH5mNoE1NU1eWm+kD2BFD4nzXuMrJHOieNf89rXIl
         YuZ6ZwOMXfJIu7CBzqEY/eTovAGbEppg1sPi3gXqxjuIcJo9MsRdiMm3lb7Jjs3omp1S
         MZpZG5ER6xK8u0O/R+BFBUXCBynV3lfoVB9nfJeP3mvU/E92CxZQ1qBL1buQx8DHa4xp
         YQomGyo7R8VeF/a3ZFKW9tK1Cs8V/r/rkKv3ZBLgZ+BnvWgfnN4jRnS6WOBVV95sqzsJ
         FdmA==
X-Gm-Message-State: AOJu0YwqCRt+s3pTxSMEAZ9O8/7F78zsnM6Ds+ASCP61v8k+TbnPpIYp
	Byk6aFOJL8DBWoZyerP9/ZgbGt5OXR0RKeKKQ3a0k7bMGcCfj2Nz3vzIWQ==
X-Google-Smtp-Source: AGHT+IEjlsKOHMoKhSOC0xJhyie8+BO8vvt8v8kmaiG2biAUbIgE2M7QvNN8Nasf+ONkVy0LGzbyqg==
X-Received: by 2002:a17:902:dacd:b0:1e2:7c71:4b92 with SMTP id q13-20020a170902dacd00b001e27c714b92mr4220544plx.35.1712948146666;
        Fri, 12 Apr 2024 11:55:46 -0700 (PDT)
Received: from localhost.localdomain ([23.241.67.81])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090311cc00b001e5d8433b5bsm514675plh.117.2024.04.12.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:55:46 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: docs@lists.yoctoproject.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] ref-manual: variables: Update default INHERIT_DISTRO value
Date: Fri, 12 Apr 2024 11:46:57 -0700
Message-Id: <20240412184657.2933679-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Apr 2024 18:55:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5122

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add remove-libtool and create-spdx to INHERIT_DISTRO defaults per
meta/conf/distro/defaultsetup.conf

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0dc881ed51..1eab5c82eb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4048,7 +4048,7 @@ system and gives an overview of their function and contents.
       The default value of the variable is set as follows in the
       ``meta/conf/distro/defaultsetup.conf`` file::
 
-         INHERIT_DISTRO ?= "debian devshell sstate license"
+         INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 
    :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
-- 
2.30.2



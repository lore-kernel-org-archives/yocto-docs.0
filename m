Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web12.417.1594938428436593973
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 15:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQucTmFY;
 spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id e4so6425296oib.1
        for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2020 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=FS4iNgKvEss0+mH9nSNZL8a7G3NCJrcuzTmcanURUAg=;
        b=PQucTmFYcacdFCSI7DvAQ3PNRSN1IjPD+1q3hcuzT6VI+ftHhVCvm2wF87xp7pXaur
         G9gOHQ9EDqQ6xj/9Q4/ZIuZGqpI6c94gGLn7wFaGx/zGeXwPFS+uoEcymIVQFbHen8sO
         fYyLlHt5ZY4yi3k6VNLtbOTaLfsr87hKYrrDlEIWqedrL8EAp1jnANCHDwIf9fhC/ZxT
         FXCUB1IoYZAt2Cl4F7ubTp+7v2UQzqWjjU9k2a41xqFdpGK9M0CcHu/VCk42iKIIzr4y
         +WYXrFAZV00EOx6j0EqAHyCw389D0vvkFxb884Bigt8ct89urnLJpBMfqRYXcbtxEPLX
         3LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FS4iNgKvEss0+mH9nSNZL8a7G3NCJrcuzTmcanURUAg=;
        b=FP8a+kOkHnWK9mzKFafqko96oJNK6lKOIILbCgaDb6AVeB0E2P4vwgowoHUcaFETKK
         J3//SvsLkG2Hx0491aI4ARlJFFpIJh2zei/gqobLJjqACYW1BELvq60ETZuHEHn38lQF
         jC5JGuylZVdVG60cCZDJDZH4TH0LwuTEz8Vuhi4o04kv2tNmH94q2llQI6KBtEcS3Mr3
         RAA91cKA9hMREfUbdbpZVyVVcF06mno0L6ommu8qr8ncaT5a3+6q3uwVire4TZBi+fr8
         plHCnbGB4tMGidyvQbDFAyzbGhOCV/X0B/jqxeWt/UsgCd1rwBigbnWfdCCHEwrReNZB
         qBaQ==
X-Gm-Message-State: AOAM533EJ3gwuD8twv5jW9KZ5K59B+VokSqNipAEFT5LGssA7VzC6RiF
	JK/xiiEb7jQV3Kz9KQWTzmTixSk5nuE=
X-Google-Smtp-Source: ABdhPJycy2D61F+FdtBDfuMte7bXMMejK2AGPSsLVuyfu8GYUy6AzoMpM/xiGuAyTQ73LnbfILWs1g==
X-Received: by 2002:aca:4c4a:: with SMTP id z71mr5523556oia.17.1594938427518;
        Thu, 16 Jul 2020 15:27:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7df4:7f73:717d:af68])
        by smtp.gmail.com with ESMTPSA id d10sm1344757oia.18.2020.07.16.15.27.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 15:27:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-system-requirements: update supported hosts lists
Date: Thu, 16 Jul 2020 15:27:05 -0700
Message-Id: <20200716222705.14182-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

drop Ubuntu 19, Fedora 28 & 29
Add: Fedora 31, 32 , Centos 8 and Ubuntu 20

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/ref-manual/ref-system-requirements.xml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 43e217c6d..ac8b0032d 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -94,11 +94,12 @@
             <itemizedlist>
                 <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
                 <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
-                <listitem><para>Ubuntu 19.04</para></listitem>
-                <listitem><para>Fedora 28</para></listitem>
-                <listitem><para>Fedora 29</para></listitem>
+                <listitem><para>Ubuntu 20.04</para></listitem>
                 <listitem><para>Fedora 30</para></listitem>
+                <listitem><para>Fedora 31</para></listitem>
+                <listitem><para>Fedora 32</para></listitem>
                 <listitem><para>CentOS 7.x</para></listitem>
+                <listitem><para>CentOS 8.x</para></listitem>
                 <listitem><para>Debian GNU/Linux 8.x (Jessie)</para></listitem>
                 <listitem><para>Debian GNU/Linux 9.x (Stretch)</para></listitem>
                 <listitem><para>Debian GNU/Linux 10.x (Buster)</para></listitem>
-- 
2.17.1


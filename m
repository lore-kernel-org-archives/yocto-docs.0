Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.6777.1589948802977681647
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2020 21:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o5s0MMMv;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t16so806445plo.7
        for <docs@lists.yoctoproject.org>; Tue, 19 May 2020 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=K0J+vwt/aTAC4/yiefMU7e/2Bo65SeDq9/70IJ8XBs4=;
        b=o5s0MMMvk0GVBYlWxmjiU0k/Rvk8n4iwJP5+K1QWzNf7Z95HgKrgm711srqeyZ2Eat
         H23zseoJwPxo66K9X2B1R291yV+ruYBasKbudU+1CZ+1PpgUz4C7/qhqNVFkzu8HkLeR
         EhVYfeAPVA4vK1eEBG1bVGZBvrDh4RgEM9tkKMr6/x6taV6yoXVg9jXQ9Fug3QmuYLmt
         NgIkHTSadCBiztOxFEO5LzrVc98DKfbHqPYNQeKyw+KxhDwZeYX47WEwKE9HGeTwbGO1
         nFG3LhrL+3A1llPe8mPHo//dak291DPPMQj4SqvKatY3tHAQkljykI1R/vztDtYroN/M
         DpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=K0J+vwt/aTAC4/yiefMU7e/2Bo65SeDq9/70IJ8XBs4=;
        b=FwdKvrQN9cZ6LV1SQGNgwxjY4QNVsqKQIOv3IgifBDSLHUqYRP0TkBMhpQkXQqjZFZ
         1IVBPbMVVAA8s74fQTmNfFXPufQeKTLgElLp7Cv5ZkanRaNwLjfO1AwYvYMxQU+DYmfT
         CthSE5HKRVa9BeYSjWyTkTZpdfE+PL53yS7htf0xR6OBDgSBVLq/1VMQD5lnfIig4Sq0
         SX1HkkKWPivFCWAQfY71+y46J9R/JcQKMnMwOxgslzOBruzhlSmfEK9uMbXKgX/Wovp0
         fLhASco8A3M3E2Cxvm7dJWG0b8TyVNcoXkjY56OqaTJ0FhEBa3l9nzGhdqNsjF59y/kt
         6GOA==
X-Gm-Message-State: AOAM5324sRigjpeAk25E8jzfTiq7JZiAbjlDELd/I6Aw+3blsHF1kmSp
	3/xIaE3Lh1ZYOq4fBisHyjVma0FO
X-Google-Smtp-Source: ABdhPJx+l7FIRlKCBlpZHcoeXaQgiyVB6KgGWHcUx5WYEbxFe4U1O0eKQt+8H9zHKofJT8gKEArmjg==
X-Received: by 2002:a17:90a:7062:: with SMTP id f89mr3217298pjk.42.1589948802174;
        Tue, 19 May 2020 21:26:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:89fe:2720:c4a0:6889])
        by smtp.gmail.com with ESMTPSA id u188sm852319pfu.33.2020.05.19.21.26.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 21:26:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [V2][PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
Date: Tue, 19 May 2020 21:26:39 -0700
Message-Id: <20200520042639.7077-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[v2]
Fix typo

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index a54793911a..07dc1af3d6 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -70,7 +70,7 @@
      python3-jinja2 SDL-devel xterm rpcgen">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
      $ sudo pip3 install GitPython">
 <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
-- 
2.17.1


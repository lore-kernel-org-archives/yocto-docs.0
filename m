Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12485.1617717977419242571
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 07:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFt1wjrs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i18so10928879wrm.5
        for <docs@lists.yoctoproject.org>; Tue, 06 Apr 2021 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h7b+irwBEklkJSijeC0F4VyDsF4R1X+9/LWMO6t7hu0=;
        b=HFt1wjrsPA3wOCkItOjBcMzupLNtXN9uDBsvB/toeB3lfqg0vijc76/y+oimkRxv+k
         2hppcbbD6SBTwhS2XaOeBmWaAlCIBHNE1SyeHIML1QXy9Vt5vQa7jf+iIfSeAGZdxD0A
         P4aeMUwqj9NqQSv18p3Qm6K26Njl+iOWroqoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h7b+irwBEklkJSijeC0F4VyDsF4R1X+9/LWMO6t7hu0=;
        b=otn6c171+5OgK3vqgi4yelROTumFKSQrqkpSie2XIM404j+C6tKweMa6/HesviunFE
         G/dWF+zXTUxJ8aMh26hTiRLO2Qp1+OuGt3X/tdwyHns1ZQ4qO3SGZyZ4PzCKdfRTxBif
         WXgcR7/7MJCu7bA9IIS//ytygKpeHPPKqnX7ogheiFaW0hZxDOvXt3/oNT0WMWs5gJm7
         3Br6ae2p61HA4pBmIHPjM2HJgqukiR6TAPALNOkJPosUgo5ZaFw7m1B/fCnHVwIJPOSS
         mRdFY1wkurgCK2vyhtkPRWODD/k/qcCmUXVbWmEPAkEN9rC3HEuyEuYLA2dJZd1uYWT6
         jdmQ==
X-Gm-Message-State: AOAM531D2O4QENBdP6d+We30H5pfAovErMUyQnUr9tTQEdUPYvIMO4nl
	BCke/ZZqaPOWgVKHNnYKzrUQ8Yj1nZdfyQ==
X-Google-Smtp-Source: ABdhPJzJcqEpnPB3+zTLFrurv6zY6DvqXiw615JQl2GUKZ4dIQwqFdCy3QRkHlqzDKep3UCab2BN5w==
X-Received: by 2002:a5d:498a:: with SMTP id r10mr22395024wrq.127.1617717975702;
        Tue, 06 Apr 2021 07:06:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id m3sm3443877wme.40.2021.04.06.07.06.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 07:06:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] documentation/poky.yaml: Fix latest 3.2 series tag reference
Date: Tue,  6 Apr 2021 15:06:15 +0100
Message-Id: <20210406140615.1000871-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was accidentally missed in the last release update, fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/poky.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index de264c963..f40a9d96b 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -5,7 +5,7 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.2.3"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
-DISTRO_REL_TAG : "yocto-3.2.2"
+DISTRO_REL_TAG : "yocto-3.2.3"
 POKYVERSION : "24.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-- 
2.30.2


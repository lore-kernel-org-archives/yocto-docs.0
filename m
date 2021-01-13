Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.4796.1610521660432614343
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 23:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=ua/cf+HX;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id i63so553487wma.4
        for <docs@lists.yoctoproject.org>; Tue, 12 Jan 2021 23:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DHp05tfGq/egYRApz5YnZLRNmEXwweHfCyycMeCFXhc=;
        b=ua/cf+HXFSivJgbVnMXEy3cG5TcbKoSTe3gWSM8dobnHpDLrHJ+DJMM1/SC8pBcTDb
         rLnxuv3OfMm4QE+lTmnADRqPFmdKtlRPnPyB+ZdwmUgxyz7MRSGhbjUB/7oTUkUI/kr1
         V9/IcK1Zu61E/k+UMKV50k/jwn4O8QLUiBP9xyEMZMu+zccD8PvkbOHWFYxklxC0otqL
         tIGuVqY7cJ/FuzPy++dkp9j9FrPXa6E052uVlfKUYG+QFoNxiSSJJdHs1CWLtjEEk2RY
         kwNOrE7h2SYH6wua4fsj2F/LVA2m2RTE+AQO37vVSp50ItIXFHlltnYMSx0HBV5Fx8ty
         KRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DHp05tfGq/egYRApz5YnZLRNmEXwweHfCyycMeCFXhc=;
        b=ECmWs5n3df6atiEjP4PX3PJBff/G4I1fwKJjEVnEK12+VlfaA7p/ew/Sdg5ft5FBD2
         Tm6nuwPcR14+A9QBjsDIY2cDVrS2++DgroAAjLDEWHlIRBxvomjykz0R93FM6HeecC63
         Dt6mdfE1LC/o+YsBiz4lBYuKYT9DreKjgJnO+03C4wwkrrmyKejKB6xH5etzd9JD4Rlm
         nh3zJx8d8CaMMCRKt6dTWVH58cDwYc14dGgEXWM8EFuUg3Crgsmi5D0DzTsNbS+ucgGL
         5tlNxQcYfG+fhq4AcBr+fNQFJ3pGjC1VxcG5+5ohbokOBwzQENewVJbGdxRtR5s3Lg0G
         Npmg==
X-Gm-Message-State: AOAM53255JfyNwFUsORoVGPpiiQFgjmm85dkpA/l37MLjV/B+qaZyqMa
	4SRrwcVXZtvDwvtdm0p1ZqVGSo92qTSlLA==
X-Google-Smtp-Source: ABdhPJwza+7K9QxFO3tC6m3+C0px422LHaUHKj3tLYb4DP12VS08VUfp8ZC5MQm5IRuE5+IGzMjLKA==
X-Received: by 2002:a7b:cc0a:: with SMTP id f10mr722135wmh.6.1610521658444;
        Tue, 12 Jan 2021 23:07:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost.localdomain (9.198.204.77.rev.sfr.net. [77.204.198.9])
        by smtp.gmail.com with ESMTPSA id v4sm1628873wrw.42.2021.01.12.23.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 23:07:38 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] documentation: Fix a Concpets -> Concepts typo
Date: Wed, 13 Jan 2021 08:07:01 +0100
Message-Id: <20210113070701.12412-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/ref-manual/classes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a152dcac77..f47b6e3875 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -931,7 +931,7 @@ For information on customizing images, see the
 in the Yocto Project Development Tasks Manual. For information on how
 images are created, see the
 ":ref:`overview-manual/concepts:images`" section in the
-Yocto Project Overview and Concpets Manual.
+Yocto Project Overview and Concepts Manual.
 
 .. _ref-classes-image-buildinfo:
 
-- 
2.20.1


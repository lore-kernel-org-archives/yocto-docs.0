Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E88F44850
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:02 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155085.1775823480505370166
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pu/6UsAp;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f9568e074so346166166b.0
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823479; x=1776428279; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjB/A1ldI92O0P9/xq3i80cS7Pc1MHlxySpCSX8uTcQ=;
        b=pu/6UsApDWNO6QT97DMYuyct/Rd9/JRJi7+jgEuduNRbkdK+4PA1jiFNwCClQAbPIs
         k6CqUP3BwTmLNy1sbpkS0F7+SDbXNRd2BGm2iTGXgRNX2j2MkrOOJxgBnInb6VhQLFUc
         40HpQJxcBuTweh75VomNkZYy6dTM59/oN1kLQuO+BRg7VuoXIp1Meu8gOcTKzMmMTGy2
         z/GD7l+Mb9ph895D+8lkMTzy5ghvzdaQhS0Gf3aevv8H4G0mY5C/XkR9wCpyHLLgCTeD
         Zk9LUkKJdNtCV2qtCZl9QMEPvFfArtEqhGvKj3Qy0Y7UusGbrsft5M8ZqAS+vJOk147m
         Ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823479; x=1776428279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjB/A1ldI92O0P9/xq3i80cS7Pc1MHlxySpCSX8uTcQ=;
        b=aTh6/5PDLDH+5TQqo56OPV4TAO1xpB/ljg73244yhrWqsd7PnbtojQ08YV52FqWJ1r
         ctySi61K/evcWSkdwX5zJBakbF6uk5k1qiiawHFg3xY/fiwhT1KM4bYVPmTpq5ILgG3Z
         axdzZHkmKEqafdslx/lH3dJ8rKMrk6NL+quL3vQbQibzG1m9KyoxeNSfoU7hybSXYUxD
         FhVTzz3X+Guwz3Ri9KE4hh4MS0tVnADwsKa3OTDQQ2NsZB5yGU+9j3aywli/sUlGLFDn
         /CdNVZF7v6lNX03MG/huSvmIb9xQ38DzrjlwyyNd1Nb1JXKWTU8Rwn5QqaY3fvEbsuvH
         AB2A==
X-Gm-Message-State: AOJu0YzwgxBFP625Uzmp70HzkI+17MuIp55zHb05k5bIOaCD4O+Fp0qn
	ZBfF52wGRS95S8eoDoNxZrZz0Oq9VYIlUwqOpiA59D0vv+mT6LPhTqF6
X-Gm-Gg: AeBDiesqKK/a/Gugg5+NKUp1HOVRAAKq9EfPgArhwGS+MOSZ+3mqFaHFIxTzD4sslQg
	UdG97ACWn8C7LipCWEM3K4yye0Jv35gVa/rpvRz3j4JeHGIk347eBAkiztDHScZSqhBS+0leCfq
	12bB2hPYbWkyiSk/ZUjE5JzyYaK4HLlWBQZTAMwUYpU25+Or2gaBrX2mkDGyPkmlDMavefHD7Wo
	GAW9xKL8xpORt3IVwjuOVWB8ONmENASuPIfj2ENDcUHyVnluuloJxDn/DHnQjcn/GkbwYcBefp0
	J8/MnVOEcIMf8Uwu9iB/Iyrk6JaaSCsNhzjGEbEENTuBD2loH3hYA7w1S+g7pkqwx/OuJl2GVIW
	bElhh76Efj458BzGi74U07KfK12lzNft1QWII5YPtacQppCim7lmgodeDYFIUcStZcSUfWs8Zbl
	4jnJ8M250R3huEY64LZd6oshSqCXxRwMFxmp5gzEHf
X-Received: by 2002:a17:907:3e1c:b0:b9d:94af:11cf with SMTP id a640c23a62f3a-b9d94af137amr31232866b.6.1775823478699;
        Fri, 10 Apr 2026 05:17:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:58 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:47 +0200
Subject: [PATCH v2 4/6] ref-manual/variables.rst: update RECIPE_SYSROOT*
 descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-4-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=2284;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=cQXQZuiLQhiLadE8K9imywyIkc8FhmVN2t1yelb87fk=;
 b=s83uvedGAVDx9siIQud0SRAxsrj2IjauKhI0HEWgN7kncfpBa7CeIOE1hJI3zkRyJN9R9n0km
 65a5lNxVqhIDQ7L/Ac4TpcNoZvCybCzkMkd6nDibDgtCUg9GqFreSKp
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9227

Slightly reword to emphasise the order of steps during staging.
Further clarify those variables' relation to STAGING_DIR* variables.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7d3aa8ccf..aa142a701 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8345,13 +8345,13 @@ system and gives an overview of their function and contents.
       section.
 
    :term:`RECIPE_SYSROOT`
-      This variable points to the directory that holds all files populated from
+      This variable points to the directory populated with all files provided by
       recipes specified in :term:`DEPENDS`. As the name indicates,
-      think of this variable as a custom root (``/``) for the recipe that will be
+      think of this variable as a custom root (``/``) for the recipe, that will be
       used by the compiler in order to find headers and other files needed to complete
       its job.
 
-      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      This variable is used to define :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
       according to the type of the recipe and the build target.
 
       To better understand this variable, consider the following examples:
@@ -8365,11 +8365,11 @@ system and gives an overview of their function and contents.
       Do not modify it.
 
    :term:`RECIPE_SYSROOT_NATIVE`
-      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
-      ``-native`` recipes. This allows a recipe built for the target machine to
-      use ``native`` tools.
+      This is similar to :term:`RECIPE_SYSROOT` but files in it are provided by
+      native recipes. This allows a recipe built for the target machine to
+      use native tools.
 
-      This variable is related to :term:`STAGING_DIR_NATIVE`.
+      This variable is used to define :term:`STAGING_DIR_NATIVE`.
 
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.

-- 
2.43.0



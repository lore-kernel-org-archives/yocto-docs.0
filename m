Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.1013.1590611103410351558
 for <docs@lists.yoctoproject.org>;
 Wed, 27 May 2020 13:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BOK/dgLB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c71so849582wmd.5
        for <docs@lists.yoctoproject.org>; Wed, 27 May 2020 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58W2w3jj4mgNAbGpznZgap2X3RmUlJPzT8ywCGsuCjs=;
        b=BOK/dgLBnKbyHCntAmWnI0NpCyknPOOlucfpKgWB4tkXPP4KgwHTOjOID/26dnFjt7
         GeHS2bE511zGf9hubogLqlZZFqIuUrCcyWJDM7M3figmLyoWdWHFvsc26PZpdQZmneWY
         ohyP9g0X7qF+ZStXIhEBucVwzbYzJhnEf8TPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58W2w3jj4mgNAbGpznZgap2X3RmUlJPzT8ywCGsuCjs=;
        b=aX6Cansk89VwoQ8bIhfneIsJ35wgthzkLaPX1ON2w/zC0pHEmK2VspmbFvR4K7yX8m
         ivbmgr5NUy5tVVKb4LkDVZhogaD9Vpq9BV92mUwoIvS+SGDkys1QVaafbAyBkMc/1DYY
         LYA5mhFuK+7ZNQ9BPGqzrjaKuER0Fi3tCDrHF5RmwWr+K6u3IdgC0jxAIw+08kC2hoxM
         ygTkNC452K7XEqU14pa/8rfVAdx4sjHMEwQatacE/Fdmw+WEWS9nKXUCXBhVvO6C1kHZ
         TIu+Grt1zLZoFHvuBluPbI3u7zHPRc7iBiPHBbUqv9eK4q18tY4k0dss/O6NC9ePrPao
         JfhQ==
X-Gm-Message-State: AOAM5328AkRGTXixJljW+WgXs76cEbkNJPCAtBiPrC5b6jcR6MalBh13
	x+PJpMz3zu3KfG2QM0Sm3v1FPuFfPvWdIQ==
X-Google-Smtp-Source: ABdhPJw0zgOVBEhSbdOVzN/+kPQUWFcgDX4WmNTvqo4U5kiWMF9uZK3qes0AGhvV1Ge/plA7GR5cIg==
X-Received: by 2002:a1c:2e16:: with SMTP id u22mr6298726wmu.168.1590611101472;
        Wed, 27 May 2020 13:25:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h137sm5075190wme.0.2020.05.27.13.25.00
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 13:25:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match recent changes
Date: Wed, 27 May 2020 21:24:59 +0100
Message-Id: <20200527202459.1507610-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index a54793911..94b1efb48 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -62,7 +62,7 @@
 <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "gawk wget git-core diffstat unzip texinfo gcc-multilib \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm">
+     pylint3 xterm python3-subunit mesa-common-dev">
 <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
-- 
2.25.1


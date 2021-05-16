Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.6954.1621178159695691611
 for <docs@lists.yoctoproject.org>;
 Sun, 16 May 2021 08:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gHUk8MQd;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so1516010pjb.3
        for <docs@lists.yoctoproject.org>; Sun, 16 May 2021 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=ZM8AnEM5c7exnYbioHGMFMfxlwVZ8mey4vxl3PVy+JE=;
        b=gHUk8MQdaj554o2MCOA5M/Rrq4mlGjlCFJONwg70kqnw7Mn2MTWVIGKmx10uDGpr0S
         7ieflKE5XPj2CYQm/NSxRzm7HU0vp40LZVDupkJKMeVUw4wBCm6xCU7W/b7Snt9V6uIb
         r42kl5O2riiCVEqhwv3PknPZMcI8jB6w/mGJ17eNvhoGyu3oC8URRn9/6SQb852Ayzvb
         Ezyv4/0Fq4aMs7XIdh1YN0pFLV8y8Zw0N9vlP/jNDmF4VQR6k73/6iFMBXLdLyfeqZTh
         WUTPfFrU9eBdJFigRpFMdtXaD8xCg4DaEh8rXwRXCrC9auVwl9bD9BFEp1TneGeaBZ6M
         Yagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZM8AnEM5c7exnYbioHGMFMfxlwVZ8mey4vxl3PVy+JE=;
        b=XZ4OUR7d/YEK6mWdEEIK+TI+FUiKqsS8etlew03DOAi41+JkQOhlrnoxIMxj8N6r7N
         9C/o5yfgregbRhntEX/s4mhd9o6MdwZjc+k2S0K9pcqv7LbgIOsJh6QvHimZbNQS+uCI
         0RxTtAykeOBZIDQohuDvVLRaxxcD1GfoM6tR/8LT1sPBqlvP0KFcnURgYrChE17llZaW
         ZRhz8E5bdx/hyglte9LplzmL56AyEt6y1WJ6fRVCD2DOmiT7KxjOLDIsZ5V4RGAm8RBh
         GR5gyCP20YiGwrRaspB15I8K7XX+NZof8m0CKrmgbZbYeQdybAbvBmHHEn9NZUVQolEg
         7ByQ==
X-Gm-Message-State: AOAM533LojGM9/HQjZD8Yjcmq253IQ9INEotaN5WxhwGcuK15wq0HjUn
	FNKojNbwiU5NhoEIdUXv/gaYNY8UJ3I=
X-Google-Smtp-Source: ABdhPJy//6t1dDfdyA7uNB3GiDHjYWoCxhU2VSl6fU09HukiHLstp9wrd6GU0X67bOJ9X7UUlwuScw==
X-Received: by 2002:a17:90a:db02:: with SMTP id g2mr16553144pjv.2.1621178159011;
        Sun, 16 May 2021 08:15:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id cv24sm8484827pjb.7.2021.05.16.08.15.58
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 08:15:58 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] Fedora33: add missing pkgs
Date: Sun, 16 May 2021 08:15:57 -0700
Message-Id: <20210516151557.21643-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

[ Yocto #14188]

The following packages where needed to a fresh FC33 install
perl-FindBin
perl-File-Compare
perl-File-Copy
perl-locale

Error seen:

openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
Can't locate FindBin.pm in @INC (you may need to install the FindBin module)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/poky.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 22706a0fb..9737f876f 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
+     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
+     perl-File-Copy perl-locale"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
-- 
2.17.1


Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.47969.1624286010118644503
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 07:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bnb6v8aU;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: jiladahe1997@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id i4so4958992plt.12
        for <docs@lists.yoctoproject.org>; Mon, 21 Jun 2021 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=7tq0bzb/YMAvkVs/eiOybnfjFvvycACqQRHqII+pmKo=;
        b=bnb6v8aUcBKJJN3uG2vYY9ZZ4K2tLv7tHOJJYBTTCMROs99jk7wMAF85hvLktz+Vr9
         hFToh5Ooxp+ue40KP0+ZRboOvVBfoF0NpIHztn4OLEvnGRgJapVc8RdAMUOyhJVFSRqk
         iqg+e9mL8FONW/v9O1Jmgs6i9Sm7gotjV+Chl+RnB7Z9esPuJCwaD0Df/K3D/zjE8uOn
         13II/AFDFG0aemX0i25YFCDchBKpSt5sXSo+9BVe05inhFX0QrQy76O+hpuHNMlwPH+N
         vvZqAWLe9sEQYgG4QcAkNQ2zzXvQiXKj5vlZJdFnwJb2U7AWyyQeKHfXzjJmqKp6YsrF
         7cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=7tq0bzb/YMAvkVs/eiOybnfjFvvycACqQRHqII+pmKo=;
        b=Fstsd6AGdn8EEqbtdMB7yz4fzs9eLwaRGLCZUjt8FdXHO8DDr5R/MkX57P4fx1jhT6
         +dZYYMmhLn0D0dMiYdtgnYiFbpeCZKemzLEkZjXUMB3j63pi7B/5/PGi2cLiYSlOuAgc
         F8DnwiqY/xLNJjaMo4jdR9sAIBCRfe1d01o/ZZ6XVeAwR8iFAjF2tr8UCCagKztIiEM1
         HxoyksO0Wu2fB/u9yBn8Vso5IlDPcT50G9hAzSLUyHfGBUpZPIVDWRVU3WSDPW7PtRh7
         glWqxpaZwZVR36STM8EdnbubQCxfLirSO738n2fqghrdE6nUNB1x6vWjfC2B73Tv8I+1
         GHYQ==
X-Gm-Message-State: AOAM531X8zO5a2JVwt4puWUiGyQLgHSSJePuFeSCT5ceXdddh6hr3Z92
	ZKTuP06WFCKnECDFaPkiSLw=
X-Google-Smtp-Source: ABdhPJysUahen151L7V2vkQ97rD/amo9UhF4zOAC5kVJqoU+Dm1AWvgiuHlgDx6e7kaB3vNzDRPBGw==
X-Received: by 2002:a17:90a:ce8b:: with SMTP id g11mr26771568pju.170.1624286009550;
        Mon, 21 Jun 2021 07:33:29 -0700 (PDT)
Return-Path: <jiladahe1997@gmail.com>
Received: from [127.0.0.1] (n058152077045.netvigator.com. [58.152.77.45])
        by smtp.gmail.com with ESMTPSA id a11sm15945309pfl.168.2021.06.21.07.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 07:33:29 -0700 (PDT)
From: "Mingrui Ren" <jiladahe1997@gmail.com>
Subject: [PATCH] dev-manual: fix wrong file
To: docs@lists.yoctoproject.org
Cc: foss@0leil.net, michael.opdenacker@bootlin.com, 972931182@qq.com
Message-ID: <45f034b6-c943-de00-86a7-dfce48cbffa9@gmail.com>
Date: Mon, 21 Jun 2021 22:33:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

 From 43e67b6c7c5e29d608b5459c6041b195ac94e4cc Mon Sep 17 00:00:00 2001
From: Mingrui Ren <jiladahe1997@gmail.com>
Date: Mon, 21 Jun 2021 21:38:45 +0800
Subject: [PATCH] dev-manual: fix wrong file

The file 'meta/classes/core-image.bbclass' seems have nothing about
'IMAGE_FEATURES' variable, maybe it should be 'meta/classes/image.bbclass'.

Signed-off-by: Mingrui Ren <jiladahe1997@gmail.com>
---
  documentation/dev-manual/common-tasks.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst 
b/documentation/dev-manual/common-tasks.rst
index 762636a17c..9ff33a4ce8 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -872,7 +872,7 @@ a recipe and using :term:`EXTRA_IMAGE_FEATURES` from 
within your
  :term:`Build Directory`.

  To understand how these features work, the best reference is
-``meta/classes/core-image.bbclass``. This class lists out the available
+``meta/classes/image.bbclass``. This class lists out the available
  :term:`IMAGE_FEATURES` of which most map to package groups while some, 
such
  as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
  configuration settings.

-- 
2.20.1



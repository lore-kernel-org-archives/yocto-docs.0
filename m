Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.57.1589401267220916773
 for <docs@lists.yoctoproject.org>;
 Wed, 13 May 2020 13:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GzkntOi+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id z1so245095pfn.3
        for <docs@lists.yoctoproject.org>; Wed, 13 May 2020 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=HZm/hvLY+Zry1v4FPX6zSmv4t9PH6rqUGlSnZcRZADs=;
        b=GzkntOi+WZIXZPep39tKquPN8QGK0M4lkjQiLeIS6NzlbJbeuZAOtShbGM+tVtcycw
         9S4H/eG5YbHRWa/TcvPFp5lsj0XnbIX2fhKtwCwsJr6Ys1hiH0ZmiXEreIf8XaIJDhHg
         iO3vKXCaP7uF+n6VoTMRIRutX6piFygLfcLdIJNdOYSnAXimStL/AMvxtEl7d/CH2DSL
         c7A3WKQLM2PxeizuGYyj5ECkKRg/9/aNGvJ2fyqtB1A6OdgUT9+U6UcacK/wQIcWLeyW
         wHRNUi6uyQ8bOAlMyYapz5y/6OL2Xxckwemh/7Oc2MQfplhYDUGoiEfTDVu/jPC/scOX
         +ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=HZm/hvLY+Zry1v4FPX6zSmv4t9PH6rqUGlSnZcRZADs=;
        b=UkSbiicxw0FEmr77o3nvaExEdLwtQAYISmcUmzPrwNK7evZNJNnSuCNwIDnHUMi7M5
         6PyZFl01eDOY2DdMRKRvfO1OwbiIbC0QnYbn+f/D4wNXJolfSP2y89R4UFGy60qQbAMR
         04b1ZadWhPsf5U3bLNsq68kav6wFxMbcO+QIP9Ua2dXZRaU4UdlucvGPHXGOVpd5bA5Z
         bVHsCs4pIZfM5SWy9QJmQFkCdtloE+OixWSekpu62vPlkwmvxP74J4ajHmthwdklJver
         HOxkxo8N3XIPYrnZ+ffW+VoTOeUid6pcXQFLdT8HXmhoV2pQmIe4BeWSgnNIbVkFf6l1
         kfng==
X-Gm-Message-State: AOAM5328GoX9kNMt4eSIMqz3888M1205h5vgDqr0jarKlUesYxnl18Sf
	Q/69+TH8LJFlz90KPXMIIcwuroEUwpjiPg==
X-Google-Smtp-Source: ABdhPJy+v/6q5kGGtvjMhlIBnDhMloruRnqlP17jzPtJNEthA7423Q+nhwAcZhu+n6kx0KFUlEATjg==
X-Received: by 2002:a65:6801:: with SMTP id l1mr956502pgt.73.1589401266107;
        Wed, 13 May 2020 13:21:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m12sm462440pgj.46.2020.05.13.13.21.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 13:21:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/4] Patch review
Date: Wed, 13 May 2020 10:20:52 -1000
Message-Id: <cover.1589308928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this set of patches for dunfell and have comments back
by end of day Friday.

The following changes since commit ac352ad7f95db7eeacb53c2778caa31800bd7c26:

  Updated patch for publishing (2020-04-24 15:20:58 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Robert P. J. Day (4):
  ref-manual: fix excessive command indentation
  ref-manual: IMAGE_TYPES, add tar.zst, delete elf
  ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
  ref-manual: Remove long-dead PACKAGE_GROUP variable

 documentation/ref-manual/migration.xml        |  6 ++---
 .../ref-manual/ref-system-requirements.xml    |  4 +--
 documentation/ref-manual/ref-variables.xml    | 26 ++-----------------
 3 files changed, 6 insertions(+), 30 deletions(-)

-- 
2.17.1


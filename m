Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.191.1591057718064552221
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 17:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2LQqwLe6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id m1so4261360pgk.1
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 17:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=cSm3oDtPDhbxQTNlfgfFx4RWkY1y5zckhMouExh4B2g=;
        b=2LQqwLe6t0Ss2gzMd1Yj8nCrSJYJtI8hJ2/2rDOh0jQhd0A3LoSMSa+AzgJisi9DXS
         C6CAVu1y0QXUaDCre3c+19F0lSxdQUVh2HqYDesAnC8jtSp3wTRMdlrw0HrHrmtLGCNO
         1hv6PnXRZ+d36XOX87nc+OduG+ckOvZLuFGjiUif7Do1RQ1vOx9QAYHFRhC9AgxP+UBs
         9cWcIjD9mi+wNbddM0c4uBnIh5KD3/Io6rH2JWtX0Td1KiQEebKWX9IEmHiT0AZ3yhwi
         xhFFx2YRdd9azAKjzx4LYudkaVWhIz0fS7XJ0f+YbHM7m6tSauItzy8c2ScW4BUi9pU8
         6i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=cSm3oDtPDhbxQTNlfgfFx4RWkY1y5zckhMouExh4B2g=;
        b=Eo+aBj0E5hxL0gaE7aqQrh7oErfjO5jKryCMHcEPhhZdBJtJxfQ0K8H7ooVvcZXX2D
         DlRAIvc9wVOD0u71q0p4HXClx0GNGdBNLExqUr4rLjNDMN5ILOGdbREqmyoBqNA66go4
         ff0t7vqmayRr3zHKS0s1KDR2OXMsRS7BPxbHVgkC7nt9F9jAHFzCnhp2hFBMSkKQReKD
         +Vq74SSpdcoejgHxZ8pgwwvEQUn4E8D81hgiQmPaxqvm2Zx/s9TaltfxEvRHC3setBRa
         lLegDoxFGFzuhGVEGCUV5qHRIo11Bs3chULlYNpA+TlQiULfRrJmbnF236KYMDWSp2Pe
         rfGA==
X-Gm-Message-State: AOAM533j5beyxZ/gQwPcMiQ3/3aeAbzmv2IEHLsU+Pr7owqcAbn/qkzi
	D4WBAtADgzDigl/9mU9HbAnavbOHxI0=
X-Google-Smtp-Source: ABdhPJykLNMA63DeqFkMOF150yhBGAahN2SVMU8otb8V4sYGeBTKYhzK878eZcT29zqrGK73yMFt1Q==
X-Received: by 2002:a63:1946:: with SMTP id 6mr20657305pgz.287.1591057716927;
        Mon, 01 Jun 2020 17:28:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p190sm474461pfb.107.2020.06.01.17.28.35
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:28:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/6] Patch review
Date: Mon,  1 Jun 2020 14:28:18 -1000
Message-Id: <cover.1591057623.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Adding a couple of patches to the previous set to prepare for a 3.1.1 release

The following changes since commit ac352ad7f95db7eeacb53c2778caa31800bd7c26:

  Updated patch for publishing (2020-04-24 15:20:58 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Robert P. J. Day (5):
  ref-manual: fix excessive command indentation
  ref-manual: IMAGE_TYPES, add tar.zst, delete elf
  ref-manual: typo "SSTATE_MIRROR" -> "SSTATE_MIRRORS"
  ref-manual: Remove long-dead PACKAGE_GROUP variable
  ref-manual: delete long-unused comments in variable glossary

Steve Sakoman (1):
  Documenation: Prepared for the 3.1.1 release

 documentation/bsp-guide/bsp-guide.xml         |   7 +-
 documentation/dev-manual/dev-manual.xml       |   7 +-
 documentation/mega-manual/mega-manual.xml     |   7 +-
 documentation/poky.ent                        |  14 +-
 .../profile-manual/profile-manual.xml         |   7 +-
 documentation/ref-manual/migration.xml        |   6 +-
 .../ref-manual/ref-system-requirements.xml    |   4 +-
 documentation/ref-manual/ref-variables.xml    | 597 +-----------------
 .../toaster-manual/toaster-manual.xml         |   7 +-
 documentation/tools/mega-manual.sed           |  46 +-
 10 files changed, 66 insertions(+), 636 deletions(-)

-- 
2.17.1


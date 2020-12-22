Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9847.1608631082733351056
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=h73nhhci;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id x22so1339180wmc.5
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLHJh+Kw7MkuV+Y9KJEFsU6aDNPxt8iQt9414SRAIuo=;
        b=h73nhhciGdlFhfOCv2tjmQ0aEFHM4+aX2rglIl5pX/cvv17DoXNdTW4DafKGhmkADY
         P77RH+a9Iz2pB6SbxdUB01UTUK/OKX1JB/ZUjoOO43wDnN2NUBgSxebsHYP5OrxYpOmE
         q4SIa6NM5Dvte98cBHqGCAtV2CblAj/KHrbkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gLHJh+Kw7MkuV+Y9KJEFsU6aDNPxt8iQt9414SRAIuo=;
        b=OfNVg4DrDzHohP2c954TKU/bCmxJnFr+T4SQY6BSCzghVrB7ELcpzjsCp1Lci4mG/a
         i+2+D2pt1xrLSIEjHcxqi60MvCa/Fl4PApd9dRmcy6cqn2xjsU2v7mjEVnjxLtMwWb4P
         rtK4YSwaf0fOKFMCbVrao6VPsDolzC9LGrHDM0rmiTFlvHtsDb7dUp2Rwy/yTXQ9u0F3
         U8pNnCSM9at6ni8jluYA52p0oj5vKs527nlQzHbW7tm7tkOJx8F16zPDpcBX104J9+38
         PlbqsUcwAoVOkmSrE9mVgVBPMDNPkbEAvh4MhuNxTKocJJes0yGaP8NypRoOrgO/DC3T
         2+/g==
X-Gm-Message-State: AOAM531yB+Nx30ZxfuWwgAiQmZA7LUQNMni2jdN5307DXT1vz0U9Js6D
	2y6BwsUQNzR9aCXyI73NCpKiejKOYcEwzQ==
X-Google-Smtp-Source: ABdhPJyH8gJWAjnoY7vJC5scpy5R7lyPcMikewS6Yj0C8Y00Fo6rfPZ66TO7z9xthO1SWYZxl8Vovw==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr20603681wmc.156.1608631080794;
        Tue, 22 Dec 2020 01:58:00 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:00 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 0/6] Tidy up links in documentation
Date: Tue, 22 Dec 2020 09:57:52 +0000
Message-Id: <20201222095758.7411-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
  * Addess feedback from Quentin Schulz, many thanks for the review.

Paul Barker (6):
  documentation: Simplify oe_wiki and oe_home links
  documentation: Simplify layerindex and layer links
  documentation: Simplify remaining yocto_home links
  profile-manual: Simplify yocto_bugs link
  ref-manual: Simplify oe_lists link
  documentation: Use https links where possible

 documentation/README                          |  8 +--
 documentation/boilerplate.rst                 |  2 +-
 documentation/brief-yoctoprojectqs/index.rst  |  2 +-
 documentation/bsp-guide/bsp.rst               |  4 +-
 documentation/conf.py                         |  5 +-
 documentation/dev-manual/common-tasks.rst     | 17 +++----
 documentation/kernel-dev/intro.rst            |  3 +-
 documentation/overview-manual/concepts.rst    | 28 +++++------
 .../development-environment.rst               | 22 ++++-----
 documentation/overview-manual/yp-intro.rst    | 13 ++---
 documentation/profile-manual/usage.rst        | 49 +++++++++----------
 documentation/ref-manual/classes.rst          |  4 +-
 documentation/ref-manual/faq.rst              |  6 +--
 documentation/ref-manual/images.rst           |  4 +-
 documentation/ref-manual/kickstart.rst        |  4 +-
 documentation/ref-manual/migration-2.1.rst    |  2 +-
 documentation/ref-manual/migration-2.2.rst    |  4 +-
 documentation/ref-manual/migration-2.3.rst    |  4 +-
 documentation/ref-manual/migration-2.7.rst    |  2 +-
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/resources.rst        |  7 ++-
 documentation/ref-manual/variables.rst        | 20 ++++----
 documentation/sdk-manual/intro.rst            |  2 +-
 documentation/toaster-manual/intro.rst        |  2 +-
 documentation/toaster-manual/reference.rst    |  8 +--
 .../toaster-manual/setup-and-use.rst          | 11 ++---
 .../transitioning-to-a-custom-environment.rst |  4 +-
 documentation/what-i-wish-id-known.rst        | 11 ++---
 28 files changed, 119 insertions(+), 131 deletions(-)

-- 
2.26.2


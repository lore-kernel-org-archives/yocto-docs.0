Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.823.1591316182420676850
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 17:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NnxaUZyx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id m1so4317346pgk.1
        for <docs@lists.yoctoproject.org>; Thu, 04 Jun 2020 17:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=EtNhpkBSDz35G2VGUWOQrVFNGSWKHtSkYFLiKb1Gb6I=;
        b=NnxaUZyx5vCFRHXtJGyyZ0j89TJJ/iaiWJC7z99Gzr/oxAkdOT39DIzprVs7EtiUGR
         7qZjmD4cZm6VP6oCxQw/Frs7FRwkucT3lUiNJ+5cZi/+3YXGQRUvylVqpaTkK8g+U9dB
         9Ii8gpvm+H2xaZK4//BqhS4i5rUwBojAlBF3D7zWFVTpwZsC3QE56GRi9G9UhGmHtj8F
         Mh/y66gSMsfIdXLsa9cMJEJUHiyiXldWE47MKB2tN/uOWaqVPif87IJacMA/reU8fxMO
         fAI6k2MPLXL3f534uMgGnojfEY8d4WftJBzlH1EefcMNv/kEi2aMm2zoaK4ZzkbqiqyA
         7uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=EtNhpkBSDz35G2VGUWOQrVFNGSWKHtSkYFLiKb1Gb6I=;
        b=de8TGom5pC387KX5Mw0aXatrGPQFhHKDDA180GLCXaR4VDfPLmZtxA8CXJxhncE8SI
         aXNFS3xvjbn3W4VP2ZdVoDLPLNIAwSuyLOWCJwUgAWTLUNZ4xPoqiIaUzNjeP0JKEdeD
         fZGnp211t/625mUBguc7IkP/ADSPf4RFa0yV17fQZU+SNXy6uoaf44vXkPdagLziGOma
         WZ5VbYwy6tAxsMtYeumXHaSHxq5ti4lF/9+dVoybwf7411K57RyDjdBc/AMB+0ozjMx4
         5a7TSHJgYgfcoiDpIxiNVGJSMYT5aH9qNbUQ3Sy1TBJZmJzTU8n1Eq3PpdG94rUwEXUs
         9JCA==
X-Gm-Message-State: AOAM531RuV2UMECTA6SF/5g3l7wTL5mhAso1l0SzVi82Huo5UUyXGQLE
	rzBKe8XomDwFL/L7IiB9iEBBIglReDg=
X-Google-Smtp-Source: ABdhPJwliEHNDLTP3IsRkdDjPljxFIq78n2/ozFkuhrqZ/9lwrNRI7mdcwRbXHyfWoVtovpVfvGXJw==
X-Received: by 2002:a63:e34a:: with SMTP id o10mr6798648pgj.258.1591316181287;
        Thu, 04 Jun 2020 17:16:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q13sm2993362pfk.8.2020.06.04.17.16.19
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 17:16:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/1] Pull request (cover letter only)
Date: Thu,  4 Jun 2020 14:16:07 -1000
Message-Id: <cover.1591315793.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 069c27574bf7333cdf58d9920734bb33c81ecc93:

  Documenation: Prepared for the 3.1.1 release (2020-06-01 14:26:17 -1000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (1):
  Documentation: Add 3.1.1 version updates missing from previous commit

 documentation/kernel-dev/kernel-dev.xml           | 7 ++++++-
 documentation/overview-manual/overview-manual.xml | 7 ++++++-
 documentation/ref-manual/ref-manual.xml           | 7 ++++++-
 documentation/sdk-manual/sdk-manual.xml           | 7 ++++++-
 4 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.17.1


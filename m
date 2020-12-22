Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.12845.1608651035986461487
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=D/Ry4bBH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id r4so2540926wmh.5
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eFYTKST+RWkSzsrsZDQeCvjrJ/eQDmRktqdWpVFZr1E=;
        b=D/Ry4bBHoAnmkDyUN+UhJAQSchtycY0Be04iTUGR3x/fHNoPWGmNjzoaclP37Or0SP
         eGa2ft8TL5agV3yvgMR+K1cvkEbinT/GkKlubkdMmxnA+ZMFQsEb9jAOSDjL/iZXZa0w
         JahN60YUFBwgeJkdhj139XzOpdJHWaRPtHyY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eFYTKST+RWkSzsrsZDQeCvjrJ/eQDmRktqdWpVFZr1E=;
        b=ulGniKvn2u5x31H/CDZIcLtr7walrXCC5hp1NYjgIxvqgWQyvhwJVZm9wKdgrv9W9W
         PKUMv4g1gf1UU35W9DRLrOk+G6zF+6g5DMXLCtguM4MNjO3CQcNbi/+z4clzOdevHK0m
         kRR9LkUVoySf9ER1f16hAUqacqEv8+ZVJDoK5VDN5hs4t50j3/1AMxI1ClyNjupvzY9o
         68OQwHZfrBS1iDlRHBeCMB2Chl/ZOA+FebsoQor0tYn8LUauz/u2pf8kpH9QEqjeJHQv
         2CyXB5exLHOh3s4/4qAvu3zw/9Docewtf1Epw3p/+Yy7GBtP4ijzXYKrhKi6JQR+efCh
         V0hg==
X-Gm-Message-State: AOAM532Mpz4KTNbsfhgbsBYs9SZaJkxlYhmb0jTqMlb2gU9jH4JhU5MX
	D4t0G4wLgA5QlNJ9lEKcJPjYP4PnXfAWag==
X-Google-Smtp-Source: ABdhPJwLMUEKs2FHVeM8Eh30BUvW8PyYQDReXkAM+Nq3qgnl8Gjpay9+7/ZHNoNBurzS7bqDxiEWuA==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr22604482wml.74.1608651034217;
        Tue, 22 Dec 2020 07:30:34 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id g192sm27808276wme.48.2020.12.22.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 07:30:33 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 0/6] Tidy up links in documentation
Date: Tue, 22 Dec 2020 15:30:26 +0000
Message-Id: <20201222153032.6909-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
  * Fixed usage of :oe_layerindex: and :oe_layer:

  * Dropped trailing slash from :oe_layer: links now the web server redirects
    as appropriate.

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


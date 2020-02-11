Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web09.4346.1581386594521267690
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PugtuUT9;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id c23so3593681plz.4
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 18:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=MDpPrE1iHhi1ppoufXVE8AX0DE8Oji2RcTtsYYl/HRA=;
        b=PugtuUT9D57jaM6xEUJK73ok3GAKgfQv7A4+/NRO1SznApZY+H/m7l1NdI6TYr1I3M
         wOmpiXTe73yOMHFQVoiRcawvxWigp4NA7zFCSRu+YOdV1teTWonAlCIIz9X1Xt5aUy9c
         7pNCKiH7WbhKXXULw3PNSSH9yPNq1id5CCYO9n5pDRcl/NUnv4E/6iZVy2JR9yZhBppE
         6uI6AEBqikJQJZMVinhwAM8wK3/fBqyRvLWtXuje7DGL4ToFxDVCTMGhbP08Bqd5fIQc
         sWHnwdI/fG59P/SuwFotbHARa7vUCjvNXVURjEz6/TCztnqAyE1n9dTVRY7TXtBlO89A
         rYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=MDpPrE1iHhi1ppoufXVE8AX0DE8Oji2RcTtsYYl/HRA=;
        b=hTggKiQL81WeI7/WHl8bYzuRwoiSWt0mHt0Bv5qe3d6ATkUTa5WLSSrjDb0fXDwmeo
         U+5PesqwwWA8vTSw4TH8/G6kOuoWLGuYx7zJZoIlZvWYY8/xGT1s0FLgAlIlOCa9LLg6
         rsMwcZ0TAI88Re7cYP35Yu4o6+WHW0KYQaHwInuQGZZj5OTdePnDsK0cU4owy1wcixKU
         NShq/LxPhDvt/EHviO0WBY1Q89L0b9d4rMd2Tr2HT+msbAcORV3VcsKQyxb89n4tbFqy
         rSoNNLH3IhWuxrGTuHRLR7pLQ8mUmoZ4LQKPo9bCWk4qbdR4YE2meSh8nnCfLSvBXUzS
         bZoQ==
X-Gm-Message-State: APjAAAUV9gozu+HLofI1gzLPoeHfR1+4ZL+Pvwql1SuVntzrDPU9jr2o
	vUqy4lslBlCHROJzsVe/87QtgSYj
X-Google-Smtp-Source: APXvYqxljB1Lv1SLhXmnUgppe3uYG3lKta7z21vfwBP34uykRhKRKB7dOfDmGABkVPRHT2d8RZV1yQ==
X-Received: by 2002:a17:902:8a83:: with SMTP id p3mr16430616plo.56.1581386593696;
        Mon, 10 Feb 2020 18:03:13 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id l26sm1381804pgn.46.2020.02.10.18.03.12
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 18:03:13 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [zeus 0/1] Merge request
Date: Mon, 10 Feb 2020 18:03:09 -0800
Message-Id: <cover.1581386454.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please merge to yocto-docs zeus branch to keep this repo in-sync with poky.

The following changes since commit fba30da7b4e55838ce3b19a6a7cc658bc686b947:

  Adding memoriam to scottrif (2020-01-31 08:02:49 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib yocto-docs/stable/zeus-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=yocto-docs/stable/zeus-next

Armin Kuster (1):
  Documentation: Prepared for 3.0.2 release

 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 .../overview-manual/overview-manual.xml       |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/ref-manual/ref-manual.xml       |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 44 +++++++++----------
 11 files changed, 83 insertions(+), 38 deletions(-)

-- 
2.17.1


Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.9100.1627050842909709550
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jul 2021 07:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j2roJtGN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id u8so3547039plr.1
        for <docs@lists.yoctoproject.org>; Fri, 23 Jul 2021 07:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WdM6Vxye9pCsvGRCxVbnQHF1HyVi40xUKJ0D70fbH+0=;
        b=j2roJtGNZtUo6Kf53h+RHqWO+qiChy85E9Nr0/Jr5atxEddxNqCAQjVZnAmMUvSE7X
         dz9tht2LJKecRNivZ6D5EPVX3IQtHiPiAyR/X2cYKwZp8CpC5SDLSU2XujveT9Ktqauh
         ucETImr/gZoyKESB3EyH2yqNDoVTlsl9H95+aarCbkwe34rXVUqy1wrtNZCmB6oA5k83
         uiM0G7Vuedah/1ZWQF4CQqFmQg5j2UmmGq7r6PKek5nOl6gR+PZtoZtgK7we7pPMk3IF
         TNNlwaS8ISO8E1+P2nlMjJZRrwFu8kk1xtGcwJxwCv/Q5H4oWPd3eNOFXDIA8F3Uy1eH
         Gpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WdM6Vxye9pCsvGRCxVbnQHF1HyVi40xUKJ0D70fbH+0=;
        b=oIArj4pZ/aFXOk0s5n458yJxhCga5ybV+B9rTXB2NE0tbbdWHP1BqfyuHn+kjQm5xo
         V6ZU+z55Y1Zbm6oqOyGMUANQby7qkCcT6fl7JEOpvaog1Q0QGtmfECGBmJZ7Czy6GDsU
         TlNJbt5Hm5ku0/RqSKmoaYL3Pzm0NVD69CmwQemXOEbCydSg1gjRcvI4HbjOSZLkeJC9
         cj/AC83Cg1Iynw5rV4X8GAM1MJS74ELU1J4Vro8Drz9e2MXXqFjYoQV7qsMcoa6PWLSV
         fahdedHGCKlDzWL3fkXm7NsODkw0fKrZzzunhXF7sOLNL8u63nTXApeW+Jc0XIq5xxnh
         pZMg==
X-Gm-Message-State: AOAM530qa0HsGFaTh3fd3obXU3/1NeN0uapksyr5Fo4OgnsNU4Og+2vC
	TY/VnFV/gPLr+eDg/EcdLhhuMMUhuSdQRYrF
X-Google-Smtp-Source: ABdhPJz2QmNjTsYOuXk3tOa7+JCCMYiK+9IzyEgLWzF6mhQ455UmFq1doVEXmXAD+itDZ/6q9Dhbgw==
X-Received: by 2002:aa7:9904:0:b029:32d:a034:eaeb with SMTP id z4-20020aa799040000b029032da034eaebmr4688574pff.24.1627050841661;
        Fri, 23 Jul 2021 07:34:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k8sm39706924pgr.91.2021.07.23.07.34.00
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:34:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/1] Pull request (cover letter only)
Date: Fri, 23 Jul 2021 04:33:44 -1000
Message-Id: <cover.1627050758.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0fadb292429b4147408798ed4c806ba6d9dd81b8:

  documentation: prepare for 3.1.9 release (2021-06-16 10:56:49 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (1):
  documentation: prepare for 3.1.10 release

 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 3 ++-
 documentation/sphinx-static/switchers.js | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.25.1


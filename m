Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.11507.1621614653143223208
 for <docs@lists.yoctoproject.org>;
 Fri, 21 May 2021 09:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qtYchIJF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso7891257otu.10
        for <docs@lists.yoctoproject.org>; Fri, 21 May 2021 09:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NutrPP7uX3ZiAiovWU+lZgXekbFK9g9Oy4kzRhQpYM=;
        b=qtYchIJFu3/s2Vqu3OIRfDM6OJys6HT50fJW7DO1mVWQ7JJYn86jLSegJA5wrwUm5q
         GUCskQ2KrS9FpowOeTitG/HnZajdp7e/SAP7fTTc2a6kwtquiH0nqfFW7mfLg9nE0NgX
         lrwkTy0iFZiec2wdhshvrLrSr6RCTRo8hvDc/y033tb8DV56gIz2M/5EZ8pXA+pRI6p3
         WpRYCG+dDtXKLKB8I1UY5fAN37pGDjSHOi/Awr1LsupaPhPJykB2a21rzxN+Qd/Me4En
         v+Rd1NOqXukSTcYvh8s+2Onj4uC5PrC6ZEIC9aXU604mxugb/ClMGVj701eNjZ+ACM7T
         okhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0NutrPP7uX3ZiAiovWU+lZgXekbFK9g9Oy4kzRhQpYM=;
        b=Oid/3DXbLoqwm6Iw8YwpJxRQiKDkP0zRrF6cFgJUAnpayWvDWVXIyJ7kB+jh5eN/ya
         hseQL5Nly/jNnmHhRQGdA5QuBF5myA9EmMdGg6ZzVS265lU3f9uaDIMmelBAqQEI8SOm
         DdwR42DngBG5iWOdKDnUmM1rA9vmcYvY2VmCu6FhUY6F9TF9XSMviqFDFFuEF3mtLKzm
         LguaRkgloir0XgeYSalRvLSuv5O/oU1uH+e0AGi+CBt8oGeck2/Rp0hDlXLg5oJLffFS
         NF8i7c6vbGdDYXBpr7kH8LEaeEa4lLNpDxCcbVtoPg60rU+sqfFTmC868yFPtz+P8vMH
         qUpg==
X-Gm-Message-State: AOAM531SeSBH5LvscDBE9GAhlr7CYDhsvs+RQhb4is0QjlSm1TFF4xa+
	CD6d3dlT/4l2E3L9SsOkTJK0I0SsnEXQJ+dkMK4=
X-Google-Smtp-Source: ABdhPJx4v2zVXMDP1L228U+fBYfKmBj7vOw3TvExilLJAB53M+peyeklCQiczXLoTL/C+lkDCgCkCA==
X-Received: by 2002:a9d:63d3:: with SMTP id e19mr8888582otl.64.1621614651909;
        Fri, 21 May 2021 09:30:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s17sm1280182oog.31.2021.05.21.09.30.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 09:30:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/2] Pull request (cover letter only)
Date: Fri, 21 May 2021 06:30:08 -1000
Message-Id: <cover.1621614507.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5a54200a8702e473ecbbc3dbbdaa24169796c9e8:

  documentation: prepare for 3.1.7 release (2021-04-06 08:43:27 -1000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (2):
  ref-system-requirements.rst: Add Fedora 33 to list of supported
    distros
  documentation: prepare for 3.1.8 release

 documentation/conf.py                                | 2 +-
 documentation/poky.yaml                              | 8 ++++----
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 documentation/releases.rst                           | 1 +
 documentation/sphinx-static/switchers.js             | 2 +-
 5 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.25.1


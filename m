Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.42865.1591032498518556721
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 10:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GiyHTiVX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 185so3806428pgb.10
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2020 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=FlWQYCJlaHkOxLq1N2iOcvA/m1NCjInZHmTrc3OLY5k=;
        b=GiyHTiVX1kS3xfB6XkWjUdxUgclwIU+FVZcgyy3fwoPoAnG2qZSfvYSSMaOjDg5COg
         zVtE+OpsgcXkCd658MTECcBy6z6OkdUMJW8tl39Ly9CVhlNW0YMrCGl0lxK+t2GmKcXO
         ehnJax2KbrUiFg165BBI4VvFOYIP5XbZXoxoeGNJGNT7M/UApxMtOgFrcfdxcA7cXu41
         DpvzYvUyd3VwII5KFYiWJxtr6qetsmBa0eB35/j4IDCMyIcnYV0wD+p2EUR7NgK56Ma0
         1cR0SmFElGNW4vuprow8iRSPwdLgnrLBdl/OgSPcW5Xw7047MIbJc3zflpIYpmGrmt8O
         /MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FlWQYCJlaHkOxLq1N2iOcvA/m1NCjInZHmTrc3OLY5k=;
        b=mIQ1WrgbDgw9KlKU5Wjyf4+uYxoNN/Ud5+WHRMCMKJEHDcCovfH+va2Fiwd+9vTmai
         FkcpsIk0pxDl0D7Zuo9hc7Ff329Wa3uPIGyanmPqBk2lY9s+GhZNAYHY2dnC6G7xAj8q
         cWT7b9Fj9SAwhNNKKqyqh3ZEoYOS784ahuCKqF8i/4JJfnB2tYa8vha8ychoXdLlyS1F
         JReNrRYKOsuzLEEeFVGMQAu60cWyCGRMshvxZ0Qs24Hhw7AKoINBV8df03xV4AdVg4i2
         AmeRjm8gGVwlh6FTNRZxjxFnOool0wZFB5xiiy0ZJht7Zmoqa+qDXjRljUnNmgF2J8bV
         Khig==
X-Gm-Message-State: AOAM5317z99rv9VPWVpbMoh7Z4+0LbpGcgXuCwSE4lHXUkCg4vYOI9iM
	fzUlPuetR27JPM+Pc+5LofFgqr8A/9s=
X-Google-Smtp-Source: ABdhPJybWYuBbvfYbkQr28fJXxum2IDIuyTOnWJBAGiet2HKanjOShXRgWJxd2x39wGVEMc2NEGRBg==
X-Received: by 2002:a63:e549:: with SMTP id z9mr20939459pgj.213.1591032497410;
        Mon, 01 Jun 2020 10:28:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d22sm92194pgh.64.2020.06.01.10.28.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:28:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/4] Pull request (cover letter only)
Date: Mon,  1 Jun 2020 07:27:52 -1000
Message-Id: <cover.1591032373.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

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


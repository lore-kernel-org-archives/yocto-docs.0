Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web12.1620.1623976040898165942
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 17:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C6sYICIX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id w23-20020a0568301117b029044c37262dadso2627883otq.8
        for <docs@lists.yoctoproject.org>; Thu, 17 Jun 2021 17:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SSqxapK/qLC1O0Z9Ye/a0eWYdX7sjdRs8v+BQAjJvIk=;
        b=C6sYICIX60fLZevOOw/JfIG1F4a/YLLnCV7M3L5eT5jzn731J2dpM8qk/FHTKQyG5J
         82bsWnOKSPNZPJrRYYK6ae+moKmO6rL7v5Lqu93u73sfyMQvDXllkYiRDENA7XU7qE38
         tAaAwQ+zaneBVDGShsmKfIp6Pqb4QIbrZEXuhztOwdYh7VevLsFiK6Nf4ObKLUezGWlG
         qYZYRg3WyOuile4ovEvgbnMmAVNwrrE1TL3sVUqLmLDb/tZvb7j28L9Glauc5DTOY+yA
         hsZYsUbhFZpU82iAoOWvIGSfwqO5jE0VVskNkGBKMHgbbitua1pzgfj3u3l0kBI7VQLa
         WQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SSqxapK/qLC1O0Z9Ye/a0eWYdX7sjdRs8v+BQAjJvIk=;
        b=HFUiQL38ZD0AuUbKPWY2kAuLoz03bYh7Po7vV1Uyq/QPVTdxoZljbVikawrWYBQIrY
         mKvvE18YnmY/4CuzgGNETZd+NYTv0Xu6ukqA+zb4NPmZoNmvqImE622aB64mOt4Ge3Pv
         T52zG7tLnvWvMv9P/F+UF8ZvIWbpJj9QjqnwH1AStVYG4nVWAo4kWh3Ul0ziW/ji6KDk
         WszOP8ZUeSJIirVZodRWqRsJhRQuhrXtlJDzah3pwE/MhFKqw/E4lB94XZc0pfUBXnG9
         tFMX5qCtPtcGjLJ8UF3ogZg5M5uVQgXhOgy9/AxvQNEGHBaYhcT2V1eF/EsP6RAQsZOA
         cVoA==
X-Gm-Message-State: AOAM530lY7RNbd24fzgiPTwhLdMhpmmXmC5qTYT6yWTrSmRtW0VnI8nN
	s7RQ+YT9xf+9gImDkFPn62C2Xu+32UwBqCQkQ2Y=
X-Google-Smtp-Source: ABdhPJwMLcDtPfuIQKO9h4iCpUgmoI7y8D4EgAG7F9Qm9Z7IV9RhHUY4IFt2CxNLZ6NtJ87iikMaqw==
X-Received: by 2002:a9d:6f93:: with SMTP id h19mr6743206otq.100.1623976039803;
        Thu, 17 Jun 2021 17:27:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id v42sm1607631ott.70.2021.06.17.17.27.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 17:27:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/3] Pull request (cover letter only)
Date: Thu, 17 Jun 2021 14:27:00 -1000
Message-Id: <cover.1623975879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 09b64a4d246bdcca62dddee152deef7b0dea69d7:

  documentation: prepare for 3.1.8 release (2021-05-17 04:33:02 -1000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Ovidiu Panait (1):
  variables: Add documentation for KERNEL_DTC_FLAGS

Steve Sakoman (2):
  ref-system-requirements.rst: Add openSUSE Leap 15.2 to list of
    supported distros
  documentation: prepare for 3.1.9 release

 documentation/conf.py                                | 2 +-
 documentation/poky.yaml                              | 8 ++++----
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 documentation/ref-manual/ref-variables.rst           | 9 +++++++++
 documentation/releases.rst                           | 1 +
 documentation/sphinx-static/switchers.js             | 2 +-
 6 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.25.1


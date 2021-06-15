Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.429.1623776322977419232
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 09:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W5AdCyKI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id u18so13715114pfk.11
        for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAFP+/FDCjbXfjNoTA/sdUbSft90RGKWw9gJO9hrlZ8=;
        b=W5AdCyKISBBohJUowjnFOGATQ/icHAXk8R2kEws7E2Nl87H3dZZZf/00rlrHAhtl1R
         XiNxQfiUcotR365ZyLszS6cviexUf1Y9S1vbSgMYXQMyLSTFAsEWLNgybKoQ9stH0Dmy
         ICzCoZjaBdXt0FxxzgKc+gqI+zbPj/UZKZ0gRXPHXD2GuT+qoXf3Dz847GWKSEy45tOE
         0XyWv3neyN/lk2xBgurdE1ogoT94gK9lvFNrFNVG0SnQTgd5NywkNK4EndNeuutzYyqB
         iB5SrlyHWIkXOENOVgei4AiZF1SPw9WuwOuvKevk94R/cwZBUe5RaWnk9zY4c3kegJTA
         tEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pAFP+/FDCjbXfjNoTA/sdUbSft90RGKWw9gJO9hrlZ8=;
        b=tcH2U3sc16m1DviY/KdeHF2HzGV0CkZqBjyyMcOHXwmX/1kfRvlFJBMHfyAN/SodRs
         dp3XQxi+0Ke8PlctHjW5AQadUuNxI5EAzPVIz9UGm8WfjDDyZ10NJNzjqCJBH5q/XPjP
         KsfTg5/0+VUqq9fdk84zk0ZV605kpiKpN/+jM9IPGvBHI8NkTc9cAG8SzDfDjeRzXeU6
         2Ss9kdzlvB+2q0GBzrtTVnrkvMfeeEdTx+e2Ji0x4V5WZKvTG66hda+1qqI/gJtLHsNw
         rp/tzklFg4TLkjY48e2T8DPXxLelk3GsI+r8w9t6t34dW2lsw8VTriJ8WgMb391ykCAR
         DmFw==
X-Gm-Message-State: AOAM531Vq24ftq6DpKTq2jQNz4aom+a2PSXxJPU9J9nayL/2o+xwepmg
	ouS1SaEmGnFxY9Lo6KWMQ5YeVS2ObP4L9q0xFyY=
X-Google-Smtp-Source: ABdhPJzxwSUJcUlI5z7mnipzgMLzXS90h6Sq11Usx+9r22kfh7gHoCo+FrkB2/4nHSEeTVbFruU0/A==
X-Received: by 2002:a63:ae01:: with SMTP id q1mr486261pgf.216.1623776321548;
        Tue, 15 Jun 2021 09:58:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id z3sm7862741pgl.77.2021.06.15.09.58.36
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:58:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/3] Patch review
Date: Tue, 15 Jun 2021 06:58:10 -1000
Message-Id: <cover.1623775736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this set of changes for the upcoming 3.1.9 release and have
comments back by end of day Thursday.

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


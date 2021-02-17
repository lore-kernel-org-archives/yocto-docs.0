Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.10099.1613579398428890219
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Feb 2021 08:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eJ0BonXp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id g20so7687753plo.2
        for <docs@lists.yoctoproject.org>; Wed, 17 Feb 2021 08:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU9/w+p4vXqkK7P4ULHYUp3xAcQ5G7lcvhf/qKwG3Ts=;
        b=eJ0BonXp1hsDhbcHYzqISgZFUwwJYfabSXxiQhvWq5MAwXCGIHrx4dsMX3Sbll07jc
         ubY+gENXyuA72dek0dpskGPZNdl6/rY/glSPX9avY1Fcrw2hdThxsIpbMxDYkE1MVvi2
         ACm64fBLmi65iO7Qsas0b68w0R/rhUG0bQBb74KubN/80ouf9oLm58L1OJSH1zvUoICy
         wMe03jZcb358qDDZtnIARajsmRAmDrxyz5NfFP+lDj6X3ik/3P+121eEWkZLZNfoS6zf
         izLUOvhPy4Th1U3Jd0XRpmu3o6oeZ/pH7Cr1xR0xH7XgpQ2yOBUtPvCGl7uSULIKw2oZ
         8Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WU9/w+p4vXqkK7P4ULHYUp3xAcQ5G7lcvhf/qKwG3Ts=;
        b=OxgNO11acGq5hnJVwygsEDffbNu5GRT/eYJ/LfpIryuLECb5tjl1Ix3eJO8cJJmlaE
         HF7fwwcWSfBfSKVES3i5rqPxPg1mt0KqceqQ/6y/HqM0M25SIIoJTcpirQMB7tp5PJY+
         qX4gNgGHgJB9sdRg+F6M7q58LbZl1nabBVTMEo+ItXBaG9Z9Xj0ogRlHMi55zEbiUcpi
         SpWNG92z8dJh3Cz2A6CCZ1GOq+O3zYt7DBZVCFlug+TwYVm7aaNxZScf/+roRMF/owMH
         76NHcZKRmaQ1JzRXphBUduj+cIwV+XMgcgIIfgftWy//a/THNc9BX4pHOasYD11dJZ32
         9+kA==
X-Gm-Message-State: AOAM530I+yoqmgIENixCoVgXwfpaUTVBMDjA6pHpJqLcQ2fp1dS3tZt7
	eDrD5/4cmHY+lVCn8Kjxm19xscy/yfcaIzMiQ+A=
X-Google-Smtp-Source: ABdhPJyG+dokAX1wgKVm8oeRBhz+nPKR/Am3PtvXdVHObpN1icXC3UAJUI46qwL3fmsikhrXQFk06g==
X-Received: by 2002:a17:902:e54e:b029:e1:2817:f900 with SMTP id n14-20020a170902e54eb02900e12817f900mr3118846plf.15.1613579397227;
        Wed, 17 Feb 2021 08:29:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u14sm2888478pfc.39.2021.02.17.08.29.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 08:29:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/1] Pull request
Date: Wed, 17 Feb 2021 06:29:45 -1000
Message-Id: <cover.1613579284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b367b2ece436cdd86f8408fbec1b263e03ed4267:

  documentation: prepare for 3.1.5 release (2021-01-13 08:51:05 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (1):
  documentation: prepare for 3.1.6 release

 documentation/conf.py   | 2 +-
 documentation/poky.yaml | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1


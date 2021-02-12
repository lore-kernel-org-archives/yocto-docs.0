Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.13.1613106050152374162
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 21:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AuwIxGbm;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: champagne.guillaume.c@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id e11so5937850qtg.6
        for <docs@lists.yoctoproject.org>; Thu, 11 Feb 2021 21:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uI3SW582Q/f82H4svYHWwt/Og5If8a5PhicmrG+OR4E=;
        b=AuwIxGbm2IRXthkUzDHzaEyXF5cbUClelM70X/rRBaphCsR8WnwW/6XIY9LzkllvXA
         8oCzvpT64mC1IHd2IhVC9NBAykFoynrWBiVrSkPGDjWBFD1sxjePd1ww6EsaVuWKuROI
         JfIF798jk63PkUWqfGP9caDC83wr0Q2NXI5CDfPFHG7d/1IG/MLG9XDXN9mR+IJs4JTA
         eirURHSKy+lFOH5Srnwu7FSPpDmXcXJY7L33w7SYKSMNOr+YwQtTkIZ6gYb2VOrxuPg8
         I+U+RNQts5UUR5ipkzsbQmUbe65FqylY6tGg5acTme62TkE4ZH6LFChUppfNMhf0/HhF
         482A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uI3SW582Q/f82H4svYHWwt/Og5If8a5PhicmrG+OR4E=;
        b=WziuxOI9vk178Tv7Hq+bwTcVh3U8/5Z/yr0Q1TQm+NwpJqY1a2nbHskY/zGhJ6ZxUf
         1DPXKOcCojf7Ioat5seGlO73fTTkyb/wMf+dS02jt8F44O2QzsSzQ5TYaT4kC10v4DF8
         idbVV7Qm0XwC+8Iiy5TxagHCY0/qCFQnUylQ8GLEHhdg7Dd4XPGrSH4hCzqgZgkFteV2
         buSBWoedp20BRSIwsKzNWFWZvxYLFdOK0p+pCMO2YIZTmw9p4uS+u3uzSxGqy27PJIRA
         bZaIAI87sYfNGqDbryopLA+SccccWET3BjD/ycE3SK1xDi1+5LcNFWS9qFajo10pGJ3S
         ukfg==
X-Gm-Message-State: AOAM531DP6fyaRq4H4uSnXU5PNstrgYE1jFEqXP1Fr03KPx/sO7C+zBh
	CXtvs18MlMfa2OP27rewdMfCJzuScKU=
X-Google-Smtp-Source: ABdhPJxgXzGycK04NmTtZ2GipB0A1dFspDLLUMNMZNJR0g6pj6UDbDeQ+zWFZruKwaSUefO1YV2kbg==
X-Received: by 2002:ac8:738f:: with SMTP id t15mr1037122qtp.106.1613106049097;
        Thu, 11 Feb 2021 21:00:49 -0800 (PST)
Return-Path: <champagne.guillaume.c@gmail.com>
Received: from gchdesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id b16sm4781199qtx.85.2021.02.11.21.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 21:00:48 -0800 (PST)
From: "Guillaume Champagne" <champagne.guillaume.c@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [RFC PATCH 0/2] update docs for qemuboot.json
Date: Thu, 11 Feb 2021 23:59:53 -0500
Message-Id: <20210212045954.18173-1-champagne.guillaume.c@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates references of qemuboot.conf to qemuboot.json. Should something
be added to mention that the format was migrated from qemuboot.conf to
qemuboot.json?

Guillaume Champagne (2):
  dev-manual: change qemuboot.conf for qemuboot.json
  ref-manual: change qemuboot.conf for qemuboot.json

 documentation/dev-manual/qemu.rst          | 4 ++--
 documentation/ref-manual/migration-2.2.rst | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.20.1


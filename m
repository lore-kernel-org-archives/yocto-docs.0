Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.503.1620838464029891126
 for <docs@lists.yoctoproject.org>;
 Wed, 12 May 2021 09:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZWTNsdiI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id a5so11923419pfa.11
        for <docs@lists.yoctoproject.org>; Wed, 12 May 2021 09:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JfGDc8kU+2DcrdgOU8yhVsH1wLPqEc7QjFdWd2aMsNU=;
        b=ZWTNsdiIIj9RIizTAcjKZAxlgPWZUcNbmC2Lzqz/RckBr7rzQeBCqR1Uu3TS6A7ZBl
         MNDgVTWzoLYdSK0C7e+AKw2m1q19VFg4T5WQ8ys+5RVolved6AT47XsZvw7lNsMSa9V0
         GCCZdvp3UUfF5T6RfjZLm07WVLeijyAc5pLPPCeSLdouBLVWWxhehyBIZCoLjlQ20Ue5
         GuedkX1j0rBaer60ucnLBJcDbtehjbqLCmXBfPL06/+CCrW5X263a89V1oINi8s4wm3Y
         yM67gxES/6b+CeCuFK6+sOiHHBjAl0v6ugvyQx9KaMy5gnYFF4aiY+Ym8ul+nDb56kvS
         rkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfGDc8kU+2DcrdgOU8yhVsH1wLPqEc7QjFdWd2aMsNU=;
        b=G54JX+SlvX2Xd+6GEZpER0tRtLpUdKh4FehCsEbLqRpcNL1BXFIFZ4NF7sYD+VrM03
         /e/MV6sLFyLVoAI286m5q2KqTcphLaecP2cbsoUUyZK9lvmVMxPEE7x4en8oiXKGT1TV
         P5ZZbPHlB9GrC5CkEGScNjeQrJbKv4gTDzla6f3pp/Ky5kA+5CyrjGvLvsGp25WAkmG8
         wifhsjHbjUVSSUp7g/ylML1+4HrSWIm/+VdbVxbd7Zy/woAb2cKO3SxfIolub2b9sOHM
         FI5Xrb6fWfGwevLyr4iWq/D+Rson2qgplY1Hkq2LnGlopH7P95jOkhlffSnDrPa+URg/
         ZSng==
X-Gm-Message-State: AOAM531nrFIJWeX40pChNwnGh+ewzCAdrOhdLhAMlQ75+xHCO97XXqZX
	YQJ7OxGGiQPXxGlxkBvE4NVQs2GuFEA/lB4gLfU=
X-Google-Smtp-Source: ABdhPJxdXrzxanJpFwYgTCaYHeku1th/NVkZqxunR4hZXwDu3RLRM88hznU1sh/bkAhha+rgjnFTGA==
X-Received: by 2002:a65:62da:: with SMTP id m26mr23637522pgv.195.1620838462885;
        Wed, 12 May 2021 09:54:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q27sm311493pfl.41.2021.05.12.09.54.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 09:54:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] ref-system-requirements.rst: Add Fedora 33 to list of supported distros
Date: Wed, 12 May 2021 06:54:12 -1000
Message-Id: <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1620838359.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620838359.git.steve@sakoman.com>
References: <cover.1620838359.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 65234d072..bb688772f 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -55,6 +55,8 @@ distributions:
 
 -  Fedora 32
 
+-  Fedora 33
+
 -  CentOS 7.x
 
 -  Debian GNU/Linux 8.x (Jessie)
-- 
2.25.1


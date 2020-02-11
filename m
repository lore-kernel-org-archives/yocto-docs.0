Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.4796.1581388802845790909
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 18:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PGYtnM1O;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 70so2774602pgf.8
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 18:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=qJ/FxNI25q5ILC88zoD+7OP5wvgeDvVxvQBcCbinkH8=;
        b=PGYtnM1ObNblbSzkApKKWIJ72PzSXcjQa4wllWxCd6gW6bETYLZTwYovamgXp6sUlJ
         qVKlF/1Wm2zESneDsDVAUUCPyrTinyiE5aqU7TLblskseN7iB0MDN2VTJ7BvadJsEjWh
         C94NMEYIngeH/qj5pBbGNWadvzk/GybylzOI43oAorPP6BFrUMKVrQycvbEtI1J4WvY9
         Mvilig6wPHlp8w1FNO831prsLVUmMSsbHOF7XXOCv2t3RPs952D/TkFXQHxqosWosbem
         JI6ztZKH5waisGPY0vwFnCXxWImUaeeD2zUaMY8B8pmUcG00IciHtKdCXmmSjxRPTXiD
         r2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=qJ/FxNI25q5ILC88zoD+7OP5wvgeDvVxvQBcCbinkH8=;
        b=lpfX3acD/iusJR0dCqVzYpudxaCKAutVzYqsRpB38IuuPrAvCC9Lgk4VeltzXo4qHC
         YQFhdzlvn/Y6HhhJquSn3s/q4nTbz2F+lowKutIk31nalWOaI3Nn+YGDnvL/rPxgzb6E
         N+YiR+6CFjI37oeHz8MhCsZOjq5BxclInsk+AYE9LH6ON16W8tdvAkQW6a05GEAplhd7
         V3+o4pkimqwrHghTuoiLggjJpQYTyhEvxgo+XWZ+n8iza2QBcUhsuZ5iPh38SJY7qRVU
         FBjG3ll3iFvaRD9HZt7IVogeItppiDvx1XJ27/nnhzh/xaBCav25gcRcROJsegqM2SOc
         9Thw==
X-Gm-Message-State: APjAAAXDwAYphmXzzP2fQCB2Jm1WdrKuki/Gfh1TTzP7+C0HkI+HRuIQ
	yxda7ztmK14g2dopb0QSgTZ6XkWJ
X-Google-Smtp-Source: APXvYqxOOjPZOYmFQjkl5zsc/1dmTh1SUrjS3jW2nTdNwF20wvmS8SFz91ZT/s8hOYRndw4xSR5ljQ==
X-Received: by 2002:a63:ba03:: with SMTP id k3mr4892924pgf.52.1581388801915;
        Mon, 10 Feb 2020 18:40:01 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id v184sm1798884pfc.67.2020.02.10.18.40.01
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 18:40:01 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [warrior 0/1] Patch review
Date: Mon, 10 Feb 2020 18:39:57 -0800
Message-Id: <cover.1581388725.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Changes for the pending warrior 2.7.3 release

The following changes since commit 2259d897aa996a996656f87d39cafa52c40c652d:

  Adding memoriam to scottrif (2020-01-31 08:02:53 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib yocto-docs/stable/warrior-nut
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=yocto-docs/stable/warrior-nut

Armin Kuster (1):
  Documenation: Prepared for the 2.7.3 release

 documentation/bsp-guide/bsp-guide.xml         |  8 +++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/kernel-dev/kernel-dev.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 documentation/poky.ent                        | 18 ++++----
 .../profile-manual/profile-manual.xml         |  7 ++-
 documentation/sdk-manual/sdk-manual.xml       |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 9 files changed, 74 insertions(+), 40 deletions(-)

-- 
2.17.1


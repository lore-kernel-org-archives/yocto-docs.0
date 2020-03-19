Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.398.1584662006152529253
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 16:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ndQELj9h;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: cengic@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id t21so3116002lfe.9
        for <docs@lists.yoctoproject.org>; Thu, 19 Mar 2020 16:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T0JNhNZbLESynaF2d49OHrjaRg3GjxbjuHSmWEStXr8=;
        b=ndQELj9h2ufSGqutdkhq0TqmNwVNR0K3aMqD1TWSj+6clxACC3WFzIJ30PCwjeEDrx
         HF6+WnL1s87xCsqzbVjnUsxNBIQNYk2/34ApyOL8WNeHJa0PCTGCFiwL0jDPK7RX/mr6
         vTfMgDPvIwz9SyDZb03DWO5qwWtDuPB9p9fE+MuVrbROO8y1+gVJimakFxAZ1Bf7jhse
         C8Ef4PTSXm/DLZ5cqd9eTwimR/4cS1T52rX+Q7wUx6Ney4wHcjU4yT+Bl28yWWZWULUd
         krgvR43XdD60TTAG1K/EoB9LxwwvyiPfG4vCSwf7Kc4R3FUGY4kyEqNuD/J14s8icehz
         6mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T0JNhNZbLESynaF2d49OHrjaRg3GjxbjuHSmWEStXr8=;
        b=h7T8v+q/kuDaKOJQZ/+jJzupCEbh59dZIlB+5EwwWWq4L4esTzsNaxKjXDLOTkDVxP
         wb2lq6LCooTw7djVE5+p+prWD7V66BYBfkq8ccbtBbsW4gut8dPEXwbLgIts4+QtP2cG
         nnkEQ/C8LB2YUA0n9QmcO5ueipueFjk9B6MQa+gA+AXNbJTEsA2ZAPR1aXVhJ6dyLbAD
         m/b2+NPNu/CLWkVY9tLv3EuZFYE22D0wVbimndvbg6dnyh/WUwUpE0ZxT1sR3FRZF72h
         Pfe6ByNGA9pBFW8nFw+Jd2BNk3cyfRziXK56SrDwCdOwtg1pwGOrN5Rjcth0/b743Dzy
         ebbw==
X-Gm-Message-State: ANhLgQ3QFU+wH50heiK0xTiQLA0ccBsi1TdrksJ4h3R/zVJEhX/OmoAH
	tzrrXg4fvcGgTJKjZeFpbFEEJy+rQ38=
X-Google-Smtp-Source: ADFU+vsWXdYf82oJsHNs5GxCWwlf/+hb791u1a51P/TTLng5Rlkw2AkUSslbFTGH4kKbWOnJaIhWtA==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr3603549lfg.50.1584662003981;
        Thu, 19 Mar 2020 16:53:23 -0700 (PDT)
Return-Path: <cengic@gmail.com>
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se. [83.248.75.173])
        by smtp.gmail.com with ESMTPSA id k63sm2372598lfk.43.2020.03.19.16.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 16:53:23 -0700 (PDT)
From: "Goran Cengic" <cengic@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
Subject: [PATCH v2] documentation: add rpcgen to FEDORA_HOST_PACKAGES_ESSENTIAL
Date: Fri, 20 Mar 2020 00:53:19 +0100
Message-Id: <20200319235319.24218-1-cengic@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On recent Fedora the following error appears without rpcgen package:
  ERROR: The following required tools (as specified by HOSTTOOLS)
  appear to be unavailable in PATH, please install them in order to
  proceed:
    rpcgen

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 581c87679..fba2a9123 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -65,7 +65,7 @@
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm">
+     python3-jinja2 SDL-devel xterm rpcgen">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
-- 
2.21.1


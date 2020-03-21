Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.11333.1584807929753535770
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 09:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iZ+BIklX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: cengic@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id c5so1437108lfp.5
        for <docs@lists.yoctoproject.org>; Sat, 21 Mar 2020 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O22ai8S6FhjEYqubrqnmYk8PwDcQwNa5FatxQrL9jOw=;
        b=iZ+BIklX6+1OxJm0qvK5HMUwIi1Q/k/f90OSVHqXumYraWfEvAnWJOfgdOZZQ2zzRZ
         wPU5hhl/gRMmSikFrfCBUsL16lYjdVOm7I8Cz1uCciaPKxkbnZlAuHHSasiRZRk/W3yN
         v7gytmJ0X4eB6WFob9tY7jIpUUuZAOwLaL0+epmKuvn2INsymIettYx2Zo6WgGA4q8AT
         12c1/CIyipYyaVZbzz0Hplous6Vva0VK3dhlgIldrRa8Gpg8/vDwK2ol6NpOpZsF99gu
         uTAVjdtGYxStcw210DQM0AbNKLyOkA5fuYuj6pyYvL+kiws0nWYqlJjAP7EF2J2jCngN
         84MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O22ai8S6FhjEYqubrqnmYk8PwDcQwNa5FatxQrL9jOw=;
        b=UV+zdM90q0ClUUkqsJtha7nPLDIrxtEN9cRDvbf1T6Wbcd7d40dUNhglbZXHSgKFMR
         SvcMxuBlxkN4pf3HmrI3n8IT+EuQ2tRw+33/34XuIpqJrPeiQMG3fkmisfzzctPJuao4
         CNhyJFfkLVAYU8qkubZe+iSnTklzRS/t3ZeZcf+cxxfBTBFcBWKIkfX+1RULKwh7R5gG
         wypeZ6TxoeqnR4b9lQadRLmSPIG88UQ31qDSz3KqEx6Emf602P0r1osh02V9+AET+bVp
         4gwMXmkRHXBM7QqK0SzQNqhvxLhS5RPwMYqOrwhav1cy4Rh0VZyPaPKEV6Xa6H6bKiIC
         b0Ww==
X-Gm-Message-State: ANhLgQ28jytYoA/3iTFvaWowB8AH3GwZSwmzfB24Fg2ymZFSO8hIozVz
	uTIraZb6YFqnTMDUws+DQ95I8vj3dIQ=
X-Google-Smtp-Source: ADFU+vtVC2Rufze/WYBAul8EhdMQO3tB6TZ8xxHnoLRkPIAFcbOpIHXv0Dk9lj8o8u3C+FFnkRqagA==
X-Received: by 2002:ac2:4476:: with SMTP id y22mr8248341lfl.61.1584807927637;
        Sat, 21 Mar 2020 09:25:27 -0700 (PDT)
Return-Path: <cengic@gmail.com>
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se. [83.248.75.173])
        by smtp.gmail.com with ESMTPSA id o4sm5467428lfl.62.2020.03.21.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 09:25:27 -0700 (PDT)
From: "Goran Cengic" <cengic@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
Subject: [PATCH v4] documentation: add rpcgen tool to required packages
Date: Sat, 21 Mar 2020 17:25:24 +0100
Message-Id: <20200321162524.5854-1-cengic@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On recent distros the following error appears without rpcgen host tool:
  ERROR: The following required tools (as specified by HOSTTOOLS)
  appear to be unavailable in PATH, please install them in order to
  proceed:
    rpcgen

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 documentation/poky.ent | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 581c87679..eb5de9514 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -65,11 +65,11 @@
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm">
+     python3-jinja2 SDL-devel xterm rpcgen">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
-     $ sudo pip3 install GitPython libSDL-devel xterm">
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen
+     $ sudo pip3 install GitPython">
 <!ENTITY CENTOS_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
      $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
-- 
2.25.1


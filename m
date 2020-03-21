Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.5995.1584790719252293422
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 04:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nCt1UTv3;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: cengic@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id c20so6561124lfb.0
        for <docs@lists.yoctoproject.org>; Sat, 21 Mar 2020 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fHtBmzflbtXVWjTCCxixpUaX/QwJ1aap9sgmAdI6RE=;
        b=nCt1UTv3tdSrkWa3W1BGBQ1WdTrpbyXL3TFwMJQ2ZEJxAETOPfb4ak32UbMsYOAPKw
         UnpKcrkABEGvj+FBIr+m5z1AcBoQTHJ/ukreAB77/B7p9CFQpKNcQpGoqDOMriyMjzN1
         BzffbIwP9kLrWfyqRiq71Tcir2f0Qvv7thFWk3/ujrBQTJ7YJZaWUK9H9gVZRCZrCFUW
         BHfbeU4UcpbW2TU0EpILsVl6Qy4zMBUZYrWoOvVmH1hSelwkDawTkPIVZiaKYhyk5w3h
         wG7JudSfY6QqZf5uf6W1K3ZxB+LwBCIfe/fJchVi/w2UO+RMPM5NTNSiy/FCDSzxo1W5
         wSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fHtBmzflbtXVWjTCCxixpUaX/QwJ1aap9sgmAdI6RE=;
        b=G6wwlx0VkdKGz7oP0G73H09i7k0EU/QtMJ2gDLgcBd01NQay41OE6CQuLaZHIbZyTM
         5JNpDwwA6B+f/MkvqYZB8wSutOeqDCAbayU7q4+AruidnZgAiU2q9K/wpgccAM7cSGWL
         i8zCdn9gS34DZueBVPy0ZhfsY07hWnZy6nCP7bgTr3Ru8Q4Hr5vws1TNRQ0NWAWE9GYW
         +SnA7BaB2I8/OQODi5xmnM2zFP7cKDrm2kwSk9geSvnBZYsmwkMCA/MFfGOD0so8ugDo
         K79ML/z+STz58D1UHPxeiOr3zlmel/RW87PnjBLgHOxRY8jI+E95sMQxjfscem9Lu6ZX
         d/5w==
X-Gm-Message-State: ANhLgQ2c4UYC708Txm6gN4BRFysaxKa4ymn9CUSEwWcQTUxErnvF2IB6
	bhMcdIPDPf2nApCSSl2fsadZVxqYEes=
X-Google-Smtp-Source: ADFU+vsD0HfdgV91k7RFQVRY2U5Nnym6Yiwol+xVWwMbTZQTwSkuPZXncTn2R5GdgxLrksPYTIBxog==
X-Received: by 2002:a19:6f07:: with SMTP id k7mr4385099lfc.79.1584790717124;
        Sat, 21 Mar 2020 04:38:37 -0700 (PDT)
Return-Path: <cengic@gmail.com>
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se. [83.248.75.173])
        by smtp.gmail.com with ESMTPSA id l17sm6128923lje.81.2020.03.21.04.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 04:38:36 -0700 (PDT)
From: "Goran Cengic" <cengic@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
Subject: [PATCH v3] documentation: add rpcgen tool to required packages
Date: Sat, 21 Mar 2020 12:38:32 +0100
Message-Id: <20200321113832.4256-1-cengic@gmail.com>
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
 documentation/poky.ent | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 581c87679..205628e0a 100755
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
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
-     $ sudo pip3 install GitPython libSDL-devel xterm">
+     $ sudo pip3 install GitPython libSDL-devel xterm rpcgen">
 <!ENTITY CENTOS_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
      $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
-- 
2.25.1


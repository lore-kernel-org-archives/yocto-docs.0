Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.162.1631200159826924468
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 08:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BtwUsi4P;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id m26so2035911pff.3
        for <docs@lists.yoctoproject.org>; Thu, 09 Sep 2021 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8NOIl6FgzpkgaH/OWhMUpqbZPNh9jBdml08PrsioaQ4=;
        b=BtwUsi4P0gDNl0rPVA7Q8qv/FS4xOfYAdp0s6ZBwUdef6hOdmWaPBK8sgJJGqjIEet
         CtL+c8XWdav9wFvjRxf6MhSGohTSDtlE9/64RA8mFgEWrfbQRlAjrtwx7FZ5o5M+Jl1f
         0zoadnvyyKbem9CWn/NSB2TZhMD91u9cHwrKd6reQBYfkwBYATthY8mRTM31w+qJn/ho
         E1S25tup53v6Wrocpc9BBSA++mdLZioSC40Qv1fIfrndT1r/vE+xUhcvyOhgyd9hkxlY
         bAtxlizj9yl4NQdkfUJH5vODF0TSwzXIXD5T8mRPZDCtWcAEkigVbhwIb+rBqAEDzlm4
         6sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8NOIl6FgzpkgaH/OWhMUpqbZPNh9jBdml08PrsioaQ4=;
        b=EYiZZQGWUecC1SnvO94IKhkPPkmTTkX1cUeY3i6S9c+/igZx+xUgs/kFvheMXLSwig
         C37Z16cYYTCw0jiQr6Ukx/A+OBV5bhpwhqEOotfTRUHcRCqGGzfeXHfY0D3O92POICJM
         bTbq7V6jjsie1v0HCML0E16YWya32SDVXS44VJOWm8xHedaDz1f4e73iI2eUxExQFQsP
         ViMtue0P6sJ2N56bBOk3QV8Z0zi9rdPUIPYEV4o8dCNCSGlZhEz006EkPsvBv1qocmIL
         hqyVF3kUUgU2GZapomsVZ21stjz0CCdM3o3P7n4H83uc+9r4qthTrltial34xo6k9zz+
         TyDw==
X-Gm-Message-State: AOAM532m1mgroQJTn30ecSIrX1jORxTbKXGP8rCCmQMCqlSIo12HMn79
	QjUsxmMJqesmP9LCb5JWznrXYumnUeI=
X-Google-Smtp-Source: ABdhPJxxjXH4+NlT3CIAOpNkCMXcfa5u5y0J+A+aFLmaWGbPM2nDd4iQFR8pNFP32lrQQzFjFqL2zw==
X-Received: by 2002:a63:f946:: with SMTP id q6mr3113878pgk.42.1631200159096;
        Thu, 09 Sep 2021 08:09:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:415a:31fd:220:5773])
        by smtp.gmail.com with ESMTPSA id fy2sm2615501pjb.11.2021.09.09.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:09:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH] poky.yaml: fedora33: add missing pkgs
Date: Thu,  9 Sep 2021 08:09:16 -0700
Message-Id: <20210909150916.3299739-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Yocto #14188]

The following packages where needed to a fresh FC33 install
perl-FindBin
perl-File-Compare
perl-File-Copy
perl-locale

Error seen:

openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
Can't locate FindBin.pm in @INC (you may need to install the FindBin module)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
(cherry picked from commit 5b4127dd72a465ff8c962c425e78140ca8e536db)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/poky.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 17426567a..bda8ff123 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -18,7 +18,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
+     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
+     perl-File-Copy perl-locale"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
-- 
2.25.1


Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.129.1631200124564860725
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 08:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrEXjU9P;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso1701938pjh.5
        for <docs@lists.yoctoproject.org>; Thu, 09 Sep 2021 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6T9Zb4V6vstaJeADKMiwXWQbp1Vza4zMiFkGNBo8hQ=;
        b=qrEXjU9PuDv8AdzK5Bz9pU6zVc7m12lC11Xws/Rrk6BcLioSKU9hdIN2mSCbT6iEVY
         bFBh2TDPf+NqVG8LOFoXCfUfLu0exZMUJSWBMUH2vqBerH0s7EFXMGePg1OrXq7iCn7j
         H7V10PxMV40D4g5iZsyRB9BxDPFndHzGggTQA6em9kcht5OvDay4A8soMdl091puNcQm
         mHoBjsL1ItQv0VEy62b3h0DILeWkfX42zWmrbjoEO3uIUHj2vHNpBTEp9KKL5BeFPbuM
         hpAGhq2fzLqUEGxk4d7wZromAZRa1wVEie3844lIqqYJGonLiaJjV6LCa3gGSmisMtHs
         GOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6T9Zb4V6vstaJeADKMiwXWQbp1Vza4zMiFkGNBo8hQ=;
        b=e2pWfZEf5uwVdvjyTJyYaq+2OZpj1gfnjgRZaB8wfqc2MRkcqHeAYY+BeR9svSO/3b
         +9mXHCtwMjyDbX63NsBDnDr6szlFasrHKyvUqADNF4bVtLOdNNSL853Hq6QKBhgztvo+
         TTh8jHnUQ12FZyM7/fKqfX48R5TzDptHq7QENGYT6lNjMD6DPtDplAjPv3o2J/u51xxo
         f6jPqAfnds7gf6l6pT2j2Z/nEL4XpMiEr5qCKw4xXVDqaRlePxxMrl1hSPSABpj7oi2l
         cBQeqrp7rAMrb6QAErssUINaCgrjniKp8NdasHqtrHLkWIyYe8E02lDr0nBbSPcG7t23
         V6wQ==
X-Gm-Message-State: AOAM532bQS8PwA9d2QFyEA9LjZITEjbhGD7TAS2qOC4DLWo/IV/asIsV
	X04qSYJehiG39cpN5HsizvU8LD2M2nw=
X-Google-Smtp-Source: ABdhPJwCRnwUZ511B7rPrF+5v2qvAE1C21ngaBsmcjq+A0wAEgXomcWS/o5EJKjuRj0wLxGjjFUKGg==
X-Received: by 2002:a17:90b:1c10:: with SMTP id oc16mr4210265pjb.1.1631200123770;
        Thu, 09 Sep 2021 08:08:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:415a:31fd:220:5773])
        by smtp.gmail.com with ESMTPSA id n22sm2585702pff.57.2021.09.09.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:08:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [hardknott][PATCH] poky.yaml: fedora33: add missing pkgs
Date: Thu,  9 Sep 2021 08:08:42 -0700
Message-Id: <20210909150842.3299672-1-akuster808@gmail.com>
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
index 02c9bf3dc..7207df142 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
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


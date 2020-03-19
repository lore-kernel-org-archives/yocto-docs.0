Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.563.1584660199028405041
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 16:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VqRz3gfJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: cengic@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id n20so3076329lfl.10
        for <docs@lists.yoctoproject.org>; Thu, 19 Mar 2020 16:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMsBLrRUNLV1pIgFv/q+doWcNL3Ow52kamvQPHJU37c=;
        b=VqRz3gfJumWgZQVpgNGYS5rKcdmK+ir6hea+VFcGmxQ6lRYBGSNURecsu2w0liYSRE
         eg7Onc/4lTMHCBtC+ng7MNGNDlpKTqtCiFSCgJplf3HGCk8PkmbWovtHVa7k56fyzo6l
         rXNSpsufqbMSb3mXgtPUqkqe4dgYjb5/3bVN6SP3nUH6Nf60AXfgOyoYiOyJbDJM1rpw
         MGJshb88B28qaZWHrnR1oLlDzHwWVpupvf4Gn5IVD6G8vvym2D4/JYYXMxrxnBZvK78W
         pWIlQCTUA6EsKoF64mpCiAZF9ta2nueDd6XX87NtrMjhvMtfxi2NROifkEQZKMTVUFXd
         GXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VMsBLrRUNLV1pIgFv/q+doWcNL3Ow52kamvQPHJU37c=;
        b=lq32qOP4bKzh2lzyaRmPpQ4jji5ILH5HKG0nGddVDI1IthTilzm7aSea5FzXFHvSCP
         q1eV4r+vII+fyw4nwGpY8qKuLTRekYH22FZNQ5b2L3aUhHsK51NVreLBsCvd+uJiuJh9
         BrvIL5ThWsMhZbwZGQ+rqEOkQpgmeotPmya0DtP+kDBwic+f7v1bA+VsiBv8942o66NN
         jDFKhgWewVmJVRBwF4RHte08oMH8iwrX2WgJ8/5lT9gnEhOxr4q29qRCTroZqQn/udxu
         rXMUopk7sDLgRdHiOrfnZJxhS+J8/hOwcLAUs6SEx7+zzo3g63Fx/VgLZCDN52AUGS6H
         nuyQ==
X-Gm-Message-State: ANhLgQ0eA7BwRXnpDyUym+a+WMbVb9DZ4EbCO6uclOzqK9NGPgxNZhgs
	dq9d36aVKN/J4jRvqDaSOC+yUMZASag=
X-Google-Smtp-Source: ADFU+vv7tfC+p4RkZJ7pDV7KmEyehA0MjaWwy72J/GfkFS+PK1U9BEYN4ilFHd6jo6LkTUPYek1iFQ==
X-Received: by 2002:ac2:4201:: with SMTP id y1mr3559224lfh.92.1584660197110;
        Thu, 19 Mar 2020 16:23:17 -0700 (PDT)
Return-Path: <cengic@gmail.com>
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se. [83.248.75.173])
        by smtp.gmail.com with ESMTPSA id p27sm2664472lfo.63.2020.03.19.16.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 16:23:16 -0700 (PDT)
From: cengic@gmail.com
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
Subject: [PATCH] documentation: add rpcgen to FEDORA_HOST_PACKAGES_ESSENTIAL
Date: Fri, 20 Mar 2020 00:23:14 +0100
Message-Id: <20200319232314.2038-1-cengic@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fedora 30 and 31 the following error appears without rpcgen package:
ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:
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


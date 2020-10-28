Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web08.7299.1603884598891978980
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VeFypbxv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id w23so4204413wmi.4
        for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2020 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxGeRoYbP2bZ6+2DfFZme+oCa59U5LpuRoJR4aQR8mE=;
        b=VeFypbxvkG39zk/Dk3VBuflCoVvoOsVswZZ7iYOlfaCeBACNY9QZY3au8W9hho+rCV
         tR4Cjs36eTRGRkrot1R1w3EoM/uRouVsW+qL4iHfdhHoFgg0dFuJWwdMgK5fTu8Ibuc8
         xtyeprZIDZ1lAFekB6VAIcIrvK+p80/x2OooU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxGeRoYbP2bZ6+2DfFZme+oCa59U5LpuRoJR4aQR8mE=;
        b=mVZBJZLJGuRP9PHuk2kc2YBlL/NOo+WzMUv5Jhsv/A/IZXCrmzZwsRSfzYDoaocIkA
         wniPa+95WeBhkR24smaCtHKwdQrS9DDYq5++iGfX3DkiVZ/FuLX9Z5cn12zpFKM7hP+E
         rwazpjV6RxTvNGMcyOj/UQ6dBV1Ghzfv9lHhMOPdt+CPcW6WqIbSUvnEoP/ekDCeOwOy
         0k/xd7goX2ikO6aT/cLj8zu9FSeCQPCfJvV5SdBediqsHfjcY25YlDXXHo4lGQWkW3cj
         jGl2aC2gcDui15a+sJXjAT6MYJS0+z39+ks0bb/51qpn7dfXTA8TvlYxeXCUrVrVf0nf
         iZrw==
X-Gm-Message-State: AOAM532s/j40o6wJR2JTR2/rKJCqdkbJujHBrBpHpztN+b8h/PlTBsCD
	B3h2LhDqH8hKVx7p/36/MH3WAHtkNXZh/w==
X-Google-Smtp-Source: ABdhPJz2H2g6yNbkfhD5mzpV22/f/u87YWRsqEm0E7NADnkpiStT6eESWbk0W9aroJe3VRzhQe+Z1A==
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr7648491wmj.170.1603884593983;
        Wed, 28 Oct 2020 04:29:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id q2sm6402685wrw.40.2020.10.28.04.29.53
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:29:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/ref: Add entry for why binaries are changed in images
Date: Wed, 28 Oct 2020 11:29:52 +0000
Message-Id: <20201028112952.172577-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 7a1614028..b79ba0306 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -451,3 +451,14 @@ variant. For another example, permissions errors might be caused by a
 Makefile that ignores ``DESTDIR`` or uses a different name for that
 environment variable. Check the the build system to see if these kinds
 of issues exist.
+
+**Q:** I'm adding a binary in a recipe but its different in the image, what is
+changing it?
+
+**A:** The first most obvious change is the system stripping debug symbols from
+it. Setting ``INHIBIT_PACKAGE_STRIP`` to stop debug symbols being stripped and/or
+``INHIBIT_PACKAGE_DEBUG_SPLIT`` to stop debug symbols being split into a separate
+file will ensure the binary is unchanged. The other less obvious thing that can
+happen is prelinking of the image. This is set by default in local.conf via
+``USER_CLASSES`` which can contain 'image-prelink'. If you remove that, the
+image will not be prelinked meaning the binaries would be unchanged.
-- 
2.25.1


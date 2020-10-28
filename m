Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7361.1603884691804347316
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B/YPd7Xc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id t9so5256341wrq.11
        for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2020 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ0rMJwR0Hjwvk5cqbOFBm/bYgxHPVc9Tswa90dbrBk=;
        b=B/YPd7XcR28lofAkDHBQkry+C48TQDv1aDR7e4zTqUZd6IViiGpAfGQ3XrwOmixpG9
         b1oFgDFVYUv8xcfRt7utSqqwMv3u72yNYIQqqaX5h30XtrC5uhGe3E4+Je9cM2WufNDN
         OSWKDC56gou0DmqiLuyT4/WIfxR91/Jy2enVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MZ0rMJwR0Hjwvk5cqbOFBm/bYgxHPVc9Tswa90dbrBk=;
        b=sGO2aPoVru3AJ10Z2Q0m4G4+yMStXugj4bFoDEdQg+AqMz8E0N75O5+o5nNt5vmq8r
         zRhgjk++5fIHLmlv7xh96PC2C6FDXmbnaAxA4RBLSPZ9WdR681IQF3P/W/BmkmOAw/hk
         KjeyogVh7pJL/3JW4LGP8gbppWr+aYGq+LnqLo/Xsaxk0x8i04Cq4UBs3M0eHE59Mlh8
         FbvVppufORDtF+uh4HzEg3ulCu6dZ44vfxpWC4wP0ecUgCA57faXlVXWL6JzOJXYfdoy
         VS4BEVETdOvzu1oq4a/CXO824zNXeNqKQW2INT3NVoCYougI79/LTv2vKRthWAbrV0nn
         TOOw==
X-Gm-Message-State: AOAM530WWkw+I/gtmCJQktMk1I/CWc5QRWBX4/hqYAk2Ef46N/rwftX6
	i19+7Le/5L6Pfgbstyt1lYH9wWbowH5Y3Q==
X-Google-Smtp-Source: ABdhPJxiK09XhcfbXnchY7x3Wd89lyaWQd1lpZPw9V47pUtLFrps453TMLBsc/FKKSUj7S5hhBspOg==
X-Received: by 2002:a05:6000:1109:: with SMTP id z9mr7674484wrw.388.1603884690227;
        Wed, 28 Oct 2020 04:31:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id c1sm6583273wru.49.2020.10.28.04.31.29
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 04:31:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/ref: Add entry for why binaries are changed in images
Date: Wed, 28 Oct 2020 11:31:29 +0000
Message-Id: <20201028113129.173789-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 7a1614028..c602a137c 100644
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
+it. Setting :term:`INHIBIT_PACKAGE_STRIP` to stop debug symbols being stripped and/or
+:term:`INHIBIT_PACKAGE_DEBUG_SPLIT` to stop debug symbols being split into a separate
+file will ensure the binary is unchanged. The other less obvious thing that can
+happen is prelinking of the image. This is set by default in local.conf via
+:term:`USER_CLASSES` which can contain 'image-prelink'. If you remove that, the
+image will not be prelinked meaning the binaries would be unchanged.
-- 
2.25.1


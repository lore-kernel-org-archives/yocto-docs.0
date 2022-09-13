Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F2DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:27:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.6059.1663082836537485377
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 08:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NG4DezBK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c198so12077701pfc.13
        for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=dM3SNVDoC7Qnrux7PF4MewEKHqJQmh/VsiGV6bETgME=;
        b=NG4DezBKt8aDuvp03vXRvwj3P8wP0CA3F3yOCJ3FaTPbpBuajEfUbV+BbUz2KnFHLE
         8QVb5+qNp1sSEPVN5jtlRjq3snASj/i7Herd4Gi+XvcO6AeGmhSQwoOepRmVQ/hzmz7C
         hQspZ0kjrwN6OmjuZFkCUcyM1OsmRX5vrd2R+0PzmxTA7bPDoBHi8f54HI54OraVDNzU
         g14CkPDkP7vow/LelFvNe2LhsOQP9c3NsizeaGp2nqT3sPfoFQHACFpv5a3iQLsKrFwv
         4Yg/hV6ZuLHFsDv7vbYyqQzYUTKKm5EGXx7KxOo85E13BxSls50w7OkAOqAxMZFa5rFZ
         ekzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dM3SNVDoC7Qnrux7PF4MewEKHqJQmh/VsiGV6bETgME=;
        b=IVJfTaafwswWb0uh7otpwUCzTxtNSVUAK+69vefcEkfyTOjqnifpaikLcYb2uz9VxJ
         /bloS19Wdg3o8/382StYaDGu3s/OWIPts3WXdNEXOb1xwju4kfQveE+BnS7F9g2m30aD
         ZKmxZbNjdYENO7vfWJiZcncZLq3jYRC1h5uy9VrDrnp/Y4cFeoFewztzdirOzlXqmoL2
         2aE06wvyWQVnNGU4culXCVpxAhVJyBMO96hjdiLtUjMTqB+N3Dh+9IVX5CZRLqPS5E9K
         JFtMLb7o0ILAhR/cJTIUSC/E/wbX5XZTNUuljwqpUpVMLYC4jJckZ+x5Y0utHOIrBmjQ
         T+Rg==
X-Gm-Message-State: ACgBeo3NYDilZUfd7uIOQmEmOrpEF8alQ1p1ZmslHMKv0WlNSI30YwEl
	4TlaCvsP/WUZQjtGyDUXcrS/aR/gRNjGac8j
X-Google-Smtp-Source: 
 AA6agR4Qb9dHAZ/Y3nkL32QIh7sb1yJCqHOVIELFmNKI183qLSoqmKcfC+tXse2SiXelTM6tjrlQ5A==
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id
 l16-20020a056a00141000b005285a5ad846mr34009059pfu.9.1663082835532;
        Tue, 13 Sep 2022 08:27:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p10-20020a631e4a000000b004307ac80cacsm7787578pgm.54.2022.09.13.08.27.14
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:27:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][kirkstone] system-requirements.rst: Add Ubuntu 22.04 to
 list of supported distros
Date: Tue, 13 Sep 2022 05:27:05 -1000
Message-Id: 
 <f632dad24c39778f948014029e74db3c871d9d21.1663082718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663082718.git.steve@sakoman.com>
References: <cover.1663082718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Sep 2022 15:27:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3159

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 04f9efaa2..caafccb63 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -41,6 +41,8 @@ distributions:
 
 -  Ubuntu 20.04 (LTS)
 
+-  Ubuntu 22.04 (LTS)
+
 -  Fedora 34
 
 -  Fedora 35
-- 
2.25.1



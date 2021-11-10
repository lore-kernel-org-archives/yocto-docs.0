Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D24C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:09:00 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.1112.1636564138846767922
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SbPg3Xgf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id q126so2800006pgq.13
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IAnaZCL61s4BZCi/P5y7SBZYv97+iX0fjcszl25mKc4=;
        b=SbPg3XgfY/J5U95T6dmHt844V4GW2q0GjZ0YAKYCZglZco9mnsSTkERbwWey4OQRS9
         qMSIbhf/Fj84C35ttLrGuf5W/St3ToIcIvqmMnJOxHImOtObTG/pku5B7OVyypAS+S/c
         FgrHHDgxdZGCeCu37QbJcL0I8sLLcEq96cvxVgQIBwtsU+MY5Jh/rcBgIJCfhG+Ey21M
         W+vofSr9vLVcKdIvaMQvTZgqMPPARAL/f1DBNvOc/SmkOqZAALMkKtiwIzwQk/o+fJ3p
         JuzrbhH196xgbTtzll409VJCCGQm2tmPRyemfnNFm+7ADjmy9R3xkHFZDYi+JyaGUV7I
         aeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IAnaZCL61s4BZCi/P5y7SBZYv97+iX0fjcszl25mKc4=;
        b=mYxLyQVAqOEbY9G62NBQ+K1BhLyXsgOUjKvXs7hN0BhLuI4iAMs/lir4UGQBF3Jhdm
         v6R16pSKaF3E4d3uac365072UBgbENRR2ZeGXSyB6m8UPo6jh/BQN46wB/e4CckLKOXD
         YLzyPDAej+bxiL1KCQRQ9O39l2kEEevNsJtaBHcJxg1NnuSZ+I8h8TcchJ2XvffC+O+I
         myc0qL4lVfydWld3EezleSKW9VcSdgakErWE1/2nNZ0oRBFe2NudaZaGpaexaX/TcL3q
         sq4BGVkMnKpUMDkpO6rETjBI8ec8y1aVHkvJq7o/IuczPBwUAmm3ksgd5Cos1s6X8e4q
         x2MQ==
X-Gm-Message-State: AOAM530lhchqs3Wny6kylBgPx0tR2VDizk71kd5kpnqYwaWY9EJYNC5m
	7/EiguTG8DGnuowBF7Dmi8BQngROqXac/aUfz/Y=
X-Google-Smtp-Source: 
 ABdhPJxmxwrNoDwfM0roZxrZql3SxeKxtmP0uUhkn0kAawNXm+Cvnrj2kQjvRzuDe8hmuIY8xS96HA==
X-Received: by 2002:aa7:924d:0:b0:47b:d390:da8d with SMTP id
 13-20020aa7924d000000b0047bd390da8dmr739938pfp.15.1636564137878;
        Wed, 10 Nov 2021 09:08:57 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m6sm164595pgc.17.2021.11.10.09.08.56
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 09:08:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/3] ref-system-requirements.rst: Add Fedora 34
 to list of supported distros
Date: Wed, 10 Nov 2021 07:08:38 -1000
Message-Id: 
 <e52bcc41e11681275b46b320cb623bf5576b589c.1636564016.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636564016.git.steve@sakoman.com>
References: <cover.1636564016.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:09:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2117

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 4c4a7cf0a..041f64c59 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -57,6 +57,8 @@ distributions:
 
 -  Fedora 33
 
+-  Fedora 34
+
 -  CentOS 7.x
 
 -  Debian GNU/Linux 8.x (Jessie)
-- 
2.25.1



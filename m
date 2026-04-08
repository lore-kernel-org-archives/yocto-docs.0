Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCA31073CB9
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:48 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105730.1775653540523812923
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VwzmPvK6;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso805862166b.3
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653539; x=1776258339; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0w3Cu0UbjgyhVJINPhXxLR1olerhXx9ixzO2gYpDr4=;
        b=VwzmPvK6mdS+meebNlK2A4V243K8heWdey6UVjGlcpT1HFC1engRUHGzostRoa1npD
         /ZG0i/YZF6IsXsqYidi3ZoJnuxspzTwwXPRAFnAC6QLekVLH/iTDjBDElQqjNsmWk7HC
         99DwREQ9KrtYnboBrlVoA/649fnqmD61XkP7RmeatJPmPA+pP7USRfrW4WCITY9h/IEJ
         ejT5kCvYmp2inesLbOr6JuzALfGRd6whLLlebwBorsswyXEgK3/VI7O0LcG85OiHJWic
         Drl1u5Ya8jKWfKYByIGDkKF0SSSIuj40Yx7Ym0eSjFpk6vvnLfajC9XkQ/TXL+bwiqdU
         kf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653539; x=1776258339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0w3Cu0UbjgyhVJINPhXxLR1olerhXx9ixzO2gYpDr4=;
        b=lr2jiU0IeRAcoBiqznnjj41UZjb97UEJFFB6NGAnVc978SdEZs8JUCI7Sb9mryIxG0
         VOv94sRNWMAKDAC0CZwllkOuFPuqdFVlRdvH4MLMD882NhzTtjzyH3SleUQYr1eiJBMb
         2IUue/A31BLgMojkrUESIhHvrIAEK3eHHNoHTX4dEazFtA0Y6xmmCUtlDUlhvCxeXwdI
         EcBAU5RxA7IuWkAfB4vf4Ata8y8fn4jXW6nxokkgrKcTmEVYSmD+3JtIvGmTuONZSGpN
         RohuAFDmTVuGJ+CPa1zpjpgkvl3wEZc884p8dqZu9+vbjV5h2UxDYTdF11dcS/aMPGU9
         0V2Q==
X-Gm-Message-State: AOJu0YyL7zi1Ik8I8HD81nn1Yqw60VUCuzYgqf+jI6xBe8G/qifOLawH
	CTaWdtvd1Lu1SE6vZMZwwIVRsNkyAg3Iu41GTIo6PtC8YeR4lvVwcOhLV44lbA==
X-Gm-Gg: AeBDievGISiiE/h8arD+J4gRtymnAkr+nuysyuNttbAkXSbwy0X+O3slakqDdFVHBhn
	CUdwDH4FZc1+S+MdmkcQBpVEQiUnHVkRySKEjqDCSOhxAOZkPqsedxM6gRetifhattQC++qOPPX
	ovs5dD37KIaNHG+fpiZjd1JOD3aGVDGSoaT29iorwJcuwx9YQiU51GpjVjqUwxOwNydw4zt9ub6
	ilu1fPirB0zs6VVcZK3M/q4W26xqV7vDrWicuZ8foDC/pzCGCTM36JZd5RUJV4NeRrshOK1DL6Q
	l0N91C0+65W1glgymkyzn5Tamoa00g7JdiWIv3cshh873dxuLst+hxR6A9htPv6Tmzh8AP6M5Kd
	YwMeBilomIxhQdhMhJCW4Vz9MqovlXU5Q3a4ene2uz8Pmom5pyThYEuZoqe8p6WndaawirxGhiT
	17rGIJb2ZrpLeW6nnBiy3uh0NDCd2Tcw==
X-Received: by 2002:a17:907:704:b0:b97:1009:7536 with SMTP id a640c23a62f3a-b9c676ec3a9mr1095346066b.15.1775653538683;
        Wed, 08 Apr 2026 06:05:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:38 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:27 +0200
Subject: [PATCH 3/6] ref-manual/variables.rst: update PKGDATA_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-3-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=1695;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=MDEniKvTQ95sg24jGXC/WFue3Yd2yMjWwlByI0AkIP8=;
 b=vTqdqqcH8GUG9puhxGXqSvGWMQxVSsyi3XLNxlMHBoUgPUBNF7fKeIvmLdqHvQJXHXuoSr+qb
 B6htgSu/nlnBZR8LfEjMfODjrqSSJDUPYhyIWpn2eLgRx/q8kP7LgCD
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9202

Don't refer to it as temporary. Update the default value.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e11294c6b..7d3aa8ccf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7493,19 +7493,17 @@ system and gives an overview of their function and contents.
       Points to a shared, global-state directory that holds data generated
       during the packaging process. During the packaging process, the
       :ref:`ref-tasks-packagedata` task packages data
-      for each recipe and installs it into this temporary, shared area.
+      for each recipe and installs it into this shared area.
       This directory defaults to the following, which you should not
       change::
 
-         ${STAGING_DIR_HOST}/pkgdata
+         ${TMPDIR}/pkgdata/${MACHINE}
 
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
-      section in the Yocto Project Development Tasks Manual. For more
-      information on the shared, global-state directory, see
-      :term:`STAGING_DIR_HOST`.
+      section in the Yocto Project Development Tasks Manual.
 
    :term:`PKGDEST`
       Points to the parent directory for files to be packaged after they

-- 
2.43.0



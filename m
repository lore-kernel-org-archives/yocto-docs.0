Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB23C4707E
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:06:41 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.13174.1633619201027713207
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 08:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=zxy+n49g;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id t2so6423869qtx.8
        for <docs@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YGv9NN1DXxDA4QKEuwU6clyMG4+YMYggtTVhOpyo1Ts=;
        b=zxy+n49gSRdPluAFUyfLtPAy8cXQ8Hb6fJG7Lc2x1TjqeVKV97qKInXArtKa8p8X0/
         VWBIbYsmAKO6ToOMuI9fRptUA80j48qpvejsR1Jpy/kgMXD8JmlgSUB23WylAAKc+liX
         EQLpUEjveRKnBc32yTANArmwWdezmQ5A+0jI1Q3/ZWK/d1dpoBDi4Z4S0hctd8P2xTU2
         T2Z3Ir10GxXA1/V9MP8Hj+LaqFBo4XYM4YwKCfFv2pC9TCkgJNG/oFGPKyr6WcdZYfd6
         zkaZ/XS/D5/84hgT0rRO/GOc74Y1ezF/xB1s1Fd9jRNcTzC0luXgZJPb3tmMVn/nGDeA
         yGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGv9NN1DXxDA4QKEuwU6clyMG4+YMYggtTVhOpyo1Ts=;
        b=67XPwywSHwIdmfwa7fz7tqIJRkixVAQ8pG3NCqMbYxxp+kSSEBW90qA/issX37lFbP
         DzO0nFkFeUaPYl5aFBFL3Eh5ZkR5IVi4j7jlyYDeX6qjjmfH14lkNJYClcqNdOTKfAUt
         4uEO8nN79Vzej+DioJjt8G35QQCFVQqotUZWv3UmLg3lSGi9EgKO0DqPf654g4NPqRSP
         AJnkx3X07+/TTXsVN95me1ldecYM+9zr9A8Wbl+LleU9Xr3acdpEI5Jxg8Bpb2kzzUK1
         S36CbvsrSljxooWrr75OlPCfQCosltxFcB6F0oaei2WDxJ5XEydNPnvWwwUJKC1mI6Db
         1UMA==
X-Gm-Message-State: AOAM532qAxAFyIfK31InU/mSY2PDCuQHMNozgl0UhR1nZzwf3rcVsse9
	zlG6U5kosV1rnhR9kOmCK+VQOivKBUpypw==
X-Google-Smtp-Source: 
 ABdhPJwlq+RMSfWUI3PX+46vE9cgJVhaj2zNfMOWOnQ5U2abP+Ikz8NmOdX7mROmoMf+Ky6kJcS3Wg==
X-Received: by 2002:a05:622a:190a:: with SMTP id
 w10mr5437560qtc.300.1633619200205;
        Thu, 07 Oct 2021 08:06:40 -0700 (PDT)
Received: from localhost ([2605:a601:a650:b700:9937:f30b:7d2e:fddf])
        by smtp.gmail.com with ESMTPSA id
 c4sm14379851qkf.122.2021.10.07.08.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 08:06:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org,
	bitbake-devel@lists.openembedded.org
Subject: [PATCH 8/8] dev-manual: remove errant /
Date: Thu,  7 Oct 2021 11:06:30 -0400
Message-Id: <20211007150630.22138-9-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007150630.22138-1-jdmason@kudzu.us>
References: <20211007150630.22138-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Oct 2021 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1960

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 documentation/dev-manual/start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index fc1b7c30752e..1ca25318cd53 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -670,7 +670,7 @@ Accessing Nightly Builds
 ------------------------
 
 Yocto Project maintains an area for nightly builds that contains tarball
-releases at https://autobuilder.yocto.io//pub/nightly/. These builds include Yocto
+releases at https://autobuilder.yocto.io/pub/nightly/. These builds include Yocto
 Project releases ("poky"), toolchains, and builds for supported
 machines.
 
@@ -678,7 +678,7 @@ Should you ever want to access a nightly build of a particular Yocto
 Project component, use the following procedure:
 
 1. *Locate the Index of Nightly Builds:* Open a browser and go to
-   https://autobuilder.yocto.io//pub/nightly/ to access the Nightly Builds.
+   https://autobuilder.yocto.io/pub/nightly/ to access the Nightly Builds.
 
 2. *Select a Date:* Click on the date in which you are interested. If
    you want the latest builds, use "CURRENT".
-- 
2.20.1



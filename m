Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4AEC43219
	for <webhook@archiver.kernel.org>; Tue,  5 Oct 2021 22:45:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.4122.1633473915647991879
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 15:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YqqurO14;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id j12so664503qvk.12
        for <docs@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dRRv61/iuAtAv2hYSlSqDu0qfo2qb4X0oh7LC7lv3+I=;
        b=YqqurO14b4LQi3X6TjjSgLBPYpsqzIf8kDHVvLaMrnxEJNObB4Aq7rpZnfA0gWB5hF
         IofMnLOBz0mtSv+dwXOFZCIVASh6mgGnYOEgfv+kKVBhkbkn5KoTeEXL0HbcP3MHOg15
         Jzl21FkxadbYS0l9job0StAER4g78KlpTpvFvSLpIbjiTBvFpGGunI/TermOG6iV9kDV
         c3iprZEXeIYJ0Rim6Cd8bclpGF1UNgnmlshQyNAl+GDv/Ckp9s7yZSq3YvVmT+eyAz5O
         1ga2gsuyNI5nurmMPMtfvvxbgegTfKh8TUs1XB9yeqwNq6Oe7MDq9r4VcZPYnNBysKTT
         ILbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRRv61/iuAtAv2hYSlSqDu0qfo2qb4X0oh7LC7lv3+I=;
        b=Casgf/+7Hu7xJ/89WIzKB/mxyaAirW1VH48RySTF41uFHz7Y9IYpfJsR6Bw7NtEQR6
         2CqmdvYHKHMdrD7UOW9KnHtvvhVcFMKAEKFfGVT6Df5O4gA5/6sEiDM929j1272etB2p
         czNaOF493rQIzWe1v5SFjgQTUG0G8cBsldm3sCUdhJwZFsA1wlW3KtJghc9uVMh9MNuA
         MuN3A/hElomfcBTuv/ruOZV57uNtPEcsm7bkky9ZZsmoG7IKmzYU8jQjSLQPyDhzodao
         /soZ+4XB7Ly22w2WRneWw176HC8L7fCQd69RQakwlpcRp1qGRp4CejJk5hxNl3jqKKUu
         w0Lw==
X-Gm-Message-State: AOAM5316ZCWatROsSkUpppn1monV/M+3kZWGg2fTBr5WCKhtiw0LUZEA
	9robFKCOKuIK8d9+tX+xRmVVLVVlaHygiA==
X-Google-Smtp-Source: 
 ABdhPJzIp0XLqZf71Q6/OnPfVUNo37FfhVdpHK8PTrzg7EVQh2fHdcYi34zCLW9FiU9B43EReEj+HA==
X-Received: by 2002:a05:6214:42f:: with SMTP id
 a15mr11717640qvy.41.1633473914789;
        Tue, 05 Oct 2021 15:45:14 -0700 (PDT)
Received: from localhost ([2605:a601:a650:b700:9878:6bc:c765:2aac])
        by smtp.gmail.com with ESMTPSA id
 66sm10397569qke.118.2021.10.05.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 15:45:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: docs@lists.yoctoproject.org,
	bitbake-devel@lists.openembedded.org
Subject: [PATCH 2/2] bitbake: bitbake-user-manual: update sources mirror URL
Date: Tue,  5 Oct 2021 18:45:13 -0400
Message-Id: <20211005224513.14134-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211005224513.14134-1-jdmason@kudzu.us>
References: <20211005224513.14134-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Oct 2021 22:45:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1918

The URL for the sources mirror no longer works.  Update to the new
location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 .../bitbake-user-manual-ref-variables.rst                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 8862e16b83cb..11f8fdcde003 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -1123,10 +1123,10 @@ overview of their function and contents.
       your configuration::
 
          PREMIRRORS:prepend = "\
-         git://.*/.* http://www.yoctoproject.org/sources/ \n \
-         ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
-         http://.*/.* http://www.yoctoproject.org/sources/ \n \
-         https://.*/.* http://www.yoctoproject.org/sources/ \n"
+         git://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         ftp://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         http://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+         https://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n"
 
       These changes cause the build system to intercept Git, FTP, HTTP, and
       HTTPS requests and direct them to the ``http://`` sources mirror. You can
-- 
2.20.1



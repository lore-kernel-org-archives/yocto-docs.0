Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A5DC4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 01:25:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.13270.1669253113499122346
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 17:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=h3Ay+MOC;
 spf=pass (domain: linaro.org, ip: 209.85.167.173, mailfrom: javier.tia@linaro.org)
Received: by mail-oi1-f173.google.com with SMTP id l127so190370oia.8
        for <docs@lists.yoctoproject.org>; Wed, 23 Nov 2022 17:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AH4QNZy21BIB0WtnUrsyeattK2T0KYjnD2ppkVAEvJA=;
        b=h3Ay+MOC0Yb2PMB8lNvKqHHorScgJc1rBOBp3tGwohSm62MoFj3yVxP1xpIitAvtW6
         XkxPYm32EGZqDcP2fT9w6tf1kaFq0ufP2/w1pEXLlaGDUmZy3dIKTHDknC+vMSj1K3/k
         waZVRNmjMVqi5EyOWpIu1IIVQJwSKhkCbE5Qx6loU1RT2UQcpzpXDSogwhGY8e4mdHHM
         KNhs2TFYNEJTYfRjkGyVjOL44iRCb1nsFJvM5ihyu53zIjiAbVsMB5f4xkZmG8UbflBi
         5+NSgNTPNy8dB802azy6HxjywaVEQPOv3TmdTIJTdMQzQTPLdfCY+WoMbaaMj1i7bObJ
         hW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH4QNZy21BIB0WtnUrsyeattK2T0KYjnD2ppkVAEvJA=;
        b=wS7nkuhI5bNk76cVbn6ItQCsdpiqri9F2wylMygDoIC47GeH544AfgZMW8xqc4qwfV
         xnNdtMReMUwsMoY73kV9OW0Ya+h8Pq7fpbAWw1KsDps5Umwx4tplwJHEMuiaLIeZqDt4
         IaRJpK7E4okdXnNLffe87as2fzyy4EgcvCSBq3jI8Y4f6ZyOJd3WMc3oBKYIlMSWi1xI
         cviB6PwVhGKBCQ77byYJmL3nkyHPJ6B1aWD7KCe0g0KJPgL5K4+ysBR9ZqgfzkbLCYFU
         PLWwwFWg1QrIg1rLEpvj9MLcaSc3wvBvWbmWRKTmw7Wojtqo5oU9X3qyz/qVuXoFRC7J
         nseA==
X-Gm-Message-State: ANoB5pm3VpvFPcgL7DdVSA5MLHLLAKHwsSef+tbfPqA33ZY8K6Wz/1oe
	53wsZFhZNem2fhcH9rq8GfKpITgDrcSvFYKN
X-Google-Smtp-Source: AA0mqf6U9tuQvMyI0cO82aARbxwMw7lotxCfkMuVjuSYdr+2A4gDJhgfLz2nAp6rN7hRwX5lZTgSbg==
X-Received: by 2002:a05:6808:1a15:b0:35a:3c4d:9c9e with SMTP id bk21-20020a0568081a1500b0035a3c4d9c9emr5304161oib.97.1669253112541;
        Wed, 23 Nov 2022 17:25:12 -0800 (PST)
Received: from javier-pc.. ([177.93.3.224])
        by smtp.gmail.com with ESMTPSA id q3-20020a4adc43000000b0049427725e62sm6808671oov.19.2022.11.23.17.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 17:25:12 -0800 (PST)
From: Javier Tia <javier.tia@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Javier Tia <javier.tia@linaro.org>
Subject: [PATCH] Add missing iproute and iputils packages for Fedora 36
Date: Wed, 23 Nov 2022 19:24:46 -0600
Message-Id: <20221124012446.483364-1-javier.tia@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Nov 2022 01:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3500

So far from crops/yocto:fedora-36-base I have been building in Fedora 36
without issue. Just found iproute and iputils are missing.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 documentation/poky.yaml.in                       | 2 +-
 documentation/ref-manual/system-requirements.rst | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index ce67c4d3d..c6a6560a4 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -19,7 +19,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
      python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4"
+     perl-File-Copy perl-locale zstd lz4 iproute iputils"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 150263381..3e1fc40d5 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -47,6 +47,8 @@ distributions:
 
 -  Fedora 35
 
+-  Fedora 36
+
 -  AlmaLinux 8.5
 
 -  Debian GNU/Linux 10.x (Buster)
-- 
2.38.1



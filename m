Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E671FC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:36:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.10440.1646152589573596991
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qNvc0Nzg;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id t5so5668039pfg.4
        for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JlvEvuZDJd2y42WYZEPfaMrxgvwX3zmMuFYxrn8SpJs=;
        b=qNvc0NzgqECGoQy8zkR251+3DPJ4o2OJAsI0StpiOXE8zt1RTKVLZPC5R0TVoNSDgI
         RbUVeugJ9R1DZ/4JdYs+24+HI799JYYG73uog6js39psyCfVRlRHsvgsLzBD9xSkPmEE
         7lhLdE/3TxV1wLg1F/CMYwBH+Kj0mARrcntmx1YMPBbDlQF60g9WhWT0gJUgjHOxxazj
         icy/D8A9DNA8h4OOWDnUa8RMeioUJX5RZzxOeIvMhpYv85ZlutQ2Whiqm8dxXWzLAuRI
         +Mmc/RaKBf8PlHVNAIafuT2t121FW+mGfqK+OvZTtIIKYX8yubJcFz90dBi3/4p8ibd4
         t+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JlvEvuZDJd2y42WYZEPfaMrxgvwX3zmMuFYxrn8SpJs=;
        b=jir+/JSdkYyQtmpODtFhYMHjUBenjwkwlI/35Xy6agwRE1KyHwDVqWKrdMcWBtmSpK
         0ahmDTG9RfJ36dD6mw1XUcpOcojkeedqhI4fMyH7GlaPYEBiKCDWZcScX1tdFXY3wdpQ
         0jsLaYtexjiObhW5/pyvpfRXP5DqVMd7R8MC8b1hxf7vFB4LuTEDDU0YrfbLWh3xm6xg
         bjiFcs+zTcudx/Eag9OtDN6Jy9qSpfNFRaCTO2HS3mdzMO2kmL6CCxMrJp1HCe8jSSMJ
         g/+IwwRz4CnXSpLuum2uiGVC+nfnWsKLEjV3VOOmIGs+yzfKPWpPAaQ49pdGuxPQeGsg
         t7Wg==
X-Gm-Message-State: AOAM531wp6KSAcDGhTOhVIMz5Pz289UnXiIJ2GxzBrTtsROIZaAfX986
	YOAVd528uY4kstT/88TNnKw0b6w+we0=
X-Google-Smtp-Source: 
 ABdhPJxIqkYqWq9rHEvfK+h7JPRrD42LCvRZd7eFFA1AETwJ2GD+k2u8SOGsNiWlC0wjsMMN7DB94A==
X-Received: by 2002:a63:f80b:0:b0:378:3b1e:7bdf with SMTP id
 n11-20020a63f80b000000b003783b1e7bdfmr17610323pgh.271.1646152588483;
        Tue, 01 Mar 2022 08:36:28 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm13450461pgj.47.2022.03.01.08.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 3/5] docs: migration-3.5: distutils move
Date: Tue,  1 Mar 2022 08:36:15 -0800
Message-Id: <20220301163617.1543257-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301163617.1543257-1-tim.orling@konsulko.com>
References: <20220301163617.1543257-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:36:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2519

The distutils*.bbclasses have been dropped from oe-core and moved to
meta-python.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/migration-guides/migration-3.5.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/migration-3.5.rst b/documentation/migration-guides/migration-3.5.rst
index 8c2a7d2c6..b52ae7119 100644
--- a/documentation/migration-guides/migration-3.5.rst
+++ b/documentation/migration-guides/migration-3.5.rst
@@ -54,3 +54,5 @@ Recipe changes
 - :ref:`allarch <ref-classes-allarch>` packagegroups can no longer depend on packages
   which use :term:`PKG` renaming such as :ref:`ref-classes-debian`.
 
+- The `disutils*.bbclasses` have been moved to `meta-python`. The classes and
+  `DISTUTILS*` variables have been removed from the documentation.
-- 
2.30.2



Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9C7C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 16:14:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.20373.1677773678891132905
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 08:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=YcGbwTsG;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso1849104wmo.0
        for <docs@lists.yoctoproject.org>; Thu, 02 Mar 2023 08:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUW22duzAmduApEKg9J/njcvQm+OeW23YzbEzVAlVvc=;
        b=YcGbwTsGdOcxEXIFj9q2e+42KUXmXi9B9MWSdGkiGBwh8vkjtJBmCwFIY+FQThjfX+
         ZaKkdADjKomfKR0VBfBgwMnRQjfBzoJBz2Ezx0xyysvxV5y5KgFIYsRME5ru0CixpOED
         qX5IQLzmKilrS3tiNju7NWm5u6qbZcD3fnkk1tGYyv7t7K5/HgJHNoeg8qDCyx0gQaVm
         3ghyOUvatKjly1TKv9xwq5ktjxoVwn85YNkCoPLZHWVJ1TfjrCYDyFvU7JOaXToQkX2y
         lc7fKoVCC+kYBZhfsESw10R2HtSnliPDY7hcbPaH0NNhYzaKcWmG2VWkb7tHchRV9szp
         AYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUW22duzAmduApEKg9J/njcvQm+OeW23YzbEzVAlVvc=;
        b=iVx3FmNBP82JS4dMz2v0r7JtFE2R8b+FzEvS83L7jbr3E6zySy1JUpw3YPQDLjcfly
         7lodCtNn2QN3gYWhIPOc2MR8aBkJ7Relxq54Su66Tt+Q4xdktuZ0ifoeIW0/cjY3YtB4
         PPNSdZdz29Cdu4NXvQmhViWjqv9+4T49jQi1dko/kgjvvhPCyLs1j4JDBdmR2D1NanOa
         7pP5nuNbvgN/8yPglwSJFwALtiesQAKj50T51gHEXraMCiUF1H/ea4kCXuh0v/dnV14s
         /D1ywj9mugixyLXom3xWGLAhuVjWdaMCTeEhNzV4D8AKUDQbiI6mMeik3ETr+7YV/hkh
         NVIw==
X-Gm-Message-State: AO0yUKX/2iCVGlKolD4leo3glwXZM+ltHviTYguyS44ZnDhvilBBkDpW
	cpiwE4/dDRiTFqeF6NVrMKP96Q==
X-Google-Smtp-Source: AK7set9wIiIibfTdDEc42YdZWH54bZccols6zVYSBMUGYXe9NzpDVbAurfa8HpHv6UwspVCXeZagpQ==
X-Received: by 2002:a05:600c:30d3:b0:3eb:376e:2b9c with SMTP id h19-20020a05600c30d300b003eb376e2b9cmr7855031wmn.36.1677773677168;
        Thu, 02 Mar 2023 08:14:37 -0800 (PST)
Received: from localhost.localdomain (251.38.22.93.rev.sfr.net. [93.22.38.251])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b003e204fdb160sm3861779wmo.3.2023.03.02.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 08:14:36 -0800 (PST)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Fawzi KHABER <fawzi.khaber@smile.fr>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Ever ATILANO <ever.atilano@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v4 1/2] doc: ref-variables: add LAYERSERIES_COMPAT to term glossary
Date: Thu,  2 Mar 2023 17:14:30 +0100
Message-Id: <20230302161431.8594-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Mar 2023 16:14:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3775

Bitbake throws a warning if the layer compatibility is not defined since
cca81e33b58c390dcf5cc3a31555a43b79177166. The description of this variable
comes from the Yocto Project manual.

Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reviewed-by: Ever ATILANO <ever.atilano@smile.fr>
Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 .../bitbake-user-manual-ref-variables.rst     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 09d09a8d..a48e7000 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -1096,6 +1096,29 @@ overview of their function and contents.
       variable is not available outside of ``layer.conf`` and references
       are expanded immediately when parsing of the file completes.
 
+   :term:`LAYERSERIES_COMPAT`
+      Lists the versions of the OpenEmbedded-Core (OE-Core) for which
+      a layer is compatible. Using the :term:`LAYERSERIES_COMPAT` variable
+      allows the layer maintainer to indicate which combinations of the
+      layer and OE-Core can be expected to work. The variable gives the
+      system a way to detect when a layer has not been tested with new
+      releases of OE-Core (e.g. the layer is not maintained).
+
+      To specify the OE-Core versions for which a layer is compatible, use
+      this variable in your layer's ``conf/layer.conf`` configuration file.
+      For the list, use the Yocto Project release name (e.g. "kirkstone",
+      "mickledore"). To specify multiple OE-Core versions for the layer, use
+      a space-separated list::
+
+         LAYERSERIES_COMPAT_layer_root_name = "kirkstone mickledore"
+
+      .. note::
+
+         Setting :term:`LAYERSERIES_COMPAT` is required by the Yocto Project
+         Compatible version 2 standard.
+         The OpenEmbedded build system produces a warning if the variable
+         is not set for any given layer.
+
    :term:`LAYERVERSION`
       Optionally specifies the version of a layer as a single number. You
       can use this variable within
-- 
2.39.2



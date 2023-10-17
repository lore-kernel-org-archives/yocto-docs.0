Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60417CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:00:48 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.211084.1697544038182006328
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 05:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRvNZnav;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e855d7dacso4896903a12.0
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 05:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697544036; x=1698148836; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrkAh28W+2uIH0o0ocr/xUt+A9BHn28Ai7m74md6PQ0=;
        b=IRvNZnav+Bklz97sQGOII1oSRtK5g2A9agpsEfltYKZsCQsT/UACR+eU9dg5fbxGj0
         IGnU7HXXypg5lhIQxvb+rdjusCgMcTBE9ah4+Us6iOvDQuUsyLX0BB3pwXezWdUKvc89
         3bETT9Nf2D9N2itCcFe1j9yt0QkfLg8kM+JhuGsm8A/5/qVASgcxYrjnxhiOg+cntTom
         ZLnT8a8ie0zRjMquTPyYzuXgY9cV0vCP+jDkwQeYz+ehBfXho6iqtiAJywXjPQBNFnao
         Cm+85iVXwOLHmMkcEUyxIG2qtwlmZwtQ4SdnnF9P1NsB3JHXo75rNEWRws0AP+6UNIil
         m0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544036; x=1698148836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrkAh28W+2uIH0o0ocr/xUt+A9BHn28Ai7m74md6PQ0=;
        b=Tyb8zTRRrmE/vWyb2f+jLGuidMG7InVpZUWBdxyM1vmsOMTV9rJMa/mTeZSQUhqXVB
         80jV3OdUlDbHOoUyXbwfjhLJ3JiqMAX69/qSworuNRYN5sBHlsB2ABo3LfmQhgxaA7Fo
         aoKsjHxUuxNgp4WX/ZYem36VhloRflH7Btw8Z39CZu+thMEitXmJtCsqms+vzl0M9kXn
         ldUiAe00rS53LDAQKzkfa2guPnPx7kzj2/Ua/+pkIk9/mh1KVIwnPFjmlEMKsh3SA0qH
         E4WCuLIQkzpzSq5MuXnAqebZmXvGnYmI78t2Psnc9D1uovfU6jE4I6425hCVRuhE41Qd
         cqfA==
X-Gm-Message-State: AOJu0YxAFNwaKSBtPTcnBeHiJ9EFcK9moLwBx40u7Y2OjmSBw+MlCZwB
	IOiHyMTq1iLJRgztXE7bJbg8WBwzxWI=
X-Google-Smtp-Source: AGHT+IGU/IMaXaIp+jNEnG+zCfHyEPmP5UnLAzHfv0pdMCJKitzd6c5f+WQmZdp3ixMaGnzTrXJHUw==
X-Received: by 2002:a05:6402:42c7:b0:53d:fe06:3bb2 with SMTP id i7-20020a05640242c700b0053dfe063bb2mr1755440edc.8.1697544036164;
        Tue, 17 Oct 2023 05:00:36 -0700 (PDT)
Received: from talel.sofia.local ([193.95.99.58])
        by smtp.gmail.com with ESMTPSA id s10-20020a508dca000000b005340d9d042bsm1065872edh.40.2023.10.17.05.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:00:35 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] dev-manual: layers: Add notes about layer.conf
Date: Tue, 17 Oct 2023 13:00:28 +0100
Message-Id: <20231017120028.3093932-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 12:00:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4395

As discussed before with Richard Purdie, the code supports this but the documentation is not.
Developers in general will not notice this or focus on it because they do not mess with the
layer.conf template file, but in my opinion I think more details can help.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/layers.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2d809562d..c4fdb4caf 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -128,6 +128,17 @@ Follow these general steps to create your layer without using tools:
       variable is a good way to indicate if your particular layer is
       current.
 
+
+   .. note::
+
+      A layer does not have to contain only recipes ``.bb`` or append files ``.bbappend``.
+      Generally, developers create layers using `bitbake-layers create-layer`, see
+      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`", that
+      creates the `layer.conf` file from a template located in `meta/lib/bblayers/templates/layer.conf`.
+      In fact, all the variables set in ``layer.conf`` are not mandatory,
+      except when :term:`BBFILE_COLLECTIONS` is present. In this case
+      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` will have to be defined too.
+
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
-- 
2.25.1



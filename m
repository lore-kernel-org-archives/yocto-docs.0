Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F2DC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:03:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.42150.1723453408749769136
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXDp8fgS;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: jan.vermaete@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef1c12ae23so41182741fa.0
        for <docs@lists.yoctoproject.org>; Mon, 12 Aug 2024 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723453407; x=1724058207; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApTvmy2ctgwPqYHLFhfnAiqPQMiOs8GR607AjEyPcOY=;
        b=QXDp8fgS1s31OPQCe+n/bvSgPLzNN5gOKgD2fJ+qhK1zmOCD9Ynp8CidT9LGFDL7NU
         Yqzb7RJwzIeM3RUlkT/YsP4uPWRPOgYfMItm9uDzuwEpSO5kchdAIRI8/A4Ntg7+ejDD
         Uxv/k3wJGrASH1W5C19zdVqC6w7tJBVeY/eBqX4JRqDlbaeT2PXcwC8PshIKLEXbAkev
         c8cVRkHaxTlsRXSq7je18uZEzLWpfDpZnPLkkim0Pid0pZuuBFQpjOPfP2fK55fraPa3
         NJ3eNRL+PcGIebNW88wkwUi+YXcuQopBrNU9vjospkxLDQEfhfRR8gZ7LqS0y9ee6Qc5
         Q6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723453407; x=1724058207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApTvmy2ctgwPqYHLFhfnAiqPQMiOs8GR607AjEyPcOY=;
        b=ayba0TtBRLcROtJchyt5iHjHJtkkpUuw/tsJQ0U8HQsMhntdXeInZF2i+aqiCKcxfH
         ZVyHw54qSlz34QqvdMEikM6iD7JFiM77+fkWq/+4q6kR5z22J9tW92pSTsPTno5gmfQD
         aCJBTY2J4qtPycKnnHEXGGVV88ZRZiCh9nPf7T5tQNTojgHF37JWFJoXRNcc6p0gAkvG
         DOqw3jq1REaDiBGufFlkzrbkULf1wuSejDNtWefXX3AFYio3718Ipq3meo99hy+XCUiA
         6wpNf414hf8lK7k3ogpZ3R/M1sHAzkDQuiNw5AIxhbumprowaMUhjBZOxwExtLGO1pAN
         hXng==
X-Gm-Message-State: AOJu0YyzPoXZ/OilbdCRHc2AQZTfp+wEPSPr8o7YTBsUKtqFWkUor1mw
	ClF49/C+ycnYjX5q2aEod+bJEp/LIaqgBKYxabL1Q/wpUfBZTS4NzjkmiA==
X-Google-Smtp-Source: AGHT+IHdPlfri81mugzKbnp3sLg6hmdzMIGJZ62Kmffs9GMhgSoIZL1AR0AQIQXljnVog3pZRBLuQg==
X-Received: by 2002:a2e:4c1a:0:b0:2ef:1d79:cae7 with SMTP id 38308e7fff4ca-2f1a6d0ca39mr60038101fa.14.1723453406095;
        Mon, 12 Aug 2024 02:03:26 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c751a554sm96891965e9.22.2024.08.12.02.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 02:03:25 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] ref-manual: added wic.zst to the IMAGE_TYPES
Date: Mon, 12 Aug 2024 11:03:06 +0200
Message-Id: <20240812090306.9098-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Aug 2024 09:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5333

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 documentation/ref-manual/variables.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 848cea787..237bf3a54 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3971,6 +3971,7 @@ system and gives an overview of their function and contents.
       - wic.bz2
       - wic.gz
       - wic.lzma
+      - wic.zst
 
       For more information about these types of images, see
       ``meta/classes-recipe/image_types*.bbclass`` in the :term:`Source Directory`.
-- 
2.39.2



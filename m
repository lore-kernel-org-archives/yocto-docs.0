Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215D1C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 15:31:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.41254.1741620691649134993
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 08:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fSvz1kyR;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499b18d704so2027100e87.0
        for <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741620689; x=1742225489; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1j2MnOnNngy3z98H4b7BI89EUZL8JJrgvAYbb1II2pw=;
        b=fSvz1kyRx3H5q/FQLRaJ2lkxfXCfb6pAwlINUeGf9jcIHE6pDxwOlu5/qIbSEMhKZy
         mlRyRRYgLe5foJ4Oyx+byHY1xdlKtVO6HmCOlDSlksSgEQaGB9savxHqMZn8fnsvPL47
         82TRv2e0Sehb5g4OYBT1SMw+KuJhVFJIQKU94BGInBYR8x/guY6QcPfntyvMfkhRpmBL
         I8UoKGFB2710Iny+ybskqGIe/hK8ZtVEySac1HbQz+PzPVExXl0/JUe8axr+NCXhnZMQ
         0ErsgjL5dpR5arPX+CK120vFGE6ZFM/Opx8Bt00MlWpfkDoqIiXouFZPKQ8Zea9BoFj2
         142Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741620690; x=1742225490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1j2MnOnNngy3z98H4b7BI89EUZL8JJrgvAYbb1II2pw=;
        b=g1RnqAZq4Y8PjQURNBwdrn+PmA7BgTBjPPTCxSL76LYAmrf6KGqxVMV1BFC1Fihogt
         2OU7MsmEKPInngu+JWasyBt6TUn5y1IcbmrHWd2LyGMgn9ROoesyn9xcS7Gcujc8O8s9
         iBhOej4/laXr6lTFufrGbtXE+zpzsqCafUppDIWtOa5bfNSW1eckSwJIusnhcpyIMJmD
         TV5jmUA2PLWMqvZ5AlAE7SA6qh+g66LfdMkxGTyfxUpI9sib9o+8aHV+Dyj9fRqpuEoD
         guy5Yg/XmhYnjeVqcDf27uWvWKSbKVB6sOT9niM95JniJhA0ln5J3CygPXI9bv1KW+9q
         b4Aw==
X-Gm-Message-State: AOJu0YxzlEIx/hjPV3G1FT0K0HGCwi2qnNPsj2LGe0kCGd41mV0s0CAi
	hRWlBtDrbjOWMlPYY+nmpIIdrXmVTHlNtO1+ulPX8v7qoUC0B84lr5S81btCRPJ4jCMun/DBqPE
	q8Ss=
X-Gm-Gg: ASbGncs2XTRnYX5HuvAVjWrI0hR2EbPMWK52QACEjhmLh3Ume/qCIufE2ny+D/UrvcT
	JGVPrF7Zj6xfnXCoQa8Ns6yk3AWVMvkoNmHQhyJ1UQgVxZO+6proxKetlm3UByklr8IoYAefXH+
	2csj9JsFgI6tpKey3e7Wu85PrkPyS/DbfjW0NtAGD8OYi0RJxBBqVgfVd0OsWlqN0hxxAyM5ror
	ChMrXcFBC49qHyqVvQRkbVfFruzzYAs1EFOWhcROGIEMTbNhEswnrH1+6JHgC0qFgFGECgv4m8n
	H9nR+v0ECC0kgIIm9xGN7mLX3BzGhHfW3yOarvypxzYrSG1+oGAQZ+aWxQVHvQmry6HcTxlHOiO
	pyNpPlQvEkSh72w==
X-Google-Smtp-Source: AGHT+IG9j00RdxlfQHR/GzYxfrfNQ29pJEeAYIMX2Bxycu30oPXq2A/hqQahlxsRgCDfnh/EXiL5Ow==
X-Received: by 2002:a05:6512:2391:b0:549:58d5:f899 with SMTP id 2adb3069b0e04-54990eadc5cmr4905806e87.37.1741620689442;
        Mon, 10 Mar 2025 08:31:29 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58a7bsm1494136e87.72.2025.03.10.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:31:28 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] sbom.rst: how to disable SPDX generation
Date: Mon, 10 Mar 2025 17:31:08 +0200
Message-ID: <20250310153108.40579-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Mar 2025 15:31:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6523

Generating SPDX is enabled by default in poky but
it can take a lot of build time resources so document
how to disable it.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/dev-manual/sbom.rst | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index b72bad1554..f5a706bc14 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -24,12 +24,18 @@ users can read in standardized format.
 :term:`SBOM` information is also critical to performing vulnerability exposure
 assessments, as all the components used in the Software Supply Chain are listed.
 
-The OpenEmbedded build system doesn't generate such information by default.
-To make this happen, you must inherit the
-:ref:`ref-classes-create-spdx` class from a configuration file::
+The OpenEmbedded build system doesn't generate such information by default,
+though ``poky`` reference distribution has it enabled out of the box.
+
+To enable it, inherit the :ref:`ref-classes-create-spdx` class from a configuration file::
 
    INHERIT += "create-spdx"
 
+In ``poky`` reference distribution, :term:`SPDX` generation does consume some build time
+resources and thus if needed it can be disabled with:
+
+   INHERIT:remove = "create-spdx"
+
 Upon building an image, you will then get:
 
 -  :term:`SPDX` output in JSON format as an ``IMAGE-MACHINE.spdx.json`` file in
-- 
2.43.0



Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050AFC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:36:06 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.44085.1738856164175638668
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 07:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=G0aJOnqR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516FNZ87008854
	for <docs@lists.yoctoproject.org>; Thu, 6 Feb 2025 15:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=0MuQU
	W8zRxqE1hxdLOIr5x59BtHOtEoj7YfwQoqVDYQ=; b=G0aJOnqRpjtyipD1YFG3i
	0u75rC8TzjE3cHGCSsXlDN5lWukaXalSGY+u7cyJR7aEC0hvG5f/6/IyD7ckn+AE
	FGvipT6eWhRw20vZ13l5vFhhKWfWcrDXX5to449Js/KVFGJ/jJ3gLIykFdxBerKm
	a755G2RPe1ots/Vumd5U3nhB9FwJdRZsylrH0fjV8G/5GgpXp9/rSfldIS+1PL4x
	uj30iys3Vm9vpqRMPq5MWyV5L1GSSIyzrbz07tcurVgrjEvy4J8XW41tKqDUXItq
	sjsW3AhHvrCFtDx/sfjDs8owN63BHIdBnUZ9aqjvflPahF02wGa+h0aIXyt79Z0d
	Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mwruh189-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 15:36:01 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 16:36:01 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 16:36:01 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 16:36:00 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <docs@lists.yoctoproject.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v3] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
Date: Thu, 6 Feb 2025 16:35:29 +0100
Message-ID: <20250206153529.2546767-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4ZiyhJ0n6dfUQn1HFH3VBiRBB-P9VrKt
X-Proofpoint-ORIG-GUID: 4ZiyhJ0n6dfUQn1HFH3VBiRBB-P9VrKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 15:36:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6263

This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
to the reference manual.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..889944b0a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3984,6 +3984,12 @@ system and gives an overview of their function and contents.
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
+   :term:`IMAGE_ROOTFS_MAXSIZE`
+       Defines the maximum size in Kbytes for the generated image. If the
+       generated image size is above that, the build will fail. It's a good
+       idea to set this variable for images that need to fit on a limited
+       space (e.g. SD card, a fixed-size partition, ...).
+
    :term:`IMAGE_ROOTFS_SIZE`
       Defines the size in Kbytes for the generated image. The OpenEmbedded
       build system determines the final size for the generated image using
-- 
2.48.1



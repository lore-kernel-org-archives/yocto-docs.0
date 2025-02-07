Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6CFC0219B
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:55:51 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.65876.1738922145310134200
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=E1zaPKzm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5178nvJJ019460
	for <docs@lists.yoctoproject.org>; Fri, 7 Feb 2025 09:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=9Cwa7
	gWfFQROhTwGm6BNrU2mD4cpL/JhZ6A918hdx6g=; b=E1zaPKzmsSQd2W/cqC/P9
	Qzp3VjyMNFH/BR1bfAxh76urzGvY+OnwmiFNcZMmy2CB55CYxRSfZOuYEt164/82
	GRFcdTw44UZ2/rPhn6kuth3ZcvKPMqxCOMcOMZKsZIJUxcYmiYjS3zvlHZORYihu
	jofnc0hLoxYcVFLIHC7UHyoHy41ScEnQ8rSYENA9GToL0+BhU8xS2HGFj5XMH84E
	I/uwzV6bcm1XO94o6ctTLEi5+1YrHZWWaL+IE4jD8ZpVgn6By51WTxS6z2GFjZlj
	fN/8MSm1QK4baNKKiNx/BKHm4na1vCQocweg5cnhWxTgfFNuchioyxo71QQdhZRG
	A==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44ndwv8qbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:55:43 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 10:55:42 +0100
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 7 Feb 2025 10:55:42 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <docs@lists.yoctoproject.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v4] ref-manual: Add missing variable IMAGE_ROOTFS_MAXSIZE
Date: Fri, 7 Feb 2025 10:55:40 +0100
Message-ID: <20250207095540.186588-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jO8VTY_OFUGIy2q2Z4bQlY8sYnTa0BPs
X-Proofpoint-GUID: jO8VTY_OFUGIy2q2Z4bQlY8sYnTa0BPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_02,2024-11-22_01
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:55:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6291

This patch adds the missing documentation of variable IMAGE_ROOTFS_MAXSIZE
to the reference manual.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..16413f80b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3984,6 +3984,12 @@ system and gives an overview of their function and contents.
 
          IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 
+   :term:`IMAGE_ROOTFS_MAXSIZE`
+      Defines the maximum size in Kbytes for the generated image. If the
+      generated image size is above that, the build will fail. It's a good
+      idea to set this variable for images that need to fit on a limited
+      space (e.g. SD card, a fixed-size partition, ...).
+
    :term:`IMAGE_ROOTFS_SIZE`
       Defines the size in Kbytes for the generated image. The OpenEmbedded
       build system determines the final size for the generated image using
-- 
2.48.1



Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53523CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:08:48 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6610.1780661320158339693
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 05:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NHyYMf1P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026060512083705d8455e93000207c1-vdvjlb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026060512083705d8455e93000207c1
        for <docs@lists.yoctoproject.org>;
        Fri, 05 Jun 2026 14:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/zIvHa0idILQ9OteYnOvccxLKYlCf0wvxU+uA3t0L5E=;
 b=NHyYMf1PTfVPH15vxIzDceMlRaG9uD+GYjTnwknfhtvo10Gj/LVe6KNMae4anQ8SViNp8P
 52dOMX3JImkh0mBZJ+TO+Vyh+VlOTlvLrQCUnWoW/WiiZTPxjxY8X9s0CkqHPdYbak0flr5U
 9Xk+QQKAhJgLAHMu/ucOOtG7Mb8kWhjTqWmA4VVcokUS/qcNfSafbzAS8x4sqzok1fsJRD4g
 Zi7W2DOnWjqqlnojOAjzqoB9eplWE10gbvuiI3itss+YGWSA0kVyckp+FT1DgYalO88n9O8q
 b5w1ImRldMi8ooVxPz2+MoUJoiPBtTcwM/KH5kjCMUUKyLoWzyzxzx4w==;
From: Peter Marko <peter.marko@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] dev-manual: remove semicolons for rootfs commands
Date: Fri,  5 Jun 2026 14:08:23 +0200
Message-ID: <20260605120823.130634-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 12:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9588

From: Peter Marko <peter.marko@siemens.com>

Usage of semicolon as separator in ROOTFS/IMAGE_*COMMAND was deprecated
long time ago.
Code was changed to not include it anymore.
Update the example.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/build-quality.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index 163d8832e..af1a903d8 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -242,8 +242,8 @@ Here is an example of ``image-info.txt``:
    BAD_RECOMMENDATIONS =
    NO_RECOMMENDATIONS =
    PACKAGE_EXCLUDE =
-   ROOTFS_POSTPROCESS_COMMAND = write_package_manifest; license_create_manifest; cve_check_write_rootfs_manifest;   ssh_allow_empty_password;  ssh_allow_root_login;  postinst_enable_logging;  rootfs_update_timestamp;   write_image_test_data;   empty_var_volatile;   sort_passwd; rootfs_reproducible;
-   IMAGE_POSTPROCESS_COMMAND =  buildhistory_get_imageinfo ;
+   ROOTFS_POSTPROCESS_COMMAND = write_package_manifest license_create_manifest cve_check_write_rootfs_manifest   ssh_allow_empty_password  ssh_allow_root_login  postinst_enable_logging  rootfs_update_timestamp   write_image_test_data   empty_var_volatile   sort_passwd rootfs_reproducible
+   IMAGE_POSTPROCESS_COMMAND =  buildhistory_get_imageinfo
    IMAGESIZE = 9265
 
 Other than ``IMAGESIZE``,


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E133ECD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 06:53:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73581.1780988023055304722
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 23:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=nXQ/JZjE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260609065339d63a57e1e300020710-i2sh_v@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260609065339d63a57e1e300020710
        for <docs@lists.yoctoproject.org>;
        Tue, 09 Jun 2026 08:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vlrcbIxabg7WqPxNzy0xJ6bl1xKnC/LOPABq0AjWvtg=;
 b=nXQ/JZjEtyc7MZh+ReZVzIdnFl9AjEBOzA+ibHUhWxLhJhJW9vliGWg2uRPK1Fn4mI1+r6
 1QxOnsx13kFSPRgSSB6Vz3DeqBUihqB5/Cg5XUzIKnltPQvuxgWbwrao5ElgjW6+p0zgE7dj
 xjDtkPaXBQ5ZD5mEG2ZXeZwYHBIg+IyJdoTIZQhPuD29m8anFbECnbHlwco0w5IzLRIePCzB
 QkB+nFgevSW6Wmyr5hzuan0OMt0cniTthlzdyG/uOwveB2w8PL59fLJyQyiMI5PIByOv2aYy
 +E7CtdgJEbISFZlhbQsF9kAIwTCskLVZlzOJef5z9ZxYPt5t9V5oNWdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] build-manual: update ROOTFS_POSTPROCESS_COMMAND example
Date: Tue,  9 Jun 2026 08:53:32 +0200
Message-ID: <20260609065332.5274-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 06:53:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9634

From: Peter Marko <peter.marko@siemens.com>

Some commands were moved from ROOTFS_POSTPROCESS_COMMAND to
ROOTFS_POSTUNINSTALL_COMMAND.
Since ROOTFS_POSTUNINSTALL_COMMAND is not in printed subset, just remove
the tasks instead of moving them.

Corresponding oe-core change:
https://git.openembedded.org/openembedded-core/commit/?id=c3097962ac925538e99b17b771c541950a8b8c26

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/dev-manual/build-quality.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev-manual/build-quality.rst
index af1a903d8..c3c7ccbb2 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -242,7 +242,7 @@ Here is an example of ``image-info.txt``:
    BAD_RECOMMENDATIONS =
    NO_RECOMMENDATIONS =
    PACKAGE_EXCLUDE =
-   ROOTFS_POSTPROCESS_COMMAND = write_package_manifest license_create_manifest cve_check_write_rootfs_manifest   ssh_allow_empty_password  ssh_allow_root_login  postinst_enable_logging  rootfs_update_timestamp   write_image_test_data   empty_var_volatile   sort_passwd rootfs_reproducible
+   ROOTFS_POSTPROCESS_COMMAND = ssh_allow_empty_password  ssh_allow_root_login  postinst_enable_logging  rootfs_update_timestamp   write_image_test_data   empty_var_volatile   sort_passwd rootfs_reproducible
    IMAGE_POSTPROCESS_COMMAND =  buildhistory_get_imageinfo
    IMAGESIZE = 9265
 


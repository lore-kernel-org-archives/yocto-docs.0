Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021DAD5CC82
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 10:08:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11582.1730282878319728505
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 03:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hgEf1hq2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C92E4FF803;
	Wed, 30 Oct 2024 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730282877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLa2odR7Tf/FW5OVohH62PrpAFP3V2q7vZumXylOF3I=;
	b=hgEf1hq2iTNNE6keWi7aysdJ90AZWfFqKcffzV0SAB0Wks6UkOoIT2dWPGlotScknIEahS
	smkXe/zAPVihWxIh0pzn0a7Y3LoEJQ68mFoNXRarZzv2hKFBCKG5Zv+elyfOZLvwpdUBw9
	GjPeahvszIr94AiVnet1/vhsgkcdYyvvt/tYGg+cIjnnV2OQ29tyRaVoq3H//6pC0ETDzx
	svoeTHXMH+J27XofQV5RpxynMzSx/synFu8ljvuDnAkGQJj7aeUgm/EssOgjfGLfaMh9yJ
	l5mZShmo6ptwy56z23XMs//a6j0EYipoUrUwFNGpl9LeN9N2ePr+fN2Cceuzrw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 30 Oct 2024 11:07:29 +0100
Subject: [PATCH 2/2] ref-manual: release-process: add a reference to the
 doc's release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-update-releases-svg-v1-2-1cafebd6c6d9@bootlin.com>
References: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
In-Reply-To: <20241030-update-releases-svg-v1-0-1cafebd6c6d9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bCh7NJd7fce3zeRUpjd86V8ZnKEMThQrd7S8z0Y6D+4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnIgV70hbmOTxXyDaMKOONHZtWYi9SFnZAHGB12
 vzbQxoq/BmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZyIFewAKCRDRgEFAKaOo
 NvrsD/9tA7labhmKjwKu0JXdgJFXqZPvphh9g/Zm+9nM64mUHL2ybFVZCkhnsqO0hlZkk75N/oK
 X+3XE/p/HlYsvosi093tDC901u8siSp+hEnWl65zCpV0wlx8bieGRZFkTjR53anXwLsNawj/ZcT
 0sIinRQAyhMOODPdplyXw4kOVBkkE7ul034p8kkpMkmG04UKaXcYvF/Jousr9z/rSFeYvn7Xw1G
 6gOLCOKvmiIkFJtbi6VFevXZasbKNAtOclTTypeAATtQ0L7oY2wwtGLhV8/WAbvUgnVMV+N6w0A
 F3dudQVfkkPMvzyxS5ddIYunkoFHpxNC3JDhS26kySpyFpAQ+LhNjQh6lGJ3SZgXVUK+zPPuBVf
 mTNpOcA676/9w2cii5sETZs9HlPiwnyN2IyeQfwBvaw6oCMkVUSet2HK1Z4WbJ98U83kpvpCmgb
 ChpOI+zwc2CLv8M9YaQ/MEaqwMjwBWPZjdmavMwatdQ0UX18NbidpH30bDIg77XrmuWhzCJlVYN
 en1ZM/azdrzWC92qiUhqKG4EJwR1KXkfMVXhiOm4hq8DYCSwLcAKyE2Mw+OII5IDhQiMT7M5k8D
 0B7DdGrAhqrtwT9tstGzf3lzNYYxfS2ne0hWwAzhZpQ+lKWf247zIhnOFTBSOptSIpHY0c+tFmN
 gBIva1mNE9QxZwg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 30 Oct 2024 10:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5614

When reading the stable releases section, we want to know for which
release the documentation was built. Use &DISTRO_NAME; to refer to the
current release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 75532addbdcd52cb0ab13ee8ffd57a70e1fc8045..691e7d3ed90c98e43e558809828b5094670ccca3 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -117,6 +117,8 @@ The currently supported :term:`LTS` releases are:
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
 of stable and :term:`LTS` releases.
 
+This documentation was built for the &DISTRO_NAME; release.
+
 .. image:: svg/releases.*
    :width: 100%
 

-- 
2.46.1


